package mx.amib.sistemas.sepomex.catalogo


class Asentamiento {
	String clave
	String nombre
	Boolean vigente
	Municipio municipio

	static hasMany = [conjuntoSepomex: Sepomex]
	static belongsTo = [Municipio]

	static mapping = {
		table 't203_c_asentamiento'
		
		clave column: 'cve_asentamiento'
		nombre column: 'nm_asentamiento'
		vigente column: 'st_vigente'
		
		municipio column: 'id_202_municipio'
		
		version false
	}

	static constraints = {
		clave maxSize: 4
		nombre maxSize: 255
	}
}
