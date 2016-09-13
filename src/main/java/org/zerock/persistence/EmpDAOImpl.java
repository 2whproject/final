package org.zerock.persistence;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.EmpVO;
import org.zerock.domain.SearchCriteria;

@Repository
public class EmpDAOImpl implements EmpDAO {
  @Inject
  private SqlSession session;
  private static String namespace = "org.zerock.mapper.EmpMapper";
@Override
public void create(EmpVO vo) throws Exception {
	session.insert(namespace + ".create", vo);
}
@Override
public EmpVO read(Integer bno) throws Exception {
	return session.selectOne(namespace + ".read", bno);
}
@Override
public void update(EmpVO vo) throws Exception {
	session.update(namespace + ".update", vo);
}
@Override
public void delete(Integer bno) throws Exception {
	session.delete(namespace + ".delete", bno);
}
@Override
public List<EmpVO> listAll() throws Exception {
	return session.selectList(namespace + ".listAll");
}
@Override
public List<EmpVO> listPage(int page) throws Exception {
    if (page <= 0) {
        page = 1;
      }

      page = (page - 1) * 10;

      return session.selectList(namespace + ".listPage", page);
    }
@Override
public List<EmpVO> listCriteria(Criteria cri) throws Exception {
	 return session.selectList(namespace + ".listCriteria", cri);
}
@Override
public int countPaging(Criteria cri) throws Exception {
	return session.selectOne(namespace + ".countPaging", cri);
}
@Override
public List<EmpVO> listSearch(SearchCriteria cri) throws Exception {
	return session.selectList(namespace + ".listSearch", cri);
}
@Override
public int listSearchCount(SearchCriteria cri) throws Exception {
	 return session.selectOne(namespace + ".listSearchCount", cri);
}
}
