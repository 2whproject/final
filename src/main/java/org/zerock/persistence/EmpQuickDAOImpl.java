package org.zerock.persistence;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.EmpVO;
@Repository
public class EmpQuickDAOImpl implements EmpQuickDAO {
	@Inject
	private SqlSession session;
	private static String namespace = "org.zerock.mapper.EmpQuickMapper";

	@Override
	public List<EmpVO> listAll() throws Exception {
		return session.selectList(namespace + ".read");
	}
}
