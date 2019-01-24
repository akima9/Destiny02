  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html >
<head><script src='https://static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'></script><script src='https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/phenax/pen/RPveyq" />


<style class="cp-pen-styles">body {
  margin: 0;
  padding: 0;
  background-color: #222;
}

* {
  font-family: Helvetica,sans-serif;
  color: #888;
}

main.container {
  width: 60%;
  margin: 40px auto;
}
main.container .list {
  width: 30%;
  float: left;
  background: #51e980;
  height: 400px;
  border-radius: 10px 0 0 10px;
  border-right: 1px solid #fff;
}
main.container .list ul {
  list-style-type: none;
  padding: 0;
}
main.container .list ul li a {
  display: block;
  border: none;
  border-left: 5px solid transparent;
  cursor: pointer;
  background: rgba(0, 0, 0, 0.5);
  font-size: 20px;
  text-decoration: none;
  padding: 10px 10px;
  color: #fff;
}
main.container .list ul li a:hover {
  border-left: 5px solid #E57373;
}
main.container .list ul li:first-child {
  color: #fff;
  text-align: center;
  border-bottom: 1px solid #fff;
  margin-bottom: 3px;
}
main.container .chat-box {
  float: left;
  width: 69%;
  background: #ccc;
  height: 400px;
  border-radius: 0 10px 10px 0;
}
main.container .chat-box ul {
  list-style-type: none;
  padding: 0;
  display: none;
}
main.container .chat-box ul:target {
  display: block;
}
main.container .chat-box ul li .title {
  color: #888;
  text-align: center;
  border-bottom: 1px solid #88;
  margin-bottom: 3px;
}
main.container .chat-box ul li .me {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}
main.container .chat-box ul li .you {
  display: flex;
  align-items: center;
}
main.container .chat-box ul li > div .img {
  display: inline-block;
  width: 50px;
  height: 50px;
  background: #fff;
  border-radius: 50%;
  margin-bottom: -25px;
  border: 2px solid #03A9F4;
  z-index: 100;
  position: relative;
}
main.container .chat-box ul li > div .name {
  display: inline-block;
  padding: 5px 50px 5px 20px;
  margin-top: -20px;
  margin-right: -30px;
  background-color: #03A9F4;
  color: #fff;
  border-radius: 15px 0 0 0;
  font-size: 13px;
  position: relative;
}
main.container .chat-box ul li > div .text div {
  background-color: #fff;
  display: inline-block;
  padding: 15px 20px;
  max-width: 300px;
  min-width: 150px;
  margin-left: -55px;
  border-radius: 10px 0 10px 10px;
  z-index: 10;
  position: relative;
  text-align: right;
}
main.container .chat-box ul li .you .name {
  padding: 5px 25px 5px 50px;
  margin-left: -30px;
  border-radius: 0 15px 0 0;
}
main.container .chat-box ul li .you .text div {
  margin-left: 6px;
  border-radius: 0 10px 10px 10px;
  text-align: left;
}
</style></head><body>
<main class='container'>

	<div class='list'>
		<ul>
			<li>UserList</li>
			<li><a href='#user_1'>User_1</a></li>
			<li><a href='#user_2'>User_2</a></li>
			<li><a href='#user_3'>User_3</a></li>
		</ul>
	</div>

	<!-- User Number 1 -->
	<div class='chat-box'>
		<ul id='user_1'>
			<li><div class='title'>User_1</div></li>
			<li>
				<div class='me'>
					<div>
						<div class='name'>Akshay</div>
						<div class='img'></div>
						<div class='text'>
							<div>
								Hello
							</div>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class='you'>
				<div>
					<div class='img'></div>
					<div class='name'>User_1</div>
					<div class='text'>
						<div>
							Get lost, Akshay.
						</div>
					</div>
				</div>
				</div>
			</li>
		</ul>

		<!-- User Number 2 -->
		<ul id='user_2'>
			<li><div class='title'>User_2</div></li>
			<li>
				<div class='me'>
					<div>
						<div class='name'>Akshay</div>
						<div class='img'></div>
						<div class='text'>
							<div>
								Hey!<br />
								Were u sleeping?
							</div>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class='you'>
				<div>
					<div class='img'></div>
					<div class='name'>User_2</div>
					<div class='text'>
						<div>
							No. I was just training my dinosaurs to fight for the government.
						</div>
					</div>
				</div>
				</div>
			</li>
		</ul>

		<!-- User Number 3 -->
		<ul id='user_3'>
			<li><div class='title'>User_3</div></li>
			<li>
				<div class='me'>
					<div>
						<div class='name'>Akshay</div>
						<div class='img'></div>
						<div class='text'>
							<div>
								Hey. <br />
								How are you doing?
							</div>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class='you'>
				<div>
					<div class='img'></div>
					<div class='name'>User_3</div>
					<div class='text'>
						<div>
							I'm fine. What about you?
						</div>
					</div>
				</div>
				</div>
			</li>
		</ul>
	</div>
</main>

</body></html>