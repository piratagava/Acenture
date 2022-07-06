<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>

<meta charset="utf-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
	textarea {
	overflow-y: scroll;
    resize: none;
	}
	.letra {
	  font-size: 14px;
	}
	
	input:disabled {
	  background: #ccc;
	}
</style>
</head>

<body onload="CalculaAntes()">
<table align="center">
	<tr>
		<td width= "35%" VALIGN=top>
			<div id="TablaValorFlete"><label style="color: #770733"><b>Valores del Flete</b></label>
			<table class="table table-sm table-bordered table-striped">
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Valor del Flete $</b></td>
					<td class="letra" style="width: 120px;"><input id="ValorFlete" onFocus="doClear(this)" onkeypress="return numerosConPunto(event, this);" onkeyup = "if(event.keyCode == 13) calcularFlete()" value="0.00" placeholder="0.00" class="letra" type="text" style="width: 120px;text-align:right;" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Valor Carga $</b></td>
					<td class="letra" style="width: 120px;"><input id="ValorCarga" onFocus="doClear(this)" onkeypress="return numerosConPunto(event, this)" value="0.00" placeholder="0.00" class="letra" type="text" style="width: 120px;text-align:right;" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Valor Descarga $</b></td>
					<td class="letra" style="width: 120px;"><input id="ValorDescarga" onFocus="doClear(this)" disabled="disabled" onkeypress="return numerosConPunto(event, this)" value="0.00" placeholder="0.00" class="letra" type="text" style="width: 120px;text-align:right;" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 430px;"align="right"><b>Autopista, Libramientos, Transbordador $</b></td>
					<td class="letra" style="width: 120px;"><input id="ValorTransbordador" onFocus="doClear(this)" disabled="disabled" onkeypress="return numerosConPunto(event, this)" value="0.00" placeholder="0.00" class="letra" type="text" style="width: 120px;text-align:right;" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Valor Recolección $</b></td>
					<td class="letra" style="width: 120px;"><input id="ValorRecoleccion" onFocus="doClear(this)" onkeypress="return numerosConPunto(event, this)" value="0.00"onkeypress="return numerosConPunto(event, this)" placeholder="0.00" class="letra" type="text" style="width: 120px;text-align:right;" maxlength="10"></td>
				</tr>
			</table>
				<table align="center">
					<tr>
					<td class="letra ocultar" id="cDescargaTD" style="width: 350px; margin-left: 40px;"align="right"><input id="cDescarga" type="checkbox" class="form-check-input" onchange="calcularFlete();"value=""><b>Con Descarga</b></td><!-- Ana Carolina Herrera e HimperPeninsular -->
					
					<td class="letra ocultar" id="cEntregaTD" style="width: 350px; margin-left: 40px;"align="right"><input id="cEntrega" type="checkbox" class="form-check-input" onchange="calcularFlete();" value=""><b>Cobrar Entrega</b></td><!-- Cobrar Entrega -->
					
					<td class="letra ocultar" id="ccitaTD" style="width: 350px; margin-left: 40px;"align="right"><input id="ccita" type="checkbox" class="form-check-input" onchange="calcularFlete();" value=""><b>Con Cita</b></td><!-- Assa -->
					
					<td class="letra ocultar" id="vcompTD" style="width: 350px; margin-left: 40px;"align="right"><input id="vcomp" type="checkbox" class="form-check-input" onchange="fleteRoshfrans();" value=""><b>Viaje Completo</b></td><!-- Roshfrans -->
					<td class="letra ocultar" id="vcombTD" style="width: 350px; margin-left: 40px;"align="right"><input id="vcomb" type="checkbox" class="form-check-input" onchange="fleteRoshfransCombinado();"value=""><b>Viaje Combinado</b></td><!-- Roshfrans -->
					<td class="letra ocultar" id="vnormalTD" style="width: 350px; margin-left: 40px;"align="right"><input id="vnormal" type="checkbox" class="form-check-input" onchange="fleteRoshfransNormal();" value=""><b>Viaje Normal</b></td><!-- Roshfrans -->
					<td class="letra ocultar" id="vmapTD" style="width: 350px; margin-left: 40px;"align="right"><input id="vmap" type="checkbox" class="form-check-input" onchange="fleteRoshfransCombinado();" value=""><b>Mayor Peso</b></td><!-- Roshfrans -->
					<td class="letra ocultar" id="vmepTD" style="width: 350px; margin-left: 40px;"align="right"><input id="vmep" type="checkbox" class="form-check-input" onchange="fleteRoshfransCombinado();" value=""><b>Menor Peso</b></td><!-- Roshfrans -->
					
					<td class="letra ocultar" id="vccuracretoTD" style="width: 350px; margin-left: 40px;"align="right"><input id="vccuracreto" type="checkbox" class="form-check-input" onchange="habilitaCuracretoViajeCompleto();" value=""><b>Viaje Completo</b></td><!-- Completo curacreto -->
					<td class="letra ocultar" id="vccuracretocombinadoTD" style="width: 350px; margin-left: 40px;"align="right"><input id="vccuracretocombinado" type="checkbox" class="form-check-input" onchange="habilitaCuracretoViajeCombinado();" value=""><b>Viaje Combinado</b></td><!-- Combinado curacreto -->
					<td class="letra ocultar" id="trailerTD" style="width: 350px; margin-left: 40px;"align="right"><input id="trailer" type="checkbox" class="form-check-input" onchange="OpcionCuracreto();" value=""><b>Cancún</b></td><!-- trailer curacreto -->
					<td class="letra ocultar" id="torthonTD" style="width: 350px; margin-left: 40px;"align="right"><input id="torthon" type="checkbox" class="form-check-input" onchange="OpcionCuracreto();" value=""><b>Mérida</b></td><!-- torthon curacreto-->
					
					<td class="letra ocultar" id="combinadomayorTD" style="width: 350px; margin-left: 40px;"align="right"><input id="combinadomayor" type="checkbox" class="form-check-input" onchange="OpcionCuracretoCombinado();" value=""><b>Mayor Peso</b></td><!-- combinado mayor curacreto-->
					<td class="letra ocultar" id="combinadomenorTD" style="width: 350px; margin-left: 40px;"align="right"><input id="combinadomenor" type="checkbox" class="form-check-input" onchange="OpcionCuracretoCombinado();" value=""><b>Menor Peso</b></td><!-- combinado menor curacreto-->
				</tr>
				</table>
			</div>
		</td>
		<td width= "3%">
			<table>
				<tr><td></td></tr>
			</table>
		</td>
		<td width= "35%" VALIGN=top>
			<div id="TablaFleteCalculado"><label style="color: #770733"><b>Flete Calculado</b></label>
			<table class="table table-sm table-bordered table-striped">
				<tr>
					<td class="letra" style="width: 300px;"align="right"><%if(talonSeguro.equals("69")){%><b>FLETE (SEGURO):</b><%} else if(talonSeguro.equals("65")){%><b>FLETE (CARGO) $</b><%} else{%><b>Valor del Flete $</b><%}%></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="vFleteC" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent;" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Seguro $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="00.00" value="0.00" id="seguro" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Carga $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="carga" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Descarga $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="descarga" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Transbordadores $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="transbordador" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Recuperación de Evidencia $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="entrega" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Recolección $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="recoleccion" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Sub Total $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="subTotal" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>IVA $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="iva" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Total $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="total" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Retención $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="retencion" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
				<tr>
					<td class="letra" style="width: 300px;"align="right"><b>Neto a Pagar $</b></td>
					<td class="letra" style="width: 120px;"><input disabled="disabled" placeholder="0.00" id="nPagar" class="letra" type="text" style="width: 120px;text-align:right; border: 0;  background-color: transparent" maxlength="10"></td>
				</tr>
			</table>
			</div>
		</td>
	</tr>
</table>
</div>
		<div id="guarda" class="mb-2 mr-sm-2">
			<button type="button" class="btn btn-dark btn-sm active" onclick="GuardarFleteCalculado();">Guardar</button>
			<button type="button" id="botonEliminar3" class="btn btn-dark btn-sm active" title="" onclick="eliminaTalonLogico(3);">Eliminar</button>
		</div>
<div id="espera1">
</div>
	
<script type="text/javascript" src="/PerliExpressWeb/bootstrap/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/PerliExpressWeb/bootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="/PerliExpressWeb/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>