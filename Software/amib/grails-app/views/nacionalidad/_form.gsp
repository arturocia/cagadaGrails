<%@ page import="mx.amib.sistemas.solicitante.catalogo.Nacionalidad" %>



<div class="fieldcontain ${hasErrors(bean: nacionalidadInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="nacionalidad.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="50" value="${nacionalidadInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: nacionalidadInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="nacionalidad.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${nacionalidadInstance?.vigente}" />
</div>

