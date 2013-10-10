<%@ page import="mx.amib.sistemas.solicitud.ArchivoDocumentoAnexo" %>



<div class="fieldcontain ${hasErrors(bean: archivoDocumentoAnexoInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="archivoDocumentoAnexo.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" maxlength="16" value="${archivoDocumentoAnexoInstance?.tipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoDocumentoAnexoInstance, field: 'archivo', 'error')} required">
	<label for="archivo">
		<g:message code="archivoDocumentoAnexo.archivo.label" default="Archivo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="archivo" name="archivo" />
</div>

<div class="fieldcontain ${hasErrors(bean: archivoDocumentoAnexoInstance, field: 'documentoAnexo', 'error')} required">
	<label for="documentoAnexo">
		<g:message code="archivoDocumentoAnexo.documentoAnexo.label" default="Documento Anexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="documentoAnexo" name="documentoAnexo.id" from="${mx.amib.sistemas.solicitud.DocumentoAnexo.list()}" optionKey="id" required="" value="${archivoDocumentoAnexoInstance?.documentoAnexo?.id}" class="many-to-one"/>
</div>

