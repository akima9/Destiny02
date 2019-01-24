

<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
  <link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
  <title>CodePen - Chat Widget</title>
  
  
  
  
      <style>
      @import url(https://fonts.googleapis.com/css?family=Lato:200,300,400,100,700);
@import url(https://fonts.googleapis.com/css?family=Bubblegum+Sans);
/*Font in PSD is Open Sans, I had to use Lato in order to get the desired font-weight for the header. */
/* any elements with a commented out background color can be un-commented to see the guides */
body {
  position: relative;
  overflow-x: hidden;
  background-color: #2d5986;
}

.info-panel * {
  font-family: "Bubblegum Sans", cursive;
  color: white;
  font-weight: 200;
}

.info-panel {
  position: relative;
  float: left;
  padding-left: 5%;
  padding-top: 2%;
  width: 30%;
}
.info-panel .info-title h1 {
  font-size: 4em;
}

.phone-canvas {
  position: relative;
  margin: 0 auto;
  width: 25vw;
  height: 44.5vw;
  min-width: 500px;
  min-height: 889px;
}

.chat-ui-canvas {
  position: relative;
  margin: 0 auto;
  width: 19vw;
  height: 33.5vw;
  min-width: 340px;
  min-height: 604px;
  background-image: url("https://i.imgur.com/eKHNpIu.png");
  background-size: cover;
  overflow: hidden;
  top: 3vw;
  border: 8px white solid;
  border-radius: 20px;
  box-shadow: 3px 3px 3px;
}

.header {
  outline: white 3px solid;
  position: relative;
  top: 0px;
}

.header.header-unscrolled {
  height: 39%;
  transition: height 0.5s ease-in-out;
}
.header.header-unscrolled .top-icons {
  height: 23%;
  width: 100%;
  position: relative;
  top: 3%;
  padding: 0px;
  transition: height 0.5s ease-in-out;
}
.header.header-unscrolled .top-icons .back-arrow {
  position: relative;
  display: inline-block;
  height: 100%;
  width: 20%;
  padding: 0px;
  cursor: pointer;
}
.header.header-unscrolled .top-icons .back-arrow .back-arrow-line {
  transition: all 0.1s ease-in-out;
  position: absolute;
  width: 5%;
  background-color: #ffffff;
  padding: 0px;
}
.header.header-unscrolled .top-icons .back-arrow .back-arrow-line-1 {
  transform: rotate(50deg);
  left: 32%;
  top: 21.8%;
  height: 30%;
}
.header.header-unscrolled .top-icons .back-arrow .back-arrow-line-2 {
  transform: rotate(-50deg);
  left: 32%;
  height: 30%;
  top: 37.5%;
}
.header.header-unscrolled .top-icons .back-arrow .back-arrow-line-3 {
  left: 48%;
  top: 20%;
  transform: rotate(90deg);
  height: 50%;
}
.header.header-unscrolled .top-icons .back-arrow:hover .back-arrow-line-1 {
  left: 25%;
}
.header.header-unscrolled .top-icons .back-arrow:hover .back-arrow-line-2 {
  left: 25%;
}
.header.header-unscrolled .top-icons .back-arrow:hover .back-arrow-line-3 {
  left: 40%;
}
.header.header-unscrolled .top-icons .phone-icon {
  height: 100%;
  width: 20%;
  position: relative;
  left: 60%;
  display: inline-block;
  cursor: pointer;
  opacity: 1;
  transition: opacity 0.2s ease-in-out;
}
.header.header-unscrolled .top-icons .phone-icon img {
  position: absolute;
  margin: 0 auto;
  top: 20%;
  left: 25%;
  transition: all 0.1s ease-in-out;
}
.header.header-unscrolled .top-icons .phone-icon:hover img {
  transform: scale(1.1);
}
.header.header-unscrolled .user-header-image {
  width: 31%;
  opacity: 1;
  transition: opacity 0.3s ease-in-out;
  transition-delay: 0.3s;
  background-image: url("https://i.imgur.com/Tl5p1Wb.png");
  background-size: cover;
  top: -5%;
  height: 45%;
  position: relative;
  margin: 0 auto;
  border: 4px white solid;
  border-radius: 100%;
  overflow: hidden;
  box-shadow: 1px 1px 5px #3c3c3c;
}
.header.header-unscrolled .user-name-header {
  position: relative;
  width: 100%;
  bottom: 5%;
  top: -7%;
  transition: top 0.5s ease-in-out;
  transition-delay: 0.1s;
}
.header.header-unscrolled .user-name-header h1 {
  text-align: center;
  font-family: "Lato", sans-serif;
  font-weight: 300;
  color: white;
  font-size: 2.5em;
  transition: all 0.5s ease-in-out;
}

.header.header-scrolled {
  height: 13%;
  transition: height 0.5s ease-in-out;
}
.header.header-scrolled .top-icons {
  height: 69%;
  transition: height 0.5s ease-in-out;
  transition-delay: 0.1s;
  width: 100%;
  position: relative;
  top: 3%;
  padding: 0px;
}
.header.header-scrolled .top-icons .back-arrow {
  position: relative;
  display: inline-block;
  height: 100%;
  width: 20%;
  top: 27%;
  padding: 0px;
  cursor: pointer;
}
.header.header-scrolled .top-icons .back-arrow .back-arrow-line {
  transition: all 0.1s ease-in-out;
  position: absolute;
  width: 5%;
  background-color: #ffffff;
  padding: 0px;
}
.header.header-scrolled .top-icons .back-arrow .back-arrow-line-1 {
  transform: rotate(50deg);
  left: 32%;
  top: 21.8%;
  height: 30%;
}
.header.header-scrolled .top-icons .back-arrow .back-arrow-line-2 {
  transform: rotate(-50deg);
  left: 32%;
  height: 30%;
  top: 37.5%;
}
.header.header-scrolled .top-icons .back-arrow .back-arrow-line-3 {
  left: 48%;
  top: 20%;
  transform: rotate(90deg);
  height: 50%;
}
.header.header-scrolled .top-icons .back-arrow:hover .back-arrow-line-1 {
  left: 25%;
}
.header.header-scrolled .top-icons .back-arrow:hover .back-arrow-line-2 {
  left: 25%;
}
.header.header-scrolled .top-icons .back-arrow:hover .back-arrow-line-3 {
  left: 40%;
}
.header.header-scrolled .top-icons .phone-icon {
  height: 100%;
  width: 20%;
  position: relative;
  left: 60%;
  display: inline-block;
  cursor: pointer;
  opacity: 0;
  transition: opacity 0.2s ease-in-out;
}
.header.header-scrolled .top-icons .phone-icon img {
  position: absolute;
  margin: 0 auto;
  top: 20%;
  left: 25%;
  transition: all 0.1s ease-in-out;
}
.header.header-scrolled .top-icons .phone-icon:hover img {
  transform: scale(1.1);
}
.header.header-scrolled .user-header-image {
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
}
.header.header-scrolled .user-name-header {
  position: relative;
  width: 100%;
  bottom: 5%;
  top: -65%;
  transition: top 0.6s ease-in-out;
  transition-delay: 0.1s;
}
.header.header-scrolled .user-name-header h1 {
  text-align: center;
  font-family: "Lato", sans-serif;
  font-weight: 300;
  color: white;
  font-size: 2em;
  transition: all 0.5s ease-in-out;
}

.message-feed.message-feed-scrolled {
  height: 77% !important;
}

.message-feed::-webkit-scrollbar {
  background-color: transparent;
  width: 2%;
}

.message-feed::-webkit-scrollbar-thumb {
  background-color: transparent;
  border-radius: 80px;
  transition: background-color 0.2s ease-in-out;
}

.message-feed:hover::-webkit-scrollbar-thumb {
  background-color: #868686;
  transition: background-color 0.2s ease-in-out;
}

.message-feed {
  position: relative;
  width: 100%;
  bottom: 0px !important;
  height: 51%;
  overflow-y: scroll;
  overflow-x: hidden;
}
.message-feed .message * {
  margin: 0 auto;
}
.message-feed .message {
  margin-left: 2%;
  position: relative;
  width: 90%;
  border-bottom: 1px white solid;
  padding: 1%;
  padding-left: 5%;
  padding-right: 5%;
  display: block;
}
.message-feed .message .message-name {
  position: relative;
  width: 95%;
  padding: 0px;
  top: 0px;
  display: block;
}
.message-feed .message .message-name h1 {
  font-family: "Lato", sans-serif;
  color: white;
  font-weight: 700;
  font-size: 1.4em;
  height: 100%;
  margin: 1%;
  margin-top: 3%;
}
.message-feed .message .message-body {
  position: relative;
  width: 80%;
  top: 0px;
  display: block;
  word-break: break-all;
}
.message-feed .message .message-body p {
  font-family: "Lato", sans-serif;
  color: white;
  font-weight: 300;
  font-size: 0.8em;
  margin: 1%;
}
.message-feed .message .message-timestamp {
  position: relative;
  width: 95%;
  top: 0px;
  display: block;
}
.message-feed .message .message-timestamp p {
  font-family: "Lato", sans-serif;
  color: white;
  font-weight: 700;
  font-size: 0.7em;
  margin: 1%;
  margin-top: 3%;
  margin-bottom: 3%;
}
.message-feed .message.message-to * {
  text-align: right;
  margin-right: 0px;
}
.message-feed .message.message-from * {
  margin-left: 0px;
}

.message-input-bar {
  position: absolute;
  z-index: 3;
  background: rgba(0, 0, 0, 0.3);
  outline: white 3px solid;
  width: 100%;
  height: 10%;
  bottom: 0px !important;
  box-sizing: border-box;
  margin: 0px;
}
.message-input-bar .media-expand-arrow {
  position: absolute;
  display: inline-block;
  width: 20%;
  height: 100%;
  top: 0px;
  cursor: pointer;
}
.message-input-bar .media-expand-arrow .media-expand-arrow-line {
  transition: all 0.1s ease-in-out;
  position: absolute;
  width: 5%;
  background-color: #ffffff;
  padding: 0px;
  transition: all 0.1s ease-in-out;
}
.message-input-bar .media-expand-arrow .media-expand-arrow-line-1 {
  transform: rotate(50deg);
  left: 39%;
  top: 16%;
  height: 25%;
}
.message-input-bar .media-expand-arrow .media-expand-arrow-line-2 {
  transform: rotate(-50deg);
  left: 52%;
  height: 25%;
  top: 16%;
}
.message-input-bar .media-expand-arrow .media-expand-arrow-line-3 {
  left: 45.3%;
  top: 20.5%;
  height: 46%;
}
.message-input-bar .media-expand-arrow:hover .media-expand-arrow-line-1 {
  top: 10%;
}
.message-input-bar .media-expand-arrow:hover .media-expand-arrow-line-2 {
  top: 10%;
}
.message-input-bar .media-expand-arrow:hover .media-expand-arrow-line-3 {
  top: 15%;
}
.message-input-bar .message-text-input {
  display: inline-block;
  box-sizing: border-box;
  margin: 0px;
  position: absolute;
  width: 80%;
  height: 100%;
  right: 0px;
}
.message-input-bar .message-text-input form {
  width: 100%;
  height: 100%;
  position: relative;
}
.message-input-bar .message-text-input form textarea {
  position: relative;
  margin: 0 auto;
  width: 90%;
  height: 40%;
  left: 0%;
  top: 17%;
  font-size: 1.2em;
  font-family: "lato", sans-serif;
  padding-left: 2%;
  overflowY: scroll;
  resize: none;
  border-radius: 0px !important;
}

.media-bar {
  position: relative;
  background-color: #e8e8e8;
  width: 100%;
  top: 100%;
  height: 25%;
  z-index: 4;
  transition: all 0.4s ease-in-out;
}
.media-bar .media-bar-header {
  width: 100%;
  height: 30%;
  position: relative;
  background-color: #363636;
}
.media-bar .media-bar-header .media-bar-title {
  position: relative;
  width: 40%;
  height: 100%;
  padding-left: 3%;
}
.media-bar .media-bar-header .media-bar-title h1 {
  font-family: "Lato", sans-serif;
  color: white;
  font-size: 2em;
  line-height: 1.3em;
  font-weight: 300;
  padding-left: 6%;
}
.media-bar .media-bar-header .media-close {
  position: relative;
  height: 100%;
  width: 17%;
  top: -100%;
  left: 83%;
  cursor: pointer;
}
.media-bar .media-bar-header .media-close .media-close-line {
  position: absolute;
  background-color: #ffffff;
  width: 6%;
  height: 75%;
  top: 10%;
  transition: all 0.2s ease-in-out;
}
.media-bar .media-bar-header .media-close .media-close-line-1 {
  transform: rotate(45deg);
  left: 50%;
}
.media-bar .media-bar-header .media-close .media-close-line-2 {
  transform: rotate(-45deg);
  left: 50%;
}
.media-bar .media-bar-header .media-close:hover .media-close-line {
  height: 90%;
  top: 0;
  transition: all 0.2s ease-in-out;
}
.media-bar .media-bar-body {
  position: relative;
  width: 100%;
  height: 70%;
  top: 0%;
}
.media-bar .media-bar-body .media-buttons-canvas {
  height: 80%;
  top: 10%;
  width: 95%;
  margin: 0 auto;
  position: relative;
  padding: 0px;
}
.media-bar .media-bar-body .media-buttons-canvas .media-button {
  width: 25%;
  position: relative;
  height: 100%;
  display: block;
  padding: 0px;
  float: left;
  cursor: pointer;
}
.media-bar .media-bar-body .media-buttons-canvas .media-button img {
  width: 90%;
  left: 5%;
  top: 5%;
  position: relative;
  filter: grayscale(100%);
  -webkit-filter: grayscale(100%);
  transition: all 0.3s ease-in-out;
}
.media-bar .media-bar-body .media-buttons-canvas .media-button img:hover {
  filter: grayscale(0%);
  -webkit-filter: grayscale(0%);
  transition: all 0.3s ease-in-out;
}
.media-bar .media-bar-body .media-buttons-canvas .media-button.media-audio img {
  filter: brightness(150%);
  -webkit-filter: grayscale(100%) brightness(150%);
}
.media-bar .media-bar-body .media-buttons-canvas .media-button.media-audio img:hover {
  filter: brightness(150%);
  -webkit-filter: grayscale(0%);
}

.media-bar.media-bar-open {
  top: -17.6% !important;
  transition: top 0.5s ease-in-out;
}

    </style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


</head>

<body translate="no" >

  <div class="info-panel">
            <div class="info-title">
                <h1>Chat Widget</h1>
                <h2> <a target="_new" href="https://www.andrewhaine.co.uk">Andrew Haine</a></h2>
            </div>
        </div>
        <div class="phone-canvas">
            <div class="chat-ui-canvas">
                <div id="header" class="header header-scrolled">
                    <div class="top-icons">
                        <div class="back-arrow">
                            <div class="back-arrow-line back-arrow-line-1"></div>
                            <div class="back-arrow-line back-arrow-line-2"></div>
                            <div class="back-arrow-line back-arrow-line-3"></div>
                        </div>
                        <div class="phone-icon">
                            <img src="https://i.imgur.com/4OTkocV.png" height="50%">
                        </div>
                    </div>
                    <div class="user-header-image"></div>
                    <div class="user-name-header"><h1>Arthur Johnson</h1></div>
                </div>
                <div id="message-feed" class="message-feed message-feed-unscrolled">
                    <div class="message message-from">
                        <div class="message-name"><h1>Arthur</h1></div>
                        <div class="message-body">
                            <p>
                                Put a bird on it wolf gentrify retro forage freegan craft beer ramps, mlkshk cold-pressed listicle before they sold out +1 slow-carb.
                            </p>
                        </div>
                        <div class="message-timestamp">
                            <p>Today 10:02</p>
                        </div>
                    </div>
                    <div class="message message-to">
                        <div class="message-name"><h1>You</h1></div>
                        <div class="message-body">
                            <p>
                                Tumblr meh chartreuse, messenger bag hammock heirloom bicycle rights pour-over fingerstache. Next level selfies kickstarter, vice gentrify pinterest whatever heirloom occupy ramps direct trade celiac +1.
                            </p>
                        </div>
                        <div class="message-timestamp">
                            <p>Today 10:14</p>
                        </div>
                    </div>
                    <div class="message message-from">
                        <div class="message-name"><h1>Arthur</h1></div>
                        <div class="message-body">
                            <p>
                                Viral portland thundercats readymade wayfarers man bun. Bespoke semiotics vegan, chia asymmetrical shabby chic quinoa man braid wayfarers
                            </p>
                        </div>
                        <div class="message-timestamp">
                            <p>Today 10:20</p>
                        </div>
                    </div>
                </div>
                <div class="message-input-bar">
                    <div id="media-expand-arrow" class="media-expand-arrow">
                        <div class="media-expand-arrow-line media-expand-arrow-line-1"></div>
                        <div class="media-expand-arrow-line media-expand-arrow-line-2"></div>
                        <div class="media-expand-arrow-line media-expand-arrow-line-3"></div>
                    </div>
                    <div class="message-text-input">
                        <form class="message-send">
                            <textarea id="message-input" placeholder="Message..." value=""></textarea>
                        </form>
                    </div>
                </div>
                <div id="media-bar" class="media-bar">
                    <div class="media-bar-header">
                        <div class="media-bar-title">               <h1>Media</h1>
                        </div>
                        <div id="media-bar-cross" class="media-close">
                            <div class="media-close-line media-close-line-1"></div>
                            <div class="media-close-line media-close-line-2"></div>
                        </div>
                    </div>
                    <div class="media-bar-body">
                        <div class="media-buttons-canvas">
                            <div class="media-button media-video">
                                <img src="https://imgur.com/x9NDjYV.png">
                            </div>
                            <div class="media-button media-image">
                                <img src="https://imgur.com/0Sw4F6i.png">
                            </div>
                            <div class="media-button media-audio">
                                <img src="https://imgur.com/2KlzOiN.png">
                            </div>
                            <div class="media-button media-location">
                                <img src="https://imgur.com/OvqVDk5.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script >
      window.onload = function () {
    var mediaExpand = document.getElementById("media-expand-arrow");
    var mediaBar = document.getElementById("media-bar");
    var mediaCross = document.getElementById("media-bar-cross");
    var messageFeed = document.getElementById("message-feed");
    
    console.log(mediaExpand + mediaBar);
    
    function mediaOpen(){
        mediaBar.className += " media-bar-open"
    };
    
    mediaExpand.addEventListener("click", mediaOpen, false);
    
    function mediaClose(){
        mediaBar.className = "media-bar"
    };
    
    mediaCross.addEventListener("click", mediaClose, false);
    
    function wScroll(){
        console.log(messageFeed.scrollTop);
        
        messageHeight = messageFeed.offsetHeight;
    
        var heightToScroll = (130);
        var header = document.getElementById('header');
    
        if(messageFeed.scrollTop > heightToScroll){
            header.className = "header header-scrolled"
            messageFeed.className = "message-feed message-feed-scrolled"
        }
        else if(messageFeed.scrollTop < 1){
            header.className = "header header-unscrolled"
            messageFeed.className = "message-feed"
        }
     };
    
    messageFeed.addEventListener("scroll", wScroll, false);
    
    wScroll();
        
        
    function logMessage(event){
        
        //get time
        function addZero(i){
            if(i < 10){
                i = "0" + i    
            }
            return i;
        }
    
        var d = new Date();    
        var h = addZero(d.getHours());
        var m = addZero(d.getMinutes()); 
        
        //build message
        
        function appendMessage() {
            $('#message-feed').append(
                '<div class="message message-to"><div class="message-name"><h1>You</h1></div><div class="message-body"><p>' + messageVal + '</p></div><div class="message-timestamp"><p>Today ' + h + ' : ' + m + '</p></div>'   
            );
        }
        
        //set event trigger
        
        var messageInput = document.getElementById("message-input");
        
        var messageVal = messageInput.value;
        
        //hipsum responses
        
        var responseTimed;
        
        function timedResponse(){
            setTimeout(
            function appendResponse() {
                var randNumber = Math.floor((Math.random()*10)+1)

                switch(randNumber){
                    case 1:
                        $('#message-feed').append(
                            '<div class="message message-from"><div class="message-name"><h1>Arthur</h1></div><div class="message-body"><p>Gluten-free VHS gentrify, humblebrag blue bottle retro vegan yuccie swag etsy.</p></div><div class="message-timestamp"><p>Today ' + h + ' : ' + m + '</p></div>'   
                        );
                        break;
                    case 2:
                        $('#message-feed').append(
                            '<div class="message message-from"><div class="message-name"><h1>Arthur</h1></div><div class="message-body"><p>Tilde ethical offal plaid everyday carry meggings banjo gentrify, green juice food truck fap. Beard lumbersexual photo booth.</p></div><div class="message-timestamp"><p>Today ' + h + ' : ' + m + '</p></div>'   
                        );
                        break;
                    case 3:
                        $('#message-feed').append(
                            '<div class="message message-from"><div class="message-name"><h1>Arthur</h1></div><div class="message-body"><p>Cliche sriracha jean shorts, cronut beard irony meh asymmetrical man braid offal.</p></div><div class="message-timestamp"><p>Today ' + h + ' : ' + m + '</p></div>'   
                        );
                        break;
                    case 4:
                        $('#message-feed').append(
                            '<div class="message message-from"><div class="message-name"><h1>Arthur</h1></div><div class="message-body"><p>Quinoa man braid tumblr venmo lomo cray microdosing, pinterest celiac affogato fingerstache umami fashion axe schlitz. Ethical four loko truffaut salvia.</p></div><div class="message-timestamp"><p>Today ' + h + ' : ' + m + '</p></div>'   
                        );
                        break;
                    case 5:
                        $('#message-feed').append(
                            '<div class="message message-from"><div class="message-name"><h1>Arthur</h1></div><div class="message-body"><p>Street art bicycle rights letterpress mixtape cold-pressed. Drinking vinegar flexitarian quinoa twee.</p></div><div class="message-timestamp"><p>Today ' + h + ' : ' + m + '</p></div>'   
                        );
                        break;
                    case 6:
                        $('#message-feed').append(
                            '<div class="message message-from"><div class="message-name"><h1>Arthur</h1></div><div class="message-body"><p> Artisan heirloom iPhone normcore, salvia farm-to-table vice freegan hammock waistcoat.</p></div><div class="message-timestamp"><p>Today ' + h + ' : ' + m + '</p></div>'   
                        );
                        break;
                    case 7:
                        $('#message-feed').append(
                            '<div class="message message-from"><div class="message-name"><h1>Arthur</h1></div><div class="message-body"><p>Pinterest kale chips single-origin coffee, man braid franzen ethical chia plaid locavore small batch hashtag swag. Dreamcatcher kogi fingerstache, lo-fi roof party pork belly.</p></div><div class="message-timestamp"><p>Today ' + h + ' : ' + m + '</p></div>'   
                        );
                        break;
                    case 8:
                        $('#message-feed').append(
                            '<div class="message message-from"><div class="message-name"><h1>Arthur</h1></div><div class="message-body"><p> Vegan celiac heirloom knausgaard. Paleo mixtape ramps irony lomo.</p></div><div class="message-timestamp"><p>Today ' + h + ' : ' + m + '</p></div>'   
                        );
                        break;
                }
                messageFeed.scrollTop = messageFeed.scrollHeight;
            }, 2500);
        };
        
        
        //fire on enter
        
        
        if (event.keyCode == 13) {
            event.preventDefault();
            messageInput.value= "";
            appendMessage();
            messageFeed.scrollTop = messageFeed.scrollHeight;
            timedResponse();
        }        
        
    };
        
    document.addEventListener("keypress", logMessage, false);

    
}
      //# sourceURL=pen.js
    </script>



  
  

  <script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>
</body>

</html>
 
