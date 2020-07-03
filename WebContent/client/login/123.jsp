<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="mks.Mapper.clientMapper">

	<select resultType="map" parameterType="map" id="hospitalList">
		SELECT 
		    r, hp_code, hp_name , hp_lat, hp_lng, hp_detail, hp_address, hp_open, hp_close, hp_phone, dept_name
		  FROM (
		        SELECT  ROWNUM 
		            r, hp_code, hp_name, hp_lat, hp_lng, hp_detail, hp_address, hp_open, hp_close, hp_phone, dept_name                   
		          FROM ( 
		                SELECT h.hp_code , MIN(h.hp_name) hp_name 
		                                , MIN(h.hp_lat) hp_lat ,MIN(h.hp_lng) hp_lng
		                                , MIN(h.hp_detail) hp_detail, MIN(h.hp_address) hp_address
		                                , MIN(h.hp_open) hp_open , MIN(h.hp_close) hp_close
		                                , MIN(h.hp_phone) hp_phone
		                                ,WM_CONCAT(d.dept_name) dept_name 
		                  FROM mks_hospital h , mks_dept d
		                  WHERE h.hp_code= d.hp_code
		                  GROUP BY h.hp_code
		                )
		                WHERE 1 = 1
		                <if test="hp_open != null">
			                AND hp_open = #{hp_open}
		                </if>
		                <if test="hp_close != null">
			                AND hp_close = #{hp_close}
		                </if>
		                <if test="hp_name != null">
		                 	AND hp_name LIKE '%'||#{hp_name}||'%' 
		                </if>
		        )
		        <if test="first != null">   
					WHERE r BETWEEN #{first} AND #{end}
				</if>
	</select>

<!-- crm_ReservationDao 부분 -->   
<!-- crm_ReservationDao 부분 -->	
	<resultMap id="rmap1" type="java.util.Map"/>	
	<resultMap id="rmap2" type="java.util.Map"/>	
	<resultMap id="rmap3" type="java.util.Map"/>	
	<resultMap id="rmap4" type="java.util.Map"/>	
	<select id="proc_reservelist" parameterType="java.util.Map" statementType="CALLABLE">
		<if test="u_dept_name == null and u_doc_name == null">
			{call proc_reservelist_first (
	                                   #{res_list,jdbcType=CURSOR
			                                   , mode=OUT
			                                   , javaType=java.sql.ResultSet
			                                   , resultMap=rmap1}
	                                    ,#{u_hp_code, mode=IN, jdbcType=VARCHAR}
	                                    ,#{fnum, mode=IN, jdbcType=INTEGER}
	                                    ,#{enum, mode=IN, jdbcType=INTEGER}			
								   )}
		</if>
		<if test="u_dept_name == null and u_doc_name != null">
			{call proc_reservelist_second (
	                                   #{res_list,jdbcType=CURSOR
			                                   , mode=OUT
			                                   , javaType=java.sql.ResultSet
			                                   , resultMap=rmap2}
	                                    ,#{u_hp_code, mode=IN, jdbcType=VARCHAR}
	                                    ,#{u_doc_name, mode=IN, jdbcType=VARCHAR}
	                                    ,#{fnum, mode=IN, jdbcType=INTEGER}
	                                    ,#{enum, mode=IN, jdbcType=INTEGER}			
								   )}
		</if>
		<if test="u_dept_name != null and u_doc_name == null">									   
			{call proc_reservelist_third (
	                                   #{res_list,jdbcType=CURSOR
			                                   , mode=OUT
			                                   , javaType=java.sql.ResultSet
			                                   , resultMap=rmap3}
	                                    ,#{u_hp_code, mode=IN, jdbcType=VARCHAR}
	                                    ,#{u_dept_name, mode=IN, jdbcType=VARCHAR}
	                                    ,#{fnum, mode=IN, jdbcType=INTEGER}
	                                    ,#{enum, mode=IN, jdbcType=INTEGER}			
								   )}
		</if>
		<!--  -->
		<if test="u_dept_name != null and u_doc_name != null"> 
			{call proc_reservelist_fourth (
	                                   #{res_list,jdbcType=CURSOR
			                                   , mode=OUT
			                                   , javaType=java.sql.ResultSet
			                                   , resultMap=rmap4}
	                                    ,#{u_hp_code, mode=IN, jdbcType=VARCHAR}
	                                    ,#{u_dept_name, mode=IN, jdbcType=VARCHAR}
	                                    ,#{u_doc_name, mode=IN, jdbcType=VARCHAR}
	                                    ,#{fnum, mode=IN, jdbcType=INTEGER}
	                                    ,#{enum, mode=IN, jdbcType=INTEGER}			
								   )}
		 </if>
	</select>
	<select id="noticeNew" parameterType="map" resultType="map">
	<!-- 예약회면에서 최신 공시사항 2가지 제목 보여주기. -->
		SELECT 
		    board_no, board_title, board_date
		  FROM (
		        SELECT
		            board_no, board_title, board_date
		          FROM mks_board	
		         WHERE board_type = 0
		         ORDER BY board_date desc  
		       ) 
		 WHERE ROWNUM <![CDATA[<=]]> 2 
		 <!-- <![CDATA[<=]]> 는 <, > 같은 부등호가 xml에는 올 수 없으므로 단독으로 사용할때는 <![CDATA[여기 안에다 부등호 넣자.]]> --> 	
	</select>
	<select id="noticeList" parameterType="map" resultType="map">
	<!-- 공지사항 리스트 보기. -->
		SELECT
		    board_no, board_type, board_title, mks_id, board_date
		  FROM mks_board
		 WHERE board_type = 0	
	</select>
	<select id="noticeDetail" parameterType="map" resultType="map">
	<!-- 공지사항 세부사항 보기. -->
		SELECT 
		    board_no, board_title, mks_id, board_date, board_content
		  FROM mks_board
		 WHERE 1 = 1
		   AND board_no = #{board_no} 	
	</select>
	<select id="deptCategory" parameterType="map" resultType="map">
	<!-- 과 카테고리 -->
		SELECT
		    hp_code, dept_name
		  FROM mks_dept
		 WHERE hp_code = #{hp_code}
	</select>
	<select id="waitCheck" parameterType="map" resultType="map">
	<!-- 대기시간, 대기인원 보여주기. -->
		SELECT 
		    dept_prewait, (dept_lastwait - dept_prewait)*2
		  FROM mks_dept
		  WHERE hp_code = #{hp_code}
		  AND dept_name = #{dept_name} 	
	</select>
	<select id="docSel" parameterType="map" resultType="map">
	<!-- 의사 선생님 상세정보. -->
		SELECT 
		    doc_name, dept_name, doc_position, doc_education
		  FROM mks_doctor
		  WHERE doc_name = #{doc_name}
		  AND doc_name LIKE '%'||#{doc_name}||'%' 
	</select>
	<select id="calender" parameterType="map" resultType="map">
	<!-- 예약 가능한 시간표 Select -->
		SELECT
		    hp_code, hp_name, doc_code, doc_name, dept_code, dept_name, sch_code, sch_time, to_char(to_date(sch_date), 'YYYY-MM-DD') sch_date 
		  FROM mks_schedule   
		 WHERE hp_code = #{hp_code}
		   <if test="dept_code != null">
		   	   AND dept_code = #{dept_code} 
		   </if>
		   <if test="doc_code != null">
			   AND doc_code = #{doc_code}   
		   </if>
		   <if test="sch_date != null">
			   AND sch_date = #{sch_date}
		   </if>
		   <if test="sch_time != null">
			   AND sch_time = #{sch_time}
		   </if>
		 ORDER BY sch_date, sch_time asc
	</select>
	<select id="docCategory" parameterType="map" resultType="map">
		SELECT
		    doc_code, doc_name, dept_code, dept_name
		  FROM mks_schedule 
		 WHERE dept_code = #{dept_code}
		   AND hp_code = #{hp_code}	
	</select>
	<insert id="reservation" parameterType="map">
	<!-- 예약하기. -->
		INSERT 
		  INTO mks_reserve
		    (mem_memcode, res_memo, sch_code, res_qrcode, doc_name, res_time, doc_code, hp_code, dept_name, dept_code, sch_date, hp_name) 
		  VAlUES (#{mem_memcode},#{res_memo},#{sch_code},#{res_qrcode},#{doc_name},#{res_time},#{doc_code},#{hp_code},#{dept_name},#{dept_code},#{sch_date},#{hp_name})	
	</insert>
	
<!-- crm_HealthDao 부분 -->
<!-- crm_LoginDao 부분 -->
	<select id="proc_mem_login" parameterType="map" statementType="CALLABLE">
		{call proc_mem_login (
			#{u_id, mode=IN, jdbcType=VARCHAR}
			,#{u_pw, mode=IN, jdbcType=VARCHAR}						
			,#{msg, mode=OUT, jdbcType=VARCHAR}						
			,#{msg_id, mode=OUT, jdbcType=VARCHAR}						
		)}
	</select>
	
<!-- crm_MypageDao 부분 -->
	<select id="mypageList" parameterType="map" resultType="map">
	<!-- 예약목록화면 리스트 -->
		SELECT
		    mem_memcode, hp_name, dept_name, doc_name, sch_date, res_qrcode
		  FROM mks_reserve
		 WHERE mem_memcode = #{mem_memcode}	
	</select>
	<select id="idCheck" parameterType="map" resultType="map">
	<!-- id중복 검사  -->
		SELECT NVL(
		(SELECT
		    o.mks_id
		  FROM mks_online o, mks_member m
		  WHERE o.mem_memcode = m.mem_memcode
		  AND o.mks_id = #{mks_id}
		  ),'통과')idCheck		    
		  FROM DUAL	
		
	</select>
	<select id="socialnumCheck" parameterType="map" resultType="String">
	<!-- 주민번호 중복검사 -->
	SELECT NVL(
		(SELECT
		    m.mem_socialnum
		  FROM mks_online o, mks_member m
		  WHERE o.mem_memcode = m.mem_memcode
		    AND m.mem_socialnum = #{mem_socialnum}
 		),'통과')socialnumCheck	
 		FROM DUAL		 
	</select>
	<select id="proc_mem_Add" parameterType="map" statementType="CALLABLE">
	<!-- 그냥 회원가입할 때. -->
		{call proc_mem_Add (
			#{u_id, mode=IN, jdbcType=VARCHAR}
			,#{u_pw, mode=IN, jdbcType=VARCHAR}
			,#{msg, mode=OUT, jdbcType=VARCHAR}
			,#{u_soc, mode=IN, jdbcType=VARCHAR}
			,#{u_addr, mode=IN, jdbcType=VARCHAR}
			,#{u_phone, mode=IN, jdbcType=VARCHAR}
			,#{u_name, mode=IN, jdbcType=VARCHAR}
			,#{u_email, mode=IN, jdbcType=VARCHAR}
			)}
	</select>
	
	<!-- crm_boadDao -->
	<select id="boardList" parameterType="map" resultType="map">
	SELECT rnum, eva_code, sch_code, mks_id, eva_title, eva_date, hp_name, step, pos, group_no, eva_content, hit
       FROM (
        		SELECT rownum rnum, eva_code, sch_code, mks_id, eva_title, eva_date, hp_name, step, pos, group_no, eva_content, hit
         		  FROM (
            				SELECT a.eva_code, a.sch_code, b.mks_id, a.eva_title, a.eva_date, a.hp_name, a.step, a.pos, a.group_no, a.eva_content, a.hit
               			      FROM mks_eva a, mks_online b
                             WHERE a.mem_memcode = b.mem_memcode
                			   AND pos = 1
                			<if test="eva_code!=null">
	           				   AND eva_code = #{eva_code}
           					</if>
           					<if test="eva_title!=null and eva_title.length()>0">
						       AND eva_title LIKE '%'||#{eva_title}||'%'
					        </if>
					        <if test="mks_id!=null and mks_id.length()>0">
	          				   AND b.mks_id LIKE '%'||#{mks_id}||'%'
          					</if>
          					<if test="hp_name!=null and hp_name.length()>0">
					           AND a.hp_name LIKE '%'||#{hp_name}||'%'
				            </if>
             				<if test="b_order!=null">
      					ORDER BY hit desc, eva_code desc
      	   					</if>
      	   					<if test="b_order==null">
      				    ORDER BY eva_code desc 
      	   					</if>
          				)
        	)
     <if test="fnum!=null">
     WHERE rnum BETWEEN #{fnum} AND #{enum}
     </if>
    </select>
	
	<select id="boardResList" parameterType="map" resultType="map">
		SELECT a.sch_code, a.sch_date, a.hp_name, a.dept_name, a.doc_name
 		  FROM mks_reserve a
 		 WHERE mem_memcode = (SELECT mem_memcode FROM mks_online WHERE mks_id=#{mks_id})
    	   AND (SELECT sch_code
        		  FROM mks_eva
    			 WHERE sch_code = a.sch_code) IS NULL 
    	   AND (SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL) > TO_DATE(a.sch_date)
	</select>
	
	<select id="boardReplyList" parameterType="map" resultType="map">
		SELECT a.eva_code, b.mks_id, a.eva_date, a.step, a.pos, a.group_no ,a.eva_content
  		  FROM mks_eva a, mks_online b
 		 WHERE a.mem_memcode = b.mem_memcode
   		   AND group_no = (SELECT group_no FROM mks_eva WHERE eva_code = #{eva_code})
           AND pos = 2
      ORDER BY step desc
	</select>
	
	<insert id="boardIns" parameterType="map">
		INSERT INTO mks_eva VALUES( 
   	 		(SELECT NVL(MAX(eva_code),0)+1 FROM mks_eva), 
    		#{eva_content}, 
    		(SELECT mem_memcode FROM mks_online WHERE mks_id=#{mks_id}), 
    		#{sch_code},
    		'',
    		(SELECT doc_code FROM mks_schedule WHERE sch_code=#{sch_code}),
    		(SELECT dept_code FROM mks_schedule WHERE sch_code=#{sch_code}),
    		(SELECT hp_name FROM mks_schedule WHERE sch_code=#{sch_code}),
    		<if test="group_no!=null">
    		(SELECT group_no FROM mks_eva WHERE eva_code = #{eva_code}),
    		#{pos},
    		(SELECT NVL(MAX(step),0)+1 FROM mks_eva WHERE group_no=(SELECT group_no FROM mks_eva WHERE eva_code = #{eva_code})),
    		</if>
    		<if test="group_no==null">
    		(SELECT NVL(MAX(group_no),0)+1 FROM mks_eva),
    		#{pos},
    		(SELECT NVL(MAX(step),0)+1 FROM mks_eva WHERE group_no=(SELECT NVL(MAX(group_no),0)+1 FROM mks_eva)),
    		</if>
    		<if test="eva_title!=null">
    		#{eva_title},
    		</if>
    		<if test="eva_title==null">
    		'',
    		</if>
    		<if test="eva_data!=null">
    		#{eva_date},
    		</if>
    		<if test="eva_data==null">
    		(SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL),
    		</if>
    		0
		)
	</insert>
	
	<update id="boardHit" parameterType="map">
		UPDATE mks_eva 
		   SET hit = (SELECT nvl(hit,0) FROM mks_eva WHERE eva_code=#{eva_code})+1
		 WHERE eva_code = #{eva_code}
	</update>
	
	<update id="boardUpd" parameterType="map">
		UPDATE mks_eva 
   	   	   SET 
               eva_content=#{eva_content}
              ,eva_title=#{eva_title}
  		 WHERE eva_code = #{eva_code}
	</update>
	
	<delete id="boardDel" parameterType="map">
		DELETE
		  FROM mks_eva
 		 WHERE eva_code= #{eva_code}
	</delete>
	
	<select id="boardPwCheck" parameterType="map" resultType="map">
		SELECT NVL(
					(SELECT mks_id
  					   FROM mks_online
 				      WHERE mks_id = #{mks_id}
   					    AND mks_pw = #{mks_pw}), '') mks_id 
   		  FROM DUAL
	</select>

</mapper>