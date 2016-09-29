package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReplyVO;

public interface MovieReplyService {

  public void addReply(MovieReplyVO vo) throws Exception;

  public List<MovieReplyVO> listReply(String movieId) throws Exception;

  public void modifyReply(MovieReplyVO vo) throws Exception;

  public void removeReply(Integer rno) throws Exception;

  public List<MovieReplyVO> listReplyPage(String movieId, Criteria cri) 
      throws Exception;

  public int count(String movieId) throws Exception;




}
