package mx.amib.sistemas.solicitante

import mx.amib.sistemas.membership.Usuario;
import mx.amib.sistemas.sepomex.catalogo.Sepomex;
import mx.amib.sistemas.solicitante.catalogo.Nacionalidad;
import mx.amib.sistemas.solicitante.catalogo.NivelEstudios;
import mx.amib.sistemas.solicitud.Solicitud;

class Solicitante {

	String apellidoPaterno
	String apellidoMaterno
	String nombrePila
	String rfc
	String curp
	String correoElectronicoPersonal
	String lugarNacimiento
	Date fechaNacimiento
	String genero
	String estadoCivil
	String calle
	String numeroExterior
	Boolean esMexicanoNaturalizado
	Sepomex sepomex
	Nacionalidad nacionalidad
	NivelEstudios nivelEstudios
	Usuario usuario
	
	static hasMany = [puestos: Puesto,
	                  telefonos: TelefonoSolicitante,
	                  solicitudes: Solicitud]
	static hasOne = [archivoFoto: ArchivoFoto]
	static belongsTo = [Sepomex, Nacionalidad, NivelEstudios, Usuario]

	static mapping = {
		table 't301_t_solicitante'
		
		apellidoPaterno column: 'nm_apaterno'
		apellidoMaterno column: 'nm_amaterno'
		nombrePila column: 'nm_nombrepila'
		rfc column: 'tx_rfc'
		curp column: 'tx_curp'
		correoElectronicoPersonal column: 'tx_correopersonal'
		lugarNacimiento column: 'tx_lugarnacimiento'
		fechaNacimiento column: 'fh_fechanacimiento'
		genero column: 'st_genero'
		estadoCivil column: 'st_estadocivil'
		calle column: 'tx_calle'
		numeroExterior column: 'tx_numext'
		esMexicanoNaturalizado column: 'st_nacmexnatural'
		
		sepomex column: 'id_205_sepomex'
		nacionalidad column: 'id_304_nacionalidad'
		nivelEstudios column: 'id_305_nivelestudios'
		usuario column: 'id_101_usuario'
		
		version false
	}

	static constraints = {
		apellidoPaterno maxSize: 100
		apellidoMaterno maxSize: 100
		nombrePila maxSize: 100
		rfc maxSize: 13
		curp nullable: true, maxSize: 18
		correoElectronicoPersonal maxSize: 254
		lugarNacimiento maxSize: 100
		genero maxSize: 1
		estadoCivil maxSize: 1
		calle maxSize: 100
		numeroExterior maxSize: 35
		esMexicanoNaturalizado nullable: true
	}
}
