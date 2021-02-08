package com.etoile.app.member.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginCheckFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//필터 초기화 작업

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//로그인 여부 확인
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String id = (String) req.getSession().getAttribute("id");
		if(id == null) {
			res.sendRedirect("/etoile/site/loginForm");
		}else {
			chain.doFilter(request, response);

		}
				
	}

	@Override
	public void destroy() {
		//주로 필터가 사용한 자원을 반납

	}

}
