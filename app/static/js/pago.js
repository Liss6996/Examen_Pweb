
function pagar(saldo,total,usuario){
    console.log(saldo)
    console.log(usuario)
    if(saldo >= total){

        Swal.fire({
            title: '¡Gracias ' + usuario + ' por preferirnos!',
            width: 600,
            padding: '3em',
            color: '#716add',
            background: '#fff url(https://c.tenor.com/1haGZ9yiu2oAAAAC/angel-beats-yui.gif)',
            backdrop: `
              rgba(0,0,123,0.4)
              url("https://c.tenor.com/xzjlrhYq_lQAAAAi/cat-nyan-cat.gif")
              left top
              no-repeat
            `
          }).then((result) => {
                if(result.value){
                    Swal.fire(
                        'Pago',
                        'Pago Realizado con éxito.',
                        'success',
                        ).then(function(){
                            window.location.href = "/procesar-pago" ;
                        })
                }
            })
        
    }else{
         
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '¡Saldo insuficiente!',
        })

    }

}
