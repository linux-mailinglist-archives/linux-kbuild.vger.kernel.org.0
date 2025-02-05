Return-Path: <linux-kbuild+bounces-5638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A5CA2967D
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 17:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4E3169FB1
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 16:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCF41DAC95;
	Wed,  5 Feb 2025 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbvcBD9P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09AC18A6BA;
	Wed,  5 Feb 2025 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738773604; cv=none; b=sE/9Bv2l+/DYoABFQ4e5UEhNE7MK1eGRc+HWlo2ao+CSGzLLBAETtJn3lN0/sJxofGy2DARSZrrrpc7+KN1MLGI0c8hoSrBfvE2YX17BCxMILPSbWyO3s7oxdOFtu1w0+ktsVtY9Yab5O1XNwVYTQgFNlbgPJtVGtwe8Hly0QpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738773604; c=relaxed/simple;
	bh=MW6+C14jG5Esc0YVeTcbxaytpn8rmcNZfT7WdMxypH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FWV3hSludjnqUw+SG3fw04G1uB0UsUqTVYX+21gTOTskq3YUdu35BDLaVBVHXEkxsXZHiO1Jm3/MZOC0mQT0yC+mF4S8ukZsXKsgLSrpY1JrCpMhwNn5AS7WnVQr4ECM4iW6/OkO7eXp62TvZNfIvUjNdM/CRCSNaCb5K/TsDF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbvcBD9P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8713C4CED1;
	Wed,  5 Feb 2025 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738773603;
	bh=MW6+C14jG5Esc0YVeTcbxaytpn8rmcNZfT7WdMxypH0=;
	h=From:To:Cc:Subject:Date:From;
	b=PbvcBD9Pf48kjdmaunVfRm5HfKlG94YQkySYFmcKEhQpOV8dCfiq95QnAkj9au0Fn
	 qCfVZYKf/+eMX18ZVyLZO76EaNqPNah3h528mNHT2F+rdGXDJZS8Af5hkSC4C7GKVY
	 sB+0eIWiot4fXMhgWYAhlHq5rrh3tHqowXBvBislvgq99/FtqstgQtfATnrZ4HCs+o
	 nZd9/vC1IP/LdePUmr25n/DfoURISrwDg4u7AZzvS5ryahUDsrDZFjskBhPz3d0Z8f
	 n5znAHDlLKTZiA/q5Xj0JMaToeCmvdgTR620uvPOqs5rzUO3SFIQSWghvvbAJN3IXQ
	 DdgVNuKto18Lw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-doc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH] kbuild: remove EXTRA_*FLAGS support
Date: Thu,  6 Feb 2025 01:39:38 +0900
Message-ID: <20250205163939.3464137-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f77bf01425b1 ("kbuild: introduce ccflags-y, asflags-y and
ldflags-y") deprecated these in 2007. The migration should have been
completed by now.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/dev-tools/checkpatch.rst | 18 ------------------
 Documentation/kbuild/makefiles.rst     |  3 ---
 scripts/Makefile.build                 |  4 ----
 scripts/Makefile.lib                   |  5 -----
 scripts/checkpatch.pl                  | 14 --------------
 5 files changed, 44 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index abb3ff682076..76bd0ddb0041 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -342,24 +342,6 @@ API usage
 
     See: https://www.kernel.org/doc/html/latest/RCU/whatisRCU.html#full-list-of-rcu-apis
 
-  **DEPRECATED_VARIABLE**
-    EXTRA_{A,C,CPP,LD}FLAGS are deprecated and should be replaced by the new
-    flags added via commit f77bf01425b1 ("kbuild: introduce ccflags-y,
-    asflags-y and ldflags-y").
-
-    The following conversion scheme maybe used::
-
-      EXTRA_AFLAGS    ->  asflags-y
-      EXTRA_CFLAGS    ->  ccflags-y
-      EXTRA_CPPFLAGS  ->  cppflags-y
-      EXTRA_LDFLAGS   ->  ldflags-y
-
-    See:
-
-      1. https://lore.kernel.org/lkml/20070930191054.GA15876@uranus.ravnborg.org/
-      2. https://lore.kernel.org/lkml/1313384834-24433-12-git-send-email-lacombar@gmail.com/
-      3. https://www.kernel.org/doc/html/latest/kbuild/makefiles.html#compilation-flags
-
   **DEVICE_ATTR_FUNCTIONS**
     The function names used in DEVICE_ATTR is unusual.
     Typically, the store and show functions are used with <attr>_store and
diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index d36519f194dc..25e04e47faff 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -318,9 +318,6 @@ ccflags-y, asflags-y and ldflags-y
   These three flags apply only to the kbuild makefile in which they
   are assigned. They are used for all the normal cc, as and ld
   invocations happening during a recursive build.
-  Note: Flags with the same behaviour were previously named:
-  EXTRA_CFLAGS, EXTRA_AFLAGS and EXTRA_LDFLAGS.
-  They are still supported but their usage is deprecated.
 
   ccflags-y specifies options for compiling with $(CC).
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 993708d11874..a59650ba140b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -20,10 +20,6 @@ always-m :=
 targets :=
 subdir-y :=
 subdir-m :=
-EXTRA_AFLAGS   :=
-EXTRA_CFLAGS   :=
-EXTRA_CPPFLAGS :=
-EXTRA_LDFLAGS  :=
 asflags-y  :=
 ccflags-y  :=
 rustflags-y :=
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index ad55ef201aac..20d77bfd0d72 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -1,9 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-# Backward compatibility
-asflags-y  += $(EXTRA_AFLAGS)
-ccflags-y  += $(EXTRA_CFLAGS)
-cppflags-y += $(EXTRA_CPPFLAGS)
-ldflags-y  += $(EXTRA_LDFLAGS)
 
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b28ad331742..8f70bedc18be 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3689,20 +3689,6 @@ sub process {
 			}
 		}
 
-		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
-		    ($line =~ /\+(EXTRA_[A-Z]+FLAGS).*/)) {
-			my $flag = $1;
-			my $replacement = {
-				'EXTRA_AFLAGS' =>   'asflags-y',
-				'EXTRA_CFLAGS' =>   'ccflags-y',
-				'EXTRA_CPPFLAGS' => 'cppflags-y',
-				'EXTRA_LDFLAGS' =>  'ldflags-y',
-			};
-
-			WARN("DEPRECATED_VARIABLE",
-			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
-		}
-
 # check for DT compatible documentation
 		if (defined $root &&
 			(($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*compatible\s*=\s*\"/) ||
-- 
2.43.0


