package kh.spring.service;

import java.security.MessageDigest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired 
	private MemberDAO memberDAO;

	// 암호화 메서드
	public static String SHA256(String pw) {
		try{

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(pw.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}
			return hexString.toString();

		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
	}

	// 아이디 중복 조회
	public int memberIdCheck(String id) {
		return memberDAO.memberIdCheck(id);
	}

	// 이메일 인증
	@Transactional
	public int emailCheck(String email, String num) {
		return memberDAO.emailcheck(email,num);
	}

	// 이메일 인증 확인
	public int emailNumCheck(String email, int num) {
		return memberDAO.emailNumcheck(email,num);
	}

	// 이메일 인증 삭제
	public int emailNumDelete(String email, int num) {
		return memberDAO.emailNumDelete(email,num);
	}

	// 회원가입처리
	public int joinAction(MemberDTO member) {
		member.setmem_pw(SHA256(member.getmem_pw()));
		return memberDAO.joinAction(member);
	}

	// 로그인 처리
	public MemberDTO login(MemberDTO member) {
		MemberDTO loginMember = memberDAO.login(member);
		if(loginMember != null) {
			if(member.getmem_pw().length()<=14) {
				member.setmem_pw(SHA256(member.getmem_pw()));
				if(!member.getmem_pw().equals(loginMember.getmem_pw())) {
					loginMember = null;
				}else {
					loginMember.setmem_pw(null);
				}
			}else {
				loginMember.setmem_pw(null);
			}
		}
		return loginMember;
	}

	// 카카오톡 계정 생성 여부 확인 및 로그인 처리
	public MemberDTO kakaoLoginCheck(MemberDTO member) {
		return memberDAO.kakaoLoginCheck(member);
	}

	// 카카오 계정 생성
	public MemberDTO kakaoSingUp(MemberDTO member) {
		MemberDTO loginMember = new MemberDTO();
		int result = memberDAO.kakaoJoinAction(member);
		if(result > 0) {
			loginMember = memberDAO.kakaoLoginCheck(member);
			System.out.println(loginMember);
		}
		return loginMember;
	}

}
