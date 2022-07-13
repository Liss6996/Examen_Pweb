from django.shortcuts import render
from django.db.models.query import QuerySet

#Páginas web prediseñadas de REST_FRAMEWORK
from rest_framework import generics
from app.models import Producto, TipoProducto, Cliente, TipoUsuario
from .serializers import ProductoSerializers, TipoProductoSerializers, ClienteSerializers, TipoUsuarioSerializers
from api import serializers
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view


# Create your views here.

#Clase que va a mostrar un conjunto de datos

class ProductoViewSet(generics.ListAPIView):
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializers

class TipoProductoViewSet(generics.ListAPIView):
    queryset = TipoProducto.objects.all()
    serializer_class = TipoProductoSerializers

class ClienteViewSet(generics.ListAPIView):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializers

class TipoUsuarioViewSet(generics.ListAPIView):
    queryset = TipoUsuario.objects.all()
    serializer_class = TipoUsuarioSerializers

#ViewSet con parametro
class ProductoBuscarViewSet(generics.ListAPIView):
    serializer_class = ProductoSerializers
    
    def get_queryset(self):
        code = self.kwargs['id']
        return Producto.objects.filter(codigo=code)

class TipoProductoBuscarViewSet(generics.ListAPIView):
    serializer_class = TipoProductoSerializers

    def get_queryset(self):
        id_tipo = self.kwargs['id']
        return TipoProducto.objects.filter(id_tipo=id_tipo) 



@api_view(['PUT','DELETE','GET'])
def cliente_detalle(request,id = None):
    # Queryset
    cliente = Cliente.objects.filter(id=id).first()

    # Validación
    if cliente:
        if request.method == 'GET':
            cliente_serializer = ClienteSerializers(cliente).data
            return Response(cliente_serializer, status =  status.HTTP_200_OK)

        if request.method == 'PUT':
            # request.data aquí viene la información
            cliente_serializer = ClienteSerializers(cliente, data = request.data)
            if cliente_serializer.is_valid():
                cliente_serializer.save()
                return Response(cliente_serializer.data)
            return Response(cliente_serializer.errors, status =  status.HTTP_200_OK)

        elif request.method == 'DELETE':
            cliente.delete()
            return Response('Eliminado', status =  status.HTTP_200_OK)
        
        return Response({'message':'No se ha encontrado el usuario.'},status = status.HTTP_400_BAD_REQUEST)