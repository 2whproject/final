package org.zerock.persistence;
import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.LogVO;
@Repository
public class LogDAOImpl implements LogDAO{
	@Inject
	private SqlSession session;
	private String namespace = "org.zerock.mapper.LogMapper";
	@Override
	public void result(LogVO result) {
		session.selectOne(namespace + ".result", result);
	}
	@Override
	public List<LogVO> read(String log) throws Exception {
		return session.selectList(namespace + ".read", log);
	}
}
