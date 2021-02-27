Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE79326B76
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 04:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhB0Dqy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Feb 2021 22:46:54 -0500
Received: from toothrot.meleeweb.net ([62.210.131.231]:47020 "EHLO
        toothrot.meleeweb.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhB0Dqy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Feb 2021 22:46:54 -0500
X-Greylist: delayed 1136 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Feb 2021 22:46:54 EST
Received: from [80.111.226.61] (port=39554 helo=lady-voodoo.scabb)
        by toothrot.meleeweb.net with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
        id 1lFqDz-00Ae5m-B7; Sat, 27 Feb 2021 04:24:59 +0100
Date:   Sat, 27 Feb 2021 03:24:57 +0000
From:   Bertrand Jacquin <bertrand@jacquin.bzh>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] build: print short version command only for quiet build
Message-ID: <YDm7iZFSxLypXRg5@lady-voodoo.scabb>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="A5t2lF4xRvxZvfGR"
Content-Disposition: inline
Jabber-ID: bertrand@jacquin.bzh
X-GPG-Key: 0xA3B5C016618D9AAA
X-GPG-Fingerprint: D71B FE62 F66F 3C8B 1A25  A461 A3B5 C016 618D 9AAA
X-GPG-URL: https://sks-keyservers.net/pks/lookup?op=get&search=0xA3B5C016618D9AAA
User-Agent: All mail clients suck. This one just sucks less.
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--A5t2lF4xRvxZvfGR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On verbose build, most shell scripts enable set -x making short version
command output redundant. On silent build, no output is expected. Hence
the short version should only be printed for quiet build.

-- 
Bertrand

--A5t2lF4xRvxZvfGR
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0001-build-print-short-version-command-only-for-quiet-bui.patch"

From d7c757172de9b9d426c5f55381d2dce7c39b0c94 Mon Sep 17 00:00:00 2001
From: Bertrand Jacquin <bertrand@jacquin.bzh>
Date: Sat, 27 Feb 2021 03:12:11 +0000
Subject: [PATCH] build: print short version command only for quiet build

On verbose build, most shell scripts enable set -x making short version
command output redundant. On silent build, no output is expected. Hence
the short version should only be printed for quiet build.
---
 kernel/gen_kheaders.sh      | 2 +-
 scripts/adjust_autoksyms.sh | 2 +-
 scripts/link-vmlinux.sh     | 2 +-
 scripts/mkcompile_h         | 2 +-
 scripts/mkmakefile          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index c1510f0ab3ea..8fdc74e3626e 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -56,7 +56,7 @@ if [ -f kernel/kheaders.md5 ] &&
 		exit
 fi
 
-if [ "${quiet}" != "silent_" ]; then
+if [ "${quiet}" = "quiet_" ]; then
        echo "  GEN     $tarfile"
 fi
 
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 2b366d945ccb..b72d38200052 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -20,7 +20,7 @@ cur_ksyms_file="include/generated/autoksyms.h"
 new_ksyms_file="include/generated/autoksyms.h.tmpnew"
 
 info() {
-	if [ "$quiet" != "silent_" ]; then
+	if [ "$quiet" = "quiet_" ]; then
 		printf "  %-7s %s\n" "$1" "$2"
 	fi
 }
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 3b261b0f74f0..5bb49fa08cdc 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -38,7 +38,7 @@ LDFLAGS_vmlinux="$3"
 # Will be supressed by "make -s"
 info()
 {
-	if [ "${quiet}" != "silent_" ]; then
+	if [ "${quiet}" = "quiet_" ]; then
 		printf "  %-7s %s\n" "${1}" "${2}"
 	fi
 }
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 4ae735039daf..8f453f7c12e1 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -9,7 +9,7 @@ PREEMPT_RT=$5
 CC_VERSION="$6"
 LD=$7
 
-vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
+vecho() { [ "${quiet}" = "quiet_" ] && echo "$@" ; }
 
 # Do not expand names
 set -f
diff --git a/scripts/mkmakefile b/scripts/mkmakefile
index 1cb174751429..cf71c588036d 100755
--- a/scripts/mkmakefile
+++ b/scripts/mkmakefile
@@ -7,7 +7,7 @@
 # Usage
 # $1 - Kernel src directory
 
-if [ "${quiet}" != "silent_" ]; then
+if [ "${quiet}" = "quiet_" ]; then
 	echo "  GEN     Makefile"
 fi
 

--A5t2lF4xRvxZvfGR--
