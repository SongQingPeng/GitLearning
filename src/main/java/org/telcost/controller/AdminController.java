package org.telcost.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.telcost.entity.Admin;
import org.telcost.service.AdminService;

@Controller
public class AdminController {
	/**
	 * 登录
	 */
	 @Autowired
	  AdminService adminService;
	  @RequestMapping("logAdmin.do")
      public String loginAdmin(Admin admin,HttpSession session){ 
		  System.out.println("123456");
   	   Admin am=adminService.checkUsernameAndPwd(admin);
   	   
   	   if(am!=null) {
   		   session.setAttribute("ad",am);
   		   return "forward:/view/index.jsp";
   	   }
   	   return "redirect:/view/login.jsp";
	  }
	  /**
	   * 修改密码
	   */
	  @RequestMapping("/UpdatePwdServlet")
	  public void changePwd(String oldpwd,String newpwd,String newpwd1,Admin admin,HttpSession session) {
		  Admin am=adminService.checkUsernameAndPwd(admin);
		  if(oldpwd.equals(am.getApwd()) && newpwd.equals(newpwd1)) {
			  am.setApwd(newpwd);
			  
		  }
		   
		  
	  }
	  
}
