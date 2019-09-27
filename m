Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9820C0E52
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2019 01:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfI0Xad (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 19:30:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:9728 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbfI0Xac (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 19:30:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Sep 2019 16:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,557,1559545200"; 
   d="scan'208";a="196870260"
Received: from jekeller-desk.amr.corp.intel.com ([10.166.244.172])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Sep 2019 16:30:31 -0700
From:   Jacob Keller <jacob.e.keller@intel.com>
To:     <linux-kbuild@vger.kernel.org>
Cc:     Jacob Keller <jacob.e.keller@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] namespace: fix namespace.pl script to support relative paths
Date:   Fri, 27 Sep 2019 16:30:27 -0700
Message-Id: <20190927233027.30208-1-jacob.e.keller@intel.com>
X-Mailer: git-send-email 2.23.0.245.gf157bbb9169d
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The namespace.pl script does not work properly if objtree is not set to
an absolute path. The do_nm function is run from within the find
function, which changes directories.

Because of this, appending objtree, $File::Find::dir, and $source, will
return a path which is not valid from the current directory.

This used to work when objtree was set to an absolute path when using
"make namespacecheck". It appears to have not worked when calling
./scripts/namespace.pl directly.

This behavior was changed in 7e1c04779efd ("kbuild: Use relative path
for $(objtree)", 2014-05-14)

Rather than fixing the Makefile to set objtree to an absolute path, just
fix namespace.pl to work when srctree and objtree are relative. Also fix
the script to use an absolute path for these by default.

Use the File::Spec module for this purpose. It's been part of perl
5 since 5.005.

The curdir() function is used to get the current directory when the
objtree and srctree aren't set in the environment.

rel2abs() is used to convert possibly relative objtree and srctree
environment variables to absolute paths.

Finally, the catfile() function is used instead of string appending
paths together, since this is more robust when joining paths together.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 scripts/namespace.pl | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/namespace.pl b/scripts/namespace.pl
index 6135574a6f39..1da7bca201a4 100755
--- a/scripts/namespace.pl
+++ b/scripts/namespace.pl
@@ -65,13 +65,14 @@
 use warnings;
 use strict;
 use File::Find;
+use File::Spec;
 
 my $nm = ($ENV{'NM'} || "nm") . " -p";
 my $objdump = ($ENV{'OBJDUMP'} || "objdump") . " -s -j .comment";
-my $srctree = "";
-my $objtree = "";
-$srctree = "$ENV{'srctree'}/" if (exists($ENV{'srctree'}));
-$objtree = "$ENV{'objtree'}/" if (exists($ENV{'objtree'}));
+my $srctree = File::Spec->curdir();
+my $objtree = File::Spec->curdir();
+$srctree = File::Spec->rel2abs($ENV{'srctree'}) if (exists($ENV{'srctree'}));
+$objtree = File::Spec->rel2abs($ENV{'objtree'}) if (exists($ENV{'objtree'}));
 
 if ($#ARGV != -1) {
 	print STDERR "usage: $0 takes no parameters\n";
@@ -231,9 +232,9 @@ sub do_nm
 	}
 	($source = $basename) =~ s/\.o$//;
 	if (-e "$source.c" || -e "$source.S") {
-		$source = "$objtree$File::Find::dir/$source";
+		$source = File::Spec->catfile($objtree, $File::Find::dir, $source)
 	} else {
-		$source = "$srctree$File::Find::dir/$source";
+		$source = File::Spec->catfile($srctree, $File::Find::dir, $source)
 	}
 	if (! -e "$source.c" && ! -e "$source.S") {
 		# No obvious source, exclude the object if it is conglomerate
-- 
2.23.0.245.gf157bbb9169d

