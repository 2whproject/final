package org.zerock.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

  @Inject
  private MemberService service;

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registGET() throws Exception {

    logger.info("regist get ...........");
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(MemberVO member, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(member.toString());
    try{
    	service.regist(member);
    } catch (Exception e) {
    	logger.info("FAIL");
    	return "redirect:/member/fail";
    }
    
    rttr.addFlashAttribute("msg", "SUCCESS");
    logger.info(rttr.toString());
    service.regist(member);
    
    return "redirect:/user/login";
  }
  @RequestMapping(value = "/success", method = RequestMethod.GET)
  public void successGET() throws Exception {
	  logger.info("SUCCESS");
  }
  
  @RequestMapping(value = "/fail", method = RequestMethod.GET)
  public void failGET() throws Exception {
	  logger.info("FAIL");
  }
}