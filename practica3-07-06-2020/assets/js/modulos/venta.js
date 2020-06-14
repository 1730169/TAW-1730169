var orden_json = [];
var subtotal;
var descuento;
var total;

var json = $("#orden_json").val();

// SI LA ORDEN SE ESTA MOSTRANDO
if(json != null && json != ""){
    //Parsear json string 
    orden_json = JSON.parse(json);
    // Llenar la tabla con los productos
    llenarTablaOrden();

    var sub = $("#subtotal_form_edit").val();
    var desc = $("#descuento_form_edit").val();
    var tot = $("#total_form_edit").val();

    // MOSTRAR TOTALES EN LAS ETIQUETAS
    $("#subtotal").text("$ "+formatMoney(sub));
    $("#descuento").text("$ "+formatMoney(desc));
    $("#total").text("$ "+formatMoney(tot));

    
}

function agregar_a_orden(id){
    var input = $("#input_cantidad_"+id);
    var cantidad = input.val();
    var nombre = input.attr( "nombre" );
    var precio = input.attr( "precio" );

    // Agregar fila a la tabla
    var producto = {
        id: id,
        nombre: nombre,
        cantidad: cantidad,
        precio: precio,
        subtotal: precio * cantidad
    }

    orden_json.push(producto);

    llenarTablaOrden();
    //alert(cantidad);

    // Reiniciar campo cantidad
    input.val(1);

    // Descontar el maximo del campo cantidad
    var maximo = input.attr("max");
    // Actualizar
    input.attr("max",maximo-cantidad);
}

function llenarTablaOrden(){
    // Limpiar tabla de la orden
    var tabla = $("#contenido_tabla_orden");
    tabla.empty();

    // Limpiar totales
    subtotal = 0;
    descuento = 0;
    total = 0;

    for(var indice in orden_json){

        var producto = orden_json[indice];

        // Añadir a la tabla
        tabla.append(
            `<tr>
                <th scope="row">`+producto.nombre+`</th>
                <td>$`+formatMoney(producto.precio)+`</td>
                <td>`+producto.cantidad+`</td>
                <td>$`+formatMoney(producto.subtotal)+`</td>
            </tr>`
        );

        // Incrementar el subtotal
        subtotal += producto.subtotal;
    }

    var porcentaje = $("#input-descuento").val();
    descuento = (subtotal * (porcentaje/100.0));
    // Calcular total considerando el descuento
    total = subtotal - descuento;

    // MOSTRAR TOTALES EN LAS ETIQUETAS
    $("#cant-productos").text(orden_json.length);
    $("#subtotal").text("$ "+formatMoney(subtotal));
    $("#descuento").text("$ "+formatMoney(descuento));
    $("#total").text("$ "+formatMoney(total));

    // Actualizar campo JSON en el formulario
    $("#orden_json").val(JSON.stringify(orden_json));
    $("#subtotal_form").val(subtotal);
    $("#descuento_form").val(descuento);
    $("#total_form").val(total);
}

function aplicar_descuento(){
    llenarTablaOrden();

}

function formatMoney(number) {
    var decPlaces = 2;
    var decSep = ".";
    var thouSep = ",";

    decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
    decSep = typeof decSep === "undefined" ? "." : decSep;
    thouSep = typeof thouSep === "undefined" ? "," : thouSep;
    var sign = number < 0 ? "-" : "";
    var i = String(parseInt(number = Math.abs(Number(number) || 0).toFixed(decPlaces)));
    var j = (j = i.length) > 3 ? j % 3 : 0;
    
    return sign +
        (j ? i.substr(0, j) + thouSep : "") +
        i.substr(j).replace(/(\decSep{3})(?=\decSep)/g, "$1" + thouSep) +
        (decPlaces ? decSep + Math.abs(number - i).toFixed(decPlaces).slice(2) : "");
}