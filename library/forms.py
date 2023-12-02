from django import forms
from models import TblUser

class FormUser(forms.ModelForms):
    class Meta:
        model = TblUser
        fields = '__all__'
        #widgets = {'fecha_nacimiento': forms.DateInput(attrs={'type':'date'})}