from django.shortcuts import render
from .models import TblUser

# Create your views here.
def login(request):
    users = TblUser.objects.all()
    print(users)
    return render(request, 'login.html', { 'users':users} )

def home(request):
    return render(request, 'home.html')

def book(request):
    return render(request, 'book.html')