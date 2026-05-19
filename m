Return-Path: <linux-kbuild+bounces-13281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGMbKgHdDGp5owUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13281-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 23:58:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 790EB5855A4
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 23:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADA8C3050EA0
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 21:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8783D3EC2EB;
	Tue, 19 May 2026 21:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XiTrhhGn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3403DF00B
	for <linux-kbuild@vger.kernel.org>; Tue, 19 May 2026 21:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779227902; cv=none; b=ggY3wS5fer/83NHxKfD5lm/RvU15N2hmlhckA8T4WqvZ5dpIXqRk0pYplICEiPjAjDVpjkzcQK4tWKf7hLXkgtsnO/+72lkxW+nyOmz6JeIfVEg7nKQR3uyvWomKFZdtu2jO0EuKKv+NUhyLF03VHUi2VWE84LCmn7T+YkKrv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779227902; c=relaxed/simple;
	bh=O76m9x95ybgxP6M6PHgexbLF1DdcN8mN1tXO3hy8lL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9UtlAqRupM3en6T0AnLpKNkWGs7/R+Qfpn8mBXfUwemfG5C3hIJZwMbXXhoNcmSdlEJ3QShd5qsOXgfDuuFqeWkbKfiNy0dYoMTbsPjr23z8GRwaDNcKbiknou7DmLijksLhWDSQp7tJkSkaeXnOwB3WDYyCgp3t5mdRcxPOTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XiTrhhGn; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779227898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y0e120dmylbFo+t9+HsasQpy/PPb563dhdsUNVHdkro=;
	b=XiTrhhGn364Qiz6mpExlUeSRTrmk9/r/mULX/dQYXifCCG+vZMwZX8znCySLlYGZ5X3pXC
	IqVHtmfVUpyrL8gFtfBLWXAD0xEB1MN4Hievry6sTu6bHvQXGVGHLR5dYNexq9iCIoSrr/
	Li6Z3td2gWE0zI0JLe7ZEN1DX+h+wzs=
From: Andrew Jones <andrew.jones@linux.dev>
To: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: nathan@kernel.org,
	nsc@kernel.org,
	andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org,
	julianbraha@gmail.com
Subject: [PATCH v2] kconfig: add kconfig-sym-check static checker
Date: Tue, 19 May 2026 16:58:04 -0500
Message-ID: <20260519215804.84025-1-andrew.jones@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13281-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,infradead.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.jones@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,linux.dev:dkim,infradead.org:email,intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 790EB5855A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add 'make kconfig-sym-check', a static checker that finds Kconfig
symbols referenced in expressions (select, depends on, default, etc.)
but never defined via config/menuconfig anywhere in the tree. New
dangling symbols are reported as errors (exit 1) unless they are
listed in an exclusion file, e.g.

 KCONFIG_SYM_CHECK_EXCLUDES=sym-check-excludes make kconfig-sym-check

The checker also warns about uppercase N/Y/M used as tristate literal
values following the same logic as checkpatch.

This new static checker is the script used for [1] with a few
improvements to avoid some false positives.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216748 [1]
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---

v2:
  - Added Andy's and Randy's tags
  - Accept srctree as first argument so the Makefile can drop 'cd $(srctree)' [Nathan]
  - Replace git ls-files with git+find fallback [Nathan and Andy]
  - Changes thanks to sashiko's review
    - strip quoted strings before inline comments to avoid '#' inside a string
    - use [^)]* instead of .* in macro strip regex to avoid greedy match
      eating tokens between adjacent $(macro) expansions

 Makefile                             |  7 +-
 scripts/kconfig/kconfig-sym-check.pl | 97 ++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100755 scripts/kconfig/kconfig-sym-check.pl

diff --git a/Makefile b/Makefile
index fbc67fcb6cdb..b86ccc1e08cd 100644
--- a/Makefile
+++ b/Makefile
@@ -293,6 +293,7 @@ version_h := include/generated/uapi/linux/version.h
 clean-targets := %clean mrproper cleandocs
 no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
+			 kconfig-sym-check \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
@@ -1811,6 +1812,7 @@ help:
 	@echo  '  includecheck    - Check for duplicate included header files'
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@echo  '  coccicheck      - Check with Coccinelle'
+	@echo  '  kconfig-sym-check - Check for dangling Kconfig symbol references'
 	@echo  '  clang-analyzer  - Check with clang static analyzer'
 	@echo  '  clang-tidy      - Check with clang-tidy'
 	@echo  ''
@@ -2232,7 +2234,7 @@ endif
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
-PHONY += includecheck versioncheck coccicheck
+PHONY += includecheck versioncheck coccicheck kconfig-sym-check
 
 includecheck:
 	find $(srctree)/* $(RCS_FIND_IGNORE) \
@@ -2247,6 +2249,9 @@ versioncheck:
 coccicheck:
 	$(Q)$(BASH) $(srctree)/scripts/$@
 
+kconfig-sym-check:
+	$(Q)$(PERL) $(srctree)/scripts/kconfig/kconfig-sym-check.pl $(srctree) $(KCONFIG_SYM_CHECK_EXCLUDES)
+
 PHONY += checkstack kernelrelease kernelversion image_name
 
 # UML needs a little special treatment here.  It wants to use the host
diff --git a/scripts/kconfig/kconfig-sym-check.pl b/scripts/kconfig/kconfig-sym-check.pl
new file mode 100755
index 000000000000..6bf32fb37929
--- /dev/null
+++ b/scripts/kconfig/kconfig-sym-check.pl
@@ -0,0 +1,97 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+
+use warnings;
+use strict;
+
+my $srctree = shift @ARGV;
+my $kconfig_sym_check_excludes = defined $ARGV[0] ? $ARGV[0] : undef;
+
+my @files = `git -C \Q$srctree\E ls-files '*Kconfig*' 2>/dev/null`;
+if (@files) {
+	chomp @files;
+	@files = map { "$srctree/$_" } @files;
+} else {
+	@files = `find \Q$srctree\E -name '*Kconfig*'`;
+	chomp @files;
+}
+
+my %configs = ();
+my %refs = ();
+
+foreach my $file (@files) {
+	open F, $file or die "Cannot open $file: $!";
+
+	my $help = 0;
+	my $help_level;
+	my $level;
+
+	while (<F>) {
+		chomp;
+
+		next if /^\s*$/;
+		next if /^\s*#/;
+
+		/^(\s*)/;
+		$level = length $1;
+
+		if ($help && $level < $help_level) {
+			$help = 0;
+		}
+
+		next if ($help);
+
+		if (/^\s*(help|\-\-\-help\-\-\-)$/) {
+			$help = 1;
+			$_ = <F>;
+			/^(\s*)/;
+			$help_level = length $1;
+			next;
+		}
+
+		if (/^\s*(config|menuconfig)\s+([a-zA-Z0-9_]+)\s*(#.*)?$/) {
+			$configs{$2}++;
+			next;
+		}
+
+		if (/^\s*(default|def_bool|def_tristate|select|depends\s+on|imply|visible\s+if|range|if)\s+(.+)\s*$/) {
+			my $s = $2;
+			$s =~ s/"[^"]*"//g;
+			$s =~ s/'[^']*'//g;
+			$s =~ s/#.*//;
+			$s =~ s/\$\([^)]*\)//g;
+			$s =~ s/%%[^%]*%%//g;
+			my @syms = split /[^a-zA-Z0-9_]+/, $s;
+			map {
+				$refs{$_}++ if (/[a-zA-Z]/ && $_ ne "if" && $_ ne "y" && $_ ne "n" && $_ ne "m" && !(/^0[xX]/ && !/[g-wy-zG-WY-Z]/));
+			} @syms
+		}
+	}
+
+	close F;
+}
+
+my %known_syms = ();
+if (defined $kconfig_sym_check_excludes) {
+	my $file = $kconfig_sym_check_excludes;
+	open F, $file or die "Cannot open $file: $!";
+	while (<F>) {
+		chomp;
+		next if /^\s*$/;
+		next if /^\s*#/;
+		$known_syms{$1}++ if (/^\s*([a-zA-Z0-9_]+)\s*(#.*)?$/);
+	}
+}
+
+my $ret = 0;
+foreach my $k (sort keys %refs) {
+	next if (exists $configs{$k} || exists $known_syms{$k});
+
+	print "$k";
+	print " - warning: '$k' is probably not what you want; Kconfig tristate literals are always lowercase ('n', 'y', 'm')" if ($k eq "N" || $k eq "Y" || $k eq "M");
+	print "\n";
+
+	$ret = 1;
+}
+
+exit $ret;
-- 
2.43.0


