Return-Path: <linux-kbuild+bounces-5053-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16D9EAB0A
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 09:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 267021666E5
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 08:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AB0230D1D;
	Tue, 10 Dec 2024 08:52:19 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9721230D08
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Dec 2024 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733820739; cv=none; b=SD710yq8Kd48NjX4yEzYaVWvbAR8HkULxbpGSGmbn5Qw4htB88zLbossbmmq8DcJC2DJwnZQ+hzrmPxOeDZ8Z6Pqo4ZOc28eg7hXlHa39glSnuxHNSBbJUIyTVsnUIopc9aEvVbbw4hIvWCT8zMMBsmTxFe/GJthvnHvAbW8gFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733820739; c=relaxed/simple;
	bh=hr0TPaCGw3LhKmhIDpLsXe/y8JIpZV+C5LY9aLrSB/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C4i4hVH9wA5KE6LirFyFq4zH7iG827ssj2SMqcDKwBuxt+yBhPAcPcu6d3K8xutHuInAELsm7qVEsPlQ6Naxr14N4qKzlxlDPI9NRHkcwYrQSeOigrMn3dZWC0zYSqUoITSpAjkiImWnl8bn3dvzogBL9LyH12brieV6tN+xGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:bf13:4c3:373e:7260])
	by laurent.telenet-ops.be with cmsmtp
	id mws72D00K3K2VbF01ws7Kj; Tue, 10 Dec 2024 09:52:08 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tKvyP-000eT0-U3;
	Tue, 10 Dec 2024 09:52:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tKvyR-009nZb-5C;
	Tue, 10 Dec 2024 09:52:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] kbuild: Drop architecture argument from headers_check.pl
Date: Tue, 10 Dec 2024 09:52:05 +0100
Message-Id: <168b2cb09f09ec3cead8a6b1e726ac76f5d06171.1733820553.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 7ff0fd4a9e20cf73 ("kbuild: drop support for
include/asm-<arch> in headers_check.pl"), the second argument $arch is
no longer used, hence drop it.

Reported-by: Masahiro Yamada <masahiroy@kernel.org>
Closes: https://lore.kernel.org/CAK7LNARNa3NPSeRAUgMaEqWiA+C6-s1PxRe1bCUJg6zLyOtDkA@mail.gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Commit 7ff0fd4a9e20cf73 is part of the mm tree.

 usr/include/Makefile         | 2 +-
 usr/include/headers_check.pl | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 771e32872b2ab12d..6c6de1b1622b1a69 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -78,7 +78,7 @@ quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null \
 			$(if $(filter-out $(no-header-test), $*.h), -include $< -include $<); \
-		$(PERL) $(src)/headers_check.pl $(obj) $(SRCARCH) $<; \
+		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(obj)/%.h FORCE
diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index 7070c891ea294b4d..2b70bfa5558e6451 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -3,9 +3,8 @@
 #
 # headers_check.pl execute a number of trivial consistency checks
 #
-# Usage: headers_check.pl dir arch [files...]
+# Usage: headers_check.pl dir [files...]
 # dir:   dir to look for included files
-# arch:  architecture
 # files: list of files to check
 #
 # The script reads the supplied files line by line and:
@@ -23,7 +22,7 @@ use warnings;
 use strict;
 use File::Basename;
 
-my ($dir, $arch, @files) = @ARGV;
+my ($dir, @files) = @ARGV;
 
 my $ret = 0;
 my $line;
-- 
2.34.1


