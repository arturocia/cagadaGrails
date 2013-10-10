package mx.amib.sistemas.sepomex.catalogo


class Ciudad {
	String clave
	String nombre
	Boolean vigente
	Municipio municipio

	static hasMany = [conjuntoSepomex: Sepomex]
	static belongsTo = [Municipio]

	static mapping = {
		table 't204_c_ciudad'
		
		clave column: 'cve_ciudad'
		nombre column: 'nm_ciudad'
		vigente column: 'st_vigente'
		
		municipio column: 'id_202_municipio'
		
		version false
	}

	static constraints = {
		clave maxSize: 2
		nombre maxSize: 255
	}
}
