<%@ page import="mx.amib.sistemas.solicitud.ArchivoDocumentoAnexo" %>



<div class="fieldcontain ${hasErrors(bean: archivoDocumentoAnexoInstance, field: 'txTipo', 'error')} ">
	<label for="txTipo">
		<g:message code="archivoDocumentoAnexo.txTipo.label" default="Tx Tipo" />
		
	</label>
	<g:textField name="txTipo" maxlength="16" value="${archivoDocumentoAnexoInstance?.txTipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoDocumentoAnexoInstance, field: 'blDocanexo', 'error')} required">
	<label for="blDocanexo">
		<g:message code="archivoDocumentoAnexo.blDocanexo.label" default="Bl Docanexo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="blDocanexo" name="blDocanexo" />
</div>

<div class="fieldcontain ${hasErrors(bean: archivoDocumentoAnexoInstance, field: 't402TDocanexo', 'error')} required">
	<label for="t402TDocanexo">
		<g:message code="archivoDocumentoAnexo.t402TDocanexo.label" default="T402 TD ocanexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t402TDocanexo" name="t402TDocanexo.id" from="${mx.amib.sistemas.solicitud.DocumentoAnexo.list()}" optionKey="id" required="" value="${archivoDocumentoAnexoInstance?.t402TDocanexo?.id}" class="many-to-one"/>
</div>

