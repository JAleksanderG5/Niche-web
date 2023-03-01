$(document).ready(function () {
    $("tr #btn-delete").click(function () {
        var idp = $(this).parent().find("#idp").val();
        const swalWithBootstrapButtons = Swal.mixin({
            buttonsStyling: true,
        });

        swalWithBootstrapButtons
                .fire({
                    background: "var(--color-fondo)",
                    html: "<h4 style='color: var(--color-fondo-oscuro);'>¿Desea eliminar el producto?</h4>",
                    titleText: "",
                    iconHtml: "<i class='fa-solid fa-trash-can'></i>",
                    iconColor: "var(--color-secundario)",
                    showCancelButton: true,
                    confirmButtonText: "Aceptar",
                    confirmButtonColor: "#883772",
                    cancelButtonText: "Cancelar",
                    cancelButtonColor: "#343740",
                    reverseButtons: false,
                })
                .then((result) => {
                    if (result.isConfirmed) {
                        eliminar(idp);
                        location.href = "SrvProducto?action=Carrito";
                    }
                });


    });

    function eliminar(idp) {
        var url = "SrvProducto?accion=EliminarProducto";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp,
            success: function (data, textStatus, jpXHR) {
            }
        });
    }


 /*   $("div #drop_pagos").change(function () {
        //var idp = $(this).parent().find("#idpro").val();
        // var cantidad = $(this).parent().find("#Cantidad").val();

        var idEnvio = $(this).parent().find("#drop_pago").val();
        alert(idEnvio);
        var url = "SrvProducto?accion=agregarEnvio";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idenvio=" + idEnvio,
            success: function (data, textStatus, jqXHR) {
                location.href = "SrvProducto?action=Carrito";
                asignar(idEnvio);

            }
        });
    });*/


});