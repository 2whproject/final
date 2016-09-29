package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReplyVO;

public interface MovieReplyDAO {

  public List<MovieReplyVO> list(String movieId) throws Exception;

  public void create(MovieReplyVO vo) throws Exception;

  public void update(MovieReplyVO vo) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<MovieReplyVO> listPage(String movieId, Criteria cri) throws Exception;

  public int count(String movieId) throws Exception;

  public int getBno(Integer rno) throws Exception;


}
