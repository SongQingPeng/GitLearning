package org.telcost.mapper;
import org.springframework.stereotype.Repository;
import org.telcost.entity.Admin;
@Repository("adminMapper")
public interface AdminMapper {
	public Admin loginAdmin(Admin admin);
}
