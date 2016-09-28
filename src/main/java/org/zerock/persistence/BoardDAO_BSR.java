package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO_BSR;
import org.zerock.domain.Criteria_BSR;
import org.zerock.domain.SearchCriteria_BSR;

public interface BoardDAO_BSR {

  public void create(BoardVO_BSR vo) throws Exception;

  public BoardVO_BSR read(Integer bno) throws Exception;

  public void update(BoardVO_BSR vo) throws Exception;

  public void delete(Integer bno) throws Exception;

  public List<BoardVO_BSR> listAll() throws Exception;
  public List<BoardVO_BSR> listNew() throws Exception;


  public List<BoardVO_BSR> listPage(int page) throws Exception;

  public List<BoardVO_BSR> listCriteria(Criteria_BSR cri) throws Exception;

  public int countPaging(Criteria_BSR cri) throws Exception;
  
  //use for dynamic sql
  
  public List<BoardVO_BSR> listSearch(SearchCriteria_BSR cri)throws Exception;
  
  public int listSearchCount(SearchCriteria_BSR cri)throws Exception;
  
  
  public void updateReplyCnt(Integer bno, int amount)throws Exception;
  
  
  public void updateViewCnt(Integer bno)throws Exception;
  
  public void addAttach(String fullName)throws Exception;
  
  public List<String> getAttach(Integer bno)throws Exception;  
   
  public void deleteAttach(Integer bno)throws Exception;
  
  public void replaceAttach(String fullName, Integer bno)throws Exception;
  
}
