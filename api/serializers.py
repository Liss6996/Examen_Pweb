from app.models import Producto, TipoProducto, Cliente, TipoUsuario
from rest_framework import serializers

#crear una clase que permita serializar una tabla  y sus campos


class ProductoSerializers(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = ["codigo","nombre","marca","precio",'descripcion','stock','id_tipo','imagen','fecha_creacion','fecha_actualizacion']

class TipoProductoSerializers(serializers.ModelSerializer):
    class Meta:
        model = TipoProducto
        fields = ["id_tipo","tipo"]

class ClienteSerializers(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        fields = '__all__'

class TipoUsuarioSerializers(serializers.ModelSerializer):
    class Meta:
        model = TipoUsuario
        fields = ["id","tipo_usuario"]
