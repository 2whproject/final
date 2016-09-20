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
import org.zerock.domain.BoardVO;
import org.zerock.domain.NotePageMaker;
import org.zerock.domain.NoteSearchCriteria;
import org.zerock.domain.NoteVO;
import org.zerock.service.NoteService;

@Controller
@RequestMapping("/notice/*")
public class NoteController {

  private static final Logger logger = LoggerFactory.getLogger(NoteController.class);

  @Inject
  private NoteService service;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void listPage(@ModelAttribute("cri") NoteSearchCriteria cri, Model model) throws Exception {

    logger.info(cri.toString());

    // model.addAttribute("list", service.listCriteria(cri));
    model.addAttribute("list", service.listSearchCriteria(cri));

    NotePageMaker pageMaker = new NotePageMaker();
    pageMaker.setCri(cri);

    // pageMaker.setTotalCount(service.listCountCriteria(cri));
    pageMaker.setTotalCount(service.listSearchCount(cri));

    model.addAttribute("pageMaker", pageMaker);
  }

  @RequestMapping(value = "/readNote", method = RequestMethod.GET)
  public void read(@RequestParam("no") int no, @ModelAttribute("cri") NoteSearchCriteria cri, Model model)
      throws Exception {

    model.addAttribute(service.read(no));
  }
  @RequestMapping(value = "/readNote", method = RequestMethod.POST)
  public String read(NoteVO receiver, RedirectAttributes rttr, Model model) throws Exception {
	NoteVO vo = service.receiver(receiver);
	if (vo == null) {
		rttr.addFlashAttribute("msg", "FAIL");
		return "redirect:/notice/list";
	}
	logger.info("CORRECT");
	rttr.addFlashAttribute("msg", "CORRECT");
	rttr.addFlashAttribute("receiver", receiver.getReceiver());
	rttr.addAttribute("no", receiver.getNo());
	return "redirect:/notice/readNote";
  }

  @RequestMapping(value = "/removeNote", method = RequestMethod.POST)
  public String remove(@RequestParam("no") int no, NoteSearchCriteria cri, RedirectAttributes rttr) throws Exception {

    service.remove(no);
    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/notice/list";
  }
  @RequestMapping(value = "/send", method = RequestMethod.GET)
  public void sendGET() throws Exception {
	  
  }

  @RequestMapping(value = "/send", method = RequestMethod.POST)
  public String sendPOST(@RequestParam("receiver") String find, NoteVO send, RedirectAttributes rttr, Model model) throws Exception {
		try {
			model.addAttribute(service.find(find));
		} catch (Exception e) {
			logger.info("FAIL");
			rttr.addFlashAttribute("msg", "FAIL");
			return "redirect:/notice/send";
		}
    logger.info("send post ...........");
    logger.info(send.toString());
    service.send(send);
    rttr.addFlashAttribute("msg", "SUCCESS");
    return "redirect:/notice/list";
  }
}
