package org.zerock.persistence;
import java.util.List;
import org.zerock.domain.EmpVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
public interface EmpQuickDAO {
  public List<EmpVO> listAll() throws Exception;
}
