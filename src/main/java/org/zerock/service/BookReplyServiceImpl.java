package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BookReplyVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.BookDAO;
import org.zerock.persistence.BookReplyDAO;

@Service
public class BookReplyServiceImpl implements BookReplyService {

  @Inject
  private BookReplyDAO replyDAO;
  
  @Inject
  private BookDAO boardDAO;

  @Transactional
  @Override
  public void addReply(BookReplyVO vo) throws Exception {

    replyDAO.create(vo);
    boardDAO.updateReplyCnt(vo.getBno(), 1);
  }
  
  @Transactional
  @Override
  public void removeReply(Integer rno) throws Exception {

    int bno = replyDAO.getBno(rno);
    replyDAO.delete(rno);
    boardDAO.updateReplyCnt(bno, -1);
  }   



  @Override
  public List<BookReplyVO> listReply(Integer bno) throws Exception {

    return replyDAO.list(bno);
  }

  @Override
  public void modifyReply(BookReplyVO vo) throws Exception {

    replyDAO.update(vo);
  }



  @Override
  public List<BookReplyVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception {

    return replyDAO.listPage(bno, cri);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return replyDAO.count(bno);
  }

}
