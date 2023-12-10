package com.korea.membership;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.BoardDAO;
import dao.PMemberDAO;
import util.Path;
import vo.BoardPMemberViewVO;
import vo.PMemberVO;

@Controller
public class MemberController {

	PMemberDAO pmember_dao;
	BoardDAO board_dao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@Autowired
	JavaMailSender mailSender;

	public MemberController(PMemberDAO pmember_dao, BoardDAO board_dao) {
		this.pmember_dao = pmember_dao;
		this.board_dao = board_dao;
	}

	@RequestMapping("login_form")
	public String login_form() {
		return Path.LoginPath.make_path("login_form");
	}

	@RequestMapping("login")
	@ResponseBody
	public String login(@RequestBody String body) {
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String m_id = data.get("m_id");
		String m_password = data.get("m_password");

		PMemberVO vo = pmember_dao.login_check(m_id);

		// 아이디가 없는 경우
		if (vo == null) {
			return "{\"param\": \"no_m_id\"}";
		}
		// 비밀번호가 일치하지 않는 경우
		if (!vo.getM_password().equals(m_password)) {
			return "{\"param\": \"no_m_password\"}";
		}

		String localStorage = null;

		try {
			localStorage = om.writeValueAsString(vo);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		// 아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩 한다.
		session.setAttribute("id", vo);
		session.setAttribute("m_idx", vo.getM_idx());

		// 로그인에 성공한 경우
		return localStorage;
	}

	@RequestMapping("check_email") // 이메일 중복체크
	@ResponseBody
	public String check_email(@RequestBody String body) throws UnsupportedEncodingException {

		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String m_email = URLDecoder.decode(data.get("m_email"), "utf-8");

		int res = pmember_dao.email_check(m_email);

		if (res == 0) {
			return "{\"param\": \"no m_email\"}";
		}
		return "{\"param\": \"success\"}";

	}

	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("id");
		session.removeAttribute("m_idx");

		return Path.HomePath.make_path("home");
	}

	@RequestMapping("member_insert_form")
	public String member_insert_form() {
		return Path.UserPath.make_path("member_insert_form");
	}

	@RequestMapping("check_id")
	@ResponseBody
	public String check_id(@RequestBody String body) throws UnsupportedEncodingException {

		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String m_id = URLDecoder.decode(data.get("m_id"), "utf-8");

		int res = pmember_dao.id_check(m_id);

		if (res == 0) {
			return "{\"param\": \"ok_m_id\"}";
		}

		return "{\"param\": \"fail\"}";
	}

	@RequestMapping("member_insert")
	public String insert_member(PMemberVO vo) {
		int res = pmember_dao.insert(vo);
		if (res > 0) {
			session.setAttribute("id", vo);
			return "redirect:membership_info";
		}
		return null;
	}

	@RequestMapping("delete_update")
	@ResponseBody
	public String delete_update(@RequestBody String body) {
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		int m_idx = Integer.parseInt(data.get("m_idx"));
		PMemberVO basevo = pmember_dao.select_one(m_idx);

		int res = pmember_dao.delete_update(basevo);

		System.out.println(res);

		if (res == 1) {
			return "{\"param\": \"success\"}";
		} else {
			return "{\"param\": \"fail\"}";
		}
	}

	@RequestMapping("user_edit")
	public String user_edit(HttpSession session, Model model) {
		int m_idx = (int) session.getAttribute("m_idx");

		PMemberVO vo = pmember_dao.select_one(m_idx);

		model.addAttribute("vo", vo);

		return Path.UserPath.make_path("user_edit");
	}

	@RequestMapping("user_info_form")
	public String user_info_form(HttpSession session, Model model) {
		int m_idx = (int) session.getAttribute("m_idx");

		PMemberVO vo = pmember_dao.select_one(m_idx);

		model.addAttribute("vo", vo);

		return Path.UserPath.make_path("user_info_form");
	}

	@RequestMapping("user_edit_profile")
	public String user_edit_profile(HttpSession session, Model model) {
		int m_idx = (int) session.getAttribute("m_idx");

		PMemberVO vo = pmember_dao.select_one(m_idx);

		model.addAttribute("vo", vo);

		return Path.UserPath.make_path("user_edit_profile");
	}

	@RequestMapping("user_order_list")
	public String user_order_list() {
		return Path.UserPath.make_path("user_order_list");
	}

	@RequestMapping("user_post_list")
	public String user_post_list() {
		PMemberVO vo = (PMemberVO) session.getAttribute("id");

		List<BoardPMemberViewVO> list = board_dao.fixed_board_list();

		session.setAttribute("list", list);

		return Path.UserPath.make_path("user_post_list");
	}

	@RequestMapping(value = "mail_check", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String m_email) throws Exception { // 반환값이 있기에 메서드 타입도 String

		// 인증번호 생성
		Random random = new Random();
		int check_num = random.nextInt(888888) + 111111;

		// 이메일 전송 내용
		String set_from = "chai0805123@gmail.com"; // 발신 이메일
		String to_mail = m_email; // 받는 이메일
		String title = "membership 회원가입 인증 이메일 입니다.";
		String content = "인증 번호는 " + check_num + "입니다." + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		// 이메일 전송 코드
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(set_from);
			helper.setTo(to_mail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(check_num); // ajax를 뷰로 반환시 데이터 타입은 String 타입만 가능
		return num; // String 타입으로 변환 후 반환
	}

	@RequestMapping("register_find_id")
	public String register_find_id() {
		return Path.LoginPath.make_path("register_find_id");
	}

	@RequestMapping("find_id")
	@ResponseBody
	public String find_id(@RequestBody String body) throws UnsupportedEncodingException {

		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String m_email = URLDecoder.decode(data.get("m_email"), "utf-8");
		String m_name = URLDecoder.decode(data.get("m_name"), "utf-8");

		PMemberVO vo = pmember_dao.id_find(m_email);

		if (vo == null) {
			return "{\"param\": \"no_m_email\"}";
		}

		if (!vo.getM_name().equals(m_name)) {
			return "{\"param\": \"no_m_name\"}";
		}

		session.setAttribute("id", vo);
		return "{\"param\": \"success\"}";
	}

	@RequestMapping("id")
	public String id() {
		return Path.LoginPath.make_path("id");
	}

	@RequestMapping("find_password")
	@ResponseBody
	public String find_password(@RequestBody String body) throws UnsupportedEncodingException {

		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String m_email = URLDecoder.decode(data.get("m_email"), "utf-8");
		String m_code = URLDecoder.decode(data.get("m_code"), "utf-8");
		String m_id = URLDecoder.decode(data.get("m_id"), "utf-8");

		HashMap<String, String> m_map = new HashMap<String, String>();
		m_map.put("m_email", m_email);
		m_map.put("m_code", m_code);

		PMemberVO vo = pmember_dao.id_find(m_email);

		if (vo == null) {
			return "{\"param\": \"no_m_email\"}";
		}

		if (!vo.getM_id().equals(m_id)) {
			return "{\"param\": \"no_m_id\"}";
		}

		int res = pmember_dao.password_update(m_map);

		session.setAttribute("id", vo);

		return "{\"param\": \"success\"}";

	}

	@RequestMapping("password")
	public String password() {
		return Path.LoginPath.make_path("password");
	}

	@RequestMapping("register_find_password")
	public String register_find_password() {
		return Path.LoginPath.make_path("register_find_password");
	}

	@RequestMapping("register_modify_password")
	public String register_modify_password(Map<String, String> password) {
		int res = pmember_dao.password_update(password);

		if (res > 0) {
			return "redirect:register_modify_password";
		} else {
			System.out.println("추가 에러");
			return null;
		}
	}

	@RequestMapping("kakao_pay")
	public String kakao_pay(Model model) {
		
		String payment_name = String.valueOf(session.getAttribute("payment_name"));
		String payment_price = String.valueOf(session.getAttribute("payment_price"));
		
		model.addAttribute("payment_price", payment_price);
		model.addAttribute("payment_name", payment_name);
				
		return Path.LoginPath.make_path("kakao_pay");
	}

	@RequestMapping("user_info_modify_form")
	public String user_modify_form(Model model, int m_idx) {
		PMemberVO vo = pmember_dao.select_one(m_idx);
		model.addAttribute("vo", vo);
		return Path.UserPath.make_path("user_info_modify_form");
	}

	@RequestMapping("user_info_modify")
	public String user_modify(PMemberVO vo, Model model) {
		int res = pmember_dao.user_info_update(vo);

		return "redirect:user_info_form";
	}
	
	@RequestMapping("user_profile_modify")
	public String user_profile_update(PMemberVO vo) {
		String webPath = "/resources/upload/user/";
		String savePath= request.getServletContext().getRealPath(webPath);
		
		int m_idx = vo.getM_idx();
		String m_userName = vo.getM_username();
		
		//콘솔에 절대경로가 잘 출력되는지 보고 절대경로가서 이미지파일이 있는지 확인해보자

		//업로드된 파일의 정보
		//MultipartRequest 클래스가 없어서 MultipartFile가 받는다.
		MultipartFile photo = vo.getM_photo();
		String filename = "no_file";

		//!photo.isEmpty() 내용이 뭐라도 들어있다.
		if(!photo.isEmpty()) {
			//photo.getOriginalFilename() : 업로드된 실제 파일명
			filename=photo.getOriginalFilename();

			//파일을 저장할 경로 지정
			File saveFile = new File(savePath, filename);

			if(!saveFile.exists()) {//경로가 없다면...
				//폴더를 만들어라
				saveFile.mkdirs();
			} else {
				//동일한 이름의 파일일 경우 폴더형태로 변환이 불가하므로
				//업로드 시간을 붙여서 이름이 중복되는 것을 방지
				//currentTimeMillis 메서드는 자바가 만들어진 1970년부터 2022년 현재까지의 시간을 100분의 1초로 저장하고 있다.

				long time = System.currentTimeMillis();
				filename = String.format("%d_%s",time,filename);
				saveFile = new File(savePath, filename);
			}

			//물리적으로 파일을 업로드 하는 코드
			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		vo.setM_photo_name(filename);
		
		request.setAttribute("vo", vo);
		
		int res = pmember_dao.user_profile_update(vo);

		return "redirect:user_edit";
	}

	@RequestMapping("membership_info")
	public String congratulations_register() {
		return Path.LoginPath.make_path("membership_info");
	}
}
