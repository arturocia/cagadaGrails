CREATE VIEW v_201_ciudad_comp AS
	select distinct c.id, c.cve_ciudad, m.cve_municipio, e.cve_entidadfed 
	from t204_c_ciudad c, t202_c_municipio m, t201_c_entidadfed e 
	where
		c.id_202_municipio = m.id and
		m.id_201_entidadfed = e.id;
		
CREATE VIEW v_202_asentamiento_comp AS
	select distinct a.id, a.cve_asentamiento, m.cve_municipio, e.cve_entidadfed 
	from t203_c_asentamiento a, t202_c_municipio m, t201_c_entidadfed e 
	where
		a.id_202_municipio = m.id and
		m.id_201_entidadfed = e.id;