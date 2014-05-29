## yaDynIp Sendmail config - (template: rename to sendmail)

## SMTP Mail server - mandatory
$smtp = 'mailhost';

## From email address - mandatory
$from = 'noreply@yourdomain.net';

## People to notify - mandatory
$to = [ qw(you@yourdomain.net another@somemail.org) ];

## hostname used as identifier - optional
$hostname = '*.yourdomain.net';

# Config as a Perl lib - must return 1;
1;
