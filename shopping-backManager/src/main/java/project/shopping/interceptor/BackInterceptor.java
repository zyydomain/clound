package project.shopping.interceptor;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import project.shopping.constant.Constant;
import project.shopping.pojo.BackUser;
import project.shopping.service.IBackUserService;

/**
 * 后台拦截器
 * 
 * @author zhouyuyou
 * @date 2017年4月28日下午4:53:34
 */
public class BackInterceptor extends HandlerInterceptorAdapter {

	Logger logger = LoggerFactory.getLogger(getClass());
	private String loginUrl = "/back/login";
	@Autowired
	private IBackUserService backUserService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		BackUser backeUser = (BackUser) request.getSession().getAttribute(Constant.BACK_USER);
		if (null == backeUser) {
			// 如果是ajax请求响应头会有，x-requested-with；
			if (request.getHeader("x-requested-with") != null
					&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
				response.setHeader("statusCode", "301");// 在响应头设置session状态
				response.setHeader("path", request.getContextPath());
				response.setHeader("Referer", getLoginUrl(request));
				return false;
			}
			try {
				response.sendRedirect(getLoginUrl(request));
			} catch (IOException e) {
				logger.error("preHandle error ", e);
			}
			return false;
		} else {
			Boolean flag = false;
			String msg = "";
			BackUser user = backUserService.findByPrimaryKey(backeUser.getId());
			if (user.getIsBlack() == BackUser.STATUS_BLACK.intValue()) {
				msg = "黑名单用户不能登录！";
				flag = true;
			} else if (!backeUser.getUserPassword().equals(// 说明已修改过密码，之前的不允许登录
					user.getUserPassword())) {
				flag = true;
				msg = "密码被修改，强制退出！";
			}
			if (flag) {
				try {
					request.getSession().removeAttribute(Constant.BACK_USER);
					if (request.getHeader("x-requested-with") != null
							&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
						response.setHeader("Referer", getLoginUrl(request));
						response.setHeader("msg", java.net.URLEncoder.encode(msg, "utf-8"));
						response.setHeader("statusCode", "301");
					} else {
						response.sendRedirect(request.getContextPath() + "/back/login?message="
								+ java.net.URLEncoder.encode(msg, "utf-8"));
					}
				} catch (Exception e) {
					logger.error(" judege user error", e);
				}
				return false;
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	private String getLoginUrl(HttpServletRequest request) {
		StringBuilder buff = new StringBuilder();
		String ctx = request.getContextPath();
		String requestUrl = request.getRequestURL().toString();
		if (request.getHeader("x-requested-with") != null
				&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
			requestUrl = request.getHeader("Referer");
		}
		if (loginUrl.startsWith("/")) {
			if (!StringUtils.isBlank(ctx)) {
				buff.append(ctx);
			}
		}
		int i = 0, start = 0, count = 3;
		while (i < count && start != -1) {
			start = requestUrl.indexOf('/', start + 1);
			i++;

		}
		buff.append(loginUrl).append("?");
		String retUrl = requestUrl.substring(start);
		if (StringUtils.isNotBlank(retUrl)) {
			Map<String, String[]> params = request.getParameterMap();
			if (params != null && params.size() > 0) {
				int index = retUrl.indexOf("?");
				if (index >= 0) {
					retUrl = retUrl.substring(0, index);
				}
				retUrl += "?";
				for (String key : params.keySet()) {
					Object value = params.get(key);
					Object v = null;
					if ((value.getClass().isArray()) && (((Object[]) value).length > 0)) {
						if (((Object[]) value).length > 1) {
							v = ((Object[]) value);
						} else {
							v = ((Object[]) value)[0];
						}
					} else {
						v = value;
					}
					retUrl += key + "=" + v + "&";
				}
				retUrl = retUrl.substring(0, retUrl.length() - 1);
			}
		}

		buff.append("returnUrl").append("=").append(retUrl);
		return buff.toString();
	}
}
