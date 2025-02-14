package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.spring.dto.Cafein_imgDTO;
import kh.spring.dto.Feed_imgDTO;
import kh.spring.dto.MemberDTO;

@SessionAttributes({"loginMember"})
@Repository
public class MypageDAO {
	
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public MemberDTO selectID(String loginID) throws Exception {
		return mybatis.selectOne("mypage.selectID",loginID) ;
	}
	
	public List<Cafein_imgDTO> selectcafeinimg(String loginID) throws Exception {
		return mybatis.selectList("mypage.selectcafeinimg", loginID) ;
	}
	
	public List<Feed_imgDTO> selectfeedimg(String loginID) throws Exception {
		return mybatis.selectList("mypage.selectfeedimg", loginID) ;
	}
	
	public int mypageUpdate(MemberDTO dto)throws Exception{
		return mybatis.update("mypage.mypageUpdate",dto);
	}
	
	public int memberout(String loginID)throws Exception{
		return mybatis.delete("mypage.memberout",loginID);
	}

}
