aws-env
=======

AWS client (i.e. your laptop):

$ git clone https://github.com/derekchiles/aws-env ~/aws-env
$ echo ". ~/aws-env/bin/aws-init" >> ~/.bashrc

Note: This was developed and tested on Mac OS X 10.8.5. YMMV.

AWS EC2 instance:

#
# Source aws-env/aws-bootstrap, without configuring Duo Security
#
$ bash -c "$(curl -sL http://bit.ly/1eocBY6)" 

#
# Source aws-env/aws-bootstrap, and configure Duo Security
#
$ LOGIN_DUO_CONF_S3_BUCKET=mys3bucket
$ LOGIN_DUO_CONF_S3_KEY=my_login_duo.conf
$ bash -c "$(curl -sL http://bit.ly/1eocBY6)" ${LOGIN_DUO_CONF_S3_BUCKET} ${LOGIN_DUO_CONF_S3_KEY}

