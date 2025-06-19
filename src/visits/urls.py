from django.urls import path
from visits.views import home_view, about_view
urlpatterns = [
    path("", home_view),
    path("about/", about_view),
]
