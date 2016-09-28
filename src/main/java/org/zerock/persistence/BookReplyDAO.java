package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.BookReplyVO;

public interface BookReplyDAO {

  public List<BookReplyVO> list(Integer bno) throws Exception;

  public void create(BookReplyVO vo) throws Exception;

  public void update(BookReplyVO vo) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<BookReplyVO> listPage(Integer bno, Criteria cri) throws Exception;

  public int count(Integer bno) throws Exception;

  public int getBno(Integer rno) throws Exception;

}
