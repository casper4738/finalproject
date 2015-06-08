package fandy.manager;

import java.sql.SQLException;
import java.util.List;

import fandy.bean.OptionBean;

public interface DepartmentsDao {

	public List<OptionBean> getListOptionDepartment() throws SQLException;

}
