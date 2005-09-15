package OSF::Validate;

use strict;
use warnings;
use English;

use File::Temp qw(tempfile);

use Exporter;
use vars qw(@ISA @EXPORT);
@ISA = qw(Exporter);

@EXPORT = qw(
	     is_valid_email_address
	     is_valid_fqhostname
	     is_valid_host
	     is_valid_ip_address
	     is_valid_regexp
	     is_valid_sa_score
	    );


sub is_valid_email_address($)
{
    my ($value) = @_;

    # FIXME: see <http://www.faqs.org/rfcs/rfc2822.html> section 3.4
    # for correct solution

    return ($value =~ m!^[A-Z0-9._%-]+@[A-Z0-9._]+$!i);
}


sub is_valid_fqhostname($)
{
    my ($value) = @_;

    return ($value =~ m![a-z][a-z0-9.-]*[a-z0-9]!i);
}


sub is_valid_ip_address($)
{
    my ($value) = @_;

    return ($value =~ m!(\d+)\.(\d+)\.(\d+)\.(\d+)!
	    && $1 <= 255 && $2 <= 255 && $3 <= 255 && $4 <= 255);
}


sub is_valid_host($)
{
    my ($value) = @_;

    return is_valid_fqhostname($value) || is_valid_ip_address($value);
}


sub is_valid_regexp
{
    my $regexp = $_[0];
    # We could do perl -e '/ ... /' but then we would have to escape shell
    # metacharacters...
    my ($fh, $filename) = tempfile() or die "Could not create temporary file: $!";
    $regexp =~ s,/,\\/,g;
    print $fh "/".$regexp."/";
    close($fh);
    system("$EXECUTABLE_NAME $filename >/dev/null 2>&1");
    unlink($filename);
    my $ret = $? >> 8;
    if ($ret == 0) {
	return 1;
    } else {
	return 0;
    }
}


sub is_valid_sa_score($)
{
    my ($value) = @_;

    return ($value =~ /^-?[0-9]+(\.[0-9]+)?$/)
}
