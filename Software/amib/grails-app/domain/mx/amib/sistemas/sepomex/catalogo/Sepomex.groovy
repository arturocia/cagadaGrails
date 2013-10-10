package mx.amib.sistemas.sepomex.catalogo

class Sepomex {
	String codigoPostal
	Boolean vigente
	Ciudad ciudad
	Asentamiento asentamiento

	static belongsTo = [Asentamiento, Ciudad]

	static mapping = {
		table 't205_c_sepomex'
		
		codigoPostal column: 'cve_codigopostal'
		vigente column: 'st_vigente'
		
		ciudad column: 'id_204_ciudad'
		asentamiento column: 'id_203_asentamiento'
		 
		version false
	}

	static constraints = {
		codigoPostal maxSize: 5
	}
}
