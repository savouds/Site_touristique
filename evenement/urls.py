from django.conf.urls import url
from . import views


app_name = 'evenement'

urlpatterns = [
	url(r'', views.evenement, name = 'evenement'),
] 