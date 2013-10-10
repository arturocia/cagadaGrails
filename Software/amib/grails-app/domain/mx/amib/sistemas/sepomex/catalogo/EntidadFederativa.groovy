package mx.amib.sistemas.sepomex.catalogo

class EntidadFederativa {
	String clave
	String nombre
	Boolean vigente

	static hasMany = [municipios: Municipio]

	static mapping = {
		table 't201_c_entidadfed'
		
		clave column: 'cve_entidadfed'
		nombre column: 'nm_entidadfed'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		clave maxSize: 2, unique: true
		nombre maxSize: 100
	}
}
