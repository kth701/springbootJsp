package com.springstudy.springbootJsp.member.dto;

import java.sql.Date;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
	private int recnum; 
	private String id;
	private String pwd;
	private String name;
	private String email;
	private Date joinDate;
	
	// mybatis : localdate <-> sql date형식변환
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate joinLocalDate;
	
	private String uuid;

	// ----------------------------- //
	public void toLocaleDate() {
		this.joinLocalDate = this.joinDate.toLocalDate();
	}
	public void toSqlDate() {
	}
	// ---------------------------- //
	

}
