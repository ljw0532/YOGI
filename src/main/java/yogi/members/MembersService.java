package yogi.members;

import javax.servlet.http.HttpServletRequest;

public interface MembersService {
	public void insertMember(MembersModel model, HttpServletRequest request) throws Exception;
	public void insertSnsMember(MembersModel model, HttpServletRequest request) throws Exception;
	public void updateMember(MembersModel model, HttpServletRequest request) throws Exception;
	public void deleteMember(String name);
	public int checksnsId(String password);
	public int checkId(String id);
	public int checkPhone(String phone);
	public MembersModel snsLoginCheck(String password);
	public MembersModel loginCheck(MembersModel model, HttpServletRequest request);
	public MembersModel findId(MembersModel model, HttpServletRequest request);
	public MembersModel findPW(MembersModel model, HttpServletRequest request);
	public void resetPW(MembersModel model);
	public MembersModel mInfo(int no);
}
