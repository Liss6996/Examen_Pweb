from django.contrib import admin
from .models import *
from django.apps import AppConfig
from tabnanny import verbose

# Register your models here.

class ProductosAdmin(admin.ModelAdmin):
    list_display =['codigo','nombre','marca','precio','descripcion','id_tipo','imagen','fecha_creacion','fecha_actualizacion']
    search_fields = ['codigo']
    list_per_page: 5
    list_editable = ['nombre','marca','descripcion','id_tipo','imagen']
    list_filter = ["codigo"]

class TipoAdmin(admin.ModelAdmin):
    list_display =['tipo']
    search_fields =['tipo']
    list_per_page: 5


class TipoUsuarioAdmin(admin.ModelAdmin):
    list_display =['id','tipo_usuario']
    search_fields =['id']
    list_per_page: 5

class ClienteAdmin(admin.ModelAdmin):
    list_display =['usuario','tipo_usuario','direccion','estado_sub','saldo']
    search_fields = ['usuario','direccion']
    list_per_page: 5
    list_editable = ['tipo_usuario','direccion','estado_sub','saldo']
    list_filter = ["estado_sub"]

class DonacionAdmin(admin.ModelAdmin):
    list_display =['usuario','donacion']
    search_fields =['usuario','donacion']
    list_per_page: 5

class PedidoAdmin(admin.ModelAdmin):
    list_display =['total','id_cliente','fecha']
    search_fields =['id_cliente','total','fecha']
    list_per_page: 5

class DetallePedidoAdmin(admin.ModelAdmin):
    list_display =['cantidad','id_pedido','id_producto','subtotal']
    search_fields =['cantidad','id_pedido','id_producto','subtotal']
    list_per_page: 5

class CarritoAdmin(admin.ModelAdmin):
    list_display =['cantidad','id_producto','subtotal']
    search_fields =['cantidad','id_producto','subtotal']
    list_per_page: 5

class EstadoSeguimientoAdmin(admin.ModelAdmin):
    list_display =['descripcion']
    search_fields =['descripcion']
    list_per_page: 5

class DetalleSeguimientoAdmin(admin.ModelAdmin):
    list_display =['id_pedido','id_estado','fecha_proceso']
    search_fields =['id_pedido','id_estado','fecha_proceso']
    list_per_page: 5

class HistorialCompraAdmin(admin.ModelAdmin):
    list_display =['id_pedido']
    search_fields =['id_pedido']
    list_per_page: 5

# 11 Tablas administrables
admin.site.register(TipoProducto,TipoAdmin)
admin.site.register(Producto,ProductosAdmin)
admin.site.register(TipoUsuario,TipoUsuarioAdmin)
admin.site.register(Cliente,ClienteAdmin)
admin.site.register(Donacion,DonacionAdmin)
admin.site.register(Pedido,PedidoAdmin)
admin.site.register(DetallePedido,DetallePedidoAdmin)
admin.site.register(Carrito,CarritoAdmin)
admin.site.register(EstadoSeguimiento,EstadoSeguimientoAdmin)
admin.site.register(DetalleSeguimiento,DetalleSeguimientoAdmin)
admin.site.register(HistorialCompra,HistorialCompraAdmin)
