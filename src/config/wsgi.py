# in wsgi.py
from whitenoise import WhiteNoise
from django.core.wsgi import get_wsgi_application
from django.conf import settings

application = get_wsgi_application()
application = WhiteNoise(application, root=settings.STATIC_ROOT)
