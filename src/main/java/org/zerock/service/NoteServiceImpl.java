package org.zerock.service;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.NoteCriteria;
import org.zerock.domain.NoteSearchCriteria;
import org.zerock.domain.NoteVO;
import org.zerock.persistence.NoteDAO;

@Service
public class NoteServiceImpl implements NoteService {

  @Inject
  private NoteDAO dao;

  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public NoteVO read(Integer no) throws Exception {
    dao.updateViewCnt(no);
    return dao.read(no);
  }
@Transactional
@Override
public void remove(Integer no) throws Exception {
	dao.delete(no);
}
@Transactional
@Override
public NoteVO receiver(NoteVO receiver) throws Exception {
	return dao.receiver(receiver);
}
@Override
public List<NoteVO> listAll() throws Exception {
	return dao.listAll();
}
@Override
public List<NoteVO> listCriteria(NoteCriteria cri) throws Exception {
	return dao.listCriteria(cri);
}
@Override
public int listCountCriteria(NoteCriteria cri) throws Exception {
	return dao.countPaging(cri);
}
@Override
public List<NoteVO> listSearchCriteria(NoteSearchCriteria cri) throws Exception {
	return dao.listSearch(cri);
}
@Override
public int listSearchCount(NoteSearchCriteria cri) throws Exception {
	return dao.listSearchCount(cri);
}
@Transactional
@Override
public void send(NoteVO send) throws Exception {
	dao.send(send);
}
@Override
public NoteVO find(String find) throws Exception {
	return dao.find(find);
}
}
