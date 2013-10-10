
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
			
				<g:if test="${documentoAnexoInstance?.t401TSolicitud}">
				<li class="fieldcontain">
					<span id="t401TSolicitud-label" class="property-label"><g:message code="documentoAnexo.t401TSolicitud.label" default="T401 TS olicitud" /></span>
					
						<span class="property-value" aria-labelledby="t401TSolicitud-label"><g:link controller="solicitud" action="show" id="${documentoAnexoInstance?.t401TSolicitud?.id}">${documentoAnexoInstance?.t401TSolicitud?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoAnexoInstance?.t403TArchivodocanexos}">
				<li class="fieldcontain">
					<span id="t403TArchivodocanexos-label" class="property-label"><g:message code="documentoAnexo.t403TArchivodocanexos.label" default="T403 TA rchivodocanexos" /></span>
					
						<g:each in="${documentoAnexoInstance.t403TArchivodocanexos}" var="t">
						<span class="property-value" aria-labelledby="t403TArchivodocanexos-label"><g:link controller="archivoDocumentoAnexo" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${documentoAnexoInstance?.t405CTipodoc}">
				<li class="fieldcontain">
					<span id="t405CTipodoc-label" class="property-label"><g:message code="documentoAnexo.t405CTipodoc.label" default="T405 CT ipodoc" /></span>
					
						<span class="property-value" aria-labelledby="t405CTipodoc-label"><g:link controller="tipoDocumento" action="show" id="${documentoAnexoInstance?.t405CTipodoc?.id}">${documentoAnexoInstance?.t405CTipodoc?.encodeAsHTML()}</g:link></span>
					
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
