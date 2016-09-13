package org.zerock.service;
import java.util.List;
import org.zerock.domain.EmpVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
public interface EmpService {

	public void regist(EmpVO board) throws Exception;

	public EmpVO read(Integer bno) throws Exception;

	public void modify(EmpVO board) throws Exception;

	public void remove(Integer bno) throws Exception;

	public List<EmpVO> listAll() throws Exception;

	public List<EmpVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

	public List<EmpVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
