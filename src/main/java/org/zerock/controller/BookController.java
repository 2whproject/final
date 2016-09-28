package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BookVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BookService;

@Controller
@RequestMapping("/book/*")
public class BookController {

  private static final Logger logger = LoggerFactory.getLogger(BookController.class);

  @Inject
  private BookService service;
  
  @RequestMapping(value = "/search", method = RequestMethod.GET)
  public void searchListPage(@RequestParam ("cate_id") Integer cate_id, Model model) throws Exception {
	  model.addAttribute("cate_id", cate_id);
  }
  

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    logger.info(cri.toString());

    model.addAttribute("list", service.listSearchCriteria(cri));

    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);

    pageMaker.setTotalCount(service.listSearchCount(cri));

    model.addAttribute("pageMaker", pageMaker);
  }

  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
  public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)
      throws Exception {
    model.addAttribute(service.read(bno));
    logger.info(service.read(bno).toString());
  }

  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    service.remove(bno);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/book/list";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    model.addAttribute(service.read(bno));
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(BookVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    logger.info(cri.toString());
    service.modify(board);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/book/list";
  }

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registGET(@RequestParam("title") String title,
		  				@RequestParam("author") String author,
					    @RequestParam("price") String price,
					    @RequestParam("publisher") String publisher,
					    @RequestParam("overview") String overview,
					    @RequestParam("link") String link,
					    Model model){
	
	model.addAttribute("title", title);
	model.addAttribute("author", author);
	model.addAttribute("publisher", publisher);
	model.addAttribute("price", price);
	model.addAttribute("overview", overview);
	model.addAttribute("link", link);
	
    logger.info("regist get ...........");
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(BookVO board, RedirectAttributes rttr) throws Exception {
    logger.info("regist post ...........");
    logger.info(board.toString());
    board.setStar(board.getStar()-1);
    service.regist(board);

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/book/list";
  }
  
  
  @RequestMapping("/getAttach/{bno}")
  @ResponseBody
  public List<String> getAttach(@PathVariable("bno")Integer bno)throws Exception{
    
    return service.getAttach(bno);
  }  

}
