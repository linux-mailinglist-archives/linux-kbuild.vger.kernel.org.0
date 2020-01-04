Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D32A1302DA
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 16:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgADPDx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jan 2020 10:03:53 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:54704 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgADPDx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:53 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 004F2gcY018492;
        Sun, 5 Jan 2020 00:02:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 004F2gcY018492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578150168;
        bh=WZOgRtqxF0Kb4x0Cb5gHlA6M0SDhuMJyyQqpxtV4EQo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wev/N8AAp5/DD4da/QsUTYbx8iXUNMjbJkMfmgPPBQZZlwqeGuepRFZFW4VtMD382
         shjSHWL3l0fAzWs8aQxVCGyDwLU6jSA2H78QVyovy4NDHq+50OG1uCoz4yXd+LCTHJ
         rFfRD91rahAw0I54+4NR7m9GhWgVQIXpRHKQoAbtZcaqlS0rJz7cz5I+beTQodz8gz
         voM3hq2yITOpzQYa0YlwHbqoBcwFpSYu3bx1XUmaBvPbW7+qyaqD5sBZfIB+vcrnsz
         HXoDFMmQ1MhsoRj8thmxlCiWgHkZu1zoEYIRN2YJgdRhk2sIZFoApmJ+TJWCBzE4X8
         OcEThb3g0c6EA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/13] initramfs: specify $(src)/gen_initramfs.sh as a prerequisite in Makefile
Date:   Sun,  5 Jan 2020 00:02:33 +0900
Message-Id: <20200104150238.19834-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Specify the dependency directly in the Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 usr/Makefile         | 7 +++----
 usr/gen_initramfs.sh | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/usr/Makefile b/usr/Makefile
index e44a66b8c051..7df6559f0f30 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -24,7 +24,6 @@ $(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
 # Generate the initramfs cpio archive
 
 hostprogs-y := gen_init_cpio
-initramfs   := $(CONFIG_SHELL) $(srctree)/$(src)/gen_initramfs.sh
 ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
 			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
 ramfs-args  := \
@@ -40,7 +39,7 @@ ifneq ($(wildcard $(obj)/$(datafile_d_y)),)
 endif
 
 quiet_cmd_initfs = GEN     $@
-      cmd_initfs = $(initramfs) -o $@ $(ramfs-args) $(ramfs-input)
+      cmd_initfs = $< -o $@ $(ramfs-args) $(ramfs-input)
 
 targets := $(datafile_y)
 
@@ -52,8 +51,8 @@ $(deps_initramfs): ;
 # 2) There are changes in which files are included (added or deleted)
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) Arguments to gen_initramfs.sh changes
-$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) FORCE
-	$(Q)$(initramfs) -l $(ramfs-input) > $(obj)/$(datafile_d_y)
+$(obj)/$(datafile_y): $(src)/gen_initramfs.sh $(obj)/gen_init_cpio $(deps_initramfs) FORCE
+	$(Q)$< -l $(ramfs-input) > $(obj)/$(datafile_d_y)
 	$(call if_changed,initfs)
 
 subdir-$(CONFIG_UAPI_HEADER_TEST) += include
diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 1fd93414fb37..68b6ddfd5f96 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -235,7 +235,7 @@ arg="$1"
 case "$arg" in
 	"-l")	# files included in initramfs - used by kbuild
 		dep_list="list_"
-		echo "deps_initramfs := $0 \\"
+		echo "deps_initramfs := \\"
 		shift
 		;;
 	"-o")	# generate compressed cpio image named $1
-- 
2.17.1

