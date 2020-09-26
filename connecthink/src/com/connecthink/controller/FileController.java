package com.connecthink.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {
	
	@RequestMapping("/uploadProfileImg")
	public ResponseEntity<String> uploadProfileImg(MultipartFile profileImg, HttpSession session) {
		String savePath = session.getServletContext().getRealPath("/").replace(
				"webapps" + File.separator + "connecthink" + File.separator, "webapps" + File.separator + "ROOT")
				+ File.separator + "storage" + File.separator + "customer" + File.separator
				+ Integer.toString((Integer) session.getAttribute("loginInfo")) + ".jpg";

		try {
			if (profileImg != null) {
				File newProfileImg = new File(savePath);
				profileImg.transferTo(newProfileImg);
				
				return ResponseEntity.ok("success");
			} else {
				System.out.println("---------------test--------------");
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}
}
