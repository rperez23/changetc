#!/usr/bin/perl


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
      next;
    }

    #$txt =~ s/^01:/00:/;
    print OUTF ("$txt\n");
  }

  close(INF);
  close(OUTF);

}
