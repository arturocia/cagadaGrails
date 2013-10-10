<%@ page import="mx.amib.sistemas.solicitud.catalogo.TipoDocumento" %>



<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoDocumento.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="150" value="${tipoDocumentoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="tipoDocumento.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${tipoDocumentoInstance?.vigente}" />
</div>

