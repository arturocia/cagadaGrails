package mx.amib.sistemas.solicitud.catalogo

class ModalidadCapacitacion {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't410_c_modalcapacitacion'
		
		descripcion column: 'ds_modalcapacitacion'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 100
	}
}
