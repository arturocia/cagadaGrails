
<%@ page import="mx.amib.sistemas.solicitud.ArchivoDocumentoAnexo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-archivoDocumentoAnexo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-archivoDocumentoAnexo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="txTipo" title="${message(code: 'archivoDocumentoAnexo.txTipo.label', default: 'Tx Tipo')}" />
					
						<g:sortableColumn property="blDocanexo" title="${message(code: 'archivoDocumentoAnexo.blDocanexo.label', default: 'Bl Docanexo')}" />
					
						<th><g:message code="archivoDocumentoAnexo.t402TDocanexo.label" default="T402 TD ocanexo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${archivoDocumentoAnexoInstanceList}" status="i" var="archivoDocumentoAnexoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${archivoDocumentoAnexoInstance.id}">${fieldValue(bean: archivoDocumentoAnexoInstance, field: "txTipo")}</g:link></td>
					
						<td>${fieldValue(bean: archivoDocumentoAnexoInstance, field: "blDocanexo")}</td>
					
						<td>${fieldValue(bean: archivoDocumentoAnexoInstance, field: "t402TDocanexo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${archivoDocumentoAnexoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
