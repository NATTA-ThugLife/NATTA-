package com.kh.natta.reservation.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.service.ArtistInfoService;
import com.kh.natta.artist.service.ArtistService;
import com.kh.natta.reservation.domain.Reservation;
import com.kh.natta.reservation.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired
	private ArtistInfoService infoService;
	@Autowired
	private ReservationService rService;
	
		@RequestMapping(value="reservation.na",method=RequestMethod.GET)
		public  String reservation(String artistId, Model model) {
			ArtistInfo infoPage = infoService.selectOneArtistInfo(artistId);
			
			model.addAttribute("artistInfo",infoPage);
			return "Reservation/reservation";
		}
		
		// 예약 등록
		@RequestMapping(value="reservation.na",method=RequestMethod.POST)
		public String reservationInsert(Reservation reservation,Model model,HttpServletRequest request,
										@RequestParam(name="upload",required=false)MultipartFile uploadFile){

			if(!uploadFile.getOriginalFilename().equals("")) {
				String renameFilename = saveFile(uploadFile,request);
				if(renameFilename != null) {
					reservation.setOriginalFilename(uploadFile.getOriginalFilename());
					reservation.setRenameFilename(renameFilename);
				}
			}
			int result = 0;
			String path = null;
			System.out.println(reservation);
			result = rService.insertReservation(reservation);
			if(result>0) {
				path="redirect:main.na";
			}else {
				model.addAttribute("msg","예약 등록 실패!");
				path="common/errorPage";
			}
			return path;
		}
		
		// 예약 도안 등록
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			// 파일 저장 경로
			String root = request.getSession().getServletContext().getRealPath("resources/images");
			String savePath = root + "\\ruploadFiles";
			// 저장 폴더 선택
			File folder = new File(savePath);
			
			// 만약 폴더가 없을 경우 자동 생성
			if(!folder.exists()) {
				folder.mkdir();
			}
			// 공지사항 첨부파일은 파일명 변환없이 바로 저장했지만
			// 게시판 같은 경우 많은 회원들이 동시에 올릴 수도 있고, 같은 이름의 파일을 올릴 수도 있기 때문에
			// 파일명을 rename하는 과정이 필요함. rename할땐 "년월시분초.확장자"로 변경 필요
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originalFilename = file.getOriginalFilename();
			String renameFilename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
										+ originalFilename.substring(originalFilename.lastIndexOf(".")+1);
			
			String filePath = folder + "\\" + renameFilename;
			// 파일 저장
			try {
				file.transferTo(new File(filePath));			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return renameFilename;
		}
		
		
		
}
