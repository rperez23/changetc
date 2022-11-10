#! /usr/bin/perl

use Getopt::Long;

%captionhash;


GetOptions(
           'capfile=s'   => \my $capf,
           'srchr=i'     => \my $srchr,
           'outhr=i'     => \my $outhr,);


if ( ($capf eq "") or ($srchr eq "") or ($outhr eq "") )
{
  print("   ~~~ Undefined input $capf : $srchr : $outhr   ~~~\n");
  exit(1);
}

$srchr = sprintf("%02d",$srchr);
$outhr = sprintf("%02d",$outhr);


unless (open INF,"<$capf")
{
  print("   ~~~Cannot open input file $inf~~~\n");
  exit(1);
}

$counter = 0;
while(<INF>)
{
  chomp;
  $counter += 1;

  #add text to hash, counter is the key
  $captionhash{$counter} = $_;
}
close(INF);

foreach $n (1..$counter)
{

  $txt = $captionhash{$n};

  #if the text starts with a TC, we have a caption entry
  if ($txt =~ /^(\d{2})(:\d{2}:\d{2}.+)$/)
  {
      $hr      = $1;
      $therest = $2;

      if ($hr eq $srchr)
      {
        print("${outhr}${therest}\n");
      }

      #this is for troubleshooting
=pod
      else
      {
        print("IGNORING : $txt\n");
      }
=cut


  }
  else #if not a TC just print it
  {
    print("$txt\n");
  }

}
