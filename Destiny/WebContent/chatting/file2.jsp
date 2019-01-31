<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Dplex</title>
    <style type="text/css">
        #py {
            height: 263px;
           
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
    <script src="http://cdn.binaryjs.com/0/binary.js"></script>
    <script src="/socket.io/socket.io.js"></script>
    <script>
        var y;
        var client = new BinaryClient('ws://192.168.0.47:8020');
        client.on('open', function () {
            var box = $('#box');
            box.on('dragenter', doNothing);
            box.on('dragover', doNothing);
            box.text('Drag files here');
            box.on('drop', function (e) {
                e.originalEvent.preventDefault();
                var files = e.originalEvent.dataTransfer.files;
                for (var i = 0; i < files.length; i++) {
                    file = files[i];
                // Add to list of uploaded files
                $('<div align="center"></div>').append($('<a></a>').text(file.name).prop('href', '/' + file.name)).appendTo('body');

                // `client.send` is a helper function that creates a stream with the
                // given metadata, and then chunks up and streams the data.
                var stream = client.send(file, { name: file.name, size: file.size });

                // Print progress
                var tx = 0;
                stream.on('data', function (data) {
                    $('#progress').text(Math.round(tx += data.rx * 100) + '% complete');
                });
                }
            });
        });

        // Deal with DOM quirks
        function doNothing(e) {
            e.preventDefault();
            e.stopPropagation();
        }

        socket = io.connect('http://192.168.0.47:8021');
        window.onload = function () {
            console.log("load Complet");
            socket.on('webText', function (data) {
                console.log("webText : " + data);
                document.getElementById("py").value = data;
            });
            socket.on('fileList', function (data) {
                console.log(data);
                for (var i = 0; i < data.length; i++) {
                    $('<div align="center"></div>').append($('<a></a>').text(data[i]).prop('href', '/' + data[i])).appendTo('body');
                }
            });
        }
        function abc() {
            var x = document.getElementById("py").value;
            console.log(x);
            socket.emit('webmessage', x);
        }
    </script>
</head>
<body>
    <form action="/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="uploadFile" />
        <input type="submit" name="Upload" />
    </form>
    <div id="progress" align="center">0% complete</div>
    <div id="box" style="background: #eee; font-size: 26px; height: 300px;line-height: 300px; margin: 0 auto; text-align: center;">
        Drag Files    
    </div>
    <textarea id="py" type="text" onkeyup="abc()"></textarea>
</body>
</html>

