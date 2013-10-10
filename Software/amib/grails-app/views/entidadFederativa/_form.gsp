<%@ page import="mx.amib.sistemas.sepomex.catalogo.EntidadFederativa" %>



<div class="fieldcontain ${hasErrors(bean: entidadFederativaInstance, field: 'clave', 'error')} ">
	<label for="clave">
		<g:message code="entidadFederativa.clave.label" default="Clave" />
		
	</label>
	<g:textField name="clave" maxlength="2" value="${entidadFederativaInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entidadFederativaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="entidadFederativa.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="100" value="${entidadFederativaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entidadFederativaInstance, field: 'municipios', 'error')} ">
	<label for="municipios">
		<g:message code="entidadFederativa.municipios.label" default="Municipios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${entidadFederativaInstance?.municipios?}" var="m">
    <li><g:link controller="municipio" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="municipio" action="create" params="['entidadFederativa.id': entidadFederativaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'municipio.label', default: 'Municipio')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: entidadFederativaInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="entidadFederativa.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${entidadFederativaInstance?.vigente}" />
</div>

