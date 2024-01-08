const {Router} = require('express');
const router = Router();

const SENDBOX_CLIENT_ID = '##############';
const SENDBOX_CLIENT_SECRET = '##################';

//코드에프 가입을 통해 발급 받은 클라이언트 정보 - 데모
const DEMO_CLIENT_ID = '################';
const DEMO_CLIENT_SECRET = '###############';

// 코드에프 가입을 통해 발급 받은 클라이언트 정보- 정식
const CLIENT_ID = '';
const CLIENT_SECRET = '';

//	코드에프 가입을 통해 발급 받은 RSA 공개키 정보
const PUBLIC_KEY = '###############';

module.exports = router;