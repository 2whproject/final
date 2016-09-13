package org.zerock.service;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.QuickVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.QuickDAO;
@Service
public class QuickServiceImpl implements QuickService {
  @Inject
  private QuickDAO dao;
  @Transactional
  @Override
  public List<QuickVO> read() throws Exception {
	return dao.read();
  }
}
