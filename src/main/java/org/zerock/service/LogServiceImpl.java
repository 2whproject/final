package org.zerock.service;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.zerock.domain.LogVO;
import org.zerock.persistence.LogDAO;
@Service
public class LogServiceImpl implements LogService {
  @Inject
  private LogDAO dao;

  @Override
  public void result(LogVO result) throws Exception {
	dao.result(result);
  }

@Override
public List<LogVO> read(String log) throws Exception {
	return dao.read(log);
}
}
