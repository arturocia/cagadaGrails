
<%@ page import="foliosaaa.SubFolio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subFolio.label', default: 'SubFolio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subFolio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subFolio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'subFolio.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'subFolio.numero.label', default: 'Numero')}" />
					
						<th><g:message code="subFolio.folio.label" default="Folio" /></th>
					
						<g:sortableColumn property="pdf2" title="${message(code: 'subFolio.pdf2.label', default: 'Pdf2')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subFolioInstanceList}" status="i" var="subFolioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subFolioInstance.id}">${fieldValue(bean: subFolioInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: subFolioInstance, field: "numero")}</td>
					
						<td>${fieldValue(bean: subFolioInstance, field: "folio")}</td>
					
						<td>${fieldValue(bean: subFolioInstance, field: "pdf2")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subFolioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
