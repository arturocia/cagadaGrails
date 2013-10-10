<%@ page import="mx.amib.sistemas.solicitud.catalogo.ModalidadCertificacion" %>



<div class="fieldcontain ${hasErrors(bean: modalidadCertificacionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="modalidadCertificacion.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="50" value="${modalidadCertificacionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modalidadCertificacionInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="modalidadCertificacion.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${modalidadCertificacionInstance?.vigente}" />
</div>

