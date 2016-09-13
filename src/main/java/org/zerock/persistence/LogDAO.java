package org.zerock.persistence;
import java.util.List;
import org.zerock.domain.LogVO;
public interface LogDAO {
	public void result(LogVO result) throws Exception;
	public List<LogVO> read(String log) throws Exception;
}
