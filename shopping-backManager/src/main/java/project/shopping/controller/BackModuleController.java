package project.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.shopping.constant.Constant;
import project.shopping.pojo.BackModule;
import project.shopping.pojo.BackTree;
import project.shopping.pojo.PageConfig;
import project.shopping.service.IBackModuleService;
import project.shopping.utils.DwzResult;
import project.shopping.utils.RequestUtils;
import project.shopping.utils.SpringUtils;
import project.shopping.utils.TreeUtil;

/**
 * 系统模块管理
 * 
 * @author zhouyuyou
 * @date 2017年4月28日上午11:12:19
 */
@Controller
@RequestMapping("/module")
public class BackModuleController {

	private static Logger logger = LoggerFactory.getLogger(BackModuleController.class);

	@Autowired
	private IBackModuleService backModuleService;

	/**
	 * 根据某个树节点查询子节点，菜单管理树
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/getModuleList.shop")
	public String findModuleList(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> params = RequestUtils.getQueryParams(request);
		params.put("nameSpace", "BackModule");
		try {
			if (!params.containsKey("moduleId")) {
				List<BackTree> treeModels = backModuleService.findAllModuleTree(params);
				String url = "module/getModuleList.shop?myId=" + params.get("myId") + "&moduleId=";
				String ModuleList = TreeUtil.getTreeModelStrings(url, "moduleBox", 0, 0, treeModels);
				ModuleList = "<a href=\"module/getModuleList.shop?myId=" + params.get("myId")
						+ "&moduleId=0\" target=\"ajax\" rel=\"moduleBox\" >根目录</a>"
						+ ModuleList.replaceAll("<ul></ul>", "");
				model.addAttribute("ModuleList", ModuleList);
			} else {
				params.put("parentId", params.get("moduleId"));
				PageConfig<BackModule> pageConfig = backModuleService.findPage(params);
				model.addAttribute("pm", pageConfig);
			}
			model.addAttribute("params", params);
		} catch (Exception e) {
			logger.error("展示用户权限树失败，异常信息:", e);
		}
		return "module/listModuleSearch";
	}

	/**
	 * 权限查询
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/rightSubList.shop")
	public String topSubList(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> params = new HashMap<>();
		params.put("parentId", request.getParameter("parentId"));
		try {
			List<BackModule> allModule = this.backModuleService.findAllModule(params);
			model.addAttribute("rightSubList", allModule);
		} catch (Exception e) {
			logger.error("rightSubList error", e);
			model.addAttribute(Constant.MESSAGE, "权限查询失败");
		}
		return "rightSubList";
	}

	/**
	 * 添加或更新
	 * 
	 * @param request
	 * @param response
	 * @param backModule
	 * @param model
	 */
	@RequestMapping("/saveUpdateModule.shop")
	public String addBackMoudle(HttpServletRequest request, HttpServletResponse response, BackModule backModule,
			Model model) {
		Map<String, Object> params = RequestUtils.getQueryParams(request);
		String result = null;
		String messsage = null;
		try {
			if ("toJsp".equals(params.get("type"))) {
				if (params.containsKey("id")) {
					BackModule module = this.backModuleService.findById((Integer) params.get("myId"));
					BackModule parentMoudle = this.backModuleService.findById(module.getModuleParentId());
					model.addAttribute("backMoudle", module);
					model.addAttribute("parentMoudle", parentMoudle);
				}
				result = "module/saveUpdateModule";
			} else {
				// 防止未填
				if (params.containsKey("district.id")) {
					backModule.setModuleParentId(Integer.parseInt(params.get("district.id").toString()));
				} else {
					backModule.setModuleParentId(0);
				}
				if (null != backModule.getId()) {
					this.backModuleService.updateBackMoudle(backModule);
				} else {
					this.backModuleService.addBackMoudle(backModule);
				}
				SpringUtils.renderDwzResult(response, true, "操作成功", DwzResult.CALLBACK_CLOSECURRENT,
						params.get("parentId").toString());
			}
		} catch (Exception e) {
			if (result == null) {
				SpringUtils.renderDwzResult(response, false, "操作失败", DwzResult.CALLBACK_CLOSECURRENT,
						params.get("parentId").toString());
			} else {
				messsage = "服务器异常，请稍后重试！";
			}
			logger.error("添加权限信息失败，异常信息:", e);
		}
		model.addAttribute(Constant.MESSAGE, messsage);
		model.addAttribute("params", params);
		return result;
	}

	/**
	 * 展现菜单树
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/showRightList.shop")
	public String showRightList(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> params = RequestUtils.getQueryParams(request);
		String message = null;
		try {
			List<BackTree> treeModels = backModuleService.findAllModuleTree(params);
			String outGroupHtml = TreeUtil.getCallBackTreeString(0, 0, treeModels);
			model.addAttribute("outGroupHtml", outGroupHtml);
		} catch (Exception e) {
			message = "服务器异常，请稍后重试！";
			logger.error("展示权限树失败，异常信息:", e);
		}
		model.addAttribute(Constant.MESSAGE, message);
		return "showRight";
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/deleteBackMoudle.shop")
	public void deleteBackMoudle(HttpServletRequest request, HttpServletResponse response) {
		Boolean flag = false;
		try {
			this.backModuleService.deleteById(Integer.parseInt(request.getParameter("id")));
			flag = true;
		} catch (Exception e) {
			logger.error("删除菜单信息失败，异常信息:", e);
		}
		SpringUtils.renderDwzResult(response, flag, flag == true ? "删除权限成功" : "删除权限失败",
				DwzResult.CALLBACK_CLOSECURRENTDIALOG, request.getParameter("parentId").toString());
	}

	/**
	 * 菜单切换
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/subMenu.shop")
	public String subMenu(HttpServletRequest request, HttpServletResponse response, Model model) {
		String myId = request.getParameter("myId");
		Map<String, Object> params = new HashMap<>();
		List<BackModule> subMenu = new ArrayList<>();
		params.put("parentId", myId);
		List<BackModule> module = this.backModuleService.findAllModule(params);
		if (null != module && module.size() > 0) {
			for (BackModule backModule2 : module) {
				params.put("parentId", backModule2.getId());
				List<BackModule> list = this.backModuleService.findAllModule(params);
				backModule2.setModuleList(list);
				subMenu.add(backModule2);
			}
		}
		model.addAttribute("subMenu", subMenu);
		return "subMenu";
	}
}
