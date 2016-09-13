package org.zerock.service;
import java.util.List;
import org.zerock.domain.EmpVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
public interface EmpQuickService {
	public List<EmpVO> listAll() throws Exception;
}
