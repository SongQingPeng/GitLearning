package org.telcost.service;

import org.telcost.entity.Admin;
public interface AdminService {
	 public Admin getAdmin(Admin admin);
	 Admin checkUsernameAndPwd(Admin admin);
}
