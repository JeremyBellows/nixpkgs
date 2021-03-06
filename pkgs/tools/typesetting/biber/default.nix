{ stdenv, fetchFromGitHub, buildPerlModule, autovivification, BusinessISBN
, BusinessISMN, BusinessISSN, ConfigAutoConf, DataCompare, DataDump, DateSimple
, DateTime, DateTimeFormatBuilder, DateTimeCalendarJulian
, EncodeEUCJPASCII, EncodeHanExtra, EncodeJIS2K, ExtUtilsLibBuilder
, FileSlurp, IPCRun3, Log4Perl, LWPProtocolHttps, ListAllUtils, ListMoreUtils
, MozillaCA, ReadonlyXS, RegexpCommon, TextBibTeX, UnicodeCollate
, UnicodeLineBreak, URI, XMLLibXMLSimple, XMLLibXSLT, XMLWriter, ClassAccessor
, TextCSV, TextRoman, DataUniqid, LinguaTranslit, UnicodeNormalize, SortKey }:

buildPerlModule rec {
  name = "biber-${version}";
  version = "2.7";
  src = fetchFromGitHub {
    owner = "plk";
    repo = "biber";
    rev = "v${version}";
    sha256 = "04jmsh59g2s0b61rm25z0hwb6yliqyh5gjs4y74va93d2b9mrd17";
  };

  buildInputs = [
    autovivification BusinessISBN BusinessISMN BusinessISSN ConfigAutoConf
    DataCompare DataDump DateSimple EncodeEUCJPASCII EncodeHanExtra EncodeJIS2K
    DateTime DateTimeFormatBuilder DateTimeCalendarJulian
    ExtUtilsLibBuilder FileSlurp IPCRun3 Log4Perl LWPProtocolHttps ListAllUtils
    ListMoreUtils MozillaCA ReadonlyXS RegexpCommon TextBibTeX
    UnicodeCollate UnicodeLineBreak URI XMLLibXMLSimple XMLLibXSLT XMLWriter
    ClassAccessor TextCSV TextRoman DataUniqid LinguaTranslit UnicodeNormalize SortKey
  ];

  # Tests seem to be broken
  doCheck = false;

  postUnpack = ''
    sed '1s/env perl/perl/' -i */bin/biber
  '';

  meta = {
    description = "Backend for BibLaTeX";
    license = with stdenv.lib.licenses; [ artistic1 gpl1Plus ];
    platforms = stdenv.lib.platforms.unix;
    maintainers = [ stdenv.lib.maintainers.ttuegel ];
  };
}
