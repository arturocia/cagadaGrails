<%@ page import="foliosaaa.HolaMundo" %>



<div class="fieldcontain ${hasErrors(bean: holaMundoInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="holaMundo.apellido.label" default="Apellido" />
		
	</label>
	<g:textField name="apellido" value="${holaMundoInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: holaMundoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="holaMundo.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${holaMundoInstance?.nombre}"/>
</div>

