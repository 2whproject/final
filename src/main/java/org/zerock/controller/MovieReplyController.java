package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReplyVO;
import org.zerock.domain.PageMaker;
import org.zerock.service.MovieReplyService;

import com.sun.media.jfxmedia.logging.Logger;


@RestController
@RequestMapping("/movie")
public class MovieReplyController {

  @Inject
  private MovieReplyService service;

  @RequestMapping(value = "", method = RequestMethod.POST)
  public ResponseEntity<String> register(@RequestBody MovieReplyVO vo) {
	  
		String titlelink = vo.getTitle_link();
		int idx = titlelink.indexOf("=");
		String movieId = titlelink.substring(idx + 1);
	
	vo.setMovieId(movieId);
	
    ResponseEntity<String> entity = null;
    try {
      service.addReply(vo);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/all/{movieId}", method = RequestMethod.GET)
  public ResponseEntity<List<MovieReplyVO>> list(@PathVariable("movieId") String movieId) {
	  
    ResponseEntity<List<MovieReplyVO>> entity = null;
    try {
      entity = new ResponseEntity<>(service.listReply(movieId), HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    return entity;
  }

  @RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
  public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody MovieReplyVO vo) {

    ResponseEntity<String> entity = null;
    try {
      vo.setRno(rno);
      service.modifyReply(vo);

      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
  public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {

    ResponseEntity<String> entity = null;
    try {
      service.removeReply(rno);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/{movieId}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
      @PathVariable("movieId") String movieId,
      @PathVariable("page") Integer page) {

    ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      Criteria cri = new Criteria();
      cri.setPage(page);

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);

      Map<String, Object> map = new HashMap<String, Object>();
      List<MovieReplyVO> list = service.listReplyPage(movieId, cri);
      
      map.put("list", list);

      int replyCount = service.count(movieId);
      pageMaker.setTotalCount(replyCount);

      map.put("pageMaker", pageMaker);

      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

}
