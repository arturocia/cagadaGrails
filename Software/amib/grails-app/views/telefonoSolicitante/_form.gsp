<%@ page import="mx.amib.sistemas.solicitante.TelefonoSolicitante" %>



<div class="fieldcontain ${hasErrors(bean: telefonoSolicitanteInstance, field: 'lada', 'error')} ">
	<label for="lada">
		<g:message code="telefonoSolicitante.lada.label" default="Lada" />
		
	</label>
	<g:textField name="lada" maxlength="6" value="${telefonoSolicitanteInstance?.lada}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoSolicitanteInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="telefonoSolicitante.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="50" value="${telefonoSolicitanteInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoSolicitanteInstance, field: 'extension', 'error')} ">
	<label for="extension">
		<g:message code="telefonoSolicitante.extension.label" default="Extension" />
		
	</label>
	<g:textField name="extension" maxlength="6" value="${telefonoSolicitanteInstance?.extension}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoSolicitanteInstance, field: 'solicitante', 'error')} required">
	<label for="solicitante">
		<g:message code="telefonoSolicitante.solicitante.label" default="Solicitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="solicitante" name="solicitante.id" from="${mx.amib.sistemas.solicitante.Solicitante.list()}" optionKey="id" required="" value="${telefonoSolicitanteInstance?.solicitante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoSolicitanteInstance, field: 'tipoTelefono', 'error')} required">
	<label for="tipoTelefono">
		<g:message code="telefonoSolicitante.tipoTelefono.label" default="Tipo Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoTelefono" name="tipoTelefono.id" from="${mx.amib.sistemas.solicitante.catalogo.TipoTelefono.list()}" optionKey="id" required="" value="${telefonoSolicitanteInstance?.tipoTelefono?.id}" class="many-to-one"/>
</div>

