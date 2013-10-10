<%@ page import="mx.amib.sistemas.solicitante.ArchivoFoto" %>



<div class="fieldcontain ${hasErrors(bean: archivoFotoInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="archivoFoto.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" maxlength="16" value="${archivoFotoInstance?.tipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoFotoInstance, field: 'archivo', 'error')} required">
	<label for="archivo">
		<g:message code="archivoFoto.archivo.label" default="Archivo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="archivo" name="archivo" />
</div>

<div class="fieldcontain ${hasErrors(bean: archivoFotoInstance, field: 'solicitante', 'error')} required">
	<label for="solicitante">
		<g:message code="archivoFoto.solicitante.label" default="Solicitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="solicitante" name="solicitante.id" from="${mx.amib.sistemas.solicitante.Solicitante.list()}" optionKey="id" required="" value="${archivoFotoInstance?.solicitante?.id}" class="many-to-one"/>
</div>

