from django.shortcuts import render

def view_hotel(request):
	return render (request, 'hotel.html')

def view_carteHotel(request):
	return render(request, 'carteHotel.html')
