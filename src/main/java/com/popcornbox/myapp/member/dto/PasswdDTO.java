package com.popcornbox.myapp.member.dto;

import lombok.Data;

@Data
public class PasswdDTO {

	private String id;		//아이디
	private String fromPW;//현재비밀번호
	private String toPW;	//변경비밀번호
}
