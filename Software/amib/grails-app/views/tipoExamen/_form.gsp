<%@ page import="mx.amib.sistemas.solicitud.catalogo.TipoExamen" %>



<div class="fieldcontain ${hasErrors(bean: tipoExamenInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoExamen.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="200" value="${tipoExamenInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoExamenInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="tipoExamen.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${tipoExamenInstance?.vigente}" />
</div>

