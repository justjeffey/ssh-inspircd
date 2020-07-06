
FROM debian

RUN apt-get update && apt-get install -y \
  --no-install-recommends \
  openssh-server \
  weechat \
  weechat-plugins \
  locales \
  inspircd \
  sudo

RUN sed -ri 's/^(# )?(en_US)(.+)( UTF-8)$/\2\3\4/' /etc/locale.gen \
 && locale-gen
  
RUN mkdir /var/run/sshd

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

COPY root/ /

RUN mkdir /usr/lib/inspircd/logs && \
	touch /usr/lib/inspircd/logs/startup.log && \
	touch /var/run/inspircd.pid && \
	chown irc:irc /var/run/inspircd.pid && \
	chown irc:irc -R /usr/lib/inspircd

RUN echo 'INSPIRCD_ENABLED=1' > /etc/default/inspircd

EXPOSE 22

RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
