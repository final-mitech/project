package com.etoile.app.admin.common;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.etoile.app.member.service.MemberService;
import com.etoile.app.vo.CouponVO;
import com.etoile.app.vo.GradeVO;
import com.etoile.app.vo.MemberVO;
import com.etoile.app.vo.RentalVO;

@Component
public class MemberGradeSchedule {

	@Autowired
	MemberService memberService;

	@Scheduled(cron = "0 0 1 * * *")
	public void MemberGradeScedule() {

		Calendar cal = Calendar.getInstance();
		;
		// 지난 달정보를 받아온다 "YYYYMM"
		String date = null;
		if (cal.get(Calendar.MONTH) >= 10) {
			date = String.valueOf(cal.get(Calendar.YEAR)) + String.valueOf(cal.get(Calendar.MONTH));
		} else {
			date = String.valueOf(cal.get(Calendar.YEAR)) + "0" + String.valueOf(cal.get(Calendar.MONTH));
		}

		// 쿠폰 테이블에서 등급별 쿠폰을 삭제한다
		int n = memberService.gradeCouponDelete(null);

		// 멤버 테이블에서 BUSINESS를 제외한 회원 정보를 가져온다
		MemberVO memberVO = new MemberVO();
		memberVO.setStart(1);
		memberVO.setEnd(memberService.memberCount(memberVO));
		List<MemberVO> memberList = memberService.memberList(memberVO);

		// 등급 테이블에서 등급관련 정보를 가져온다
		List<GradeVO> gradeInfo = memberService.gradeCoupon(null);

		Map<String, String> gradeBenefit = new HashMap<String, String>();
		for (GradeVO grade : gradeInfo) {
			gradeBenefit.put(grade.getGrade(), grade.getGradeBenefit());
		}

		for (MemberVO member : memberList) {
			if (! member.getGrade().equals("BUSINESS")) {
				String id = member.getMemberId();
				// 회원별 한달간 대여기록을 카운트한다
				int rentalCount = memberService.rentalCount(id, date);
				// 등급관련 정보와 비교하여 멤버 정보를 업데이트한다.
				switch (rentalCount / 5) {
				case 0:
				case 1:
					member.setGrade("VISIT");
					break;
				case 2:
					member.setGrade("VIP");
					break;
				default:
					member.setGrade("VVIP");
					break;

				}
			}
			// 업데이트된 멤버 정보를 기준으로 쿠폰 테이블에 입력한다
			String[] benefit = gradeBenefit.get(member.getGrade()).split("%");
			for (String str : benefit) {
				CouponVO coupon = new CouponVO();
				coupon.setMemberId(member.getMemberId());
				coupon.setCouponSort(member.getGrade());
				coupon.setGradeCoupon(Integer.parseInt(str));
				coupon.setCouponUsed(0);
				memberService.couponInsert(coupon);
				System.out.println(coupon);
			}

		}


	}

}
