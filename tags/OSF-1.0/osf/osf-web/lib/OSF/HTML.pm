package OSF::HTML;

use strict;
use warnings;

use CGI qw(:standard);

use Exporter;
use vars qw(@ISA @EXPORT);
@ISA = qw(Exporter);
@EXPORT = qw(html_top html_bottom);


sub html_top($;$)
{
    my ($cgi, $status) = @_;

    if ($status) {
	print $cgi->header(-status=>$status);
    } else {
        print $cgi->header();
    }
}


sub html_bottom()
{
}
