package foliosaaa

class Folio {
    
	//static hasMany = [institucion: Institucion]
	Institucion institucion

	Date fecha
	Integer numero
	Byte pdf
	
    static constraints = {
		fecha nullable:true 
		numero nullable:true ,maxSize:6
    }
}
