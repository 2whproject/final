package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReplyVO;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.MovieDAO;
import org.zerock.persistence.MovieReplyDAO;
import org.zerock.persistence.ReplyDAO;

@Service
public class MovieReplyServiceImpl implements MovieReplyService {

  @Inject
  private MovieReplyDAO moviereplyDAO;
  
  @Inject
  private MovieDAO movieDAO ;

@Override
public void addReply(MovieReplyVO vo) throws Exception {
	moviereplyDAO.create(vo);
	movieDAO.updateReplyCnt(vo.getRno(), 1);
	
}

@Transactional
@Override
public void removeReply(Integer rno) throws Exception {
	
	int bno = moviereplyDAO.getBno(rno);
	moviereplyDAO.delete(rno);
	movieDAO.updateReplyCnt(bno, -1);
	
}

@Override
public List<MovieReplyVO> listReply(String movieId) throws Exception {
	return moviereplyDAO.list(movieId);
	 
}

@Override
public void modifyReply(MovieReplyVO vo) throws Exception {
	moviereplyDAO.update(vo);
	
}


@Override
public List<MovieReplyVO> listReplyPage(String movieId, Criteria cri) throws Exception {
	return moviereplyDAO.listPage(movieId, cri);
}

@Override
public int count(String movieId) throws Exception {
	return moviereplyDAO.count(movieId);
}

}