#!/usr/bin/perl

#0 -> 1

foreach $inf (@ARGV)
{


  $outf = "01/$inf";
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

    if (/^00/)
    {
      $txt =~ s/^00:/01:/;
    }

    print OUTF ("$txt\n");
  }

  close(INF);
  close(OUTF);

}
