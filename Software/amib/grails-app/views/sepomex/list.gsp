
<%@ page import="mx.amib.sistemas.sepomex.catalogo.Sepomex" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sepomex.label', default: 'Sepomex')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sepomex" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sepomex" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'sepomex.codigoPostal.label', default: 'Codigo Postal')}" />
					
						<th><g:message code="sepomex.asentamiento.label" default="Asentamiento" /></th>
					
						<th><g:message code="sepomex.ciudad.label" default="Ciudad" /></th>
					
						<g:sortableColumn property="vigente" title="${message(code: 'sepomex.vigente.label', default: 'Vigente')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sepomexInstanceList}" status="i" var="sepomexInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sepomexInstance.id}">${fieldValue(bean: sepomexInstance, field: "codigoPostal")}</g:link></td>
					
						<td>${fieldValue(bean: sepomexInstance, field: "asentamiento")}</td>
					
						<td>${fieldValue(bean: sepomexInstance, field: "ciudad")}</td>
					
						<td><g:formatBoolean boolean="${sepomexInstance.vigente}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sepomexInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
