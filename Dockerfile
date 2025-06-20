# Base image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy Django project (src folder only)
COPY ./src /app/src

# Change into the Django app directory
WORKDIR /app/src

# Optional: collect static files (uncomment for production)
# RUN python manage.py collectstatic --noinput

# Expose port
EXPOSE 8000

# Start the Django app using Gunicorn
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]
