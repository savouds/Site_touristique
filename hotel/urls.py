from django.conf.urls import url
from . import views


app_name = 'hotel'
urlpatterns = [
	url('hotel/', views.view_hotel, name='hotel'),
	url('carte/', views.view_carteHotel, name='carteHotel')
]