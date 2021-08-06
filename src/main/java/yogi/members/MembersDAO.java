package yogi.members;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("membersDAO")
public class MembersDAO extends AbstractDAO{
	
	public void insertMember(MembersModel model){
		insert("members.insertMember", model);
	}
	
	public void insertSnsMember(MembersModel model) {
		insert("members.insertSnsMember", model);
	}
	
	public MembersModel snsLoginCheck(String password) {
		return (MembersModel)selectOne("members.snsLoginCheck", password);
	}
	
	public MembersModel loginCheck(MembersModel model){
		return (MembersModel)selectOne("members.loginCheck", model);
	}
	
	public int idCheck(String id) {
		return (Integer)selectOne("members.idCheck", id);
	}
	
	public int phoneCheck(String id) {
		return (Integer)selectOne("members.phoneCheck", id);
	}
	
	public int snsIdCheck(String password) {
		return (Integer)selectOne("members.snsIdCheck",password);
	}
	
	public MembersModel findId(MembersModel model) {
		return (MembersModel)selectOne("members.findId", model);
	}
	
	public MembersModel findPW(MembersModel model) {
		return (MembersModel)selectOne("members.findPW", model);
	}
	
	public void resetPW(MembersModel model) {
		update("members.resetPW", model);
	}
	
	public MembersModel mInfo(int no) {
		return (MembersModel) selectOne("members.membersInfo", no);
	}
	
	public void updateMember(MembersModel model){
		update("members.updateMembers", model);
	}
	
	public void updateMemberExceptFile(MembersModel model){
		update("members.updateMembersExceptFile", model);
	}
	
	public void deleteMember(String name) {
		update("members.deleteMembers", name);
	}

	public String deleteFileName(int m_no) {
		return (String) selectOne("members.selectFileName", m_no);
	}

}
