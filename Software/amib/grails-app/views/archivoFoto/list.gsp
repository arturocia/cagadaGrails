
<%@ page import="mx.amib.sistemas.solicitante.ArchivoFoto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'archivoFoto.label', default: 'ArchivoFoto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-archivoFoto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-archivoFoto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipo" title="${message(code: 'archivoFoto.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="archivo" title="${message(code: 'archivoFoto.archivo.label', default: 'Archivo')}" />
					
						<th><g:message code="archivoFoto.solicitante.label" default="Solicitante" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${archivoFotoInstanceList}" status="i" var="archivoFotoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${archivoFotoInstance.id}">${fieldValue(bean: archivoFotoInstance, field: "tipo")}</g:link></td>
					
						<td>${fieldValue(bean: archivoFotoInstance, field: "archivo")}</td>
					
						<td>${fieldValue(bean: archivoFotoInstance, field: "solicitante")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${archivoFotoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
