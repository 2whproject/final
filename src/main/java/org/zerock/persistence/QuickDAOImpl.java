package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.QuickVO;
import org.zerock.domain.SearchCriteria;

@Repository
public class QuickDAOImpl implements QuickDAO {
	@Inject
	private SqlSession session;
	private static String namespace = "org.zerock.mapper.QuickMapper";

	@Override
	public List<QuickVO> read() throws Exception {
		return session.selectList(namespace + ".read");
	}
}
