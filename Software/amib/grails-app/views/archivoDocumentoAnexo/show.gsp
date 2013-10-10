
<%@ page import="mx.amib.sistemas.solicitud.ArchivoDocumentoAnexo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-archivoDocumentoAnexo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-archivoDocumentoAnexo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list archivoDocumentoAnexo">
			
				<g:if test="${archivoDocumentoAnexoInstance?.txTipo}">
				<li class="fieldcontain">
					<span id="txTipo-label" class="property-label"><g:message code="archivoDocumentoAnexo.txTipo.label" default="Tx Tipo" /></span>
					
						<span class="property-value" aria-labelledby="txTipo-label"><g:fieldValue bean="${archivoDocumentoAnexoInstance}" field="txTipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoDocumentoAnexoInstance?.blDocanexo}">
				<li class="fieldcontain">
					<span id="blDocanexo-label" class="property-label"><g:message code="archivoDocumentoAnexo.blDocanexo.label" default="Bl Docanexo" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoDocumentoAnexoInstance?.t402TDocanexo}">
				<li class="fieldcontain">
					<span id="t402TDocanexo-label" class="property-label"><g:message code="archivoDocumentoAnexo.t402TDocanexo.label" default="T402 TD ocanexo" /></span>
					
						<span class="property-value" aria-labelledby="t402TDocanexo-label"><g:link controller="documentoAnexo" action="show" id="${archivoDocumentoAnexoInstance?.t402TDocanexo?.id}">${archivoDocumentoAnexoInstance?.t402TDocanexo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${archivoDocumentoAnexoInstance?.id}" />
					<g:link class="edit" action="edit" id="${archivoDocumentoAnexoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
