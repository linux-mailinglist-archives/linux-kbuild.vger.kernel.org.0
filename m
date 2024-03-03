Return-Path: <linux-kbuild+bounces-1140-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789ED86F8B5
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAE281C209CE
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75C519A;
	Mon,  4 Mar 2024 02:53:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61617C9
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520822; cv=none; b=bgzTRw0522Gyzsw8hYYKpxlKdk0jFIBqeeYq6crmbx4k8FBsYxBr0kTDssOmUZyESRmaFJI384TMv/D55SYz8NeDDO9n8FC19GjEzhU6e+GRjDRQPQTf02ZxsMZPL9kbZPaXlgDqmoJhzBNSy1eYqR1EtI4oZWg9QfWLGFoilTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520822; c=relaxed/simple;
	bh=ru3fH0Y7Cv9FOf8ERv0e30bvaj+Xr4P698eKYzNffJ4=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=H8dP+nmtwia5iDaIfwoy1FW4gKYd2HsTb6V24kfuxPj5ATxjelsuIyCy4J3DGpCwFcQJPT7Q4mlVavhXoar8qMdpmmiC4oBJYRw2nazyYGwx+w7oBlRGDI8U5uP9G5sar9ls+rCuUH3doBh3lQFGxofapTl/Tr947tuo7XCWMXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242rJjp022195
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:53:25 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242rJ3u022194;
	Sun, 3 Mar 2024 18:53:19 -0800 (PST)
	(envelope-from ehem)
Message-Id: <87d95fd7abd1449477cba6d9fc201fd4eedd7df5.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 15:24:50 -0800
Subject: [WIP PATCH 30/30] tools/build: modify uses of $(objtree) to assume
 trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
X-Spam-Level: *
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Date: Tue, 20 Feb 2024 09:13:37 -0800

This isn't much more than `find | sed` to adjust all uses of $(objtree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:
find . -name Makefile\* -print0 | xargs -0 sed -i -e's,$(objtree)$,$(objtree:%/=%),' -e's,$(objtree)\([^,/]\),$(objtree:%/=%)\1,g' -es',$(objtree)/,$(objtree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 tools/perf/Makefile.perf                | 2 +-
 tools/testing/selftests/nolibc/Makefile | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 626b07d34c9f..a347500f50b6 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -150,7 +150,7 @@ srctree := $(dir $(srctree:%/=%))
 endif
 
 ifneq ($(objtree),)
-#$(info Determined 'objtree' to be $(objtree))
+#$(info Determined 'objtree' to be $(objtree:%/=%))
 endif
 
 ifneq ($(OUTPUT),)
diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 99eebfb35468..82e8d3478639 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -65,7 +65,7 @@ IMAGE_ppc64le    = arch/powerpc/boot/zImage
 IMAGE_riscv      = arch/riscv/boot/Image
 IMAGE_s390       = arch/s390/boot/bzImage
 IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
-IMAGE            = $(objtree)$(IMAGE_$(XARCH))
+IMAGE            = $(objtree:%/=%)$(IMAGE_$(XARCH))
 IMAGE_NAME       = $(notdir $(IMAGE))
 
 # default kernel configurations that appear to be usable
@@ -230,7 +230,7 @@ run-user: nolibc-test
 	$(Q)$(REPORT) $(CURDIR)/run.out
 
 initramfs.cpio: kernel nolibc-test
-	$(QUIET_GEN)echo 'file /init nolibc-test 755 0 0' | $(objtree)usr/gen_init_cpio - > initramfs.cpio
+	$(QUIET_GEN)echo 'file /init nolibc-test 755 0 0' | $(objtree:%/=%)usr/gen_init_cpio - > initramfs.cpio
 
 initramfs: nolibc-test
 	$(QUIET_MKDIR)mkdir -p initramfs
@@ -240,7 +240,7 @@ initramfs: nolibc-test
 defconfig:
 	$(Q)$(MAKE) -C $(srctree:%/=%) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
 	$(Q)if [ -n "$(EXTRACONFIG)" ]; then \
-		$(srctree)scripts/config --file $(objtree)/.config $(EXTRACONFIG); \
+		$(srctree)scripts/config --file $(objtree).config $(EXTRACONFIG); \
 		$(MAKE) -C $(srctree:%/=%) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) olddefconfig < /dev/null; \
 	fi
 
-- 
2.39.2


