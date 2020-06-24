//이름 기준체크 메소드
	function checkNames(inputnames, s, e) {
		var sum;
		if(s<=inputnames.length()&&inputnames.length()<=e) {//문자길이 맞니?
			var result = new int[inputnames.length()];
			for(var i=0; i<inputnames.length(); i++) {
				var cha = inputnames.charCodeAt(i);
				if((33<=cha&&cha<=47)||(58<=cha&&cha<=64)||
							(91<=cha&&cha<=96)||(123<=cha&&cha<=126)) {//특수문자니? 문제군
					result[i]=1;
				}else {
					result[i]=0;
				}
			}
		}else {
			sum = inputnames.length();
		}
	}
	
	//비번 기준체크 메소드
	public int checkPw(String inputpw, int s, int e) {//비밀번호는 알아서 영문으로 입력됩니다
		int sum =0;
		if(s<=inputpw.length()&&inputpw.length()<=e) {//문자길이 맞니?
			char[] names = inputpw.toCharArray();//스트링을 쪼개서
			int[] result = new int[inputpw.length()];
			for(int i=0; i<inputpw.length(); i++) {
				int cha = (int)names[i];
				if(33<=cha&&cha<=126) {//영문, 숫자니?				
					result[i]=0;
				}else {//한글, 공백이니? 문제군
					result[i]=1;
				}
			}
			for(int a:result) {
				sum+= a;
			}
		}else {
			sum = inputpw.length();
		}
		return sum;
	}
	
	//생년월일 기준체크 메소드
	/*
	 * jl_year_warning.setText(" 생년을 선택하여주세요");
		jl_month_warning.setText(" 생월을 선택하여주세요");
		jl_day_warning.setText(" 생일을 선택하여주세요");
	 */
	public void birth_checking() {
		if("년도".equals(jv.choiceYear)) {
			jv.jl_year_warning.setVisible(true);
			jv.jl_month_warning.setVisible(false);
			jv.jl_day_warning.setVisible(false);
			birth = 0;
		}else {
			if("월".equals(jv.choiceMonth)) {
				jv.jl_year_warning.setVisible(false);
				jv.jl_month_warning.setVisible(true);
				jv.jl_day_warning.setVisible(false);
				birth = 0;
			}else{
				if("일".equals(jv.choiceDay)) {
					jv.jl_year_warning.setVisible(false);
					jv.jl_month_warning.setVisible(false);
					jv.jl_day_warning.setVisible(true);
					birth = 0;
				}else {
					jv.jl_year_warning.setVisible(false);
					jv.jl_month_warning.setVisible(false);
					jv.jl_day_warning.setVisible(false);
					birth = 1;
				}
			}
		}
	}
	
	//이메일 기준 체크 메소드
	/*
	 * 로컬부분:대문자A~Z,소문자a~z,숫자0~9,특수문자!#$%&'*+-/=?^_{|}~,(.은사용가능하나첫번째, 마지막아니어야됨) 
	 도메인부분 : 대문자 A~Z, 소문자 a~z, 숫자 0~9, 하이픈-(첫번째 또는 마지막 아니어야됨)
	 정의) 로컬부분 + @ + 도메인부분 (상세하게 하면 매우다르지만 일반적으로 이정도) 
	 */
	public static int checkEmail(String inputemail) {
		String local = null;
		String domain = null;
		StringTokenizer st = null;
		int sum = 0;
		int sum2 = 0;
		if(inputemail.length()==0) {//이메일을 적지 않았다면,
			sum = 1;
			sum2 = 1;
		}else {//이메일을 적었다면,
			//먼저 @ 갯수를 확인할게
			char[] emails = inputemail.toCharArray();
			int [] check = new int[inputemail.length()];
			int checking = 0;
			for(int i =0; i<inputemail.length(); i++) {
				int email = emails[i];
				if(email==64) {
					checking+= 1;
				}
			}
			if(checking>1) {//@가 여러개니?
				sum = 1;
				sum2 = 1;
			}else {//@가 하나니?
				st = new StringTokenizer(inputemail,"@");//그럼 이제 로컬과 도메인 검사 할게
				local = st.nextToken();
				if(st.hasMoreTokens()) {//@가 있다면,
					domain = st.nextToken();
					if(domain!=null) {
						//로컬 검사
						char[] locals = local.toCharArray();
						int [] result = new int[local.length()];
						if(locals[0]==46||locals[local.length()-1]==46) {//.이 첫번째 혹은 마지막이니?
							sum = local.length();
						}else {//아니라면 다음 기준 간다
							for(int i=0; i<local.length(); i++) {
								int loc = (int)locals[i];
								if(33<=loc&&loc<=126){//영문, 숫자, 특수문자 니?
									if(loc==34||loc==40||loc==41||
											loc==44||loc==46||loc==58||loc==59||
											loc==60||loc==62||loc==64||(91<=loc&&loc<=96)) {
										result[i] = 1;//문제군
									}else {//특수문자 !#$%&'*+-/=?^_{|}~. 니?
										result[i] = 0;//좋아
									}
								}else {//아니니?
									result[i] = 1;//문제군
								}
							}
							for(int a:result) {
								sum+= a;
							}
						}
						//도메인 검사
						char[] domains = domain.toCharArray();
						int [] result2 = new int[domain.length()];
						if(domains[0]==45||domains[domain.length()-1]==45) {//-이 첫번째 혹은 마지막이니?
							sum2 = domain.length();
						}else {//아니라면 다음 기준 간다
							for(int i=0; i<domain.length(); i++) {
								int dom = (int)domains[i];
								if((48<=dom&&dom<=57)||(65<=dom&&dom<=90)||(97<=dom&&dom<=122)||dom==45||dom==46) {//영문, 숫자, -니?
									result2[i] = 0;//좋아
								}else {//아니니?
									result2[i] = 1;//문제군
								}
							}
							for(int a:result2) {
								sum2+= a;
							}
						}
					}else {//domain==null 이라면,
						sum = local.length();
						sum2 = 1;
					}
				}else {//@이 하나도 없니?
					sum = local.length();
					sum2 = 1;
				}
			}
		}
		return sum+sum2;
	}