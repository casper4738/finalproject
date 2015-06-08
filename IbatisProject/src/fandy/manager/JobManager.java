package fandy.manager;

import java.sql.SQLException;
import java.util.List;

import fandy.bean.OptionBean;

public interface JobManager {

	public List<OptionBean> getListOptionJob() throws SQLException;

}
