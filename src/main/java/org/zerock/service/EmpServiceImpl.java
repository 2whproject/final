package org.zerock.service;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.zerock.domain.EmpVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.EmpDAO;
@Service
public class EmpServiceImpl implements EmpService {
  @Inject
  private EmpDAO dao;

  @Override
  public void regist(EmpVO board) throws Exception {
    dao.create(board);
  }

  @Override
  public EmpVO read(Integer bno) throws Exception {
    return dao.read(bno);
  }

  @Override
  public void modify(EmpVO board) throws Exception {
    dao.update(board);
  }

  @Override
  public void remove(Integer bno) throws Exception {
    dao.delete(bno);
  }

  @Override
  public List<EmpVO> listAll() throws Exception {
    return dao.listAll();
  }

  @Override
  public List<EmpVO> listCriteria(Criteria cri) throws Exception {

    return dao.listCriteria(cri);
  }

  @Override
  public int listCountCriteria(Criteria cri) throws Exception {

    return dao.countPaging(cri);
  }

  @Override
  public List<EmpVO> listSearchCriteria(SearchCriteria cri) throws Exception {

    return dao.listSearch(cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return dao.listSearchCount(cri);
  }

}
