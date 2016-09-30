package org.zerock.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MovieVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.MovieService;

@Controller
@RequestMapping("/movie/*")
public class SearchBoardControlleryj {

  private static final Logger logger = LoggerFactory.getLogger(SearchBoardControlleryj.class);

  @Inject
  private MovieService service;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	logger.info("#############################list#################");
    logger.info(cri.toString());

    // model.addAttribute("list", service.listCriteria(cri));
    model.addAttribute("list", service.listSearchCriteria(cri));

    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);

    // pageMaker.setTotalCount(service.listCountCriteria(cri));
    pageMaker.setTotalCount(service.listSearchCount(cri));

    model.addAttribute("pageMaker", pageMaker);
  }

  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
  public void read(@RequestParam(value="movie_title") String movie_title,
		  		   @RequestParam(value="story") String story,
		  		   @RequestParam(value="eng_title") String eng_title,
		  		   @RequestParam(value="photo1") String photo1,
		  		   @RequestParam(value="photo2") String photo2,
		  		   @RequestParam(value="photo3") String photo3,
		  		   @RequestParam(value="open_info_data") String open_info_data,
		  		   @RequestParam(value="open_info_age") String open_info_age,
		  	   	   @RequestParam(value="open_info_time") String open_info_time,
		  		   @RequestParam(value="genre_1") String genre_1,
		  		   @RequestParam(value="nation") String nation,
		  		   @RequestParam(value="director") String director,  
		  		   @RequestParam(value="title_link") String title_link,
		  		   @RequestParam(value="actor1") String actor1,
		  		   @RequestParam(value="year") String year,
		  		
		  @ModelAttribute("cri") SearchCriteria cri, Model model)
      throws Exception {
	  
	  model.addAttribute("movie_title", movie_title);
	  model.addAttribute("story", story);
	  model.addAttribute("eng_title", eng_title);
	  model.addAttribute("photo1", photo1);
	  model.addAttribute("photo2", photo2);
	  model.addAttribute("photo3", photo3);
	  model.addAttribute("open_info_data", open_info_data);
	  model.addAttribute("open_info_time", open_info_time);
	  model.addAttribute("open_info_age", open_info_age);
	  model.addAttribute("genre_1", genre_1);
	  model.addAttribute("nation", nation);
	  model.addAttribute("director", director);
	  model.addAttribute("title_link", title_link);
	  model.addAttribute("actor1", actor1);
	  model.addAttribute("year", year);
	  
	  service.listAll(title_link);
	  
	  String titlelink = title_link;
		int idx = titlelink.indexOf("=");
		String movieId = titlelink.substring(idx + 1);
	  
		model.addAttribute("movieId",movieId);
	  model.addAttribute("list",service.listAll(title_link));
	  
	  logger.info("#############################################################################");
	  logger.info("#############################################################################");
	  logger.info(service.listAll(title_link).toString());
  }
  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    service.remove(bno);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/movie/list";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    model.addAttribute(service.read(bno));
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(MovieVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    logger.info(cri.toString());
    service.modify(board);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/movie/list";
  }

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registGET(@RequestParam(value="movie_title") String movie_title,
			 		   @RequestParam(value="eng_title") String eng_title,
			 		   @RequestParam(value="photo1") String photo1,
			 		   @RequestParam(value="open_info_data") String open_info_data,
			 		   @RequestParam(value="open_info_age") String open_info_age,
			 	   	   @RequestParam(value="open_info_time") String open_info_time,
			 		   @RequestParam(value="genre_1") String genre_1,
			 		   @RequestParam(value="nation") String nation,
			 		   @RequestParam(value="director") String director,  
			 		   @RequestParam(value="actor1") String actor1,
			 		   @RequestParam(value="year") String year,
			 		   @RequestParam(value="title_link") String title_link,
		  @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	  model.addAttribute("movie_title", movie_title);
	  model.addAttribute("eng_title", eng_title);
	  model.addAttribute("photo1", photo1);
	  model.addAttribute("open_info_data", open_info_data);
	  model.addAttribute("open_info_time", open_info_time);
	  model.addAttribute("open_info_age", open_info_age);
	  model.addAttribute("genre_1", genre_1);
	  model.addAttribute("nation", nation);
	  model.addAttribute("director", director);
	  model.addAttribute("actor1", actor1);
	  model.addAttribute("year", year);
	  model.addAttribute("title_link", title_link);
	  
	  
    logger.info("regist get ...........");
    
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(MovieVO board, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(board.toString());

    service.regist(board);

    rttr.addFlashAttribute("msg", "SUCCESS");
    
    logger.info(board.getTitle_link());

    return "redirect:/movie/list";
  }
  
  
  @RequestMapping(value = "/reviewPage", method = RequestMethod.GET)
  public void read(@RequestParam("bno") int bno, 
		  @RequestParam(value="movie_title") String movie_title,
		   @RequestParam(value="eng_title") String eng_title,
		   @RequestParam(value="photo1") String photo1,
		   @RequestParam(value="open_info_data") String open_info_data,
		   @RequestParam(value="open_info_age") String open_info_age,
	   	   @RequestParam(value="open_info_time") String open_info_time,
		   @RequestParam(value="genre_1") String genre_1,
		   @RequestParam(value="nation") String nation,
		   @RequestParam(value="director") String director,  
		   @RequestParam(value="actor1") String actor1,
		   @RequestParam(value="year") String year,
		   @RequestParam(value="title_link") String title_link,
		  SearchCriteria cri, Model model)
      throws Exception {
	  logger.info("/readPage...");

	  model.addAttribute("movie_title", movie_title);
	  model.addAttribute("eng_title", eng_title);
	  model.addAttribute("photo1", photo1);
	  model.addAttribute("open_info_data", open_info_data);
	  model.addAttribute("open_info_time", open_info_time);
	  model.addAttribute("open_info_age", open_info_age);
	  model.addAttribute("genre_1", genre_1);
	  model.addAttribute("nation", nation);
	  model.addAttribute("director", director);
	  model.addAttribute("actor1", actor1);
	  model.addAttribute("year", year);
	  model.addAttribute("title_link", title_link);
	  
	  MovieVO v = service.read(bno);
	  
	  if (v != null)
		  model.addAttribute(v);
  }

  // @RequestMapping(value = "/list", method = RequestMethod.GET)
  // public void listPage(@ModelAttribute("cri") SearchCriteria cri,
  // Model model) throws Exception {
  //
  // logger.info(cri.toString());
  //
  // model.addAttribute("list", service.listCriteria(cri));
  //
  // PageMaker pageMaker = new PageMaker();
  // pageMaker.setCri(cri);
  //
  // pageMaker.setTotalCount(service.listCountCriteria(cri));
  //
  // model.addAttribute("pageMaker", pageMaker);
  // }
}
