<%@ page import="mx.com.amiba.foliosaaa.Folio" %>



<div class="fieldcontain ${hasErrors(bean: folioInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="folio.fecha.label" default="Fecha" />
		
	</label>
	<g:datePicker name="fecha" precision="day"  value="${folioInstance?.fecha}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: folioInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="folio.numero.label" default="Numero" />
		
	</label>
	<g:field name="numero" type="number" value="${folioInstance.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: folioInstance, field: 'archivo', 'error')} required">
	<label for="archivo">
		<g:message code="folio.archivo.label" default="Archivo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="caca" />
</div>

<div class="fieldcontain ${hasErrors(bean: folioInstance, field: 'institucion', 'error')} required">
	<label for="institucion">
		<g:message code="folio.institucion.label" default="Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institucion" name="institucion.id" from="${mx.com.amiba.foliosaaa.Institucion.list()}" optionKey="id" required="" value="${folioInstance?.institucion?.id}" class="many-to-one"/>
</div>

