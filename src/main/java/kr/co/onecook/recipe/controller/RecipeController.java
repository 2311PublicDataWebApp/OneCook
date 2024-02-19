package kr.co.onecook.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.PrcdImgVO;
import kr.co.onecook.recipe.domain.PrcdVO;
import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.domain.SauseVO;
import kr.co.onecook.recipe.domain.TitleImageVO;
import kr.co.onecook.recipe.service.RecipeService;

@Controller
public class RecipeController {

	@Autowired
	private RecipeService rService;

	@RequestMapping(value = "/recipe/register.kh", method = RequestMethod.GET)
	public String showInsertRecipe(Model model) {

		return "recipe/register";
	}

	@RequestMapping(value = "/recipe/register.kh", method = RequestMethod.POST)
	public String insertRecipe(Model model
			, @ModelAttribute RecipeVO recipe, @ModelAttribute TitleImageVO titleImage
			, @ModelAttribute IgrdVO igrd, @ModelAttribute ArrayList<IgrdVO> igrdList
			, @ModelAttribute SauseVO sause, @ModelAttribute ArrayList<SauseVO> sauseList
			, @ModelAttribute PrcdVO prcd, @ModelAttribute ArrayList<PrcdVO> prcdList
			, @ModelAttribute PrcdImgVO prcdImg, @ModelAttribute ArrayList<PrcdImgVO> prcdImgList
			, @RequestParam(value = "hong", required = false) MultipartFile hongImage, HttpServletRequest request
			, @RequestParam(value = "cookDetailImage", required = false) MultipartFile detailImage
			, HttpSession session) {

		try {
			// 레시피 상단 등록
			rService.insertRecipe(recipe, titleImage);

			// 레시피 대표 사진 등록
			if (hongImage != null && !hongImage.isEmpty()) {
				Map<String, Object> bMap = this.saveFile(request, hongImage);
				titleImage.setImageTitle((String) bMap.get("fileName"));
				titleImage.setImageRename((String) bMap.get("fileRename"));
				titleImage.setImageFilePath((String) bMap.get("filePath"));
				titleImage.setImageFileLength((Long) bMap.get("fileSize"));
			}
			

			// 재료 테이블 등록
			String[] igrd1 = request.getParameterValues("igrdName");
			String[] igrd2 = request.getParameterValues("igrdUnit");
			// 양념 테이블 목록
			String[] sause1 = request.getParameterValues("sauseName");
			String[] sause2 = request.getParameterValues("sauseUnit");
			// 요리 설명 테이블 목록
			String[] saulmeung = request.getParameterValues("cookDetail");
			// 레시피 순서 사진 목록
			String[] detailImages = request.getParameterValues("cookDetailImage");
			
			prcdImgList = new ArrayList<PrcdImgVO>();
			PrcdImgVO newprcdImgs = new PrcdImgVO();
			for (int i = 0; i<detailImages.length; i++) {
				if(detailImage != null && !detailImage.isEmpty()) {
					Map<String, Object> dMap = this.saveFile2(request, detailImage);
					newprcdImgs.setFileName((String)dMap.get("fileName"));
					newprcdImgs.setFileRename((String)dMap.get("fileRename"));
					newprcdImgs.setFilePath((String)dMap.get("filePath"));
					newprcdImgs.setFileLength((Long)dMap.get("fileSize"));	
				}
				rService.insertPrcdImgList(newprcdImgs);
			}
						
			igrdList = new ArrayList<IgrdVO>();
			IgrdVO newIgrd = new IgrdVO();
			for (int i = 0; i < igrd1.length; i++) {
				newIgrd.setIgrdName(igrd1[i]);
				newIgrd.setIgrdUnit(igrd2[i]);
				rService.insertIgrdList(newIgrd);
			}

			sauseList = new ArrayList<SauseVO>();
			SauseVO newSause = new SauseVO();
			for (int i = 0; i < sause1.length; i++) {
				newSause.setSauseName(sause1[i]);
				newSause.setSauseUnit(sause2[i]);
				rService.insertSauseList(newSause);
			}
			
			prcdList = new ArrayList<PrcdVO>();
			PrcdVO newPrcd = new PrcdVO();
			for (int i = 0; i < saulmeung.length; i++) {
				newPrcd.setCookDetail(saulmeung[i]);
				rService.insertPrcdList(newPrcd);
			}		
			
			return "redirect:/";

		} catch (Exception e) {

			System.out.println(e.getMessage());
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}

	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile hongImage)
			throws IllegalStateException, IOException {
		String fileName = hongImage.getOriginalFilename();
		// 저장 경로
		String projectPath = request.getSession().getServletContext().getRealPath("resources");
		String saveDirectory = projectPath + "\\nuploadFiles";
		File sDir = new File(saveDirectory);
		if (!sDir.exists()) {
			sDir.mkdir(); // 폴더가 없으면 자동으로 만들어줌
		}
		// 파일 리네임의 필요성!!
		// A : 1.png, B: 1.png --> 내용은 다르지만 이름이 같은 파일을 구별하기 위해서 꼭 파일 리네임을 해주어야함
		// 리네임을 할 때에는 올린 시각을 기준으로 파일 이름을 만들어서 따로 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // 나중에 SS랑 비교
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1); // 원본파일의 확장자 글자부터 시작되도록 +1 해줌
		String fileRename = strResult + "." + ext;

		String savePath = saveDirectory + "\\" + fileRename;
		File file = new File(savePath);

		// 파일 저장
		hongImage.transferTo(file);
		// DB에 저장할 파일정보 셋팅
		// 1. 파일이름, 2.파일 리네임, 3. 파일경로, 4.파일크기
		long fileLength = hongImage.getSize();
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("fileName", fileName);
		infoMap.put("fileRename", fileRename);
		infoMap.put("filePath", savePath);
		infoMap.put("fileSize", fileLength);
		return infoMap;
	}
	
	private Map<String, Object> saveFile2(HttpServletRequest request, MultipartFile detailImage)
			throws IllegalStateException, IOException {
		String fileName = detailImage.getOriginalFilename();
		// 저장 경로
		String projectPath = request.getSession().getServletContext().getRealPath("resources");
		String saveDirectory = projectPath + "\\recipedetailImages";
		File sDir = new File(saveDirectory);
		if (!sDir.exists()) {
			sDir.mkdir(); // 폴더가 없으면 자동으로 만들어줌
		}
		// 파일 리네임의 필요성!!
		// A : 1.png, B: 1.png --> 내용은 다르지만 이름이 같은 파일을 구별하기 위해서 꼭 파일 리네임을 해주어야함
		// 리네임을 할 때에는 올린 시각을 기준으로 파일 이름을 만들어서 따로 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // 나중에 SS랑 비교
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1); // 원본파일의 확장자 글자부터 시작되도록 +1 해줌
		String fileRename = strResult + "." + ext;

		String savePath = saveDirectory + "\\" + fileRename;
		File file = new File(savePath);

		// 파일 저장
		detailImage.transferTo(file);
		// DB에 저장할 파일정보 셋팅
		// 1. 파일이름, 2.파일 리네임, 3. 파일경로, 4.파일크기
		long fileLength = detailImage.getSize();
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("fileName", fileName);
		infoMap.put("fileRename", fileRename);
		infoMap.put("filePath", savePath);
		infoMap.put("fileSize", fileLength);
		return infoMap;
	}
}