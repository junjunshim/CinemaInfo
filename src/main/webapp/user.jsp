<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        body {
            background-color: #f5f5f5;
   
            text-align: center;
        }
        
       .profile-box
        {
            width: 500px;
            height : 700px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .user{
       margin-right : 250px;  
		border-radius : 300px;
		width : 110px;
		height : 110px;
		float:none;
		margin-top : 10px;
		margin-bottom : 20px;
		
		
	}
	.name-label {
  	display: block;
  	margin-bottom: 10px;
  	margin-left:25px;
  	text-align : left;
	}
	
     .btn{
    		width : 450px;
    		height : 60px;
     		padding: 10px 20px;
           margin-top:120px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
     }   
     .btnx{
     	gap: 20px;
     	display :flex;
     	justify-content: center;	     
     	 flex-direction: row;
     	 margin-bottom : 100px;
     }
     .btnbox{
     	margin-bottom : 20px; 
     	margin-top : 35px; 
     }
   .bt{
   		width : 450px;
   		height : 60px;
   		background-color: white;
   		border : solid 0.1px rgba(0, 0, 0, 0.1);
   		border-radius : 5px;
   }
    </style>
</head>
<body>
    <div class="profile-box">
        
 
		<form name = "form-1" method = "post">
			<img src = "" alt = "userimage" class= "user">
			<label class = "name-label">-</label>
			<hr><br>
			<div>
				<div class = "btnbox">
					<button class = "bt">작성한 리뷰</button>	
				</div>
				<div class = "btnbox">
					<button type = "button" onclick = "" class = "bt">리뷰쓰기</button>	
				</div>
				<div class = "btnbox">
					<button class = "bt">보고싶어요한 영화</button>	
				</div>
				<div class = "btnbox">
			 <button type = "button" class="bt" onclick = "location.href = 'profile.jsp'">프로필 수정</button>
			</div>
			
			  <button type = "submit" class="btn" id = "logout" onclick = "">로그아웃</button>
			  </div>
			  
       </form>
 
    </div>

</body>
</html>