<%@ page import="mx.amib.sistemas.solicitante.catalogo.NivelEstudios" %>



<div class="fieldcontain ${hasErrors(bean: nivelEstudiosInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="nivelEstudios.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="50" value="${nivelEstudiosInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: nivelEstudiosInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="nivelEstudios.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${nivelEstudiosInstance?.vigente}" />
</div>

