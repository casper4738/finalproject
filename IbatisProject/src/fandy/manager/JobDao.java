package fandy.manager;

import java.sql.SQLException;
import java.util.List;

import fandy.bean.OptionBean;

public interface JobDao {

	public List<OptionBean> getListOptionJob() throws SQLException;

}
