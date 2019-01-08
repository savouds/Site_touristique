from django.shortcuts import render

def view_site(request):
	return render (request, 'site.html')
