from django.contrib import admin
from django.conf.urls.static import static
from .views import *

# from app import views
from django.urls import path

# importar el archivo de configuraciones "settings.py"
from django.conf import settings

urlpatterns = [
    path('',index,name='index'),
    path('registrate/',registrate,name='registrate'),
    path('farmacia/',farmacia,name='farmacia'),
    path('perros/',perros,name='perros'),
    path('gatos/',gatos,name='gatos'),
    path('exoticos/',exoticos,name='exoticos'),
    path('logout/',cerrarSesion,name = 'logout'),
    path('login/',iniciarSesion,name = 'login'),
    path('productos/',gestionProducto,name = 'productos'),
    path('eliminar-producto/<codigo>/', eliminarProducto, name = "eliminar-producto"),
    path('agregar-producto/', agregarProducto, name = "agregar-producto"),
    path('cargar-producto/<codigo>/',cargarProducto, name="cargar-producto"),
    path('modificar-producto/',modificarProducto, name="modificar-producto"),
    path('carrito-compra/',carritoCompra, name="carrito-compra"),
    path('eliminar-carrito/<id>/<codigo>',eliminarCarrito,name="eliminar-carrito"),
    path('sumar-carrito/',sumarCarrito,name="sumar-carrito"),
    path('restar-carrito/',restarCarrito,name="restar-carrito"),
    path('pago/',pagoCompra,name="pago-compra"),
    path('procesar-pago/',procesarPago,name="procesar-pago"),
    path('seguimiento/',seguimiento,name="seguimiento"),
    path('compras/',historialCompra,name="historial-compra"),
    path('compra/<int:id>',detalleCompra,name='detalle-compra'),
    path('admin-seguimiento/',adminSeguimiento,name='admin-seguimiento'),
    path('donacion/',donacion,name='donacion'),
    path('clientes/',adminClientes,name='admin-clientes'),
    path('busqueda/',filtroBusqueda,name='filtro'),
    path('suscripcion/',desactivarSuscripcion,name='desactivar-suscripcion'),
]

# Required Imports
from django.conf.urls.static import static
from django.conf import settings

#Agregar a las rutas existentes la UBICACIÓN DE LA CARPETA MEDIA

# Below Urlpatterns
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
