package com.kh.natta.customDesign.controller;




import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.common.PageInfo;
import com.kh.natta.common.Pagination;
import com.kh.natta.customDesign.domain.CustomComment;
import com.kh.natta.customDesign.domain.CustomDesign;
import com.kh.natta.customDesign.domain.Search;
import com.kh.natta.customDesign.service.CustomDesignService;
import com.kh.natta.customer.domain.Customer;

@Controller
public class CustomDesignController {

	@Autowired
	private CustomDesignService cService;
	
	@RequestMapping(value="customDesignWriteView.na",method=RequestMethod.GET)
	public String customDesignWriteView() {
		return "customDesign/customDesignWriteForm";
	}
	
	// 상세조회
	@RequestMapping(value="customDesignDetail.na",method=RequestMethod.GET)
	public ModelAndView customDetail(int customCode,ModelAndView mv, Integer page) {
		
		int currentPage = page != null ? page : 1;
		// 조회수 증가
		cService.addHits(customCode);
		// 상세조회
		CustomDesign customDesign = cService.selectcustomDesign(customCode);
		if(customDesign!=null) {
			mv.addObject("customDesign",customDesign).addObject("currentPage",currentPage)
			.setViewName("customDesign/customDesignDetailView");
		}else {
			mv.addObject("msg","도안게시판 상세조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 게시글 등록
	@RequestMapping(value="customDesignInsert.na",method=RequestMethod.POST)
	public String customDesignInsert(CustomDesign customDesign, Model model,HttpServletRequest request) {
		
		int result = cService.insertCustomDesign(customDesign);
		if(result>0) {
			return "redirect:customDesignList.na";
		}else {
			model.addAttribute("msg","게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	// 게시글 리스트
	@RequestMapping(value="customDesignList.na", method=RequestMethod.GET)
	public ModelAndView customList(ModelAndView mv,@RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = (page != null) ? page : 1;
		
		int listCount = cService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<CustomDesign> cList = cService.selectList(pi);
		if(!cList.isEmpty()) {
			mv.addObject("cList",cList);
			mv.addObject("pi",pi);
			mv.setViewName("customDesign/customDesignListView");
		}else {
			mv.setViewName("customDesign/customDesignListView");
		}
		return mv;
	}
	// 게시글 검색
	@RequestMapping(value="customSearch.na",method=RequestMethod.GET)
	public String customSearch(Search search, Model model) {
		ArrayList<CustomDesign> searchList = cService.selectListSearch(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("cList",searchList);
			model.addAttribute("search",search);
			return "customDesign/customDesignListView";
		}else {
			return "customDesign/customDesignListView";
		}
	}
	
	// 게시판 수정화면
	@RequestMapping(value="customDesignModifyView.na",method=RequestMethod.GET)
	public String customDesignModifyView(int customCode, Model model,Integer page) {
		int currentPage = page != null ? page : 1;
		model.addAttribute("customDesign",cService.selectcustomDesign(customCode));
		model.addAttribute("currentPage",currentPage);
		return "customDesign/customDesignModifyForm";
	}
	
	// 게시판 수정
	@RequestMapping(value="customDesignModify.na",method=RequestMethod.POST)
	public String customDesignModifyForm(CustomDesign customDesign, Model model, HttpServletRequest request) {
		
		int result = cService.modifyCustomDesign(customDesign);
		if(result>0) {
			return "redirect:customDesignDetail.na?customCode="+customDesign.getCustomCode();
		}else {
			model.addAttribute("msg","맞춤도안 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 게시판 삭제
	@RequestMapping(value="customDesignDelete.na",method=RequestMethod.GET)
	public String customDesignDelete(int customCode, Model model,Integer page) {
		int currentPage = page != null ? page : 1;
		
		int result = cService.deleteCustomDesign(customCode);
		if(result>0) {
			model.addAttribute("currentPage",currentPage);
			return "redirect:customDesignList.na";
		}else {
			return "common/errorPage";
		}
		
	}
	
	// 이미지저장
    @RequestMapping(value="/mine/imageUpload.na", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();
        
		/*
		 * String fileDir =
		 * "D:\\springworkspace\\NATTA(1207)\\src\\main\\webapp\\resources\\images\\customDesignImages\\";
		 */
        String fileDir = request.getSession().getServletContext().getRealPath("resources/images/customDesignImages");
        System.out.println(fileDir);
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        try{
            
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            
            //이미지 경로 생성
            String path = fileDir+ "ckImage/";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
            
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/mine/ckImgSubmit.na?uid=" + uid + "&fileName=" + fileName;  // 작성화면
            
        // 업로드시 메시지 출력
          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
          printWriter.flush();
            
        }catch(IOException e){
            e.printStackTrace();
        } finally {
          try {
           if(out != null) { out.close(); }
           if(printWriter != null) { printWriter.close(); }
          } catch(IOException e) { e.printStackTrace(); }
         }
        
        return;
    }
    
    // 이미지 출력
    @RequestMapping(value="/mine/ckImgSubmit.na")
    public void ckSubmit(@RequestParam(value="uid") String uid
                            , @RequestParam(value="fileName") String fileName
                            , HttpServletRequest request, HttpServletResponse response)
                            throws ServletException, IOException{
    	
		/*
		 * String fileDir =
		 * "D:\\springworkspace\\NATTA(1207)\\src\\main\\webapp\\resources\\images\\customDesignImages\\";
		 */
    	String fileDir = request.getSession().getServletContext().getRealPath("resources/images/customDesignImages");
        
        //서버에 저장된 이미지 경로
        String path = fileDir + "ckImage/";
    
        String sDirPath = path + uid + "_" + fileName;
    
        File imgFile = new File(sDirPath);
        
        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;
            
            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;
            
            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();
                
                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }
                
                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();
                
            }catch(IOException e){
            	e.printStackTrace();
				/* Logger.info(e); */
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
    
    // 댓글 작성
    @ResponseBody
    @RequestMapping(value="addComment.na",method=RequestMethod.POST)
    public String addComment(CustomComment customComment, HttpSession session) {
    	Artist loginArtist = (Artist)session.getAttribute("loginArtist");
    	String artistId = loginArtist.getArtistId();
    	String artistName = loginArtist.getArtistName();
    	customComment.setArtistId(artistId);
    	customComment.setArtistName(artistName);
    	System.out.println(customComment);
    	int result = cService.insertCustomComment(customComment);
    	if(result>0) {
    		return "success";
    	}else {
    		return "fail";
    	}
    }
    
    // 댓글 조회
    @ResponseBody
    @RequestMapping(value="commentList.na", method=RequestMethod.GET)
    public HashMap<String, Object> getCommentList(HttpServletResponse response, int customCode,@RequestParam(value="page", required=false) Integer page)throws Exception{
    	
    	int currentPage = (page != null) ? page : 1;
    	
    	int listCount = cService.getListCountComment(customCode);
    	
    	PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
    	ArrayList<CustomComment> ccList = cService.selectListComment(customCode,pi);
    	for(CustomComment c : ccList) {
    		c.setcContents(URLEncoder.encode(c.getcContents(),"utf-8"));
    	}

    	HashMap<String, Object> commentMap = new HashMap<String, Object>();
    	commentMap.put("pi", pi);
    	commentMap.put("ccList", ccList);
    	
    	return commentMap;
    }
    
    // 댓글 수정
    @ResponseBody
    @RequestMapping(value="customCommentModify.na",method=RequestMethod.POST)
	public String customCommentModify(CustomComment customComment) {
    	System.out.println(customComment);
    	int result = cService.modifyCustomComment(customComment);
    	if(result>0) {
    		return "success";
    	}else {
    		return "fail";
    	}
	}
    
    //댓글 삭제
    @ResponseBody
    @RequestMapping(value="customCommentDelete.na",method=RequestMethod.POST)
    public String customCommentDelete(int customCCode) {
    	int result = cService.deleteCustomComment(customCCode);
    	if(result>0) {
    		return "success";
    	}else {
    		return "fail";
    	}
    }
}
