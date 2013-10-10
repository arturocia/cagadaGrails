<%@ page import="mx.amib.sistemas.solicitud.catalogo.HorarioExamen" %>



<div class="fieldcontain ${hasErrors(bean: horarioExamenInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="horarioExamen.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="50" value="${horarioExamenInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: horarioExamenInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="horarioExamen.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${horarioExamenInstance?.vigente}" />
</div>

