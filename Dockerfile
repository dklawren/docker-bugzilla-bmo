FROM dklawren/docker-bugzilla
MAINTAINER David Lawrence <dkl@mozilla.com>

# Environment
ENV BUGZILLA_REPO https://git.mozilla.org/webtools/bmo/bugzilla.git
ENV BUGZILLA_BRANCH master

# Extra software
RUN yum install -y cvs rsh jade xorg-x11-server-Xvfb firefox java x11vnc; yum clean all

# Bugzilla configuration
ADD checksetup_answers.txt /checksetup_answers.txt
ADD bugzilla_config.sh /bugzilla_config.sh
RUN chmod 755 /bugzilla_config.sh
RUN /bugzilla_config.sh

# Final permissions fix
RUN chmod 711 /home/$BUGZILLA_USER
RUN chown -R $BUGZILLA_USER.$BUGZILLA_USER /home/$BUGZILLA_USER
