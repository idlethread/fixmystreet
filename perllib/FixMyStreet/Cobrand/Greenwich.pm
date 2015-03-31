package FixMyStreet::Cobrand::Greenwich;
use parent 'FixMyStreet::Cobrand::UKCouncils';

use strict;
use warnings;

sub council_id { return 2493; }
sub council_area { return 'Greenwich'; }
sub council_name { return 'Greenwich Borough Council'; }
sub council_url { return 'greenwich'; }

sub example_places {
    return ( 'SE18 6HQ', "Woolwich Road" );
}

sub disambiguate_location {
    my $self    = shift;
    my $string  = shift;

    my $town = 'Greenwich';

    # as it's the requested example location, try to avoid a disambiguation page
    $town .= ', SE10 0EF' if $string =~ /^\s*woolwich\s+r(?:oa)?d\s*(?:,\s*green\w+\s*)?$/i;

    return {
        %{ $self->SUPER::disambiguate_location() },
        town   => $town,
        centre => '51.4743770385684,0.0555696523982184',
        span   => '0.089851200483885,0.150572372434415',
        bounds => [ 51.423679096602, -0.0263872255863898, 51.5135302970859, 0.124185146848025 ],
    };
}

1;
