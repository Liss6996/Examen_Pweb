from django.shortcuts import render, redirect
from .models import *
# from .forms import *

import random

import requests

# Importar el Modelo de Usuarios (User)
from django.contrib.auth.models import Group, User
#Importar librerias de validación
from django.contrib.auth import authenticate,logout,login
# importar libreria de decoradores que permite evitar el ingreso a páginas  restringidas
from django.contrib.auth.decorators import login_required, permission_required #Decoradores para restringuir acceso a las páginas
#Usamos as para ponerle un alias a una importación

# Importamos los grupos
from django.contrib.auth.models import Group

# Importamos para hacer querys complejas
from django.db.models import Q

# Renderizar la página del index
def index(request):
    # Si no se encuentra la variable de sesión, indicamos que la cargue
    if "cantidad_carrito" not in request.session:
        # Verificamos que el usuario esté logueado para cargar el carrito
        if request.user:
            cargarCarrito(request)
    return render(request,'index.html')

def iniciarSesion(request):
    if request.POST:
        usuario = request.POST.get("txtUser")
        password = request.POST.get("txtPass")
        us = authenticate(request,username = usuario, password = password)
        if us is not None and  us.is_active:
            #Cargamos al usuario en todas las páginas
            login(request,us)
            try:
                cliente = Cliente.objects.get(usuario = us)
                cargarSaldo(request,cliente.saldo)
            except:
                pass
            return redirect(to='index')
        else:
            datos = {"mensaje":"Usuario o contraseña no válidos"}
            return render(request,'index.html',datos)
    return render(request,'index.html')

@login_required(login_url='/login/')
def cerrarSesion(request):
    #Me cierra la sesión del usuario logeado en ese momento
    logout(request)
    return render(request,'index.html')

def registrate(request):
    if request.POST:
        # POST PUT DELETE GET
        nombre = request.POST.get("txtNombre")
        usuario = request.POST.get("txtUsuario")
        correo = request.POST.get("txtEmail")
        contrasenia = request.POST.get("txtPassword")
        contrasenia2 = request.POST.get("txtPassword2")
        direccion = request.POST.get("txtDireccion")
        
        # Verificamos si el usuario en bdd existe
        try:
            usuariobd = User.objects.get(username = usuario)
            datos = {"error" : "¡El usuario ya está registrado!"}
            return render(request,'registrate.html',datos)
        except:
            # Si no se encuentra lo creamos
            usuariobd = User()
            usuariobd.first_name = nombre.capitalize()
            #usuariobd.last_name = ""
            usuariobd.username = usuario
            usuariobd.email = correo.lower()
            usuariobd.set_password(contrasenia)

            # Acá guardamos el usuario con los campos que le entrego
            usuariobd.save()

            # Buscamos el grupo y se asignamos al usuario
            my_group = Group.objects.get(name='cliente') 
            usuariobd.groups.add(my_group)

            us = authenticate(request,username = usuario,password = contrasenia)
            login(request,us)


            # Tipo usuario
            tipo = TipoUsuario.objects.get(id = 2)


            # Creamos un cliente de nuestro modelo 
            u = Cliente()
            u.usuario = usuariobd
            u.tipo_usuario = tipo
            u.direccion = direccion.lower()
            u.estado_sub = False


            # Generamos un saldo random al cliente entre 50.000 y 500.000 pesos
            u.saldo = random.randint(50000, 500000)
            u.save() 
            
            request.session['saldo_cliente'] = u.saldo
            request.session.modified = True

            
            return redirect(to='index')

    return render(request,'registrate.html')

@login_required(login_url='/registrate/')
def farmacia(request):
    listaProductos = Producto.objects.filter(id_tipo = 4)
    datos = {
        "listaProductos" : listaProductos
        }
    return render(request,'farmacia.html',datos)

@login_required(login_url='/registrate/')
def perros(request):
    listaProductos = Producto.objects.filter(id_tipo = 1)
    datos = {
        "listaProductos" : listaProductos
        }
    return render(request,'perros.html',datos)

@login_required(login_url='/registrate/')
def gatos(request):
    listaProductos = Producto.objects.filter(id_tipo = 2)
    datos = {
        "listaProductos" : listaProductos
        }
    return render(request,'gatos.html',datos)

@login_required(login_url='/registrate/')
def exoticos(request):
    listaProductos = Producto.objects.filter(id_tipo = 3)
    datos = {
        "listaProductos" : listaProductos
        }
    return render(request,'exoticos.html',datos)



# Renderizamos el panel de administración de productos
# Definimos los permisos para poder acceder a la página
@login_required(login_url='/registrate/')
@permission_required('app.add_producto',login_url='/registrate/')
@permission_required('app.change_producto',login_url='/registrate/')
@permission_required('app.delete_producto',login_url='/registrate/')
@permission_required('app.view_producto',login_url='/registrate/')
def gestionProducto(request):
    # Obtenemos los productos de la API
    response = requests.get("http://127.0.0.1:8000/api/producto/")
    listaProductos = response.json()

    # listaProductos = Producto.objects.all()
    datos = {
        "listaProductos" : listaProductos
    }
    return render(request,'gestion-producto.html',datos)

@login_required(login_url='/registrate/')
@permission_required('app.add_producto',login_url='/registrate/')
@permission_required('app.change_producto',login_url='/registrate/')
@permission_required('app.delete_producto',login_url='/registrate/')
@permission_required('app.view_producto',login_url='/registrate/')
def eliminarProducto(request,codigo):
    producto = Producto.objects.get(codigo = codigo)
    producto.delete()
    return redirect(to='productos')
    #return render(request,'gestionProducto.html')

@login_required(login_url='/registrate/')
@permission_required('app.add_producto',login_url='/registrate/')
@permission_required('app.change_producto',login_url='/registrate/')
@permission_required('app.delete_producto',login_url='/registrate/')
@permission_required('app.view_producto',login_url='/registrate/')
def agregarProducto(request):
    mensaje = ''
    if request.POST:
        try:
            nombre = request.POST.get('txtNombre')
            marca = request.POST.get('txtMarca')
            precio = request.POST.get('txtPrecio')
            stock = request.POST.get('txtStock')
            descripcion = request.POST.get('txtDescripcion')
            tipo = request.POST.get('cboTipo')
            txtImagen = request.FILES.get("txtImagen")
            obj_tipo = TipoProducto.objects.get(id_tipo = tipo)

            producto = Producto(
                nombre = nombre.lower() ,
                marca = marca.capitalize(),
                precio = precio,
                descripcion = descripcion.lower() ,
                stock = stock,
                id_tipo = obj_tipo
            )

            if txtImagen:
                producto.imagen = txtImagen

            # Guardamos en la bdd
            producto.save()
            mensaje = "¡Producto Guardado!"
        except:
            mensaje = "Producto no se pudo Guardar"
    listaTipos = TipoProducto.objects.all()
    datos = {
        "listaTipos" : listaTipos,
        "mensaje" : mensaje
        }
    return render(request,'agregar-producto.html',datos)

# Buscamos un producto para cargarlo en la página 
@login_required(login_url="/registrate/")
@permission_required('app.change_producto',login_url='/registrate/')
def cargarProducto(request, codigo):
    listaTipos = TipoProducto.objects.all()
    producto = Producto.objects.get(codigo = codigo)
    datos = {"tipos":listaTipos,"producto":producto}
    return render(request,'modificar-producto.html',datos)

@login_required(login_url="/registrate/")
@permission_required('app.change_producto',login_url='/registrate/')
def modificarProducto(request):
    if request.POST:
        try:
            codigo = request.POST.get('txtCodigo')
            # Buscamos el producto seleccionado
            producto = Producto.objects.get(codigo = codigo)

            nombre = request.POST.get('txtNombre')
            marca = request.POST.get('txtMarca')
            precio = request.POST.get('txtPrecio')
            stock = request.POST.get('txtStock')
            descripcion = request.POST.get('txtDescripcion')
            tipo = request.POST.get('cboTipo')
            img = request.FILES.get("txtImagen")
            obj_tipo = TipoProducto.objects.get(id_tipo = tipo)

            producto.nombre = nombre.lower()
            producto.marca = marca.capitalize()

            if int(precio) >= 0:
                producto.precio = precio
            
            if int(stock) >= 0:
                producto.stock = stock

            producto.descripcion = descripcion.lower()
            producto.id_tipo = obj_tipo

             # Si no se carga una foto que no la modifique
            if img is not None:
                producto.imagen = img

            # Guardamos en la bdd
            producto.save()
            return redirect(to='productos')
        except: #Exception as ex:
            mensaje = "Producto no se pudo Modificar"
        datos = {"mensaje":mensaje}
    return render(request,'modificar-producto.html', datos)

@login_required(login_url="/registrate/")
def carritoCompra(request):
    # Recuperamos el usuario de la sesión activa
    user = request.user
    # Obtenemos al cliente 
    cliente = Cliente.objects.get(usuario = user)
    
    # Si recibe una petición POST
    # Agregamos un item al carrito
    if request.method == 'POST':
        codigo = request.POST.get('txtCodigo')
        # Buscamos el producto por el código
        producto = Producto.objects.get(codigo=codigo)
        
        # Validamos el stock
        if producto.stock >= 1:
            # Se descuenta el stock en 1
            producto.stock = producto.stock - 1
            producto.save()
            actualizarCantidadCarrito(request, 1)

            try:
                # Ya se encuentra
                carrito = Carrito.objects.get(id_cliente = cliente, id_producto = producto)
                carrito.cantidad = carrito.cantidad + 1;
                carrito.subtotal = carrito.subtotal + producto.precio
                carrito.save()
            except:
                # Si no se encuentra lo creamos
                # Creamos un carrito
                carrito = Carrito()
                carrito.id_producto = producto
                carrito.id_cliente = cliente
                carrito.cantidad = 1
                carrito.subtotal = producto.precio
                
                # Guardamos en la bdd
                carrito.save()

    # Listamos el carrito correspondiente al cliente
    listaCarrito = Carrito.objects.filter(id_cliente = cliente)
    
    # Calculamos el total a pagar
    total = 0
    descuento = None
   

    for x in listaCarrito:
        total = total + x.subtotal

    if cliente.estado_sub:
            descuento = total - int(total * 0.05)
    datos = {
        "listaCarrito" : listaCarrito,
        "total" : total,
        "descuento" : descuento
    }

    return render(request,'carrito-compra.html',datos)

@login_required(login_url="/registrate/")
def eliminarCarrito(request,id,codigo):
    carrito = Carrito.objects.get(id = id)
    producto = Producto.objects.get(codigo = codigo)
    producto.stock = carrito.cantidad
    producto.save()
    carrito.delete()
    actualizarCantidadCarrito(request, - carrito.cantidad)
    return redirect(to='carrito-compra')

@login_required(login_url="/registrate/")
def sumarCarrito(request):
    if request.method == 'POST':
        id = request.POST.get('txtSuma')
        carrito = Carrito.objects.get(id=id)
        producto = Producto.objects.get(codigo=carrito.id_producto.codigo)
        if producto.stock >=  1:
            carrito.cantidad = carrito.cantidad + 1
            carrito.subtotal = carrito.subtotal + producto.precio 
            producto.stock = producto.stock - 1
            producto.save()
            carrito.save()
            actualizarCantidadCarrito(request, 1)
        else:
            pass

    return redirect(to='carrito-compra')

@login_required(login_url="/registrate/")
def restarCarrito(request):
    if request.method == 'POST':
        id = request.POST.get('txtResta')
        carrito = Carrito.objects.get(id=id)
        producto = Producto.objects.get(codigo=carrito.id_producto.codigo)

        if carrito.cantidad >  1:
            carrito.cantidad = carrito.cantidad - 1
            carrito.subtotal = carrito.subtotal - producto.precio
            producto.stock = producto.stock + 1
            producto.save()
            carrito.save()
            actualizarCantidadCarrito(request, -1)
        elif carrito.cantidad == 1:
            carrito.cantidad = carrito.cantidad - 1
            carrito.subtotal = carrito.subtotal - producto.precio
            producto.stock = producto.stock + 1
            producto.save()
            carrito.delete()
            actualizarCantidadCarrito(request, -1)
    else:
        pass

    return redirect(to='carrito-compra')

@login_required(login_url="/registrate/")
def cargarCarrito(request):
    try:
        # Recuperamos el usuario de la sesión activa
        user = request.user
        # Obtenemos al cliente 
        cliente = Cliente.objects.get(usuario = user)
        # Listamos el carrito correspondiente al cliente
        listaCarrito = Carrito.objects.filter(id_cliente = cliente)
        cantidad = 0
        # Contamos los productos que tiene en el carrito
        for x in listaCarrito:
            cantidad = cantidad + x.cantidad

        request.session['cantidad_carrito'] = cantidad
        request.session.modified = True  
    except:
       pass

@login_required(login_url="/registrate/")
def actualizarCantidadCarrito(request,total):
    cantidad = request.session['cantidad_carrito']
    cantidad = cantidad + total
    request.session['cantidad_carrito'] = cantidad
    
@login_required(login_url="/registrate/")
def eliminarCantidadCarrito(request):
    request.session['cantidad_carrito'] = 0

@login_required(login_url="/registrate/")
def pagoCompra(request):
    if request.user:
        usuario = request.user
        cliente = Cliente.objects.get(usuario=usuario)
        # Listamos el carrito correspondiente al cliente
        listaCarrito = Carrito.objects.filter(id_cliente = cliente)
        cantidad = 0
        totalPago = 0
        saldo = cliente.saldo
        # Contamos los productos que tiene en el carrito
        for x in listaCarrito:
            cantidad = cantidad + x.cantidad
            totalPago += x.subtotal
                    
    
        descuento = None
        if cliente.estado_sub:
            descuento = totalPago - int(totalPago * 0.05)

        datos = {"cantidad":cantidad, "totalPago":totalPago, "saldo":saldo, "descuento":descuento}
        return render(request, 'pago-compra.html',datos)
    return redirect(to='index')

# Método que ingresa los detalles de la compra y el pedido, además de validar el total a pagar
@login_required(login_url="/registrate/")
def procesarPago(request):
    if request.user:
        usuario = request.user
        cliente = Cliente.objects.get(usuario=usuario)
        # Listamos el carrito correspondiente al cliente
        listaCarrito = Carrito.objects.filter(id_cliente = cliente)
        
        totalPago = 0
        cantidad = 0
        for x in listaCarrito:
            totalPago += x.subtotal
            cantidad += x.cantidad
        
        if cliente.estado_sub:
            totalPago = totalPago - int(totalPago * 0.05)

        if cliente.saldo >= totalPago:
            # Si el saldo es mayor o igual registramos la compra 

            # Creamos el pedido 
            pedido = Pedido()
            pedido.id_cliente = cliente
            pedido.total = totalPago
            pedido.cantidad = cantidad
            pedido.save()


            # Creamos los detalles del pedido
            for x in listaCarrito:
                detalle = DetallePedido()
                detalle.id_producto = x.id_producto
                detalle.cantidad = x.cantidad
                detalle.subtotal = x.subtotal
                detalle.id_pedido = pedido
                detalle.save()
            
            # Agregamos el detalle de seguimiento
            
            estado = EstadoSeguimiento.objects.get(id=1)

            seguimiento = DetalleSeguimiento()
            seguimiento.id_pedido = pedido
            seguimiento.id_estado = estado
            seguimiento.save()

            # Borramos el contador del carrito y lo vacíamos
            eliminarCantidadCarrito(request)
            listaCarrito.delete()

            # Finalmente se le descuenta el saldo al cliente 
            cliente.saldo = cliente.saldo - totalPago
            cliente.save()

            request.session['saldo_cliente'] = cliente.saldo
            request.session.modified = True

    return redirect(to='index')

@login_required(login_url="/registrate/")
def cargarSaldo(request,saldo):
    request.session['saldo_cliente'] = saldo
    request.session.modified = True

@login_required(login_url="/registrate/")
def seguimiento(request):
    try:      
        # Recuperamos el usuario de la sesión activa
        user = request.user
        
        # Obtenemos al cliente 
        cliente = Cliente.objects.get(usuario = user)

        # Pedidos
        pedidos = Pedido.objects.filter(id_cliente = cliente)

        listaSeguimiento = []

        for x in pedidos:
            try:
                listaSeguimiento.append(DetalleSeguimiento.objects.get(id_pedido = x))
            except:
                pass
        
        datos = {
            "listaSeguimiento" : listaSeguimiento
        }
    except:
        datos = {
            "listaSeguimiento" : None
        }
    return render(request,'seguimiento-compra.html',datos)


@login_required(login_url="/registrate/")
def historialCompra(request):
    try:
        # Recuperamos el usuario de la sesión activa
        user = request.user
        
        # Obtenemos al cliente 
        cliente = Cliente.objects.get(usuario = user)

        # Pedidos
        pedidos = Pedido.objects.filter(id_cliente = cliente)

        listaCompras = []

        for x in pedidos:
            try:
                listaCompras.append(HistorialCompra.objects.get(id_pedido = x))
            except:
                pass

        datos = {
            "listaCompras" : listaCompras
        }
    except:
        datos = {
            "listaCompras" : None
        }

    return render(request,'historial-compra.html',datos)


@login_required(login_url="/registrate/")
def detalleCompra(request,id):
    # Recuperamos el pedido
    listaProductos = DetallePedido.objects.filter(id_pedido = id)
    datos = {
        "listaProductos" : listaProductos 
    }
    return render(request,'detalle-compra.html',datos)



@login_required(login_url="/registrate/")
@permission_required('app.add_producto',login_url='/registrate/')
@permission_required('app.change_producto',login_url='/registrate/')
@permission_required('app.delete_producto',login_url='/registrate/')
@permission_required('app.view_producto',login_url='/registrate/')
def adminSeguimiento(request):
    if request.method == 'POST':
        estadoid = request.POST.get('cboEstado')
        detalleid = request.POST.get('txtDetalle')
        estado = EstadoSeguimiento.objects.get(id=estadoid)
        detalle = DetalleSeguimiento.objects.get(id=detalleid)
        detalle.id_estado = estado
        detalle.save()
        if detalle.id_estado.id == 4:
            # Insertamos el historial
            historial = HistorialCompra()
            historial.id_pedido = detalle.id_pedido
            historial.save()


    listaSeguimiento = DetalleSeguimiento.objects.filter(Q(id_estado = 1) | Q(id_estado = 2) | Q(id_estado = 3))
    estados = EstadoSeguimiento.objects.all()
    datos = {
        "listaSeguimiento" : listaSeguimiento,
        "estados" : estados
    }
    return render(request,'gestion-seguimiento.html',datos)


def donacion(request):
    if request.method == 'POST':

        if request.user.is_active:
            monto = request.POST.get('txtMonto')
            # Recuperamos el usuario de la sesión activa
            user = request.user
            # Obtenemos al cliente 
            cliente = Cliente.objects.get(usuario = user)
            if cliente.saldo >= int(monto): 
                donacion = Donacion()
                donacion.usuario = user.username
                donacion.donacion = monto
                donacion.save()
                # Activamos la suscripción
                cliente.estado_sub = True
                cliente.saldo = cliente.saldo - int(monto)
                cliente.save()
                cargarSaldo(request,cliente.saldo)
        else:
            # Si no tiene cuenta
            nombre = request.POST.get('txtNombre')
            email = request.POST.get('txtEmail')
            monto = request.POST.get('txtMonto')
            donacion = Donacion()
            donacion.usuario = nombre
            donacion.donacion = monto
            donacion.save()
        
    return redirect(to='index')

@login_required(login_url="/registrate/")
@permission_required('app.add_producto',login_url='/registrate/')
@permission_required('app.change_producto',login_url='/registrate/')
@permission_required('app.delete_producto',login_url='/registrate/')
@permission_required('app.view_producto',login_url='/registrate/')
def adminClientes(request):
    # Si recibe una petición por POST
    if request.method == 'POST':
        idcliente = request.POST.get('txtCliente')
        cliente = Cliente.objects.get(id = idcliente)
        suscripcion = request.POST.get('cboSuscripcion')
        urlPUT = 'http://127.0.0.1:8000/api/detalle-cliente/' + str(idcliente) + '/'

        cliente.estado_sub = suscripcion

        datos = {
            "id": cliente.id,
            "direccion": cliente.direccion,
            "estado_sub": cliente.estado_sub,
            "saldo": cliente.saldo,
            "usuario": cliente.usuario.id,
            "tipo_usuario": cliente.tipo_usuario.id
        }


        response = requests.put(urlPUT,data = datos)

        '''
        # Obtenemos al cliente 
        cliente = Cliente.objects.get(id = idcliente)

        # Actualizamos el estado de la suscripción
        cliente.estado_sub = suscripcion
        cliente.save()
        '''


    listaClientes = Cliente.objects.all()
    estados = [True, False]
    datos = {
        "listaClientes" : listaClientes,
        "estados" : estados
    }
    return render(request, 'clientes.html', datos)



def filtroBusqueda(request):
    if request.method == 'POST':
        # Obtenemos el texto buscado
        texto = request.POST.get("filtro-busqueda")
        texto = texto.strip() # Quitamos los espacios en blanco del inicio

        if texto != "":

            # Si el texto ingresado no esta vacio, buscamos

            # Palabras claves 
            listaProductos = Producto.objects.filter(nombre__contains = texto.lower())
            cantidad = listaProductos.count()

            datos = {
                'listaProductos' : listaProductos,
                'cantidad' : cantidad,
                'texto' : texto
            }

            return render(request,'busqueda.html',datos)


    return redirect(to='index')



def desactivarSuscripcion(request):
    if request.method == 'POST':
        idcliente = request.POST.get('txtCliente')
        cliente = Cliente.objects.get(id = idcliente)
        suscripcion = request.POST.get('cboSuscripcion')
        urlPUT = 'http://127.0.0.1:8000/api/detalle-cliente/' + str(idcliente) + '/'

        cliente.estado_sub = suscripcion

        datos = {
            "id": cliente.id,
            "direccion": cliente.direccion,
            "estado_sub": cliente.estado_sub,
            "saldo": cliente.saldo,
            "usuario": cliente.usuario.id,
            "tipo_usuario": cliente.tipo_usuario.id
        }


        response = requests.put(urlPUT,data = datos)

    # Recuperamos el usuario de la sesión activa
    user = request.user
    
    # Obtenemos al cliente 
    cliente = Cliente.objects.get(usuario = user)

    datos = {
        "cliente" : cliente
    }

    return render(request, 'suscripcion.html', datos)