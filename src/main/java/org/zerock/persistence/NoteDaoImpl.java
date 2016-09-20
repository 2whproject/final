package org.zerock.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.NoteCriteria;
import org.zerock.domain.NoteSearchCriteria;
import org.zerock.domain.NoteVO;

@Repository
public class NoteDAOImpl implements NoteDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.NoteMapper";

@Override
public NoteVO read(Integer no) throws Exception {
	return session.selectOne(namespace + ".read", no);
}

@Override
public NoteVO receiver(NoteVO receiver) throws Exception {
	return session.selectOne(namespace + ".receiver", receiver);
}

@Override
public void delete(Integer no) throws Exception {
	session.delete(namespace + ".delete", no);
}

@Override
public List<NoteVO> listAll() throws Exception {
	return session.selectList(namespace + ".listall");
}

@Override
public List<NoteVO> listPage(int page) throws Exception {
    if (page <= 0) {
        page = 1;
      }

      page = (page - 1) * 10;

      return session.selectList(namespace + ".listPage", page);
    }
@Override
public List<NoteVO> listCriteria(NoteCriteria cri) throws Exception {
	return session.selectList(namespace + ".listCriteria", cri);
}

@Override
public int countPaging(NoteCriteria cri) throws Exception {
	return session.selectOne(namespace + ".countPaging", cri);
}

@Override
public List<NoteVO> listSearch(NoteSearchCriteria cri) throws Exception {
	return session.selectList(namespace + ".listSearch", cri);
}

@Override
public int listSearchCount(NoteSearchCriteria cri) throws Exception {
	return session.selectOne(namespace + ".listSearchCount", cri);
}

@Override
public void updateViewCnt(int no) throws Exception {
	session.update(namespace+ ".viewing", no);
}

@Override
public void send(NoteVO send) throws Exception {
	session.insert(namespace + ".send", send);
}

@Override
public NoteVO find(String find) throws Exception {
	return session.selectOne(namespace + ".find", find);
}
}
