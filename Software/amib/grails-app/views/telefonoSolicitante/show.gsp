
<%@ page import="mx.amib.sistemas.solicitante.TelefonoSolicitante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-telefonoSolicitante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-telefonoSolicitante" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list telefonoSolicitante">
			
				<g:if test="${telefonoSolicitanteInstance?.lada}">
				<li class="fieldcontain">
					<span id="lada-label" class="property-label"><g:message code="telefonoSolicitante.lada.label" default="Lada" /></span>
					
						<span class="property-value" aria-labelledby="lada-label"><g:fieldValue bean="${telefonoSolicitanteInstance}" field="lada"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoSolicitanteInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="telefonoSolicitante.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${telefonoSolicitanteInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoSolicitanteInstance?.extension}">
				<li class="fieldcontain">
					<span id="extension-label" class="property-label"><g:message code="telefonoSolicitante.extension.label" default="Extension" /></span>
					
						<span class="property-value" aria-labelledby="extension-label"><g:fieldValue bean="${telefonoSolicitanteInstance}" field="extension"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoSolicitanteInstance?.solicitante}">
				<li class="fieldcontain">
					<span id="solicitante-label" class="property-label"><g:message code="telefonoSolicitante.solicitante.label" default="Solicitante" /></span>
					
						<span class="property-value" aria-labelledby="solicitante-label"><g:link controller="solicitante" action="show" id="${telefonoSolicitanteInstance?.solicitante?.id}">${telefonoSolicitanteInstance?.solicitante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoSolicitanteInstance?.tipoTelefono}">
				<li class="fieldcontain">
					<span id="tipoTelefono-label" class="property-label"><g:message code="telefonoSolicitante.tipoTelefono.label" default="Tipo Telefono" /></span>
					
						<span class="property-value" aria-labelledby="tipoTelefono-label"><g:link controller="tipoTelefono" action="show" id="${telefonoSolicitanteInstance?.tipoTelefono?.id}">${telefonoSolicitanteInstance?.tipoTelefono?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${telefonoSolicitanteInstance?.id}" />
					<g:link class="edit" action="edit" id="${telefonoSolicitanteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
