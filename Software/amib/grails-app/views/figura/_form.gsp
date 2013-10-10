<%@ page import="mx.amib.sistemas.solicitud.catalogo.Figura" %>



<div class="fieldcontain ${hasErrors(bean: figuraInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="figura.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="200" value="${figuraInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: figuraInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="figura.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${figuraInstance?.vigente}" />
</div>

