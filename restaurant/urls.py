from django.conf.urls import url
from . import views
app_name = 'restaurant'

urlpatterns = [
	url('', views.view_restaurant, name = 'restaurant')
]