package foliosaaa

class Institucion {

	String nombre
	static belongsTo = [folio:Folio]
    static constraints = {
    }
}
