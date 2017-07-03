package project.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.octo.captcha.service.image.ImageCaptchaService;

import project.shopping.constant.Constant;
import project.shopping.pojo.BackModule;
import project.shopping.pojo.BackUser;
import project.shopping.pojo.OperatorLog;
import project.shopping.service.IBackModuleService;
import project.shopping.service.IBackUserService;
import project.shopping.service.IOperatorLogService;
import project.shopping.utils.RequestUtils;

/**
 * 登录及其首页
 * 
 * @author zhouyuyou
 * @date 2017年4月26日下午5:25:50
 */
@Controller
public class IndexController {

	private static Logger logger = LoggerFactory.getLogger(IndexController.class);

	@Autowired
	private ImageCaptchaService captchaService;
	@Autowired
	private IBackUserService backUserService;
	@Autowired
	private IOperatorLogService operatorLogService;
	@Autowired
	private IBackModuleService backModuleService;

	/**
	 * To 登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String toLogin(HttpServletRequest request, HttpServletResponse response, Model model) {
		if (null != request.getParameter("message")) {
			model.addAttribute(Constant.MESSAGE, request.getParameter("message"));
		}
		if (null != request.getParameter("returnUrl")) {
			model.addAttribute("returnUrl", request.getParameter("returnUrl"));
		}
		return "login";
	}

	/**
	 * 后台用户登录
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login.shop", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		OperatorLog operatorLog = new OperatorLog();
		operatorLog.setOperatorCategory(OperatorLog.BACK_LOGIN);
		operatorLog.setOperatorTitle("后台用户登录");
		try {
			if (!validateSubmit(request)) {
				model.addAttribute(Constant.MESSAGE, "验证码错误！");
				return "login";
			}
			Map<String, Object> params = RequestUtils.getQueryParams(request);
			BackUser backUser = this.backUserService.findByAccount(params);
			if (null == backUser) {
				model.addAttribute(Constant.MESSAGE, "用户名不存在！");
				return "login";
			}
			if (!backUser.getUserPassword().equals(params.get("userPassword"))) {
				model.addAttribute(Constant.MESSAGE, "密码错误！");
				return "login";
			}
			operatorLog.setLogUserid(backUser.getId().toString());
			if (backUser.getIsLock() == 0) {
				operatorLog.setOperatorReturn("登录成功");
				operatorLog.setOperatorStatus(200);
				request.getSession().setAttribute(Constant.BACK_USER, backUser);
			} else {
				operatorLog.setOperatorReturn("用户已被锁定，请联系管理员！");
				operatorLog.setOperatorStatus(300);
			}
			operatorLog.setOperatorParams(backUser.getUserAccount());
			operatorLog.setOperatorIp(RequestUtils.getIpAddr(request));
		} catch (Exception e) {
			logger.error("后台用户登录出错！" + e);
			model.addAttribute(Constant.MESSAGE, "服务器异常，请稍后再试！");
			operatorLog.setOperatorReturn("后台用户登录出错");
			operatorLog.setOperatorStatus(500);
			return "login";
		} finally {
			this.operatorLogService.addBackLog(operatorLog);
		}
		String returnUrl = request.getParameter("returnUrl");
		if (StringUtils.isNotBlank(returnUrl)) {
			int i = "/shopping-backManager/back/".length();
			String string = returnUrl.substring(i);
			return "redirect:" + string;
		}
		return "redirect:index.shop";
	}

	/**
	 * 首页
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/index.shop")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> params = new HashMap<>();
		params.put("parentId", "0");
		List<BackModule> allModule = this.backModuleService.findAllModule(params);
		List<BackModule> subMenu = new ArrayList<>();
		if (null != allModule && allModule.size() > 0) {
			BackModule backModule = allModule.get(0);
			params.put("parentId", backModule.getId());
			List<BackModule> module = this.backModuleService.findAllModule(params);
			if (null != module && module.size() > 0) {
				for (BackModule backModule2 : module) {
					params.put("parentId", backModule2.getId());
					List<BackModule> list = this.backModuleService.findAllModule(params);
					backModule2.setModuleList(list);
					subMenu.add(backModule2);
				}
			}
		}
		model.addAttribute("menuModuleList", allModule);
		model.addAttribute("subMenu", subMenu);
		return "index";
	}

	/**
	 * 验证验证码
	 * 
	 * @param request
	 * @return
	 */
	public boolean validateSubmit(HttpServletRequest request) {
		try {
			return captchaService.validateResponseForID(request.getSession(false).getId(),
					request.getParameter("captcha").toLowerCase());
		} catch (Exception e) {
			return false;
		}
	}
}
