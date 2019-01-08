from django.shortcuts import render

def view_restaurant(request):
	return render (request, 'restau.html')
