#!/bin/bash

BUGZILLA_HOME="/home/$BUGZILLA_USER/devel/htdocs/bmo"
CPANM="cpanm --quiet --notest --skip-installed"

# Clone the code repo
git clone $BUGZILLA_REPO -b $BUGZILLA_BRANCH $BUGZILLA_HOME

# Install dependencies
cd $BUGZILLA_HOME

# Custom dependencies
$CPANM autodie
$CPANM IPC::System::Simple
$CPANM App::Cmd
$CPAMN Moo
$CPANM File::Copy::Recursive
$CPANM Config::General
$CPANM ElasticSearch
$CPANM Net::RabbitMQ
$CPANM Net::SFTP
$CPANM XML::Simple
$CPANM Tie::IxHash
$CPANM Sys::Syslog
$CPANM Regexp::Common
$CPANM Crypt::CBC
$CPANM Crypt::DES
$CPANM Crypt::DES_EDE3
$CPANM Crypt::OpenPGP
$CPANM Crypt::SMIME
$CPANM Image::Magick@6.86
$CPANM GraphViz
$CPANM Net::FTP
$CPANM Net::SFTP
$CPANM Email::MIME::Attachment::Stripper
$CPANM Pod::Checker
$CPANM REST::Client
$CPANM Test::WWW::Selenium
$CPANM JSON::RPC::Client
$CPANM Perl::Tidy

# Configure bugs database
/usr/bin/mysqld_safe &
sleep 5
perl checksetup.pl /checksetup_answers.txt
mysqladmin -u root shutdown
