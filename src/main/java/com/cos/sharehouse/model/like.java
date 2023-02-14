package com.cos.sharehouse.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="houselike")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name = "LIKE_SEQ_GENERATOR"
		, sequenceName = "LIKE_SEQ"
		, initialValue = 1
		, allocationSize = 1
		)
public class like {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="LIKE_SEQ_GENERATOR")
	private int id;
	@Column(nullable=false, length=100)
	private String userid;
	 
	@Column(nullable=false, length=100)
	private String houseid;
	
}
