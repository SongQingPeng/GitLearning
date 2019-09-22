package org.telcost.entity;

import java.util.List;

import lombok.Data;

@Data
public class Pow {
	private int pid;
	private String pclass;
	private String purl;
	private List<Pow> lp;
	private String by001;
	
	public Pow() {
		
	}
	
	public Pow(int pid) {
		this.pid = pid;
	}
	public Pow(String purl) {
		this.purl = purl;
	}

	public Pow(int pid, String pclass, String purl) {
		this.pid = pid;
		this.pclass = pclass;
		this.purl = purl;
	}
}
