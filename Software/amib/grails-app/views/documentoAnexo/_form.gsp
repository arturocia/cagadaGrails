<%@ page import="mx.amib.sistemas.solicitud.DocumentoAnexo" %>



<div class="fieldcontain ${hasErrors(bean: documentoAnexoInstance, field: 'archivoDocumentoAnexo', 'error')} ">
	<label for="archivoDocumentoAnexo">
		<g:message code="documentoAnexo.archivoDocumentoAnexo.label" default="Archivo Documento Anexo" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${documentoAnexoInstance?.archivoDocumentoAnexo?}" var="a">
    <li><g:link controller="archivoDocumentoAnexo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="archivoDocumentoAnexo" action="create" params="['documentoAnexo.id': documentoAnexoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: documentoAnexoInstance, field: 'solicitud', 'error')} required">
	<label for="solicitud">
		<g:message code="documentoAnexo.solicitud.label" default="Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="solicitud" name="solicitud.id" from="${mx.amib.sistemas.solicitud.Solicitud.list()}" optionKey="id" required="" value="${documentoAnexoInstance?.solicitud?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentoAnexoInstance, field: 'tipoDocumento', 'error')} required">
	<label for="tipoDocumento">
		<g:message code="documentoAnexo.tipoDocumento.label" default="Tipo Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoDocumento" name="tipoDocumento.id" from="${mx.amib.sistemas.solicitud.catalogo.TipoDocumento.list()}" optionKey="id" required="" value="${documentoAnexoInstance?.tipoDocumento?.id}" class="many-to-one"/>
</div>

