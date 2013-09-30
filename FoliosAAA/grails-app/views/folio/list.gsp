
<%@ page import="foliosaaa.Folio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'folio.label', default: 'Folio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-folio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-folio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'folio.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'folio.numero.label', default: 'Numero')}" />
					
						<g:sortableColumn property="cagada" title="${message(code: 'folio.cagada.label', default: 'Cagada')}" />
					
						<th><g:message code="folio.institucion.label" default="Institucion" /></th>
					
						<g:sortableColumn property="pdf" title="${message(code: 'folio.pdf.label', default: 'Pdf')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${folioInstanceList}" status="i" var="folioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${folioInstance.id}">${fieldValue(bean: folioInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: folioInstance, field: "numero")}</td>
					
						<td>${fieldValue(bean: folioInstance, field: "cagada")}</td>
					
						<td>${fieldValue(bean: folioInstance, field: "institucion")}</td>
					
						<td>${fieldValue(bean: folioInstance, field: "pdf")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${folioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
