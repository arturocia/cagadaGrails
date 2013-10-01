<%@ page import="mx.com.amiba.foliosaaa.Institucion" %>



<div class="fieldcontain ${hasErrors(bean: institucionInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="institucion.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${institucionInstance?.nombre}"/>
</div>

