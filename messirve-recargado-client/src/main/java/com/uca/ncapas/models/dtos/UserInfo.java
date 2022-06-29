package com.uca.ncapas.models.dtos;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserInfo {
	@NotBlank
	@Size(min = 4, max = 32)
	private String username;
	
	@NotBlank
	@Size(min = 8, max = 32)
	@Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,32}$")
	private String password;

	public UserInfo() {
		super();
	}

	public UserInfo(@NotBlank @Size(min = 4, max = 32) String username,
			@NotBlank @Size(min = 8, max = 32) @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,32}$") String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}	
}
