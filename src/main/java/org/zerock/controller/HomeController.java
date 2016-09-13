package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.EmpQuickService;
import org.zerock.service.EmpService;
import org.zerock.service.QuickService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

  /**
   * Simply selects the home view to render by returning its name.
   */
  @Inject
  private QuickService service;
  @Inject
  private EmpQuickService service1;
  
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(@ModelAttribute("cri") SearchCriteria cri, Locale locale, Model model) throws Exception {
    logger.info("Welcome home! The client locale is {}.", locale);
    logger.info(cri.toString());
    model.addAttribute("list", service.read());
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
    model.addAttribute("pageMaker", pageMaker);
    return "home";
  }
  
  @RequestMapping(value = "/doA", method = RequestMethod.GET)
  public String doA(Locale locale, Model model) {
    

    System.out.println("doA....................");
    
    return "home";
  }  
  
  @RequestMapping(value = "/doB", method = RequestMethod.GET)
  public String doB(Locale locale, Model model) {
    

    System.out.println("doB....................");
    
    model.addAttribute("result", "DOB RESULT");
    
    return "home";
  }  
  

  @RequestMapping(value = "/test", method = RequestMethod.GET)
  public void ajaxTest() {

  }

}
