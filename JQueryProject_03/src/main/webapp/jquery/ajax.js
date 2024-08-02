let httpRequest = null;

// 브라우저에 내장 => XMLHttpRequest : 브라우저 => 서버 요청 => 결과값을 읽어오는 클래스 
function getXMLHttpRequest() {
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    } else {
        return null;
    }
}

function sendRequest(url, params, callback, method) {
    httpRequest = getXMLHttpRequest();
    if (!httpRequest) {
        alert("AJAX를 지원하지 않는 브라우저입니다.");
        return;
    }
    
    let httpMethod = method ? method.toUpperCase() : 'GET';
    if (httpMethod !== 'GET' && httpMethod !== 'POST') {
        httpMethod = 'GET';
    }
    
    // 메소드 방식을 지정 
    let httpParams = (params == null || params === "") ? null : params;
    let httpUrl = url;
    if (httpMethod === 'GET' && httpParams != null) { // 전송할 값이 있다면
        httpUrl = httpUrl + "?" + httpParams;
    }
    
    // 서버 연결 => open
    httpRequest.open(httpMethod, httpUrl, true); // true => 비동기 방식 (Ajax:비동기)
    
    // 한글 처리 
    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    // 자동 호출 함수 지정 
    httpRequest.onreadystatechange = callback;
    
    // 데이터 전송
    httpRequest.send(httpMethod === 'POST' ? httpParams : null);
}
