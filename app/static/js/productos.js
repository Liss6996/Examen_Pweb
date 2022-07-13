function confirmDelete(codigo){
    Swal.fire({
        icon: 'warning',
        title: '¿Estás seguro?',
        text: '¡No podrás deshacer esta acción!',
        showCancelButton: true,
        cancelButtonColor: "#d33",
        confirmButtonColor: "#0088F5",
        confirmButtonText: "Eliminar",
        cancelButtonText: "Cancelar",
      }).then((result) => {
          if(result.value){
            Swal.fire(
                'Eliminado',
                'Producto Eliminado correctamente.',
                'succes',
              ).then(function(){
                  window.location.href = "/eliminar-producto/"+ codigo ;
              })
          }
      })
}

