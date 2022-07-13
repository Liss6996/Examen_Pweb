'''
from django.urls import path
from django.urls import re_path as url
from api import views
from rest_framework.urlpatterns import format_suffix_patterns

'''
'''
urlpatterns = [
        url('cliente/<int:id>/',cliente_detalle, name='cliente_detalle'),
    url(r'^api/producto/$',views.ProductoViewSet.as_view()),
    url(r'^api/tipo-producto/$',views.TipoProductoViewSet.as_view()),
    url(r'^api/cliente/$',views.ClienteViewSet.as_view()),
    url(r'^api/tipo-usuario/$',views.TipoUsuarioViewSet.as_view()),
    url(r'^api/buscar-producto/(?P<id>.+)/$',views.ProductoBuscarViewSet.as_view()),
    url(r'^api/buscar-tipo-producto/(?P<id>.+)/$',views.TipoProductoBuscarViewSet.as_view()),

]

urlpatterns = format_suffix_patterns(urlpatterns)

'''

from django.urls import path
#from django.urls import re_path as url

from api.views import cliente_detalle,ProductoViewSet , TipoProductoViewSet, TipoProductoBuscarViewSet ,ClienteViewSet, TipoUsuarioViewSet, ProductoBuscarViewSet


urlpatterns = [
    path('api/producto/',ProductoViewSet.as_view(),name = 'producto'),
    path('api/tipo-producto/',TipoProductoViewSet.as_view()),
    path('api/cliente/',ClienteViewSet.as_view()),
    path('api/tipo-usuario/',TipoUsuarioViewSet.as_view()),
    path('api/buscar-producto/<int:id>/',ProductoBuscarViewSet.as_view()),
    path('api/buscar-tipo-producto/<int:id>/',TipoProductoBuscarViewSet.as_view()),
    path('api/detalle-cliente/<int:id>/',cliente_detalle, name='cliente_detalle'),
]