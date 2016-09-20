package org.zerock.service;
import java.util.List;
import org.zerock.domain.NoteCriteria;
import org.zerock.domain.NoteSearchCriteria;
import org.zerock.domain.NoteVO;
public interface NoteService {
  public NoteVO read(Integer no) throws Exception;
  public NoteVO find(String find) throws Exception;
  public void send(NoteVO send) throws Exception;
  public void remove(Integer no) throws Exception;
  public NoteVO receiver(NoteVO receiver) throws Exception;
  public List<NoteVO> listAll() throws Exception;
  public List<NoteVO> listCriteria(NoteCriteria cri) throws Exception;
  public int listCountCriteria(NoteCriteria cri) throws Exception;
  public List<NoteVO> listSearchCriteria(NoteSearchCriteria cri) 
      throws Exception;
  public int listSearchCount(NoteSearchCriteria cri) throws Exception;
}
