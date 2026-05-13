Return-Path: <linux-kbuild+bounces-13143-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIAhMCjoBGqnQQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13143-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 23:07:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A953AD46
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 23:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B1EE30B392E
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 21:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8F125B09D;
	Wed, 13 May 2026 21:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eD4ADo1j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9ED3955CB
	for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 21:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706217; cv=none; b=AcQmI9MThu1xgabkjYpuhVb+Y7n+HDm+rzQHrUEEPt4Q1Pl08HjktUY1vu8NChtv8fyhkwAgkHvr1WI+Jgy5xkE4qmsyLWkhr5apWu9SrMn22AX5G1c4byf54UWPaM1mqmywB+GEbkTLCHn3Urz+RVlSlpVOcQjXraRPLQEyLg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706217; c=relaxed/simple;
	bh=0e1yJML1TJvm0ZulXQxPmNXNmFSDM6RWyO9raFITnCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lYIzILL3hnxhzg4fED2/deC9DNdD9XdYQ7ziTWOfTPUDfEQQZRCmou1n+XKabGLcJZ7d7e7VwqhNAiN3EEPg5/DCUP4uqwD7Vmzp3ghy6qimP8Un4Tfn5V8qe3gdFEfdV8etMoE+LoHR8ZNyXcTczBHdOp9SaeS5mGxbc33RQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eD4ADo1j; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778706213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rmC5bwo7mTze0DC/qjO8EoqSZ0cR0mmBL07lKy63gnU=;
	b=eD4ADo1jcZyBTb98xbN27zXmpZLg8laTppgvRzcEu3qZoGh8IyWSdpVKO32C/rY0OawF7I
	chaXbXlwga+eYFayeR3Mn48DtYXxQ5Gq+Y4+v+49VYqeLBHC9Y6TjTlGxhsr6r+0hIQVOl
	aC5X4mcx3pM8qgappXaocVf05WLtTN0=
From: Andrew Jones <andrew.jones@linux.dev>
To: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: nathan@kernel.org,
	nsc@kernel.org,
	andriy.shevchenko@linux.intel.com
Subject: [PATCH] kconfig: add kconfig-sym-check static checker
Date: Wed, 13 May 2026 16:03:29 -0500
Message-ID: <20260513210329.637892-1-andrew.jones@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 264A953AD46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13143-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.jones@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Action: no action

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
---
 Makefile                             |  7 ++-
 scripts/kconfig/kconfig-sym-check.pl | 93 ++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100755 scripts/kconfig/kconfig-sym-check.pl

diff --git a/Makefile b/Makefile
index fc2d94aafb45..5a0a9f9d6169 100644
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
@@ -1806,6 +1807,7 @@ help:
 	@echo  '  includecheck    - Check for duplicate included header files'
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@echo  '  coccicheck      - Check with Coccinelle'
+	@echo  '  kconfig-sym-check - Check for dangling Kconfig symbol references'
 	@echo  '  clang-analyzer  - Check with clang static analyzer'
 	@echo  '  clang-tidy      - Check with clang-tidy'
 	@echo  ''
@@ -2227,7 +2229,7 @@ endif
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
-PHONY += includecheck versioncheck coccicheck
+PHONY += includecheck versioncheck coccicheck kconfig-sym-check
 
 includecheck:
 	find $(srctree)/* $(RCS_FIND_IGNORE) \
@@ -2242,6 +2244,9 @@ versioncheck:
 coccicheck:
 	$(Q)$(BASH) $(srctree)/scripts/$@
 
+kconfig-sym-check:
+	$(Q)cd $(srctree) && $(PERL) scripts/kconfig/kconfig-sym-check.pl $(KCONFIG_SYM_CHECK_EXCLUDES)
+
 PHONY += checkstack kernelrelease kernelversion image_name
 
 # UML needs a little special treatment here.  It wants to use the host
diff --git a/scripts/kconfig/kconfig-sym-check.pl b/scripts/kconfig/kconfig-sym-check.pl
new file mode 100755
index 000000000000..a6907e585962
--- /dev/null
+++ b/scripts/kconfig/kconfig-sym-check.pl
@@ -0,0 +1,93 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+
+use warnings;
+use strict;
+
+my $kconfig_sym_check_excludes = undef;
+$kconfig_sym_check_excludes = $ARGV[0] if (defined $ARGV[0]);
+
+my @files = `git ls-files '*Kconfig*'`;
+my %configs = ();
+my %refs = ();
+
+foreach my $file (<@files>) {
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
+		my $comment_idx = index $_, "#";
+		if ($comment_idx != -1) {
+			$_ = substr $_, 0, $comment_idx;
+		}
+
+		if (/^\s*(default|def_bool|def_tristate|select|depends\s+on|imply|visible\s+if|range|if)\s+(.+)\s*$/) {
+			my $s = $2;
+			$s =~ s/\$\(.*\)//g;
+			$s =~ s/'[^']*'//g;
+			$s =~ s/"[^"]*"//g;
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


