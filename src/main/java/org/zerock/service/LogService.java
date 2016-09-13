package org.zerock.service;
import java.util.List;
import org.zerock.domain.EmpVO;
import org.zerock.domain.LogVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
public interface LogService {
	public void result(LogVO result) throws Exception;
	public List<LogVO> read(String log) throws Exception;
}
