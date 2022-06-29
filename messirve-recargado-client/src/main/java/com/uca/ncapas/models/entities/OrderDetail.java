package com.uca.ncapas.models.entities;

public class OrderDetail {
	private Integer orden_detalle_id;
	private Integer orden_id;
	private Integer producto_id;
	private Integer cantidad_orden_detalle;
	
	public OrderDetail(Integer orden_detalle_id, Integer orden_id, Integer producto_id,
			Integer cantidad_orden_detalle) {
		super();
		this.orden_detalle_id = orden_detalle_id;
		this.orden_id = orden_id;
		this.producto_id = producto_id;
		this.cantidad_orden_detalle = cantidad_orden_detalle;
	}

	public OrderDetail() {
		super();
	}

	public Integer getOrden_detalle_id() {
		return orden_detalle_id;
	}

	public void setOrden_detalle_id(Integer orden_detalle_id) {
		this.orden_detalle_id = orden_detalle_id;
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

	public Integer getCantidad_orden_detalle() {
		return cantidad_orden_detalle;
	}

	public void setCantidad_orden_detalle(Integer cantidad_orden_detalle) {
		this.cantidad_orden_detalle = cantidad_orden_detalle;
	}
	
	
}
