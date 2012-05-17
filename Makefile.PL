
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A DNS ad filter",
  "AUTHOR" => "David Watson <dwatson\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Data::Dumper" => 0,
    "Net::DNS::Resolver" => 0,
    "Test" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Net-DNS-Dynamic-Adfilter",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Net::DNS::Dynamic::Adfilter",
  "PREREQ_PM" => {
    "LWP::Simple" => "6.00",
    "Moose" => "2.0403",
    "Net::Address::IP::Local" => 0,
    "Net::DNS::Dynamic::Proxyserver" => "1.2"
  },
  "VERSION" => "0.065",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



