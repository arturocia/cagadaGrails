<%@ page import="mx.amib.sistemas.solicitante.catalogo.TipoTelefono" %>



<div class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoTelefono.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${tipoTelefonoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="tipoTelefono.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${tipoTelefonoInstance?.vigente}" />
</div>

