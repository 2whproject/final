package org.zerock.controller;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.service.MemberService;
@Controller
@RequestMapping ("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	private MemberService service;
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception {
		logger.info("Member get...");
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST (String uname, MemberVO member, RedirectAttributes rttr) throws Exception {
		logger.info("Member register...");
		logger.info(member.toString());
		MemberVO vo = service.leave(member);
		if (vo != null) {
			logger.info("FAILANOTHER");
			rttr.addFlashAttribute("id", member.getUid());
			rttr.addFlashAttribute("email", member.getEmail());
			rttr.addFlashAttribute("name", member.getUname());
			rttr.addFlashAttribute("msg", "FAILANOTHER");
			return "redirect:/member/register";
		} else {
			MemberVO vo1 = service.nickleave(member);
			if (vo1 != null) {
				logger.info("NICKFAILANOTHER");
				rttr.addFlashAttribute("id", member.getUid());
				rttr.addFlashAttribute("email", member.getEmail());
				rttr.addFlashAttribute("name", member.getUname());
				rttr.addFlashAttribute("msg", "NICKFAILANOTHER");
				return "redirect:/member/register";
			}
		}
			try {
				String str = service.findnick(uname).toString();
				logger.info(str);
				if (str != null) {
					logger.info("NICKFAIL");
					rttr.addFlashAttribute("id", member.getUid());
					rttr.addFlashAttribute("email", member.getEmail());
					rttr.addFlashAttribute("name", member.getUname());
					rttr.addFlashAttribute("msg", "NICKFAIL");
					return "redirect:/member/register";
				}
			} catch (NullPointerException e) {
				try {
					service.regist(member);
					service.registleave(member);
				} catch (Exception e1) {
				logger.info("FAIL");
				rttr.addFlashAttribute("id", member.getUid());
				rttr.addFlashAttribute("email", member.getEmail());
				rttr.addFlashAttribute("name", member.getUname());
				rttr.addFlashAttribute("msg", "FAIL");
				return "redirect:/member/register";
			}
		}
		rttr.addFlashAttribute("msg", "SUCCESS");
		rttr.addFlashAttribute("name", member.getUname());
		logger.info(rttr.toString());
		return "redirect:/user/login";
	}
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public void findGET() throws Exception {
		logger.info("find get...");
	}
	@RequestMapping(value = "/find", method = RequestMethod.POST)
	public String findPOST(@RequestParam("email") String email, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("find post...");
		try {
			model.addAttribute(service.find(email));
		} catch (Exception e) {
			logger.info("FAIL");
			rttr.addFlashAttribute("msg", "FAIL");
			return "redirect:/member/find";
		}
		logger.info("SUCCESS");
		rttr.addFlashAttribute("msg", "FIND");
		rttr.addFlashAttribute("id", service.find(email).getUid());
		rttr.addFlashAttribute("pass", service.find(email).getUpw());
		return "redirect:/user/login";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteGET() throws Exception {
		logger.info("delete get...");
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePOST(MemberVO mem, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("delete post...");
		MemberVO vo = service.delete(mem);
		vo = service.select(mem);
		if (vo == null) {
			logger.info("SUCCESS");
			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/member/delete";
		}
		logger.info("FAIL");
		rttr.addFlashAttribute("msg", "FAIL");
		return "redirect:/member/delete";
	}
}
