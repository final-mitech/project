package com.etoile.app.funding.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoile.app.admin.mapper.CodeMapper;
import com.etoile.app.funding.FundingJoinVO;
import com.etoile.app.funding.FundingVO;
import com.etoile.app.funding.service.FundingService;

@Controller
public class FundingContorller {

	@Autowired
	private FundingService fundingService;
	
	@Autowired
	private CodeMapper codeMapper;

	// 펀딩 목록 조회
	@RequestMapping("/site/fundingList")
	public String fundingList(Model model, FundingVO vo) {
		List<FundingVO> fundings = fundingService.fundingList(vo);
		System.out.println(fundings.get(1).getFundingTitle());
		model.addAttribute("fundings", fundings);

		return "site/funding/fundingList";
	}

	// 펀딩 등록 폼
	@GetMapping("/site/fundingInsertForm.do") // 호출명
	public String fundingInsertForm(Model model, FundingVO vo) { // 메소드명
		model.addAttribute("fundings", fundingService.fundingList(vo)); // 등록 폼에도 DB값을 가져와야 하므로 적어줌
		model.addAttribute("cateList", codeMapper.codeList("category"));
		model.addAttribute("branList", codeMapper.codeList("brand"));
		return "site/funding/fundingInsertForm"; // 페이지명 일치
	}

	// 펀딩 등록
	@RequestMapping("site/fundingInsert.do")
	public String fundingInsert(Model model, FundingVO vo) {
		String viewPath = null;

		int n = fundingService.fundingInsert(vo);
		if (n != 0) {
			viewPath = "redirect:fundingList"; // 리퀘스트 매핑 메소드 호출
		} else
			viewPath = "site/funding/fundingInsertFail"; // jsp페이지 호출

		return viewPath;
	}

	// 펀딩 한건 조회
	@GetMapping("site/fundingSelect")
	public String fundingSelect(Model model, FundingVO vo) {
		FundingVO selectVo = fundingService.fundingSelect(vo);
		model.addAttribute("selectVo", selectVo);

		return "site/funding/fundingSelect";
	}

	//

	// (관리자) 요청된 펀딩 목록 조회
	@RequestMapping("/admin/fundingRequestList.a")
	public String fundingRequestList(Model model, FundingVO vo) {
		vo.setPage("requestPage");
		List<FundingVO> fundings = fundingService.fundingRequestList(vo);
		model.addAttribute("fundings", fundings);

		return "admin/funding/fundingRequestList";
	}

	// (관리자) 등록된 펀딩 목록 조회
	@RequestMapping("/admin/fundingRegisterList.a")
	public String fundingRegisterList(Model model, FundingVO vo) {
		vo.setPage("registerPage");
		List<FundingVO> fundings = fundingService.fundingRegisterList(vo);
		model.addAttribute("fundings", fundings);

		return "admin/funding/fundingRegisterList";
	}

	// (관리자) 등록된 펀딩 수정 폼
	@GetMapping("/admin/fundingUpdateForm.a")
	public String fundingUpdateForm(Model model, FundingVO vo) {
		FundingVO selectVo = fundingService.fundingUpdateForm(vo);
		model.addAttribute("selectVo", selectVo);

		return "admin/funding/fundingUpdateForm"; // 페이지명 일치
	}

	// (관리자) 요청된 펀딩 수정 폼
	@GetMapping("/admin/fundingRequestUpdateForm.a")
	public String fundingRequestUpdateForm(Model model, FundingVO vo) {
		FundingVO selectVo = fundingService.fundingRequestUpdateForm(vo);
		model.addAttribute("selectVo", selectVo);

		return "admin/funding/fundingRequestUpdateForm"; // 페이지명 일치
	}

	// 펀딩 수정
	@PostMapping("admin/fundingUpdate.a")
	public String fundingUpdate(Model model, FundingVO vo) {
		String viewPath = null;

		int n = fundingService.fundingUpdate(vo);
		if (n != 0) {
			viewPath = "redirect:fundingRegisterList.a"; // 리퀘스트 매핑 메소드 호출
		} else
			viewPath = "admin/funding/fundingUpdateFail"; // jsp페이지 호출

		return viewPath;
	}

	// 펀딩 수정
	@PostMapping("admin/fundingRequestUpdate.a")
	public String fundingRequestUpdate(Model model, FundingVO vo) {
		String viewPath = null;
		
		vo.setFundingCondition("검수완료");
		
		int n = fundingService.fundingRequestUpdate(vo);
		if (n != 0) {
			viewPath = "redirect:fundingRequestList.a"; // 리퀘스트 매핑 메소드 호출
		} else
			viewPath = "admin/funding/fundingUpdateFail"; // jsp페이지 호출

		return viewPath;
	}

	// 펀딩 삭제
	@PostMapping("admin/fundingDelete.a")
	public String fundingDelete(Model model, FundingVO vo) {
		String viewPath = null;

		int n = fundingService.fundingDelete(vo);
		if (n != 0)
			viewPath = "redirect:fundingList";
		else
			viewPath = "admin/funding/fundingDeleteFail"; // jsp 페이지를 호출할 때

		return viewPath;
	}

	// 펀딩 상태 수정
	@PostMapping("admin/conditionUpdate.a")
	@ResponseBody
	public String conditionUpdate(FundingVO vo) {
		
		int n = fundingService.conditionUpdate(vo);
		if (n != 0) {
			return "SUCCESS";
		} else
			return "FAIL";
	}

	// 블록체인

	// 펀딩 참여 등록 , 수정
	@RequestMapping(value = "site/fundingJoinInsert.do")
	@ResponseBody
	public FundingJoinVO fundingJoinInsert(FundingJoinVO vo, FundingVO vo2) {

		vo.setMemberId("user"); // 로그인 세션때무네 임시로만들어놓으뮤ㅠ

		fundingService.fundingJoinInsert(vo);
		fundingService.fundingJoinUpdate(vo2);

		return vo;
	}
	
	//마이페이지
	
	//마이 펀딩
	@RequestMapping("site/myFundingList.do")
	public String myFundingList(Model model, FundingVO vo) {
		
		vo.setMemberId("user");
		
		List<FundingVO> fundings = fundingService.myFundingList(vo);
		model.addAttribute("fundings", fundings);

		return "site/my/myFundingList";
	}

	//조인 펀딩
	@RequestMapping("site/joinFundingList.do")
	public String joinFundingList(Model model, FundingVO vo) {
		
		vo.setMemberId("user");
		
		List<FundingVO> fundings = fundingService.joinFundingList(vo);
		model.addAttribute("fundings", fundings);

		return "site/my/joinFundingList";
	}

}
