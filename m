Return-Path: <linux-kbuild+bounces-129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C277F5901
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 08:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 958A3B20C70
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 07:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E1C156E6;
	Thu, 23 Nov 2023 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJANAcqJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2742915AD0
	for <linux-kbuild@vger.kernel.org>; Thu, 23 Nov 2023 07:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5023C433C7;
	Thu, 23 Nov 2023 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700723924;
	bh=o6yyNvYxe2T/DPjfVyBDtP8DgRNYyj26Jx6smGQqn2I=;
	h=From:To:Cc:Subject:Date:From;
	b=vJANAcqJEEQVLC091ZNgaWwnguY6ty3nlnqE5ETGJKtClUWUO0ueZPqjvx6xmUm2V
	 Y5VAL4r6R2bSM8YrVylCsHqIjv6c6SCWsZaLEDjvnZDglb+e9dr0ZDuU9MIVAbilNg
	 xKg+WRZbymzVLe7QR1TmFBb8mBsoA9l8lbzVegWWZWKIjf9iRW0+qu3Z6HDqMRPlz8
	 U3eaDVbvzd/+DiFgr01Uj2CHqxDTfEPhT4/iuh/tkda9D9Il5DAhubZ4hd9RB41+2e
	 MjI5zOKD+YxtJNvOlKeQmzZA4ErWls4KLYsx0mg9reE/vsfc7RvOBrd9lyrnwlyi5M
	 xzTgK+/p9fh2g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: remove the last use of old cmd_src_tar rule in packaging
Date: Thu, 23 Nov 2023 16:18:24 +0900
Message-Id: <20231123071824.476845-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rpm-pkg and deb-pkg targets have transitioned to using 'git archive'
for tarball creation.

Although the old cmd_src_tar is still used by snap-pkg, there is no need
to create a tarball solely for passing the source to snapcraft.

Instead, you can use 'source-type: local' to tell the source location to
snapcraft.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Note for reviewers/testers:

You cannot run 'make snap-pkg' on recent distributions, but you can use
Ubuntu 18.04, at least. To test this, you can run the ubuntu:18.04
Docker image, and excecute 'apt-get install snapcraft', and then
'make snap-pkg'. The generated kernel snap can be used for
Ubuntu Core 18.


 Makefile                           |  2 --
 scripts/Makefile.package           | 24 +-----------------------
 scripts/package/snapcraft.template |  2 +-
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/Makefile b/Makefile
index 724c79bebe72..f128a1a1b1a0 100644
--- a/Makefile
+++ b/Makefile
@@ -609,8 +609,6 @@ export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL KBUILD_RUSTFLAGS_KERNEL
 export RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o    \
 			  -name CVS -o -name .pc -o -name .hg -o -name .git \) \
 			  -prune -o
-export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn \
-			 --exclude CVS --exclude .pc --exclude .hg --exclude .git
 
 # ===========================================================================
 # Rules shared between *config targets and build targets
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 3addd1c0b989..3c38be77acf0 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -4,27 +4,6 @@
 include $(srctree)/scripts/Kbuild.include
 include $(srctree)/scripts/Makefile.lib
 
-KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
-# Include only those top-level files that are needed by make, plus the GPL copy
-TAR_CONTENT := Documentation LICENSES arch block certs crypto drivers fs \
-               include init io_uring ipc kernel lib mm net rust \
-               samples scripts security sound tools usr virt \
-               .config Makefile \
-               Kbuild Kconfig COPYING $(wildcard localversion*)
-
-quiet_cmd_src_tar = TAR     $(2).tar.gz
-      cmd_src_tar = \
-if test "$(objtree)" != "$(srctree)"; then \
-	echo >&2; \
-	echo >&2 "  ERROR:"; \
-	echo >&2 "  Building source tarball is not possible outside the"; \
-	echo >&2 "  kernel source tree. Don't set KBUILD_OUTPUT"; \
-	echo >&2; \
-	false; \
-fi ; \
-tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
-	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3)
-
 # Git
 # ---------------------------------------------------------------------------
 
@@ -157,9 +136,8 @@ snap-pkg:
 	rm -rf $(objtree)/snap
 	mkdir $(objtree)/snap
 	$(MAKE) clean
-	$(call cmd,src_tar,$(KERNELPATH))
 	sed "s@KERNELRELEASE@$(KERNELRELEASE)@; \
-		s@SRCTREE@$(shell realpath $(KERNELPATH).tar.gz)@" \
+		s@SRCTREE@$(abs_srctree)@" \
 		$(srctree)/scripts/package/snapcraft.template > \
 		$(objtree)/snap/snapcraft.yaml
 	cd $(objtree)/snap && \
diff --git a/scripts/package/snapcraft.template b/scripts/package/snapcraft.template
index 626d278e4a5a..85d5e07d1b40 100644
--- a/scripts/package/snapcraft.template
+++ b/scripts/package/snapcraft.template
@@ -10,5 +10,5 @@ parts:
   kernel:
     plugin: kernel
     source: SRCTREE
-    source-type: tar
+    source-type: local
     kernel-with-firmware: false
-- 
2.40.1


