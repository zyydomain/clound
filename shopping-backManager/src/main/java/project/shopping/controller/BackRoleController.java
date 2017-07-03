package project.shopping.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.shopping.pojo.BackRole;
import project.shopping.pojo.BackTree;
import project.shopping.pojo.PageConfig;
import project.shopping.service.IBackRoleService;
import project.shopping.utils.RequestUtils;
import project.shopping.utils.TreeUtil;

/**
 * 后台角色
 * 
 * @author zhouyuyou
 * @date 2017年5月5日下午4:51:52
 */
@Controller
@RequestMapping("role")
public class BackRoleController {

	@Autowired
	private IBackRoleService backRoleService;

	@RequestMapping("getRoleList.shop")
	public String getRoleList(HttpServletRequest request, HttpServletResponse response, Model model) {
		String target = "role/listRoleSearch";
		Map<String, Object> params = RequestUtils.getQueryParams(request);
		if (!params.containsKey("roleId")) {
			List<BackTree> treeModels = backRoleService.findAllTree(params);
			String url = "role/getRoleList?myId=" + params.get("myId") + "&roleId=";
			String roleList = "";
			roleList = TreeUtil.getTreeModelStrings(url, "roleBox", 0, 0, treeModels);
			roleList = "<a href=" + url + "0" + " target=\"ajax\" rel=\"roleBox\" >根目录</a>"
					+ roleList.replaceAll("<ul></ul>", "");
			model.addAttribute("roleList", roleList);
		} else {
			params.put("parentId", params.get("roleId"));
			PageConfig<BackRole> pageConfig = backRoleService.findPage(params);
			model.addAttribute("pm", pageConfig);
		}
		return target;
	}
}
