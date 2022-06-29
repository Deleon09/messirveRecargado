package com.uca.ncapas.models.dtos;

public class NewsletterDTO {
	private Integer carta_id;
	private String nombre_completo_carta;
	private String correo_carta;
	private String asunto_carta;
	private String mensaje_carta;
	
	public NewsletterDTO(Integer carta_id, String nombre_completo_carta, String correo_carta, String asunto_carta,
			String mensaje_carta) {
		super();
		this.carta_id = carta_id;
		this.nombre_completo_carta = nombre_completo_carta;
		this.correo_carta = correo_carta;
		this.asunto_carta = asunto_carta;
		this.mensaje_carta = mensaje_carta;
	}

	public NewsletterDTO() {
		super();
	}

	public Integer getCarta_id() {
		return carta_id;
	}

	public void setCarta_id(Integer carta_id) {
		this.carta_id = carta_id;
	}

	public String getNombre_completo_carta() {
		return nombre_completo_carta;
	}

	public void setNombre_completo_carta(String nombre_completo_carta) {
		this.nombre_completo_carta = nombre_completo_carta;
	}

	public String getCorreo_carta() {
		return correo_carta;
	}

	public void setCorreo_carta(String correo_carta) {
		this.correo_carta = correo_carta;
	}

	public String getAsunto_carta() {
		return asunto_carta;
	}

	public void setAsunto_carta(String asunto_carta) {
		this.asunto_carta = asunto_carta;
	}

	public String getMensaje_carta() {
		return mensaje_carta;
	}

	public void setMensaje_carta(String mensaje_carta) {
		this.mensaje_carta = mensaje_carta;
	}

}
