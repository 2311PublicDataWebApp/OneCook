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
import org.springframework.web.servlet.ModelAndView;

import kr.co.onecook.recipe.domain.CommentVO;
import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.PageInfo;
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
    
 // 레시피 상세 페이지 이동
    @RequestMapping(value = "/recipe/detail.oc", method = RequestMethod.GET)
    public ModelAndView showDetailRecipe(ModelAndView mv, int recipeNumber) {
        RecipeVO recipe = rService.selectRecipeByNo(recipeNumber);
        TitleImageVO title = rService.selectRecipeTitle(recipeNumber);
        List<IgrdVO> igrd = rService.selectRecipeIgrd(recipeNumber);
        List<SauseVO> sause = rService.selectRecipeSause(recipeNumber);
        List<PrcdVO> prcd = rService.selectRecipePrcd(recipeNumber);
        List<PrcdImgVO> prcdImg = rService.selectRecipePrcdImg(recipeNumber);
        List<CommentVO> comment = rService.selectRecipeComment(recipeNumber);
        
        if(recipe != null) {
            mv.addObject("title", title);
            mv.addObject("recipe", recipe);
            mv.addObject("igrd", igrd);
            mv.addObject("sause", sause);
            mv.addObject("prcd", prcd);
            mv.addObject("prcdImg", prcdImg);
            mv.addObject("comment", comment);        
            // 조회수 증가
            rService.updateHitCount(recipeNumber);
            // 조회수 증가 후 다시 해당 레시피 정보를 가져옴
            recipe = rService.selectRecipeByNo(recipeNumber);        
            double averageRating = rService.AverageRating(recipeNumber);
            mv.addObject("averageRating", averageRating);
            mv.setViewName("recipe/detail");
        } else {
            mv.addObject("msg", "데이터가 존재하지 않습니다.").setViewName("common/errorPage");
        }
        return mv;
    }


	// --------------------------------------------------- 레시피 등록 페이지 이동스~ ---------------------------------------------------
	@RequestMapping(value = "/recipe/register.oc", method = RequestMethod.GET)
	public String showInsertRecipe(Model model) {

		return "recipe/register";
	}

	// --------------------------------------------------- 레시피 등록 기능스~ ----------------------------------------------------------
	@RequestMapping(value = "/recipe/register.oc", method = RequestMethod.POST)
	public String insertRecipe(Model model
			, @ModelAttribute RecipeVO recipe, @ModelAttribute TitleImageVO titleImage
			, @ModelAttribute IgrdVO igrd, @ModelAttribute ArrayList<IgrdVO> igrdList
			, @ModelAttribute SauseVO sause, @ModelAttribute ArrayList<SauseVO> sauseList
			, @ModelAttribute PrcdVO prcd, @ModelAttribute ArrayList<PrcdVO> prcdList
			, @ModelAttribute PrcdImgVO prcdImg, @ModelAttribute ArrayList<PrcdImgVO> prcdImgList
			, @RequestParam(value = "hong", required = false) MultipartFile hongImage
			,  @RequestParam(value = "cookDetailImage", required = false) List<MultipartFile> detailImageList
			, HttpSession session, HttpServletRequest request) {

		try {
			String writer = (String)session.getAttribute("userId");
			if(session != null && writer != null && !"".equals(writer)) {
				recipe.setUserId(writer);
			}else {
				model.addAttribute("msg", "로그인이 필요합니다");
				return "common/errorPage";
			}
			
			
			// --------------------------------------------레시피 대표 사진 등록---------------------------------------
			if (hongImage != null && !hongImage.isEmpty()) {
				Map<String, Object> bMap = this.saveFile(request, hongImage);
				titleImage.setImageTitle((String) bMap.get("fileName1"));
				titleImage.setImageRename((String) bMap.get("fileRename1"));
				titleImage.setImageFilePath((String) bMap.get("filePath1"));
				titleImage.setImageFileLength((Long) bMap.get("fileSize1"));
			}	
			
			
			// --------------------------------------------레시피 상단 등록--------------------------------------------
			rService.insertRecipe(recipe, titleImage);
			
			
			// --------------------------------------------재료 테이블 등록-------------------------------------------
			String[] igrd1 = request.getParameterValues("igrdName");
			String[] igrd2 = request.getParameterValues("igrdUnit");
			
			
			// --------------------------------------------양념 테이블 목록-------------------------------------------
			String[] sause1 = request.getParameterValues("sauseName");
			String[] sause2 = request.getParameterValues("sauseUnit");
			
			
			// --------------------------------------------요리 설명 테이블 목록--------------------------------------
			String[] saulmeung = request.getParameterValues("cookDetail");
			
			
			// --------------------------------------------레시피 순서 사진 목록--------------------------------------
	        if (detailImageList != null && !detailImageList.isEmpty()) {
	            for (MultipartFile detailImage : detailImageList) {
	                if (detailImage != null && !detailImage.isEmpty()) {
	                    Map<String, Object> dMap = this.saveFile2(request, detailImage);
	                    PrcdImgVO prcdImgs = new PrcdImgVO();
	                    prcdImgs.setFileName((String)dMap.get("fileName"));
	                    prcdImgs.setFileRename((String)dMap.get("fileRename"));
	                    prcdImgs.setFilePath((String)dMap.get("filePath"));
	                    prcdImgs.setFileLength((Long)dMap.get("fileSize"));
	                    // 각 이미지 정보 저장
	                    rService.insertprcdImages(prcdImgs);
	                }
	            }
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
	
	
	// --------------------------------------------------- 그 대표 사진 저장 경로 ---------------------------------------------------
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile hongImage)
			throws IllegalStateException, IOException {
		String fileName1 = hongImage.getOriginalFilename();
		// 저장 경로
		String projectPath1 = request.getSession().getServletContext().getRealPath("resources");
		String saveDirectory = projectPath1 + "\\RecipeTitleImgs";
		File sDir1 = new File(saveDirectory);
		if (!sDir1.exists()) {
			sDir1.mkdir(); // 폴더가 없으면 자동으로 만들어줌
		}
		// 파일 리네임의 필요성!!
		// A : 1.png, B: 1.png --> 내용은 다르지만 이름이 같은 파일을 구별하기 위해서 꼭 파일 리네임을 해주어야함
		// 리네임을 할 때에는 올린 시각을 기준으로 파일 이름을 만들어서 따로 저장
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss"); // 나중에 SS랑 비교
		String strResult1 = sdf1.format(new Date(System.currentTimeMillis()));
		String ext = fileName1.substring(fileName1.lastIndexOf(".") + 1); // 원본파일의 확장자 글자부터 시작되도록 +1 해줌
		String fileRename1 = strResult1 + "." + ext;
		
		String savePath1 = saveDirectory + "\\" + fileRename1;
		File file = new File(savePath1);
		
		// 파일 저장
		hongImage.transferTo(file);
		// DB에 저장할 파일정보 셋팅
		// 1. 파일이름, 2.파일 리네임, 3. 파일경로, 4.파일크기
		long fileLength1 = hongImage.getSize();
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("fileName1", fileName1);
		infoMap.put("fileRename1", fileRename1);
		infoMap.put("filePath1", savePath1);
		infoMap.put("fileSize1", fileLength1);
		return infoMap;
	}
	
	// --------------------------------------------------- 왜 그 그 있잖아 디테일설명이미지 저장경로 ---------------------------------------------------
	private Map<String, Object> saveFile2(HttpServletRequest request, MultipartFile detailImage)
			throws IllegalStateException, IOException {
		String fileName = detailImage.getOriginalFilename();
		String projectPath = request.getSession().getServletContext().getRealPath("resources");
		String saveDirectory = projectPath + "\\RecipeDetailImgs";
		File sDir = new File(saveDirectory);
		if (!sDir.exists()) {
			sDir.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String fileRename = strResult + "." + ext;
		String savePath = saveDirectory + "\\" + fileName;
		File file = new File(savePath);
		detailImage.transferTo(file);
		long fileLength = detailImage.getSize();
		Map<String, Object> infoMap2 = new HashMap<String, Object>();
		infoMap2.put("fileName", fileName);
		infoMap2.put("fileRename", fileRename);
		infoMap2.put("filePath", savePath);
		infoMap2.put("fileSize", fileLength);
		return infoMap2;
	}



//----------------------- 0222 추가 : 레시피 찜  - 김혜연----------------------------------
	
	@RequestMapping(value="/recipe/wishlist.oc", method=RequestMethod.GET)
	public ModelAndView showWishList(ModelAndView mv
			,@RequestParam(value="page", required=false, defaultValue="1") 
				Integer currentPage ) {
		try {
			int totalCount = rService.getTotalCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<RecipeVO> rList = rService.selectRecwishList(pInfo);
			mv.addObject("rList", rList);
			mv.addObject("pInfo", pInfo);
			mv.setViewName("recipe/wishlist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	// 페이징 처리
		private PageInfo getPageInfo(Integer currentPage, int totalCount) {
			PageInfo pi = null;
			int recordCountPerPage = 10;	// 한 페이지 당 보여줄 게시물의 갯수
			int naviCountPerPage = 5;		// 한 페이지 당 보여줄 범위의 갯수
			int naviTotalCount;				// 범위의 총갯수
			int startNavi;
			int endNavi;
			
			naviTotalCount = (int)((double)totalCount/recordCountPerPage+0.9);
			startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage + 1;
			endNavi = startNavi + naviCountPerPage - 1;
			if(endNavi > naviTotalCount) {
				endNavi = naviTotalCount;
			}
			pi = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
					return pi;
		}



}
