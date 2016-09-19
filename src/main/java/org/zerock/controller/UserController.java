package org.zerock.controller;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.Criteria;
import org.zerock.domain.LogVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.LogService;
import org.zerock.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
  @Inject
  private UserService service;
  @Inject
  private LogService service1;

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

  }

  // @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
  // public void loginPOST(LoginDTO dto, HttpSession session, Model model)
  // throws Exception {
  //
  // UserVO vo = service.login(dto);
  //
  // if (vo == null) {
  // return;
  // }
  //
  // model.addAttribute("userVO", vo);
  //
  // }

  @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
  public String loginPOST(Locale locale, LogVO log, LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
    UserVO vo = service.login(dto);
    logger.info(model.toString());
    if (vo == null) {
      logger.info("###########");
      logger.info("Login FAIL");
      logger.info("###########");
      rttr.addFlashAttribute("log", "FAIL");
      String loc = locale.getDisplayCountry();
      log.setLocale(loc);
      service1.result(log);
      return "redirect:/user/login";
    }
    String loc = locale.getDisplayCountry();
    log.setLocale(loc);
    log.setResult(true);
    service1.result(log);
    model.addAttribute("userVO", vo);
    if (dto.isUseCookie()) {
      int amount = 60 * 60 * 24 * 7;
      Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
      service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
    }
	return null;
  }
  @RequestMapping(value = "/logoff", method = RequestMethod.GET)
  public String logout(HttpServletRequest request, 
      HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {

    Object obj = session.getAttribute("login");

    if (obj != null) {
      UserVO vo = (UserVO) obj;

      session.removeAttribute("login");
      session.invalidate();

      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

      if (loginCookie != null) {
        loginCookie.setPath("/");
        loginCookie.setMaxAge(0);
        response.addCookie(loginCookie);
        service.keepLogin(vo.getUid(), session.getId(), new Date());
      }
    }
    rttr.addFlashAttribute("msg", "LOGOFF");
    return "redirect:/";
  }
  @RequestMapping(value = "/logininfo", method = RequestMethod.GET)
  public void loginInfo(UserVO vo, HttpSession session, Model model) throws Exception {
	 Object obj = session.getAttribute("login");
	 vo = (UserVO) obj;
	 model.addAttribute("list", service1.read(vo.getUid()));
  }
}
