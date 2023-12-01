from django.urls import path
from . import views

urlpatterns = [
    path('accounts/login/', views.login, name='login'),
    path('', views.home, name='home'),
    path('user/', views.user, name='user'),
    path('book/', views.book, name='book'),
    path('author/', views.author, name='author'),

    path('booking/', views.booking, name='booking'),
    path('category/', views.category, name='category'),
    path('editorial/', views.editorial, name='editorial'),
    path('loan/', views.loan, name='loan'),
    path('setting/', views.setting, name='setting'),
    path('logout/', views.logout, name='logout')
]
