
class Api  {

  static String CODE_SUCCESS = 'T';


  // static const serviceUrl = 'http://106.245.253.186:8080/'; // 운영서버
   static const serviceUrl = 'http://210.217.150.148:8080/'; // 창우님 pc
  // static const serviceUrl = 'http://10.0.2.2:8080/'; //로컬서버


  //Test
  //플라이 카고 차주용 매인 목록
  static const String MYJOB_LIST = 'select_a_my_order_v03';
  static const String MYJOB_LIST_KEY = '9b7fd737-4d9b-496d-ae03-a017f0e492eb';

  static const int STATUSCODE_SUCCESS_GET   = 200;
  static const int STATUSCODE_SUCCESS_POST  = 201;
  static const int STATUSCODE_SUCCESS_DELETE  = 204;
  static const int STATUSCODE_SUCCESS_PATCH  = 201;
  static const int STATUSCODE_FAIL_UNAUTHORIZED  = 401;
  static const int STATUSCODE_FAIL_FORBIDDEN  = 403;
  static const int STATUSCODE_FAIL_NOT_FOUND  = 404;
  static const int STATUSCODE_FAIL_SERVER_ERROR  = 500;


  static const String SUCCESS   = 'T';
  static const String FAIL   = 'F';

  // ㅌㅔ스
  static const String GET_TEST = 'https://a08b0a5e-be87-476f-a857-ad1d510a2f33.mock.pstmn.io/v1/tradetalk/app/version';


  //회원가입
  static const String SIGN_UP = 'api/trade-talk/auth/member';

  //sns회원가입
  static const String SNS_SIGN_UP = 'api/trade-talk/auth/member-sns';

  //로그인
  static const String LOGIN = 'api/trade-talk/auth/login';

  //sns로그인
  static const String SNS_LOGIN = 'api/trade-talk/auth/login-sns';

  //요청하기
  static const String ENQUIRY = 'api/trade-talk/enquiry';

  //전문가 최근 등록글 조회
  static const String REALTIME_REQUEST = 'api/trade-talk/enquirys';

  //견적 조회
  static const String ANSWERS = 'api/trade-talk/answers?';

  //견적 상세 조회
  static const String DETAIL_ANSWER = 'api/trade-talk/answer/';

  //견적 보내기
  static const String ANSWER = 'api/trade-talk/answer';

  //프로필 정보 수정
  static const String EDIT_PROFILE = 'api/trade-talk/profile?';

  //프로필 정보 조회
  static const String MY_PROFILE = 'api/trade-talk/profile';

  //전문가 등록
  static const String REGIST_EXPERT = 'api/trade-talk/expert';

  //전문가 찾기
  static const String SEARCH_EXPERT = 'api/trade-talk/experts';

  //전문가 상세보기
  static const String DETAIL_EXPERT = 'api/trade-talk/expert/';

  //회원탈퇴
  static const String RESIGN = 'api/trade-talk/auth/member';

  //채팅방생성
  static const String CREATE_CHAT = '/api/trade-talk/chat';

  //채팅방 리스트 조회
  static const String CHAT_LIST = '/api/trade-talk/chats';

  //채팅방 조회
  static const String CHAT = '/api/trade-talk/chat/';


}