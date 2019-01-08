"""guide_touristique URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
# from django.urls import include
from django.conf.urls import url, include
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from .import views

urlpatterns = [
    url('admin/', admin.site.urls),
    url('accueil/', views.index, name='accueil'),
    url(r'^contact/', include('contact.urls')),
    url('evenement/', include('evenement.urls')),
    url(r'^hotel/', include('hotel.urls')),
    url(r'^restaurant/', include('restaurant.urls')),
    url(r'^sites/', include('sitetouristique.urls')),
]

urlpatterns += staticfiles_urlpatterns()
