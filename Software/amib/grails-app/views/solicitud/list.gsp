
<%@ page import="mx.amib.sistemas.solicitud.Solicitud" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitud.label', default: 'Solicitud')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-solicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-solicitud" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nuFolioacredetica" title="${message(code: 'solicitud.nuFolioacredetica.label', default: 'Nu Folioacredetica')}" />
					
						<g:sortableColumn property="nuMatriculaamib" title="${message(code: 'solicitud.nuMatriculaamib.label', default: 'Nu Matriculaamib')}" />
					
						<g:sortableColumn property="nuFolioautorizacion" title="${message(code: 'solicitud.nuFolioautorizacion.label', default: 'Nu Folioautorizacion')}" />
					
						<g:sortableColumn property="txModactcerti" title="${message(code: 'solicitud.txModactcerti.label', default: 'Tx Modactcerti')}" />
					
						<g:sortableColumn property="txOtroinstcapac" title="${message(code: 'solicitud.txOtroinstcapac.label', default: 'Tx Otroinstcapac')}" />
					
						<g:sortableColumn property="nmDiInstitucion" title="${message(code: 'solicitud.nmDiInstitucion.label', default: 'Nm Di Institucion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${solicitudInstanceList}" status="i" var="solicitudInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${solicitudInstance.id}">${fieldValue(bean: solicitudInstance, field: "nuFolioacredetica")}</g:link></td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "nuMatriculaamib")}</td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "nuFolioautorizacion")}</td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "txModactcerti")}</td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "txOtroinstcapac")}</td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "nmDiInstitucion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${solicitudInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
