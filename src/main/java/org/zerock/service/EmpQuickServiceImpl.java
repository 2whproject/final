package org.zerock.service;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.EmpVO;
import org.zerock.domain.QuickVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.EmpDAO;
import org.zerock.persistence.QuickDAO;
@Service
public class EmpQuickServiceImpl implements EmpQuickService {
	  @Inject
	  private EmpDAO dao;
	  @Transactional
	  @Override
	  public List<EmpVO> listAll() throws Exception {
		return dao.listAll();
	  }
}
