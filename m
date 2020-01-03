Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4F4312FC02
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 19:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgACSAv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 13:00:51 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:16481 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbgACSAi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 13:00:38 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 003HxSJA022724;
        Sat, 4 Jan 2020 02:59:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 003HxSJA022724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578074374;
        bh=flhc+DXSbGVbPkljWVMNT8R6yI5s96NQRo/2c6fDjQ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nCJ1ZnVklvR8HI7xSyBYN2JrInwTEMaZbdLUEIELQatENREBUm/PHgNtRHuTbTbUa
         fW7jdb3T+kUganCSAbaV7cQsYxaz114BF6v5LRabpeQgq+FHa+N+2TQZU4+D8HNMrL
         /WOXkKfBiBILEVSS4hkUim9bMVxjKQ8y1j4Gv1D1HDP2MwSI3jqgzU2waGu4wa79vP
         4WZ+rrJmWc/pBBymDe4e28ElKJEGuCJlcYuJJJ/9Klix/xsO9KkezlMYSKsMdmcQ1n
         w0DaBSdGolww/2MKWv3yy8InaB740hko2WxwKq1RTnIamR1Iet+pFqc36ZZa+aV8RE
         35zBYJaTHvUAg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] initramfs: add default_cpio_list, and delete -d option support
Date:   Sat,  4 Jan 2020 02:59:12 +0900
Message-Id: <20200103175915.26663-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When CONFIG_INITRAMFS_SOURCE is empty, the Makefile passes the -d
option to gen_initramfs.sh to create the default initramfs, which
contains /dev, /dev/console, and /root.

This simplify the default behavior; remove the -d option, and
add the default cpio list.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/Makefile          |  2 +-
 usr/default_cpio_list |  6 ++++++
 usr/gen_initramfs.sh  | 16 ----------------
 3 files changed, 7 insertions(+), 17 deletions(-)
 create mode 100644 usr/default_cpio_list

diff --git a/usr/Makefile b/usr/Makefile
index 3ae8b45bfc61..9256a5b189ee 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -25,7 +25,7 @@ $(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
 
 hostprogs-y := gen_init_cpio
 ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
-			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
+			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),$(srctree)/$(src)/default_cpio_list)
 ramfs-args  := \
         $(if $(CONFIG_INITRAMFS_ROOT_UID), -u $(CONFIG_INITRAMFS_ROOT_UID)) \
         $(if $(CONFIG_INITRAMFS_ROOT_GID), -g $(CONFIG_INITRAMFS_ROOT_GID))
diff --git a/usr/default_cpio_list b/usr/default_cpio_list
new file mode 100644
index 000000000000..37b3864066e8
--- /dev/null
+++ b/usr/default_cpio_list
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# This is a very simple, default initramfs
+
+dir /dev 0755 0 0
+nod /dev/console 0600 0 0 c 5 1
+dir /root 0700 0 0
diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 49a4e22147b5..e6808a8c3b2b 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -28,7 +28,6 @@ $0 [-o <file>] [-l <dep_list>] [-u <uid>] [-g <gid>] {-d | <cpio_source>} ...
 	<cpio_source>  File list or directory for cpio archive.
 		       If <cpio_source> is a .cpio file it will be used
 		       as direct input to initramfs.
-	-d             Output the default cpio list.
 
 All options except -o and -l may be repeated and are interpreted
 sequentially and immediately.  -u and -g states are preserved across
@@ -43,18 +42,6 @@ field() {
 	shift $1 ; echo $1
 }
 
-default_initramfs() {
-	cat <<-EOF >> ${output}
-		# This is a very simple, default initramfs
-
-		dir /dev 0755 0 0
-		nod /dev/console 0600 0 0 c 5 1
-		dir /root 0700 0 0
-		# file /kinit usr/kinit/kinit 0755 0 0
-		# slink /init kinit 0755 0 0
-	EOF
-}
-
 filetype() {
 	local argv1="$1"
 
@@ -263,9 +250,6 @@ while [ $# -gt 0 ]; do
 			[ "$root_gid" = "-1" ] && root_gid=$(id -g || echo 0)
 			shift
 			;;
-		"-d")	# display default initramfs list
-			default_initramfs
-			;;
 		"-h")
 			usage
 			exit 0
-- 
2.17.1

