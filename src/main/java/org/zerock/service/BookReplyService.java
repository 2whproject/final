package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.BookReplyVO;

public interface BookReplyService {

  public void addReply(BookReplyVO vo) throws Exception;

  public List<BookReplyVO> listReply(Integer bno) throws Exception;

  public void modifyReply(BookReplyVO vo) throws Exception;

  public void removeReply(Integer rno) throws Exception;

  public List<BookReplyVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception;

  public int count(Integer bno) throws Exception;
}
