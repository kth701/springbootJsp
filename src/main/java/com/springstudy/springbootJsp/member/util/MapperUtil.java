package com.springstudy.springbootJsp.member.util;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;

public enum MapperUtil {
	
	INSTANCD;
	
	private ModelMapper modelMapper;
	
	
	// 생성자
	MapperUtil(){
		this.modelMapper = new ModelMapper();
		this.modelMapper.getConfiguration()
				.setFieldMatchingEnabled(true)
				.setFieldAccessLevel(org.modelmapper.config.Configuration.AccessLevel.PRIVATE)
				.setMatchingStrategy(MatchingStrategies.LOOSE);
		
	}
	public ModelMapper get() {
		return modelMapper;
	}

}
