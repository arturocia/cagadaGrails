<%@ page import="mx.amib.sistemas.solicitud.catalogo.FormaPago" %>



<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="formaPago.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${formaPagoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="formaPago.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${formaPagoInstance?.vigente}" />
</div>

