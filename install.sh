#!/bin/bash
PWD=$(pwd)

bhutuu() {
sleep 0.125
}

#<<<----------distro verification---------->>>

cd $HOME
distro=$(pwd)
if [[ $distro == '/data/data/com.termux/files/home' ]]; then
        rootdir="/data/data/com.termux/files/usr"
        installer="apt"
	deleter="rm -rf"
	launcher="echo"
if ! hash "termux-battery-status" > /dev/null 2>&1; then
xdg-open https://play.google.com/store/apps/details?id=com.termux.api
apt install termux-api -y
fi
if ! hash "bc" > /dev/null 2>&1; then
apt install bc -y > /dev/null 2>&1
fi
elif [[ $distro == '/data/data/hilled.pwnterm/files/usr/home' ]]; then
        rootdir="/data/data/hilled.pwnterm/files/usr"
        installer="apt"
	deleter="rm -rf"
if ! hash "bc" > /dev/null 2>&1; then
apt install bc -y > /dev/null 2>&1
fi
else
        rootdir="/usr"
        installer="sudo apt-get"
	deleter="sudo rm -rf"
if ! hash "bc" > /dev/null 2>&1; then
sudo apt install bc -y > /dev/null 2>&1
fi
fi

#<<<----------check and delete old files----------->>>

cd ${rootdir}/bin

pv_search=$(find pv)
if [[ $pv_search == 'pv' ]]; then
        echo
else
        ${installer} install pv -y
fi

bhutuu

T_search=(find T-fetch)
if [[ $T_search == T-fetch* ]]; then
	${deleter} T-fetch && bhutuu
fi

cd ${rootdir}/share
${deleter} T-fetch && bhutuu
bhutuu
#<---x--->

pause() {
pv -qL 50
}

#<<<----------Downloading updated version of T-fetch---------->>>

cd ${rootdir}/share
git clone https://github.com/BHUTUU/T-fetch
bhutuu

#<<<----------installing T-fetch---------->>>
cat <<- CONF > ${rootdir}/bin/T-fetch
#!${rootdir}/bin/bash
TDIR="${rootdir}/share/T-fetch"
LAUNCHT="T-fetch"

cd \${TDIR}
./\${LAUNCHT} \${@}
CONF
bhutuu
chmod u+x ${rootdir}/bin/T-fetch

#<<<----------Guide for users---------->>>

echo
#color{
T1="$(printf '\033[91m')"
T2="$(printf '\033[92m')"
T3="$(printf '\033[93m')"
T6="$(printf '\033[96m')"
T7="$(printf '\033[97m')"
B7="$(printf '\033[107m')"
SB0="$(printf '\033[0;1m')"
ST0="$(printf '\033[00m')"
#}
#banner{
echo -e "

        ${T7}___   _${ST0}
        ${T3} |___|___|_ _|_${TS0}
        ${T2} |   |(/_|_(_| |${TS0}

" | pause; bhutuu
#}
echo
printf "        ${B7}${T5} Authored by Suman Kumar ~BHUTUU ${ST0}${SB0}\n" | pause; bhutuu
echo
printf "${T3}T-fetch is successfully installed to use it just run :- ${T1}T-fetch${ST0}\n" | pause; bhutuu
echo
printf "${T1}Thanku for installing and using T-fetch${ST0}\n" | pause

#Author:- Suman kumar ~BHUTUU
