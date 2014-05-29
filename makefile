NAME=yadynip

FILES=	\
	bin/yadynip	\
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
	./install.sh ${INSTALL_DIR}

