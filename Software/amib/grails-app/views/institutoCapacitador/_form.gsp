<%@ page import="mx.amib.sistemas.solicitud.catalogo.InstitutoCapacitador" %>



<div class="fieldcontain ${hasErrors(bean: institutoCapacitadorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="institutoCapacitador.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="200" value="${institutoCapacitadorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: institutoCapacitadorInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="institutoCapacitador.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${institutoCapacitadorInstance?.vigente}" />
</div>

