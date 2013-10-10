<%@ page import="mx.amib.sistemas.solicitud.DocumentoAnexo" %>



<div class="fieldcontain ${hasErrors(bean: documentoAnexoInstance, field: 't401TSolicitud', 'error')} required">
	<label for="t401TSolicitud">
		<g:message code="documentoAnexo.t401TSolicitud.label" default="T401 TS olicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t401TSolicitud" name="t401TSolicitud.id" from="${mx.amib.sistemas.solicitud.Solicitud.list()}" optionKey="id" required="" value="${documentoAnexoInstance?.t401TSolicitud?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentoAnexoInstance, field: 't403TArchivodocanexos', 'error')} ">
	<label for="t403TArchivodocanexos">
		<g:message code="documentoAnexo.t403TArchivodocanexos.label" default="T403 TA rchivodocanexos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${documentoAnexoInstance?.t403TArchivodocanexos?}" var="t">
    <li><g:link controller="archivoDocumentoAnexo" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="archivoDocumentoAnexo" action="create" params="['documentoAnexo.id': documentoAnexoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: documentoAnexoInstance, field: 't405CTipodoc', 'error')} required">
	<label for="t405CTipodoc">
		<g:message code="documentoAnexo.t405CTipodoc.label" default="T405 CT ipodoc" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t405CTipodoc" name="t405CTipodoc.id" from="${mx.amib.sistemas.solicitud.catalogo.TipoDocumento.list()}" optionKey="id" required="" value="${documentoAnexoInstance?.t405CTipodoc?.id}" class="many-to-one"/>
</div>

