package project.shopping.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.octo.captcha.service.image.ImageCaptchaService;

import project.shopping.utils.RequestUtils;

/**
 * 登录及其首页
 * 
 * @author zhouyuyou
 * @date 2017年4月26日下午5:25:50
 */
@Controller
public class IndexController {

	@Autowired
	private ImageCaptchaService captchaService;

	/**
	 * To 登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLogin(HttpServletRequest request, HttpServletResponse response) {
		return "login";
	}

	public void login(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> params = RequestUtils.getQueryParams(request);
	}

	/**
	 * 验证验证码
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public boolean validateSubmit(HttpServletRequest request, HttpServletResponse response) {
		try {
			return captchaService.validateResponseForID(request.getSession(false).getId(),
					request.getParameter("captcha").toLowerCase());
		} catch (Exception e) {
			return false;
		}
	}
}
