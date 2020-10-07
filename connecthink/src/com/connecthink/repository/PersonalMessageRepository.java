package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.PersonalMessage;

public interface PersonalMessageRepository extends JpaRepository<PersonalMessage, Integer> {
	
	/**
	 * @author IM CRYSTAL
	 * 인박스에서 상대회원과의 메세지함에 들어갔을 때, 상대방이 보낸 메세지를 읽음 처리한다. (=status를 1로 update)
	 */
	@Query(nativeQuery = true, value = "UPDATE personal_msg\r\n" + 
			"SET status = 1\r\n" + 
			"WHERE receive = ?1 AND send = ?2")
	public void updateStatus(Integer customerNo, Integer otherNo);
	
	/**
	 * @author IM CRYSTAL
	 * 인박스에서 상대회원과의 메세지함에 들어가 있을 때, 상대가 보낸 메세지를 실시간으로 읽음 처리한다.
	 */
	@Query(nativeQuery = true, value = "UPDATE personal_msg\r\n" + 
			"SET status = 1\r\n" + 
			"WHERE personal_msg_no = ?1")
	public void updateStatusOne(Integer personalMsgNo);

	/**
	 * @author IM CRYSTAL
	 * 한 회원이 주고받은 모든 메세지를 반환.
	 */
	@Query(nativeQuery = true, value = "SELECT * FROM personal_msg\r\n" + 
			"WHERE receive = ?1 OR send = ?1\r\n" + 
			"ORDER BY create_date")
	public List<PersonalMessage> findByCustomerNo(Integer customerNo);

	@Query(nativeQuery = true, value = "SELECT COUNT(personal_msg_no) FROM personal_msg"
			+ " WHERE receive = ?1 AND read_status = 0")
	public Integer countUnreadMsg(Integer CustomerNo);

}