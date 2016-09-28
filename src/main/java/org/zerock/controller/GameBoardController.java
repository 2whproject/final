package org.zerock.controller;

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
import org.zerock.domain.GboardVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.GBoardService;

@Controller
@RequestMapping("/gboard/*")
public class GameBoardController {

  private static final Logger logger = LoggerFactory.getLogger(GameBoardController.class);

  @Inject
  private GBoardService service;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

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
  public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)
      throws Exception {

    model.addAttribute(service.read(bno));
  }

  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    service.remove(bno);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/gboard/list";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    model.addAttribute(service.read(bno));
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(GboardVO gboard, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    logger.info(cri.toString());
    service.modify(gboard);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/gboard/list";
  }

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registGET() throws Exception {

    logger.info("regist get ...........");
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(GboardVO gboard, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(gboard.toString());

    service.regist(gboard);

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/gboard/list";
  }
  
  
  @RequestMapping("/getAttach/{bno}")
  @ResponseBody
  public List<String> getAttach(@PathVariable("bno")Integer bno)throws Exception{
    
    return service.getAttach(bno);
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