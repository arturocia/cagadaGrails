
<%@ page import="mx.amib.sistemas.solicitud.Solicitud" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitud.label', default: 'Solicitud')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-solicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-solicitud" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list solicitud">
			
				<g:if test="${solicitudInstance?.nuFolioacredetica}">
				<li class="fieldcontain">
					<span id="nuFolioacredetica-label" class="property-label"><g:message code="solicitud.nuFolioacredetica.label" default="Nu Folioacredetica" /></span>
					
						<span class="property-value" aria-labelledby="nuFolioacredetica-label"><g:fieldValue bean="${solicitudInstance}" field="nuFolioacredetica"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.nuMatriculaamib}">
				<li class="fieldcontain">
					<span id="nuMatriculaamib-label" class="property-label"><g:message code="solicitud.nuMatriculaamib.label" default="Nu Matriculaamib" /></span>
					
						<span class="property-value" aria-labelledby="nuMatriculaamib-label"><g:fieldValue bean="${solicitudInstance}" field="nuMatriculaamib"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.nuFolioautorizacion}">
				<li class="fieldcontain">
					<span id="nuFolioautorizacion-label" class="property-label"><g:message code="solicitud.nuFolioautorizacion.label" default="Nu Folioautorizacion" /></span>
					
						<span class="property-value" aria-labelledby="nuFolioautorizacion-label"><g:fieldValue bean="${solicitudInstance}" field="nuFolioautorizacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.txModactcerti}">
				<li class="fieldcontain">
					<span id="txModactcerti-label" class="property-label"><g:message code="solicitud.txModactcerti.label" default="Tx Modactcerti" /></span>
					
						<span class="property-value" aria-labelledby="txModactcerti-label"><g:fieldValue bean="${solicitudInstance}" field="txModactcerti"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.txOtroinstcapac}">
				<li class="fieldcontain">
					<span id="txOtroinstcapac-label" class="property-label"><g:message code="solicitud.txOtroinstcapac.label" default="Tx Otroinstcapac" /></span>
					
						<span class="property-value" aria-labelledby="txOtroinstcapac-label"><g:fieldValue bean="${solicitudInstance}" field="txOtroinstcapac"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.nmDiInstitucion}">
				<li class="fieldcontain">
					<span id="nmDiInstitucion-label" class="property-label"><g:message code="solicitud.nmDiInstitucion.label" default="Nm Di Institucion" /></span>
					
						<span class="property-value" aria-labelledby="nmDiInstitucion-label"><g:fieldValue bean="${solicitudInstance}" field="nmDiInstitucion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.txDiPuesto}">
				<li class="fieldcontain">
					<span id="txDiPuesto-label" class="property-label"><g:message code="solicitud.txDiPuesto.label" default="Tx Di Puesto" /></span>
					
						<span class="property-value" aria-labelledby="txDiPuesto-label"><g:fieldValue bean="${solicitudInstance}" field="txDiPuesto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.fhDiIniciolaborles}">
				<li class="fieldcontain">
					<span id="fhDiIniciolaborles-label" class="property-label"><g:message code="solicitud.fhDiIniciolaborles.label" default="Fh Di Iniciolaborles" /></span>
					
						<span class="property-value" aria-labelledby="fhDiIniciolaborles-label"><g:formatDate date="${solicitudInstance?.fhDiIniciolaborles}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.fhDiConsulrepcredesp}">
				<li class="fieldcontain">
					<span id="fhDiConsulrepcredesp-label" class="property-label"><g:message code="solicitud.fhDiConsulrepcredesp.label" default="Fh Di Consulrepcredesp" /></span>
					
						<span class="property-value" aria-labelledby="fhDiConsulrepcredesp-label"><g:formatDate date="${solicitudInstance?.fhDiConsulrepcredesp}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.nmDfRazonsocial}">
				<li class="fieldcontain">
					<span id="nmDfRazonsocial-label" class="property-label"><g:message code="solicitud.nmDfRazonsocial.label" default="Nm Df Razonsocial" /></span>
					
						<span class="property-value" aria-labelledby="nmDfRazonsocial-label"><g:fieldValue bean="${solicitudInstance}" field="nmDfRazonsocial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.txDfCorreofactura}">
				<li class="fieldcontain">
					<span id="txDfCorreofactura-label" class="property-label"><g:message code="solicitud.txDfCorreofactura.label" default="Tx Df Correofactura" /></span>
					
						<span class="property-value" aria-labelledby="txDfCorreofactura-label"><g:fieldValue bean="${solicitudInstance}" field="txDfCorreofactura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.fhSolicitud}">
				<li class="fieldcontain">
					<span id="fhSolicitud-label" class="property-label"><g:message code="solicitud.fhSolicitud.label" default="Fh Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="fhSolicitud-label"><g:formatDate date="${solicitudInstance?.fhSolicitud}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t301TSolicitante}">
				<li class="fieldcontain">
					<span id="t301TSolicitante-label" class="property-label"><g:message code="solicitud.t301TSolicitante.label" default="T301 TS olicitante" /></span>
					
						<span class="property-value" aria-labelledby="t301TSolicitante-label"><g:link controller="solicitante" action="show" id="${solicitudInstance?.t301TSolicitante?.id}">${solicitudInstance?.t301TSolicitante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t402TDocanexos}">
				<li class="fieldcontain">
					<span id="t402TDocanexos-label" class="property-label"><g:message code="solicitud.t402TDocanexos.label" default="T402 TD ocanexos" /></span>
					
						<g:each in="${solicitudInstance.t402TDocanexos}" var="t">
						<span class="property-value" aria-labelledby="t402TDocanexos-label"><g:link controller="documentoAnexo" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t404CStatussolicitud}">
				<li class="fieldcontain">
					<span id="t404CStatussolicitud-label" class="property-label"><g:message code="solicitud.t404CStatussolicitud.label" default="T404 CS tatussolicitud" /></span>
					
						<span class="property-value" aria-labelledby="t404CStatussolicitud-label"><g:link controller="statusSolicitud" action="show" id="${solicitudInstance?.t404CStatussolicitud?.id}">${solicitudInstance?.t404CStatussolicitud?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t406CTiposervicio}">
				<li class="fieldcontain">
					<span id="t406CTiposervicio-label" class="property-label"><g:message code="solicitud.t406CTiposervicio.label" default="T406 CT iposervicio" /></span>
					
						<span class="property-value" aria-labelledby="t406CTiposervicio-label"><g:link controller="tipoServicio" action="show" id="${solicitudInstance?.t406CTiposervicio?.id}">${solicitudInstance?.t406CTiposervicio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t407CFormapago}">
				<li class="fieldcontain">
					<span id="t407CFormapago-label" class="property-label"><g:message code="solicitud.t407CFormapago.label" default="T407 CF ormapago" /></span>
					
						<span class="property-value" aria-labelledby="t407CFormapago-label"><g:link controller="formaPago" action="show" id="${solicitudInstance?.t407CFormapago?.id}">${solicitudInstance?.t407CFormapago?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t408CFigura}">
				<li class="fieldcontain">
					<span id="t408CFigura-label" class="property-label"><g:message code="solicitud.t408CFigura.label" default="T408 CF igura" /></span>
					
						<span class="property-value" aria-labelledby="t408CFigura-label"><g:link controller="figura" action="show" id="${solicitudInstance?.t408CFigura?.id}">${solicitudInstance?.t408CFigura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t409CTipoexamen}">
				<li class="fieldcontain">
					<span id="t409CTipoexamen-label" class="property-label"><g:message code="solicitud.t409CTipoexamen.label" default="T409 CT ipoexamen" /></span>
					
						<span class="property-value" aria-labelledby="t409CTipoexamen-label"><g:link controller="tipoExamen" action="show" id="${solicitudInstance?.t409CTipoexamen?.id}">${solicitudInstance?.t409CTipoexamen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t410CModalcapacitacion}">
				<li class="fieldcontain">
					<span id="t410CModalcapacitacion-label" class="property-label"><g:message code="solicitud.t410CModalcapacitacion.label" default="T410 CM odalcapacitacion" /></span>
					
						<span class="property-value" aria-labelledby="t410CModalcapacitacion-label"><g:link controller="modalidadCapacitacion" action="show" id="${solicitudInstance?.t410CModalcapacitacion?.id}">${solicitudInstance?.t410CModalcapacitacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t411CHorarioexamen}">
				<li class="fieldcontain">
					<span id="t411CHorarioexamen-label" class="property-label"><g:message code="solicitud.t411CHorarioexamen.label" default="T411 CH orarioexamen" /></span>
					
						<span class="property-value" aria-labelledby="t411CHorarioexamen-label"><g:link controller="horarioExamen" action="show" id="${solicitudInstance?.t411CHorarioexamen?.id}">${solicitudInstance?.t411CHorarioexamen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t412CModalactcert}">
				<li class="fieldcontain">
					<span id="t412CModalactcert-label" class="property-label"><g:message code="solicitud.t412CModalactcert.label" default="T412 CM odalactcert" /></span>
					
						<span class="property-value" aria-labelledby="t412CModalactcert-label"><g:link controller="modalidadCertificacion" action="show" id="${solicitudInstance?.t412CModalactcert?.id}">${solicitudInstance?.t412CModalactcert?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.t413CInstitutocapacitador}">
				<li class="fieldcontain">
					<span id="t413CInstitutocapacitador-label" class="property-label"><g:message code="solicitud.t413CInstitutocapacitador.label" default="T413 CI nstitutocapacitador" /></span>
					
						<span class="property-value" aria-labelledby="t413CInstitutocapacitador-label"><g:link controller="institutoCapacitador" action="show" id="${solicitudInstance?.t413CInstitutocapacitador?.id}">${solicitudInstance?.t413CInstitutocapacitador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${solicitudInstance?.id}" />
					<g:link class="edit" action="edit" id="${solicitudInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
