package org.telcost.entity;

import java.util.List;

import lombok.Data;
@Data
public class Role {
	private int rid;
	private String rname;
	private int pid;
	private List<Pow> lp;
	private List<Role> lr;
	private String pname;
	public String getPowName() {
		String pn = "";
		if(lp != null) {
			for(Pow p : lp ) {
				pn += p.getBy001() + ",";
			}
		}	
		return pn;
	}
	
	public String getRoleString() {
		String roleString = "";		
		if(lr != null) {
			for(Role role : lr) {
				roleString += role.rname + ",";
			}
		}
		return roleString;
	}
	public Role() {}
	
	public Role(List<Role> lr) {	
		this.lr = lr;
}
}
