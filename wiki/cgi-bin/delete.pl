#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use CGI;

my $q=CGI->new;
my $fn=$q->param('title');
print $q->header ('text/html; charset=utf-8');

print "Se borro la pagina web titulada $fn";
my $user='alumno';
my $password='pweb1';
my $dsn= "DBI:MariaDB:database=pweb1;host=localhost";
my $dbh=DBI->connect($dsn,$user,$password) or die ("No se puede conectar!");

my $sth=$dbh->prepare("DELETE FROM wiki WHERE Title=?");
$sth->execute($fn);
$dbh->disconnect;

print <<B;
<br>
<a href="list.pl">Volver a la lista </a>
B

