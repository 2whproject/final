package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO_BSR;
import org.zerock.domain.Criteria_BSR;
import org.zerock.domain.SearchCriteria_BSR;

public interface BoardService_BSR {

  public void regist(BoardVO_BSR board) throws Exception;

  public BoardVO_BSR read(Integer bno) throws Exception;

  public void modify(BoardVO_BSR board) throws Exception;

  public void remove(Integer bno) throws Exception;

  public List<BoardVO_BSR> listAll() throws Exception;
  
  public List<BoardVO_BSR> listNew() throws Exception;

  public List<BoardVO_BSR> listCriteria(Criteria_BSR cri) throws Exception;

  public int listCountCriteria(Criteria_BSR cri) throws Exception;

  public List<BoardVO_BSR> listSearchCriteria(SearchCriteria_BSR cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria_BSR cri) throws Exception;
  
  public List<String> getAttach(Integer bno)throws Exception;
  

}
