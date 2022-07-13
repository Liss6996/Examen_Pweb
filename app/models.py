from django.db import models
import email
from django.contrib.auth.models import User
from django.db.models.deletion import CASCADE
# Create your models here.

# Creamos un total de 11 tablas 

class TipoProducto(models.Model):
    id_tipo = models.AutoField(primary_key = True)
    tipo = models.CharField('Tipo de producto',max_length=20, unique = True)

    def __srt__(self):
        return self.tipo

    class Meta:
            db_table = 'tipo_producto'
            verbose_name = "Tipos de Productos"
            verbose_name_plural = "Tipos de Productos"
            ordering = ['id_tipo']
        

class Producto(models.Model):
    codigo = models.AutoField(primary_key = True)
    nombre = models.CharField('Nombre del producto',max_length=30)
    marca = models.CharField('Marca',max_length=30)
    precio = models.IntegerField('Precio')
    descripcion = models.CharField('Descripción',max_length=40)
    stock = models.IntegerField('Stock')
    id_tipo = models.ForeignKey(TipoProducto, on_delete= CASCADE)
    imagen = models.ImageField('Imagen',upload_to="productos/%Y-%m-%d", null=True, blank=True)
    fecha_creacion = models.DateField('Fecha de Creación',auto_now_add=True, auto_now=False)
    fecha_actualizacion = models.DateField('Fecha de Actualización', auto_now=True)

    def __srt__(self):
        return self.nombre

    class Meta:
        db_table = 'producto'
        verbose_name = "Producto"
        verbose_name_plural = "Productos"
        ordering = ['codigo']
         
class TipoUsuario(models.Model):
    id = models.AutoField(primary_key = True)
    tipo_usuario = models.CharField(max_length=20)

    def __str__(self):
        return self.tipo_usuario

    class Meta:
        db_table = "tipo_usuario"
        verbose_name = "Tipo Usuario"
        verbose_name_plural = "Tipos de Usuarios"
        ordering = ['id']
         
class Cliente(models.Model):
    usuario = models.ForeignKey(User,on_delete=models.CASCADE,null=True, blank=True)
    tipo_usuario = models.ForeignKey(TipoUsuario, on_delete=models.CASCADE)
    direccion = models.CharField('Dirección',max_length=100)
    estado_sub = models.BooleanField('Suscrito / No Suscrito',default=False)
    saldo = models.IntegerField('Saldo', default=0, null=False,blank=False)

    def __srt__(self):
        return self.usuario.username 

    class Meta:
        db_table = 'cliente'
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"
        ordering = ['estado_sub']

class Donacion(models.Model):
    usuario = models.CharField('Usuario',max_length=30,null=True)
    donacion = models.IntegerField('Donación',null=False, blank=False)

    def __srt__(self):
        return self.usuario 

    class Meta:
        db_table = 'donacion'
        verbose_name = "Donación"
        verbose_name_plural = "Donaciones"
        ordering = ['donacion']


class Pedido(models.Model):
    id = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Cliente,on_delete=models.CASCADE)
    fecha = models.DateTimeField('Fecha del pedido',auto_now_add=True,auto_now=False,null=False)  
    cantidad = models.IntegerField('Cantidad de productos')
    total = models.IntegerField('Total', null=False,blank=False)

    def __srt__(self):
        return self.id_producto.nombre 

    class Meta:
        db_table = 'pedido'
        verbose_name = "Pedido"
        verbose_name_plural = "Pedidos"
        ordering = ['id']


class Carrito(models.Model):
    id = models.AutoField(primary_key = True)
    id_producto = models.ForeignKey(Producto,on_delete=models.CASCADE)
    id_cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    cantidad = models.IntegerField('Cantidad',null=False, blank=False)
    subtotal = models.IntegerField('Subtotal', null=False, blank=False)
    
    def __srt__(self):
        return self.id_producto.nombre 

    class Meta:
        db_table = 'carrito'
        verbose_name = "Carrito de Compra"
        verbose_name_plural = "Carritos de Compra"
        ordering = ['id']

class DetallePedido(models.Model):
    id = models.AutoField(primary_key = True)
    id_producto = models.ForeignKey(Producto,on_delete=models.CASCADE)
    cantidad = models.IntegerField('Cantidad',null=False, blank=False)
    subtotal = models.IntegerField('Subtotal', null=False, blank=False)
    id_pedido = models.ForeignKey(Pedido,on_delete=models.CASCADE)

    def __srt__(self):
        return self.id_producto.nombre 

    class Meta:
        db_table = 'detalle_pedido'
        verbose_name = "Detalle Pedido"
        verbose_name_plural = "Detalles de los Pedidos"
        ordering = ['id']

class EstadoSeguimiento(models.Model):
    id = models.AutoField(primary_key=True)
    descripcion = models.CharField('Descripción Seguimiento',max_length=30,null=False, blank=False ,unique=True)

    def __srt__(self):
        return self.descripcion 

    class Meta:
        db_table = 'estado_seguimiento'
        verbose_name = "Estado Seguimiento"
        verbose_name_plural = "Estados de Seguimiento"
        ordering = ['id']


class DetalleSeguimiento(models.Model):
    id = models.AutoField(primary_key=True)
    id_pedido = models.ForeignKey(Pedido,on_delete=models.CASCADE)
    id_estado = models.ForeignKey(EstadoSeguimiento, on_delete=models.CASCADE)
    fecha_proceso = models.DateField('Fecha de Proceso',auto_now_add=True, auto_now=False)

    def __srt__(self):
        return self.id_pedido.total 

    class Meta:
        db_table = 'detalle_seguimiento'
        verbose_name = "Detalle de Seguimiento"
        verbose_name_plural = "Detalles de Seguimiento"
        ordering = ['id']


class HistorialCompra(models.Model):
    id = models.AutoField(primary_key=True)
    id_pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)

    def __srt__(self):
        return self.id_pedido.total 

    class Meta:
        db_table = 'historial_compra'
        verbose_name = "Historial de Compra"
        verbose_name_plural = "Historiales de Compra"
        ordering = ['id']

