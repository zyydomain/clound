package project.shopping.utils;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.support.WebApplicationContextUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import project.shopping.constant.Constant;

/**
 * json 格式输入
 * 
 * @author zhouyuyou
 * @date 2017年4月28日下午3:52:59
 */
public class SpringUtils {

	// header 常量定义
	private static final String ENCODING_PREFIX = "encoding";
	private static final String NOCACHE_PREFIX = "no-cache";
	private static final boolean NOCACHE_DEFAULT = true;
	private static Logger logger = LoggerFactory.getLogger(SpringUtils.class);

	/**
	 * 获得bean
	 * 
	 * @param name
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getBean(Class<T> clazz, String name) {
		return (T) WebApplicationContextUtils
				.getWebApplicationContext(ContextLoader.getCurrentWebApplicationContext().getServletContext())
				.getBean(name);
	}

	public static String formatNumber(Integer number) {
		DecimalFormat df = new DecimalFormat("#,###");
		String m = df.format(number);
		System.out.print(m);
		return m;
	}

	public static void main(String[] args) {
		SpringUtils.formatNumber(100000);
	}
	// 绕过jsp直接输出文本的函数 //

	/**
	 * 直接输出内容的简便函数.
	 * 
	 */
	public static void render(HttpServletResponse response, final String contentType, final String content,
			final String... headers) {
		try {
			// 分析headers参数
			String encoding = Constant.UTF8;
			boolean noCache = NOCACHE_DEFAULT;
			for (String header : headers) {
				String headerName = StringUtils.substringBefore(header, ":");
				String headerValue = StringUtils.substringAfter(header, ":");

				if (StringUtils.equalsIgnoreCase(headerName, ENCODING_PREFIX)) {
					encoding = headerValue;
				} else if (StringUtils.equalsIgnoreCase(headerName, NOCACHE_PREFIX)) {
					noCache = Boolean.parseBoolean(headerValue);
				} else
					throw new IllegalArgumentException(headerName + "不是一个合法的header类型");
			}
			// 设置headers参数
			String fullContentType = contentType + ";charset=" + encoding;
			response.setContentType(fullContentType);
			if (noCache) {
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setDateHeader("Expires", 0);
			}

			response.getWriter().write(content);
			response.getWriter().flush();

		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		}
	}

	/**
	 * 直接输出文本.
	 * 
	 */
	public static void renderText(HttpServletResponse response, final String text, final String... headers) {
		render(response, "text/plain", text, headers);
	}

	/**
	 * 直接输出HTML.
	 * 
	 */
	public static void renderHtml(HttpServletResponse response, final String html, final String... headers) {
		render(response, "text/html", html, headers);
	}

	/**
	 * 直接输出XML.
	 * 
	 */
	public static void renderXml(HttpServletResponse response, final String xml, final String... headers) {
		render(response, "text/xml", xml, headers);
	}

	/**
	 * 直接输出JSON格式
	 * 
	 * @param string
	 *            json字符串.
	 */
	public static void renderJson(HttpServletResponse response, final String string, final String... headers) {
		render(response, "application/json", string, headers);
	}

	/**
	 * 直接输出JSON. Java对象,将被转化为json字符串.
	 * 
	 */
	public static void renderJson(HttpServletResponse response, final Object object, final String... headers) {
		String jsonString = fromObject(object);
		renderJson(response, jsonString, headers);
	}

	/**
	 * 对象转换json格式字符串
	 * 
	 * @param obj
	 * @return
	 */
	public static String fromObject(Object obj) {
		return JSONObject.fromObject(obj).toString();
	}

	public static Map<String, Object> parseJSON2Map(String jsonStr) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 最外层解析
		JSONObject json = JSONObject.fromObject(jsonStr);
		for (Object k : json.keySet()) {
			Object v = json.get(k);
			// 如果内层还是数组的话，继续解析
			if (v instanceof JSONArray) {
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				Iterator<JSONObject> it = ((JSONArray) v).iterator();
				while (it.hasNext()) {
					JSONObject json2 = it.next();
					list.add(parseJSON2Map(json2.toString()));
				}
				map.put(k.toString(), list);
			} else {
				map.put(k.toString(), v);
			}
		}
		return map;
	}

	/**
	 * json字符串转换对象
	 * 
	 * @param jsonStr
	 * @param clazz
	 * @return
	 */
	public static Object toObject(String jsonStr, Class clazz) {

		List objList = JSONArray.toList(JSONArray.fromObject(jsonStr), clazz);
		if (objList.size() > 0) {
			return objList.get(0);
		} else {
			return null;
		}

	}

	/**
	 * list 输出json
	 */
	public static void renderJson(HttpServletResponse response, final List object, final String... headers) {
		JSONArray json = JSONArray.fromObject(object);
		renderJson(response, json.toString(), headers);
	}

	/**
	 * 输出dwz结果
	 */
	public static void renderDwzResult(HttpServletResponse response, boolean succ, String message) {
		renderDwzResult(response, succ, message, null);
	}

	/**
	 * 输出dwz结果
	 */
	public static void renderDwzResult(HttpServletResponse response, boolean succ, String message, String callback) {
		DwzResult res = new DwzResult();
		if (succ) {
			res.setStatusCode(DwzResult.SUCCESS);
		} else {
			res.setStatusCode(DwzResult.FAILD);
		}
		res.setMessage(message);
		res.setCallbackType(callback);
		SpringUtils.renderJson(response, res);
	}

	/**
	 * 输出dwz结果
	 */
	public static void renderDwzResult(HttpServletResponse response, boolean succ, String message, String callback,
			String navTabId) {
		DwzResult res = new DwzResult();
		if (succ) {
			res.setStatusCode(DwzResult.SUCCESS);
		} else {
			res.setStatusCode(DwzResult.FAILD);
		}
		res.setMessage(message);
		res.setCallbackType(callback);
		res.setNavTabId(navTabId);
		SpringUtils.renderJson(response, res);
	}

	/**
	 * 刷新某个url的方法
	 */
	@Deprecated
	public static void renderDwzResult(HttpServletResponse response, boolean succ, String message, String callback,
			String navTabId, String forwardUrl) {
		DwzResult res = new DwzResult();
		if (succ) {
			res.setStatusCode(DwzResult.SUCCESS);
		} else {
			res.setStatusCode(DwzResult.FAILD);
		}
		res.setMessage(message);
		res.setCallbackType(callback);
		res.setNavTabId(navTabId);
		res.setForwardUrl(forwardUrl);
		SpringUtils.renderJson(response, res);
	}

	public static void renderJsonResult(HttpServletResponse response, String code, String message) {
		ServiceResult rest = new ServiceResult(code, message);

		SpringUtils.renderJson(response, rest);
	}

}
