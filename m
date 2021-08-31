Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C782F3FC3CE
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239993AbhHaHli (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:41:38 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:65506 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239866AbhHaHlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:37 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8EY031407;
        Tue, 31 Aug 2021 16:40:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8EY031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395613;
        bh=gtde256J50ftZQtK2OqrHTlVdVIQybTnWy4gJlyeXlU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tNHy0C6UFWsEmSastyIBp14t9TiUr47w8wDc0HTEimp2PSoaoMT4/sIr4SpZonf+8
         t7v/CcSfSmStCNzx3iZshcRpPH6E3EbZ4BYzIaYZ5FZbQbq9HHLzUQvvZ6J6K66T/8
         TS8rBVuDdaOHVaG/GeSPcMwsFE4zc0U7pmRnaXuhUbA01RD9K/mQcBUQc0RDXj23f8
         XX8II5FdyuL+HFU3adO+NqymmypLR+U2H/uxSXWuuqpo+CzqWufLQ76cXnrKdh31Y3
         DOAIb2mQ+1bNtCWbYT3EWiF6lRjgL8TrnL53Ra1Ad11EwfgwJWv01KSntyDlvxyKtp
         E0DLjJUbaKLEw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] kbuild: do not create built-in.a.symversions or lib.a.symversions
Date:   Tue, 31 Aug 2021 16:39:58 +0900
Message-Id: <20210831074004.3195284-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Merge all *.o.symversions in scripts/link-vmlinux.sh instead of
incrementally merging them in the unit of built-in.a or lib.a.

This is a preparation for further code cleanups.

The initial patch version was implemented in a shell script, but it
was slow due to the slowness of the 'cat' command [1]. This version
was implemented in Perl.

[1]: https://lore.kernel.org/lkml/CAK7LNATyNAu6sa-TT9JXy=BXr5d2Q5K-sp-mVXXtJDuJyi6_bA@mail.gmail.com/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build   | 10 ++------
 scripts/link-vmlinux.sh  |  9 ++-----
 scripts/merge-symvers.pl | 52 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 15 deletions(-)
 create mode 100644 scripts/merge-symvers.pl

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index afc906cd7256..3ad1b1227371 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -434,11 +434,8 @@ endif
 quiet_cmd_ar_builtin = AR      $@
       cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
 
-quiet_cmd_ar_and_symver = AR      $@
-      cmd_ar_and_symver = $(cmd_update_lto_symversions); $(cmd_ar_builtin)
-
 $(obj)/built-in.a: $(real-obj-y) FORCE
-	$(call if_changed,ar_and_symver)
+	$(call if_changed,ar_builtin)
 
 #
 # Rule to create modules.order file
@@ -458,11 +455,8 @@ $(obj)/modules.order: $(obj-m) FORCE
 #
 # Rule to compile a set of .o files into one .a file (with symbol table)
 #
-quiet_cmd_ar_lib = AR      $@
-      cmd_ar_lib = $(cmd_update_lto_symversions); $(cmd_ar)
-
 $(obj)/lib.a: $(lib-y) FORCE
-	$(call if_changed,ar_lib)
+	$(call if_changed,ar)
 
 # NOTE:
 # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index d74cee5c4326..0cc6a03f2cb1 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -57,13 +57,8 @@ gen_initcalls()
 gen_symversions()
 {
 	info GEN .tmp_symversions.lds
-	rm -f .tmp_symversions.lds
-
-	for o in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
-		if [ -f ${o}.symversions ]; then
-			cat ${o}.symversions >> .tmp_symversions.lds
-		fi
-	done
+	${PERL} scripts/merge-symvers.pl -a ${AR} -o .tmp_symversions.lds \
+		${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}
 }
 
 # Link of vmlinux.o used for section mismatch analysis
diff --git a/scripts/merge-symvers.pl b/scripts/merge-symvers.pl
new file mode 100644
index 000000000000..0bd092d24eff
--- /dev/null
+++ b/scripts/merge-symvers.pl
@@ -0,0 +1,52 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0-only
+
+use autodie;
+use strict;
+use warnings;
+use Getopt::Long 'GetOptions';
+
+my $ar;
+my $output;
+
+GetOptions(
+	'a|ar=s' => \$ar,
+	'o|output=s'  => \$output,
+);
+
+# Collect all objects
+my @objects;
+
+foreach (@ARGV) {
+	if (/\.o$/) {
+		# Some objects (head-y) are linked to vmlinux directly.
+		push(@objects, $_);
+	} elsif (/\.a$/) {
+		# Most of built-in objects are contained in built-in.a or lib.a.
+		# Use 'ar -t' to get the list of the contained objects.
+		$_ = `$ar -t $_`;
+		push(@objects, split(/\n/));
+	} else {
+		die "$_: unknown file type\n";
+	}
+}
+
+open(my $out_fh, '>', "$output");
+
+foreach (@objects) {
+	# The symbol CRCs for foo/bar/baz.o is output to foo/bar/baz.o.symversions
+	s/(.*)/$1.symversions/;
+
+	if (! -e $_) {
+		# .symversions does not exist if the object does not contain
+		# EXPORT_SYMBOL at all. Skip it.
+		next;
+	}
+
+	open(my $in_fh, '<', "$_");
+	# Concatenate all the existing *.symversions files.
+	print $out_fh do { local $/; <$in_fh> };
+	close $in_fh;
+}
+
+close $out_fh;
-- 
2.30.2

