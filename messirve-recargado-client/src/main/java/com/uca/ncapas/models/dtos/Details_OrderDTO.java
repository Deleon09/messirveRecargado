package com.uca.ncapas.models.dtos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Details_OrderDTO {

	@Id
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "orden_id")
	private Integer orden_id;

	@Column(name = "producto_id")
	private Integer producto_id;

	@Column(name = "producto")
	private String producto;
	
	@Column(name = "cantidad")
	private Integer cantidad;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrden_id() {
		return orden_id;
	}

	public void setOrden_id(Integer orden_id) {
		this.orden_id = orden_id;
	}

	public Integer getProducto_id() {
		return producto_id;
	}

	public void setProducto_id(Integer producto_id) {
		this.producto_id = producto_id;
	}

	public String getProducto() {
		return producto;
	}

	public void setProducto(String producto) {
		this.producto = producto;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	
}
