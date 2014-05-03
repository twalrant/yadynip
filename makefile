NAME=yadynip

FILES=	\
	yadynip	\
	etc/checkip.d/00dir600	\
	etc/checkip.d/10all-nettools	\
	etc/checkip.d/11dyndns		\
	etc/checkip.d/12showmyip	\
	etc/checkip.d/13whatismyip	\
	etc/checkip.d/conf/dir600.tpl	\
	etc/actions.d/00zeupdate	\
	etc/actions.d/10sendmail	\
	etc/actions.d/conf/sendmail.tpl	\
	etc/actions.d/conf/zeupdate.tpl	\
	README

DIST_EXCLUDE=--exclude=*~ --exclude=*90test-*
.PHONY: dist
dist:
	tar cvfz ${NAME}.tgz ${DIST_EXCLUDE} ${FILES}

INSTALL_DIR=/usr/local
.PHONY: install
install:
	mkdir -p ${INSTALL_DIR}/etc/${NAME}/checkip.d/conf
	mkdir -p ${INSTALL_DIR}/etc/${NAME}/actions.d/conf
	mkdir -p ${INSTALL_DIR}/share/${NAME}/ipcaches
	cp etc/${NAME}.conf ${INSTALL_DIR}/etc/${NAME}.conf
	cp etc/checkip.d/* ${INSTALL_DIR}/etc/${NAME}/checkip.d
	cp etc/actions.d/* ${INSTALL_DIR}/etc/${NAME}/actions.d
