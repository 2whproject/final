package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MovieVO;
import org.zerock.domain.SearchCriteria;

public interface MovieDAO {

  public void create(MovieVO vo) throws Exception;

  public MovieVO read(int bno) throws Exception;

  public void update(MovieVO vo) throws Exception;

  public void delete(Integer bno) throws Exception;

  public List<MovieVO> listAll(String title_link) throws Exception;

  public List<MovieVO> listPage(int page) throws Exception;

  public List<MovieVO> listCriteria(Criteria cri) throws Exception;

  public int countPaging(Criteria cri) throws Exception;
  
  //use for dynamic sql
  
  public List<MovieVO> listSearch(SearchCriteria cri)throws Exception;
  
  public int listSearchCount(SearchCriteria cri)throws Exception;
  
  
  public void updateReplyCnt(Integer bno, int amount)throws Exception;
  
  
  public void updateViewCnt(Integer bno)throws Exception;
  
  public void addAttach(String fullName)throws Exception;
  
  public List<String> getAttach(Integer bno)throws Exception;  
   
  public void deleteAttach(Integer bno)throws Exception;
  
  public void replaceAttach(String fullName, Integer bno)throws Exception;

  public List<String> newList()throws Exception;
  
}
