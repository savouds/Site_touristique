from django.shortcuts import render


def evenement(request):
	return render(request, 'evenement.html')