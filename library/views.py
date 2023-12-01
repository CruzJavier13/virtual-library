from django.shortcuts import render
from .models import TblUser
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib import messages
from .models import TblAuthUser

# Create your views here.
def login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, f'Welcome, {user.username}!')
            return redirect('home')
        else:
            messages.error(request, 'Invalid username or password.')

    return render(request, 'registration/login.html')

@login_required
def home(request):
    return render(request, 'partials_views/index.html')

def user(request):
    context = {
        'details_template': 'partials_views/user.html',
    }
    return render(request, 'partials_views/user.html')

def book(request):
    context = {
        'details_template': 'partials_views/book.html',
    }
    return render(request, 'partials_views/book.html')

def author(request):
    context = {
        'details_template': 'partials_views/author.html',
    }
    return render(request, 'partials_views/author.html')

def booking(request):
    context = {
        'details_template': 'partials_views/booking.html',
    }
    return render(request, 'partials_views/booking.html')

def category(request):
    context = {
        'details_template': 'partials_views/category.html',
    }
    return render(request, 'partials_views/category.html')

def editorial(request):
    context = {
        'details_template': 'partials_views/editorial.html',
    }
    return render(request, 'partials_views/editorial.html')

def loan(request):
    context = {
        'details_template': 'partials_views/loan.html',
    }
    return render(request, 'partials_views/loan.html')

def setting(request):
    context = {
        'details_template': 'partials_views/setting.html',
    }
    return render(request, 'partials_views/setting.html')

def logout(request):
    return render(request, 'partials_views/logout.html')