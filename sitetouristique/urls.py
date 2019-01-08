from django.conf.urls import url
from . import views

app_name = 'sitetouristique'

urlpatterns = [
	url('', views.view_site, name= 'site')
]