package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO_BSR;
import org.zerock.domain.Criteria_BSR;
import org.zerock.domain.SearchCriteria_BSR;
import org.zerock.persistence.BoardDAO_BSR;

@Service
public class BoardServiceImpl_BSR implements BoardService_BSR {

  @Inject
  private BoardDAO_BSR dao;

  
  @Transactional
  @Override
  public void regist(BoardVO_BSR board) throws Exception {
  
    dao.create(board);
    
    String[] files = board.getFiles();
    
    if(files == null) { return; } 
    
    for (String fileName : files) {
      dao.addAttach(fileName);
    }   
  }
  
  //
//  @Override
//  public void regist(BoardVO board) throws Exception {
//    dao.create(board);
//  }

//  @Override
//  public BoardVO read(Integer bno) throws Exception {
//    return dao.read(bno);
//  }


  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public BoardVO_BSR read(Integer bno) throws Exception {
    dao.updateViewCnt(bno);
    return dao.read(bno);
  }

  
//  @Override
//  public void modify(BoardVO board) throws Exception {
//    dao.update(board);
//  }
  
  @Transactional
  @Override
  public void modify(BoardVO_BSR board) throws Exception {
    dao.update(board);
    
    Integer bno = board.getBno();
    
    dao.deleteAttach(bno);
    
    String[] files = board.getFiles();
    
    if(files == null) { return; } 
    
    for (String fileName : files) {
      dao.replaceAttach(fileName, bno);
    }
  }
  

//  @Override
//  public void remove(Integer bno) throws Exception {
//    dao.delete(bno);
//  }
  
  
  @Transactional
  @Override
  public void remove(Integer bno) throws Exception {
    dao.deleteAttach(bno);
    dao.delete(bno);
  } 

  @Override
  public List<BoardVO_BSR> listAll() throws Exception {
    return dao.listAll();
  }

  @Override
  public List<BoardVO_BSR> listCriteria(Criteria_BSR cri) throws Exception {

    return dao.listCriteria(cri);
  }

  @Override
  public int listCountCriteria(Criteria_BSR cri) throws Exception {

    return dao.countPaging(cri);
  }

  @Override
  public List<BoardVO_BSR> listSearchCriteria(SearchCriteria_BSR cri) throws Exception {

    return dao.listSearch(cri);
  }

  @Override
  public int listSearchCount(SearchCriteria_BSR cri) throws Exception {

    return dao.listSearchCount(cri);
  }
  

  @Override
  public List<String> getAttach(Integer bno) throws Exception {
    
    return dao.getAttach(bno);
  }

@Override
public List<BoardVO_BSR> listNew() throws Exception {
	// TODO Auto-generated method stub
	return dao.listNew();
}   

}
