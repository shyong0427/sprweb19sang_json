package pack.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SangController {
	@Autowired
	private DataDao dataDao;
	
	@RequestMapping("sangpum")
	@ResponseBody
	public Map<String, Object> sangpums() {
		List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
		Map<String, String> data = null;
		
		List<SangpumDto> sangdatas = dataDao.sangpumList();
		
		for(SangpumDto s : sangdatas) {
			data = new HashMap<String, String>();
			data.put("code", s.getCode());
			data.put("sang", s.getSang());
			data.put("su", s.getSu());
			data.put("dan", s.getDan());
			
			dataList.add(data);
		}
		
		Map<String, Object> sangpumDatas = new HashMap<String, Object>();
		sangpumDatas.put("datas", dataList);
		
		Thread thread = new Thread();
		
		try {
			thread.sleep(3000);
		} catch (Exception e) {
			System.out.println("Thread err : " + e);
		}
		
		return sangpumDatas;
	}
}