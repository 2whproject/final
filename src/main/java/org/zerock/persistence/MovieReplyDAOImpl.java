package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReplyVO;
import org.zerock.domain.ReplyVO;

@Repository
public class MovieReplyDAOImpl implements MovieReplyDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.MoviereplyMapper";

@Override
public List<MovieReplyVO> list(String movieId) throws Exception {
	return session.selectList(namespace + ".list", movieId);
}

@Override
public void create(MovieReplyVO vo) throws Exception {
	session.insert(namespace + ".create", vo);
	
}

@Override
public void update(MovieReplyVO vo) throws Exception {
	session.update(namespace + ".update", vo);
	
}

@Override
public void delete(Integer rno) throws Exception {
	 session.update(namespace + ".delete", rno);
	
}

@Override
public List<MovieReplyVO> listPage(String movieId, Criteria cri) throws Exception {
	 Map<String, Object> paramMap = new HashMap<>();

	    paramMap.put("movieId", movieId);
	    paramMap.put("cri", cri);

	    return session.selectList(namespace + ".listPage", paramMap);
}

@Override
public int count(String movieId) throws Exception {
	 return session.selectOne(namespace + ".count", movieId);
}

@Override
public int getBno(Integer rno) throws Exception {
	 return session.selectOne(namespace + ".getBno", rno);
}

 
}
