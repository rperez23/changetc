#!/usr/bin/perl

#change first timecode to 01:00:00;00

foreach $inf (@ARGV)
{


  $outf = "fixed-tc/$inf";
  #$outf =~ s/.scc/_ENG.scc/;
  print("$inf -> $outf\n");


  unless (open INF, "<$inf")
  {
    print("Cannot Open input file $inf\n");
    exit(1);
  }

  unless (open OUTF, ">$outf")
  {
    print("Cannot open output file $outf\n");
    exit(1);
  }

  while(<INF>)
  {
    chomp;

    $txt = $_;

    if (/^00:\d{2}:\d{2}([:;])\d{2}/)
    {
      #$txt =~ s/^00:/01:/;
      $txt = "01:00:00${1}00$'";
    }

    print OUTF ("$txt\n");
  }

  close(INF);
  close(OUTF);

}
