
<%@ page import="mx.amib.sistemas.solicitud.DocumentoAnexo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documentoAnexo.label', default: 'DocumentoAnexo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-documentoAnexo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-documentoAnexo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list documentoAnexo">
			
				<g:if test="${documentoAnexoInstance?.archivoDocumentoAnexo}">
				<li class="fieldcontain">
					<span id="archivoDocumentoAnexo-label" class="property-label"><g:message code="documentoAnexo.archivoDocumentoAnexo.label" default="Archivo Documento Anexo" /></span>
					
						<g:each in="${documentoAnexoInstance.archivoDocumentoAnexo}" var="a">
						<span class="property-value" aria-labelledby="archivoDocumentoAnexo-label"><g:link controller="archivoDocumentoAnexo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${documentoAnexoInstance?.solicitud}">
				<li class="fieldcontain">
					<span id="solicitud-label" class="property-label"><g:message code="documentoAnexo.solicitud.label" default="Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="solicitud-label"><g:link controller="solicitud" action="show" id="${documentoAnexoInstance?.solicitud?.id}">${documentoAnexoInstance?.solicitud?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoAnexoInstance?.tipoDocumento}">
				<li class="fieldcontain">
					<span id="tipoDocumento-label" class="property-label"><g:message code="documentoAnexo.tipoDocumento.label" default="Tipo Documento" /></span>
					
						<span class="property-value" aria-labelledby="tipoDocumento-label"><g:link controller="tipoDocumento" action="show" id="${documentoAnexoInstance?.tipoDocumento?.id}">${documentoAnexoInstance?.tipoDocumento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${documentoAnexoInstance?.id}" />
					<g:link class="edit" action="edit" id="${documentoAnexoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
