package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MovieVO;
import org.zerock.domain.SearchCriteria;

public interface MovieService {

  public void regist(MovieVO board) throws Exception;

  public MovieVO read(Integer bno) throws Exception;
  
  public void modify(MovieVO board) throws Exception;

  public void remove(Integer bno) throws Exception;

  public List<MovieVO> listAll(String title_link) throws Exception;

  public List<MovieVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<MovieVO> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
  
  
  public List<String> getAttach(Integer bno)throws Exception;

  public List<String> newList() throws Exception;





}
