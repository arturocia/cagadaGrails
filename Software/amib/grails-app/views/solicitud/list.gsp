
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
					
						<g:sortableColumn property="folioAcreditacionEtica" title="${message(code: 'solicitud.folioAcreditacionEtica.label', default: 'Folio Acreditacion Etica')}" />
					
						<g:sortableColumn property="matriculaAmib" title="${message(code: 'solicitud.matriculaAmib.label', default: 'Matricula Amib')}" />
					
						<g:sortableColumn property="folioAutorizacion" title="${message(code: 'solicitud.folioAutorizacion.label', default: 'Folio Autorizacion')}" />
					
						<g:sortableColumn property="valorModalidadActualizacionCertificacion" title="${message(code: 'solicitud.valorModalidadActualizacionCertificacion.label', default: 'Valor Modalidad Actualizacion Certificacion')}" />
					
						<g:sortableColumn property="otroInstitutoCapacitador" title="${message(code: 'solicitud.otroInstitutoCapacitador.label', default: 'Otro Instituto Capacitador')}" />
					
						<g:sortableColumn property="datoIntermediarioInstitucion" title="${message(code: 'solicitud.datoIntermediarioInstitucion.label', default: 'Dato Intermediario Institucion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${solicitudInstanceList}" status="i" var="solicitudInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${solicitudInstance.id}">${fieldValue(bean: solicitudInstance, field: "folioAcreditacionEtica")}</g:link></td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "matriculaAmib")}</td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "folioAutorizacion")}</td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "valorModalidadActualizacionCertificacion")}</td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "otroInstitutoCapacitador")}</td>
					
						<td>${fieldValue(bean: solicitudInstance, field: "datoIntermediarioInstitucion")}</td>
					
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
