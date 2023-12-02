from django.shortcuts import render, redirect
from django.contrib.auth.hashers import check_password
from .models import TblAuthUser

# Create your views here.

def view_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        try:
            user = TblAuthUser.objects.get(name_user=username)
        except TblAuthUser.DoesNotExist:
            # Usuario no encontrado
            return render(request, 'registration/login.html', {'error_message': 'Usuario no encontrado'})

        # Verificar la contraseña
        print(check_password(password, user.password))
        print(password == user.password)
        if password == user.password:
            return redirect('home')
        else:
            # Contraseña incorrecta
            return render(request, 'registration/login.html', {'error_message': 'Contraseña incorrecta'})
    return render(request, 'registration/login.html')

def logout(request):
    try:
        del request.session['num_user']
    except:
        return render(request, 'registration/login.html')
    return render(request, 'registration/login.html')

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