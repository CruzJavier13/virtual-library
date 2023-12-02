from django.urls import path, include
from django.contrib.auth import views as auth_view
from . import views

urlpatterns = [
    path('', views.view_login, name='login'),
    path('account/logout/', views.logout, name='logout'),
    #path('logout/', auth_view.LogoutView.as_view(), name='logout'),
    #path('accounts/login/', auth_view.LoginView.as_view(), name='login'),
    path('home/', views.home, name='home'),
    path('user/', views.user, name='user'),
    path('book/', views.book, name='book'),
    path('author/', views.author, name='author'),

    path('booking/', views.booking, name='booking'),
    path('category/', views.category, name='category'),
    path('editorial/', views.editorial, name='editorial'),
    path('loan/', views.loan, name='loan'),
    path('setting/', views.setting, name='setting'),
]
