<%@ page import="foliosaaa.SubFolio" %>



<div class="fieldcontain ${hasErrors(bean: subFolioInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="subFolio.fecha.label" default="Fecha" />
		
	</label>
	<g:datePicker name="fecha" precision="day"  value="${subFolioInstance?.fecha}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: subFolioInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="subFolio.numero.label" default="Numero" />
		
	</label>
	<g:field name="numero" type="number" value="${subFolioInstance.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subFolioInstance, field: 'folio', 'error')} required">
	<label for="folio">
		<g:message code="subFolio.folio.label" default="Folio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="folio" name="folio.id" from="${foliosaaa.Folio.list()}" optionKey="id" required="" value="${subFolioInstance?.folio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subFolioInstance, field: 'pdf2', 'error')} required">
	<label for="pdf2">
		<g:message code="subFolio.pdf2.label" default="Pdf2" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

