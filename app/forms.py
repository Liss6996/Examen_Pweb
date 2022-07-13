'''
from django import forms
from django.forms import ModelForm
from .models import *


from django.contrib.auth.forms import UserCreationForm

from django.contrib.auth.models import User


#form producto
class ProductoForm(ModelForm):
    nombre = forms.CharField(min_length=10,max_length=20)
    precio = forms.IntegerField(min_value=400)
    class Meta:
        model = Producto
        fields = ('codigo','nombre','marca','precio','descripcion','stock','id_tipo','imagen')

    # widgets = {
    #       'fecha_ing' : forms.SelectDateWidget(years=range(2020,2023))
    #    }

#  FORM USUARIO
class  UsuarioForm(ModelForm):
    class Meta:
        model = Usuario
        pass_usuario = forms.CharField(widget=forms.PasswordInput)
        fields = ('nombre_usu','apellidos_usu','tipo_usuario','pass_usuario','imagen_usuario','email','direccion','estado_sub')
        widgets = {
            'password': forms.PasswordInput(),
        }   


#CREACION DE USUARIOS
class UserRegistroForm(UserCreationForm):

    class Meta:
        model = Usuario
        fields = ['username','first_name','last_name','email','password1','password2']
'''