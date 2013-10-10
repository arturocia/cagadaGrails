<%@ page import="mx.amib.sistemas.solicitud.catalogo.TipoServicio" %>



<div class="fieldcontain ${hasErrors(bean: tipoServicioInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoServicio.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${tipoServicioInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoServicioInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="tipoServicio.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${tipoServicioInstance?.vigente}" />
</div>

