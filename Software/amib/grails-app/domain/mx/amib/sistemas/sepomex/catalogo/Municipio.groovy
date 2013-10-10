package mx.amib.sistemas.sepomex.catalogo

class Municipio {
	String clave
	String nombre
	Boolean vigente
	EntidadFederativa entidadFederativa

	static hasMany = [asentamientos: Asentamiento,
	                  ciudades: Ciudad]
	static belongsTo = [EntidadFederativa]

	static mapping = {
		table 't202_c_municipio'
		
		clave column: 'cve_municipio'
		nombre column: 'nm_municipio'
		vigente column: 'st_vigente'
		
		entidadFederativa column: 'id_201_entidadfed'
		
		version false
	}

	static constraints = {
		clave maxSize: 3
		nombre maxSize: 150
	}
}
