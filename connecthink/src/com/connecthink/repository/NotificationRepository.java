package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.Notification;
import com.connecthink.entity.NotificationId;

public interface NotificationRepository extends JpaRepository<Notification, NotificationId> {
	
	/**
	 * @author IM CRYSTAL
	 * 읽지않은 notification의 갯수를 불러오는 함수
	 */
	@Query(nativeQuery = true, value = "SELECT COUNT(notification_no) FROM notification"
			+ " WHERE customer_no = ?1 AND read_status = 0")
	public Integer countUnreadNoti(Integer CustomerNo);
	
	/**
	 * @author IM CRYSTAL
	 * 내가 받은 notification 전체를 불러오는 함수
	 */
	@Query(nativeQuery = true, value = "SELECT * FROM notification WHERE customer_no = ?1 ORDER BY notify_date")
	public List<Notification> findByCustomerNo(Integer CustomerNo);
	@Query(nativeQuery = true, value = "INSERT INTO notification values(?1,     (\r\n" + 
			"        SELECT\r\n" + 
			"            nvl((MAX(notification_no) + 1), 0)\r\n" + 
			"        FROM\r\n" + 
			"            notification\r\n" + 
			"        WHERE\r\n" + 
			"            customer_no = ?1\r\n" + 
			"    ), ?2, sysdate, 0)")
	@Modifying
	public void insert(Integer CustomerNo, String Content);
}
