<%@ page import="mx.amib.sistemas.solicitud.Solicitud" %>



<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'nuFolioacredetica', 'error')} ">
	<label for="nuFolioacredetica">
		<g:message code="solicitud.nuFolioacredetica.label" default="Nu Folioacredetica" />
		
	</label>
	<g:field name="nuFolioacredetica" type="number" value="${solicitudInstance.nuFolioacredetica}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'nuMatriculaamib', 'error')} ">
	<label for="nuMatriculaamib">
		<g:message code="solicitud.nuMatriculaamib.label" default="Nu Matriculaamib" />
		
	</label>
	<g:field name="nuMatriculaamib" type="number" value="${solicitudInstance.nuMatriculaamib}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'nuFolioautorizacion', 'error')} ">
	<label for="nuFolioautorizacion">
		<g:message code="solicitud.nuFolioautorizacion.label" default="Nu Folioautorizacion" />
		
	</label>
	<g:field name="nuFolioautorizacion" type="number" value="${solicitudInstance.nuFolioautorizacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'txModactcerti', 'error')} ">
	<label for="txModactcerti">
		<g:message code="solicitud.txModactcerti.label" default="Tx Modactcerti" />
		
	</label>
	<g:textField name="txModactcerti" maxlength="20" value="${solicitudInstance?.txModactcerti}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'txOtroinstcapac', 'error')} ">
	<label for="txOtroinstcapac">
		<g:message code="solicitud.txOtroinstcapac.label" default="Tx Otroinstcapac" />
		
	</label>
	<g:textField name="txOtroinstcapac" maxlength="200" value="${solicitudInstance?.txOtroinstcapac}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'nmDiInstitucion', 'error')} ">
	<label for="nmDiInstitucion">
		<g:message code="solicitud.nmDiInstitucion.label" default="Nm Di Institucion" />
		
	</label>
	<g:textField name="nmDiInstitucion" maxlength="200" value="${solicitudInstance?.nmDiInstitucion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'txDiPuesto', 'error')} ">
	<label for="txDiPuesto">
		<g:message code="solicitud.txDiPuesto.label" default="Tx Di Puesto" />
		
	</label>
	<g:textField name="txDiPuesto" maxlength="100" value="${solicitudInstance?.txDiPuesto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'fhDiIniciolaborles', 'error')} ">
	<label for="fhDiIniciolaborles">
		<g:message code="solicitud.fhDiIniciolaborles.label" default="Fh Di Iniciolaborles" />
		
	</label>
	<g:datePicker name="fhDiIniciolaborles" precision="day"  value="${solicitudInstance?.fhDiIniciolaborles}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'fhDiConsulrepcredesp', 'error')} ">
	<label for="fhDiConsulrepcredesp">
		<g:message code="solicitud.fhDiConsulrepcredesp.label" default="Fh Di Consulrepcredesp" />
		
	</label>
	<g:datePicker name="fhDiConsulrepcredesp" precision="day"  value="${solicitudInstance?.fhDiConsulrepcredesp}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'nmDfRazonsocial', 'error')} ">
	<label for="nmDfRazonsocial">
		<g:message code="solicitud.nmDfRazonsocial.label" default="Nm Df Razonsocial" />
		
	</label>
	<g:textArea name="nmDfRazonsocial" cols="40" rows="5" maxlength="254" value="${solicitudInstance?.nmDfRazonsocial}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'txDfCorreofactura', 'error')} ">
	<label for="txDfCorreofactura">
		<g:message code="solicitud.txDfCorreofactura.label" default="Tx Df Correofactura" />
		
	</label>
	<g:textArea name="txDfCorreofactura" cols="40" rows="5" maxlength="254" value="${solicitudInstance?.txDfCorreofactura}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'fhSolicitud', 'error')} required">
	<label for="fhSolicitud">
		<g:message code="solicitud.fhSolicitud.label" default="Fh Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fhSolicitud" precision="day"  value="${solicitudInstance?.fhSolicitud}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't301TSolicitante', 'error')} required">
	<label for="t301TSolicitante">
		<g:message code="solicitud.t301TSolicitante.label" default="T301 TS olicitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t301TSolicitante" name="t301TSolicitante.id" from="${mx.amib.sistemas.solicitante.Solicitante.list()}" optionKey="id" required="" value="${solicitudInstance?.t301TSolicitante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't402TDocanexos', 'error')} ">
	<label for="t402TDocanexos">
		<g:message code="solicitud.t402TDocanexos.label" default="T402 TD ocanexos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${solicitudInstance?.t402TDocanexos?}" var="t">
    <li><g:link controller="documentoAnexo" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="documentoAnexo" action="create" params="['solicitud.id': solicitudInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't404CStatussolicitud', 'error')} required">
	<label for="t404CStatussolicitud">
		<g:message code="solicitud.t404CStatussolicitud.label" default="T404 CS tatussolicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t404CStatussolicitud" name="t404CStatussolicitud.id" from="${mx.amib.sistemas.solicitud.catalogo.StatusSolicitud.list()}" optionKey="id" required="" value="${solicitudInstance?.t404CStatussolicitud?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't406CTiposervicio', 'error')} required">
	<label for="t406CTiposervicio">
		<g:message code="solicitud.t406CTiposervicio.label" default="T406 CT iposervicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t406CTiposervicio" name="t406CTiposervicio.id" from="${mx.amib.sistemas.solicitud.catalogo.TipoServicio.list()}" optionKey="id" required="" value="${solicitudInstance?.t406CTiposervicio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't407CFormapago', 'error')} required">
	<label for="t407CFormapago">
		<g:message code="solicitud.t407CFormapago.label" default="T407 CF ormapago" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t407CFormapago" name="t407CFormapago.id" from="${mx.amib.sistemas.solicitud.catalogo.FormaPago.list()}" optionKey="id" required="" value="${solicitudInstance?.t407CFormapago?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't408CFigura', 'error')} required">
	<label for="t408CFigura">
		<g:message code="solicitud.t408CFigura.label" default="T408 CF igura" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t408CFigura" name="t408CFigura.id" from="${mx.amib.sistemas.solicitud.catalogo.Figura.list()}" optionKey="id" required="" value="${solicitudInstance?.t408CFigura?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't409CTipoexamen', 'error')} required">
	<label for="t409CTipoexamen">
		<g:message code="solicitud.t409CTipoexamen.label" default="T409 CT ipoexamen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t409CTipoexamen" name="t409CTipoexamen.id" from="${mx.amib.sistemas.solicitud.catalogo.TipoExamen.list()}" optionKey="id" required="" value="${solicitudInstance?.t409CTipoexamen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't410CModalcapacitacion', 'error')} required">
	<label for="t410CModalcapacitacion">
		<g:message code="solicitud.t410CModalcapacitacion.label" default="T410 CM odalcapacitacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t410CModalcapacitacion" name="t410CModalcapacitacion.id" from="${mx.amib.sistemas.solicitud.catalogo.ModalidadCapacitacion.list()}" optionKey="id" required="" value="${solicitudInstance?.t410CModalcapacitacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't411CHorarioexamen', 'error')} required">
	<label for="t411CHorarioexamen">
		<g:message code="solicitud.t411CHorarioexamen.label" default="T411 CH orarioexamen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t411CHorarioexamen" name="t411CHorarioexamen.id" from="${mx.amib.sistemas.solicitud.catalogo.HorarioExamen.list()}" optionKey="id" required="" value="${solicitudInstance?.t411CHorarioexamen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't412CModalactcert', 'error')} required">
	<label for="t412CModalactcert">
		<g:message code="solicitud.t412CModalactcert.label" default="T412 CM odalactcert" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t412CModalactcert" name="t412CModalactcert.id" from="${mx.amib.sistemas.solicitud.catalogo.ModalidadCertificacion.list()}" optionKey="id" required="" value="${solicitudInstance?.t412CModalactcert?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 't413CInstitutocapacitador', 'error')} required">
	<label for="t413CInstitutocapacitador">
		<g:message code="solicitud.t413CInstitutocapacitador.label" default="T413 CI nstitutocapacitador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="t413CInstitutocapacitador" name="t413CInstitutocapacitador.id" from="${mx.amib.sistemas.solicitud.catalogo.InstitutoCapacitador.list()}" optionKey="id" required="" value="${solicitudInstance?.t413CInstitutocapacitador?.id}" class="many-to-one"/>
</div>

