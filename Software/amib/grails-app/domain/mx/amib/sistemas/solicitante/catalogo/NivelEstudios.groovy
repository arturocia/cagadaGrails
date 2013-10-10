package mx.amib.sistemas.solicitante.catalogo

class NivelEstudios {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't305_c_nivelestudios'
		
		descripcion column: 'ds_nivelestudios'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 50
	}
}
