<%@ page import="mx.amib.sistemas.solicitante.Solicitante" %>



<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'apellidoPaterno', 'error')} ">
	<label for="apellidoPaterno">
		<g:message code="solicitante.apellidoPaterno.label" default="Apellido Paterno" />
		
	</label>
	<g:textField name="apellidoPaterno" maxlength="100" value="${solicitanteInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="solicitante.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" maxlength="100" value="${solicitanteInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'nombrePila', 'error')} ">
	<label for="nombrePila">
		<g:message code="solicitante.nombrePila.label" default="Nombre Pila" />
		
	</label>
	<g:textField name="nombrePila" maxlength="100" value="${solicitanteInstance?.nombrePila}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'rfc', 'error')} ">
	<label for="rfc">
		<g:message code="solicitante.rfc.label" default="Rfc" />
		
	</label>
	<g:textField name="rfc" maxlength="13" value="${solicitanteInstance?.rfc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'curp', 'error')} ">
	<label for="curp">
		<g:message code="solicitante.curp.label" default="Curp" />
		
	</label>
	<g:textField name="curp" maxlength="18" value="${solicitanteInstance?.curp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'correoElectronicoPersonal', 'error')} ">
	<label for="correoElectronicoPersonal">
		<g:message code="solicitante.correoElectronicoPersonal.label" default="Correo Electronico Personal" />
		
	</label>
	<g:textArea name="correoElectronicoPersonal" cols="40" rows="5" maxlength="254" value="${solicitanteInstance?.correoElectronicoPersonal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'lugarNacimiento', 'error')} ">
	<label for="lugarNacimiento">
		<g:message code="solicitante.lugarNacimiento.label" default="Lugar Nacimiento" />
		
	</label>
	<g:textField name="lugarNacimiento" maxlength="100" value="${solicitanteInstance?.lugarNacimiento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'genero', 'error')} ">
	<label for="genero">
		<g:message code="solicitante.genero.label" default="Genero" />
		
	</label>
	<g:textField name="genero" maxlength="1" value="${solicitanteInstance?.genero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'estadoCivil', 'error')} ">
	<label for="estadoCivil">
		<g:message code="solicitante.estadoCivil.label" default="Estado Civil" />
		
	</label>
	<g:textField name="estadoCivil" maxlength="1" value="${solicitanteInstance?.estadoCivil}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="solicitante.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" maxlength="100" value="${solicitanteInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'numeroExterior', 'error')} ">
	<label for="numeroExterior">
		<g:message code="solicitante.numeroExterior.label" default="Numero Exterior" />
		
	</label>
	<g:textField name="numeroExterior" maxlength="35" value="${solicitanteInstance?.numeroExterior}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'esMexicanoNaturalizado', 'error')} ">
	<label for="esMexicanoNaturalizado">
		<g:message code="solicitante.esMexicanoNaturalizado.label" default="Es Mexicano Naturalizado" />
		
	</label>
	<g:checkBox name="esMexicanoNaturalizado" value="${solicitanteInstance?.esMexicanoNaturalizado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'archivoFoto', 'error')} required">
	<label for="archivoFoto">
		<g:message code="solicitante.archivoFoto.label" default="Archivo Foto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="archivoFoto" name="archivoFoto.id" from="${mx.amib.sistemas.solicitante.ArchivoFoto.list()}" optionKey="id" required="" value="${solicitanteInstance?.archivoFoto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="solicitante.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${solicitanteInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'nacionalidad', 'error')} required">
	<label for="nacionalidad">
		<g:message code="solicitante.nacionalidad.label" default="Nacionalidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="nacionalidad" name="nacionalidad.id" from="${mx.amib.sistemas.solicitante.catalogo.Nacionalidad.list()}" optionKey="id" required="" value="${solicitanteInstance?.nacionalidad?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'nivelEstudios', 'error')} required">
	<label for="nivelEstudios">
		<g:message code="solicitante.nivelEstudios.label" default="Nivel Estudios" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="nivelEstudios" name="nivelEstudios.id" from="${mx.amib.sistemas.solicitante.catalogo.NivelEstudios.list()}" optionKey="id" required="" value="${solicitanteInstance?.nivelEstudios?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'puestos', 'error')} ">
	<label for="puestos">
		<g:message code="solicitante.puestos.label" default="Puestos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${solicitanteInstance?.puestos?}" var="p">
    <li><g:link controller="puesto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="puesto" action="create" params="['solicitante.id': solicitanteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'puesto.label', default: 'Puesto')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'sepomex', 'error')} required">
	<label for="sepomex">
		<g:message code="solicitante.sepomex.label" default="Sepomex" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sepomex" name="sepomex.id" from="${mx.amib.sistemas.sepomex.catalogo.Sepomex.list()}" optionKey="id" required="" value="${solicitanteInstance?.sepomex?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'solicitudes', 'error')} ">
	<label for="solicitudes">
		<g:message code="solicitante.solicitudes.label" default="Solicitudes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${solicitanteInstance?.solicitudes?}" var="s">
    <li><g:link controller="solicitud" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="solicitud" action="create" params="['solicitante.id': solicitanteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'solicitud.label', default: 'Solicitud')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="solicitante.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${solicitanteInstance?.telefonos?}" var="t">
    <li><g:link controller="telefonoSolicitante" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefonoSolicitante" action="create" params="['solicitante.id': solicitanteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitanteInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="solicitante.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${ms.amib.sistemas.membership.Usuario.list()}" optionKey="id" required="" value="${solicitanteInstance?.usuario?.id}" class="many-to-one"/>
</div>

