package mx.amib.sistemas.solicitud.catalogo

class HorarioExamen {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't411_c_horarioexamen'
		
		descripcion column: 'ds_horarioexamen'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 50
	}
}
