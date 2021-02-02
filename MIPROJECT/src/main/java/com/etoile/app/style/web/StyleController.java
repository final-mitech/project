package com.etoile.app.style.web;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etoile.app.style.service.StyleService;
import com.etoile.app.vo.StylingVO;

@Controller
public class StyleController {

	//@Autowired
	private StyleService styleService; 	//styleServiceImpl 객체 자동 주입
	
	@RequestMapping("/site/styleList")
	public String stylingList(Model model, @ModelAttribute("vo") StylingVO vo) throws SQLException {
		List<StylingVO> styling = styleService.stylingList(vo);
		styling = styleService.stylingList(vo);
		model.addAttribute("styling", styling);
		
		return "site/review/reviewList";
	}
		
}
