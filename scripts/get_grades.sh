#!/bin/bash
var="$1"
entrynumber="$1"	
if [[ ${#var} == 9 ]]; then
	# echo "hello"
	dept=${var:0:3}
	uid=${var:5:4}
	year=${var:3:2}
	d=${dept^^}
	a="20"
	entrynumber=$a$year$d$uid
fi

echo $entrynumber

# echo $d
com='entrynumber='$entrynumber'&submit=Consolidate+Grade+Card'
# curl -k 'https://academics2.iitd.ac.in/parents/dmc3.php' -H 'Host: academics2.iitd.ac.in' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:57.0) Gecko/20100101 Firefox/57.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://academics2.iitd.ac.in/parents/stpage_form.php' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Cookie: _ga=GA1.3.873560539.1504393809; SESS1f002926bf876664ed5383994cb4c1de=aoi1rpl176v69ijj15sedv12j2; _gid=GA1.3.2020411744.1515657599; PHPSESSID=fd40opd64aie00b8f6dsjhp486' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data $com>a.html
curl -k 'https://academics2.iitd.ac.in/parents/dmc3.php' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'Referer: https://academics2.iitd.ac.in/parents/stpage_form.php' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Cookie: _ga=GA1.3.717011916.1529063230; SESS1f002926bf876664ed5383994cb4c1de=o7aocqk6c795b8ngkikau0jrv0; _gid=GA1.3.1823827067.1532112767; PHPSESSID=o5upds6580tai7gmoethaqot17' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data $com > $entrynumber".html"
google-chrome $entrynumber".html"

# sleep 1
# rm a.html
