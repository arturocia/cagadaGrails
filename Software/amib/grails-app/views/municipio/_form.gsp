<%@ page import="mx.amib.sistemas.sepomex.catalogo.Municipio" %>



<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'clave', 'error')} ">
	<label for="clave">
		<g:message code="municipio.clave.label" default="Clave" />
		
	</label>
	<g:textField name="clave" maxlength="3" value="${municipioInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="municipio.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="150" value="${municipioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'asentamientos', 'error')} ">
	<label for="asentamientos">
		<g:message code="municipio.asentamientos.label" default="Asentamientos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${municipioInstance?.asentamientos?}" var="a">
    <li><g:link controller="asentamiento" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="asentamiento" action="create" params="['municipio.id': municipioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asentamiento.label', default: 'Asentamiento')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'ciudades', 'error')} ">
	<label for="ciudades">
		<g:message code="municipio.ciudades.label" default="Ciudades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${municipioInstance?.ciudades?}" var="c">
    <li><g:link controller="ciudad" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ciudad" action="create" params="['municipio.id': municipioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ciudad.label', default: 'Ciudad')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'entidadFederativa', 'error')} required">
	<label for="entidadFederativa">
		<g:message code="municipio.entidadFederativa.label" default="Entidad Federativa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entidadFederativa" name="entidadFederativa.id" from="${mx.amib.sistemas.sepomex.catalogo.EntidadFederativa.list()}" optionKey="id" required="" value="${municipioInstance?.entidadFederativa?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="municipio.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${municipioInstance?.vigente}" />
</div>

