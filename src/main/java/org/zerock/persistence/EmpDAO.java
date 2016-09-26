package org.zerock.persistence;
import java.util.List;
import org.zerock.domain.EmpVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
public interface EmpDAO {

  public void create(EmpVO vo) throws Exception;

  public EmpVO read(Integer bno) throws Exception;

  public void update(EmpVO vo) throws Exception;

  public void delete(Integer bno) throws Exception;

  public List<EmpVO> listAll() throws Exception;

  public List<EmpVO> listPage(int page) throws Exception;

  public List<EmpVO> listCriteria(Criteria cri) throws Exception;

  public int countPaging(Criteria cri) throws Exception;
  
  //use for dynamic sql
  
  public List<EmpVO> listSearch(SearchCriteria cri)throws Exception;
  
  public int listSearchCount(SearchCriteria cri)throws Exception;

}
