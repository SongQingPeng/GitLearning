package org.telcost.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.telcost.entity.Admin;
import org.telcost.entity.Pow;
import org.telcost.mapper.AdminMapper;
import org.telcost.mapper.PowMapper;
import org.telcost.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminMapper adminMapper;
	@Autowired
	PowMapper powMapper;
	public Admin getAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.loginAdmin(admin);
	}
	public Admin checkUsernameAndPwd(Admin admin) {
		Admin adm = adminMapper.loginAdmin(admin); 
		System.out.println(adm.getAcname());
		//假如登录成功，继续获取该管理员的所有权限
		if(adm != null) {
			List<Pow> list = powMapper.getAllPow(adm.getAid());
			System.out.println(list.size());
			adm.setLp(list);
		}
		return adm;
	}
}

