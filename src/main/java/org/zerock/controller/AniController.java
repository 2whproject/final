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
import org.zerock.domain.AniVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.AniService;

@Controller
@RequestMapping("/comic/*")
public class AniController {

  private static final Logger logger = LoggerFactory.getLogger(AniController.class);

  @Inject
  private AniService service;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void listPage()
//		  @ModelAttribute("cri") SearchCriteria cri, Model model) 
  throws Exception {

//    logger.info(cri.toString());
//
//    model.addAttribute("list", service.listSearchCriteria(cri));
//
//    PageMaker pageMaker = new PageMaker();
//    pageMaker.setCri(cri);
//
//    pageMaker.setTotalCount(service.listSearchCount(cri));
//
//    model.addAttribute("pageMaker", pageMaker);
  }
  
  
  @RequestMapping(value = "/search", method = RequestMethod.GET)
  public void searchPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    logger.info(cri.toString());

    model.addAttribute("list", service.listSearchCriteria(cri));

    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);

    pageMaker.setTotalCount(service.listSearchCount(cri));

    model.addAttribute("pageMaker", pageMaker);
  }

  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
  public void read(
		  @RequestParam("cover_l_url") String cover_l_url,
		  @RequestParam("title") String title,
		  @RequestParam("author_t") String author_t,
		  @RequestParam("pub_nm") String pub_nm,
//		  @RequestParam("description") String description,
		  @RequestParam("list_price") String list_price,
		  @RequestParam("link") String link,
		  @RequestParam("isbn") String isbn,
		  
		  @ModelAttribute("cri") SearchCriteria cri, Model model)
  
    throws Exception {
	  
	  logger.info("XXXXXXXXXXXXXXXXXXXXXXX");
//	  logger.info(service.listAll().get(0).toString());
	  logger.info(cri.toString());
	  logger.info("XXXXXXXXXXXXXXXXXXXXXXX");
	  
//	  model.addAttribute("aniVO", service.listAll());
	  model.addAttribute("cover_l_url", cover_l_url);
	  model.addAttribute("title", title);
	  model.addAttribute("author_t", author_t);
	  model.addAttribute("pub_nm", pub_nm);
//	  model.addAttribute("description", description);
	  model.addAttribute("list_price", list_price);
	  model.addAttribute("link", link);
	  model.addAttribute("isbn", isbn);
	  	
	    model.addAttribute("aniVO", service.listSearchCriteria(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.listSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
  }

  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    service.remove(bno);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/comic/list";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    model.addAttribute(service.read(bno));
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(AniVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    logger.info(cri.toString());
    service.modify(vo);
    logger.info(vo.getBno().toString());

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/comic/list";
  }

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  
  public void registGET(
//		  )
    
      @RequestParam("cover_l_url") String cover_l_url,
	  @RequestParam("title") String title,
	  @RequestParam("author_t") String author_t,
	  @RequestParam("pub_nm") String pub_nm,
//	  @RequestParam("description") String description,
	  @RequestParam("list_price") String list_price,
	  @RequestParam("link") String link,
	  @RequestParam("isbn") String isbn,
	  
	  @ModelAttribute("cri") SearchCriteria cri, Model model)
  
 throws Exception {
	  
	  model.addAttribute("cover_l_url", cover_l_url);
	  model.addAttribute("title", title);
	  model.addAttribute("author_t", author_t);
	  model.addAttribute("pub_nm", pub_nm);
//	  model.addAttribute("description", description);
	  model.addAttribute("list_price", list_price);
	  model.addAttribute("link", link);
	  model.addAttribute("isbn", isbn);
	  
	  
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(AniVO ani, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(ani.toString());

    service.regist(ani);

    logger.info("#####################");
    logger.info(ani.toString());
    logger.info("#####################");
    
    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/comic/list";
  }
  
  @RequestMapping(value = "/reviewPage", method = RequestMethod.GET)
  
  public void read2(
		  @RequestParam("bno") int bno,
		  @RequestParam("cover_l_url") String cover_l_url,
		  @RequestParam("title") String title,
		  @RequestParam("author_t") String author_t,
		  @RequestParam("pub_nm") String pub_nm,
//		  @RequestParam("description") String description,
		  @RequestParam("list_price") String list_price,
		  @RequestParam("link") String link,
		  @RequestParam("isbn") String isbn,
		  
		  @ModelAttribute("cri") SearchCriteria cri, Model model)
		  
  throws Exception {
//	     logger.info("##############");
//	     logger.info(bno + "");
//	     logger.info("##############");
	     
	     model.addAttribute("bno", bno);
	  	 model.addAttribute(service.read(bno));
	  	 model.addAttribute("cover_l_url", cover_l_url);
		 model.addAttribute("title", title);
		 model.addAttribute("author_t", author_t);
		 model.addAttribute("pub_nm", pub_nm);
//		 model.addAttribute("description", description);
		 model.addAttribute("list_price", list_price);
		 model.addAttribute("link", link);
		 model.addAttribute("isbn", isbn);
  }
  
  
//  @RequestMapping("/getAttach/{bno}")
//  @ResponseBody
//  public List<String> getAttach(@PathVariable("bno")Integer bno)throws Exception{
//    
//    return service.getAttach(bno);
//  }  

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
