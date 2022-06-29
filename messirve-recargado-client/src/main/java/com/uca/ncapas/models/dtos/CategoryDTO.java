package com.uca.ncapas.models.dtos;

public class CategoryDTO {
	private Integer categoria_id;
	private String nombre_categoria;
	
	public CategoryDTO(Integer categoria_id, String nombre_categoria) {
		super();
		this.categoria_id = categoria_id;
		this.nombre_categoria = nombre_categoria;
	}

	public CategoryDTO() {
		super();
	}

	public Integer getCategoria_id() {
		return categoria_id;
	}

	public void setCategoria_id(Integer categoria_id) {
		this.categoria_id = categoria_id;
	}

	public String getNombre_categoria() {
		return nombre_categoria;
	}

	public void setNombre_categoria(String nombre_categoria) {
		this.nombre_categoria = nombre_categoria;
	}

}
