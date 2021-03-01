Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB80328098
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Mar 2021 15:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbhCAOVS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Mar 2021 09:21:18 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:48889 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbhCAOVM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Mar 2021 09:21:12 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 121EJkLJ020575;
        Mon, 1 Mar 2021 23:19:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 121EJkLJ020575
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614608386;
        bh=v4/dD668BG8OtkqVqave5CdCujhLX40yLgSLyf6hA4g=;
        h=From:To:Cc:Subject:Date:From;
        b=jaLj3mKwehGvrgUyFVgyb1JFi/nYGmxU5ZLw76vm5d9FlYpH39wQiEdV0EuYbZbQI
         zUQkt4hujhz9E1LjdpZOccIbBi75agrcQb8gd30k82AzlNLTjUdBMH3vEVcdlBDyNX
         Jz8ledw1w0Z0Sz6ZlY1ZZ/RrrfPkRHjXeQCyHj0EEepNjfKvSYH2Lggb5k8gLncZNw
         x2qNUHOu37BJ8ZbhHjBQ0YGFmIbdaQGRUkgp6vcMjkFfPF4MNVUiuFlWOxrCJGyw8m
         XZZdrEQlKtdXMNQXa8YGR1HCqyhh4lmGEj1r/bUEzC3aijMZLN3XHuDcQ3YkkonHN9
         BkbvlAw/fEBjA==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-ia64@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH 1/2] ia64: syscalls: switch to generic syscalltbl.sh
Date:   Mon,  1 Mar 2021 23:19:36 +0900
Message-Id: <20210301141937.342604-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Many architectures duplicate similar shell scripts.

This commit converts ia64 to use scripts/syscalltbl.sh.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/ia64/kernel/entry.S                |  3 +--
 arch/ia64/kernel/syscalls/Makefile      |  8 ++-----
 arch/ia64/kernel/syscalls/syscalltbl.sh | 32 -------------------------
 3 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 arch/ia64/kernel/syscalls/syscalltbl.sh

diff --git a/arch/ia64/kernel/entry.S b/arch/ia64/kernel/entry.S
index e98e3dafffd8..5eba3fb2e311 100644
--- a/arch/ia64/kernel/entry.S
+++ b/arch/ia64/kernel/entry.S
@@ -1420,10 +1420,9 @@ END(ftrace_stub)
 
 #endif /* CONFIG_FUNCTION_TRACER */
 
-#define __SYSCALL(nr, entry, nargs) data8 entry
+#define __SYSCALL(nr, entry) data8 entry
 	.rodata
 	.align 8
 	.globl sys_call_table
 sys_call_table:
 #include <asm/syscall_table.h>
-#undef __SYSCALL
diff --git a/arch/ia64/kernel/syscalls/Makefile b/arch/ia64/kernel/syscalls/Makefile
index bf4bda0f63eb..2d2e420749b0 100644
--- a/arch/ia64/kernel/syscalls/Makefile
+++ b/arch/ia64/kernel/syscalls/Makefile
@@ -7,7 +7,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 
 syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
-systbl := $(srctree)/$(src)/syscalltbl.sh
+systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
@@ -16,16 +16,12 @@ quiet_cmd_syshdr = SYSHDR  $@
 		   '$(syshdr_offset_$(basetarget))'
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'	\
-		   '$(systbl_abis_$(basetarget))'		\
-		   '$(systbl_abi_$(basetarget))'		\
-		   '$(systbl_offset_$(basetarget))'
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
 
 syshdr_offset_unistd_64 := __NR_Linux
 $(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-systbl_offset_syscall_table := 1024
 $(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
diff --git a/arch/ia64/kernel/syscalls/syscalltbl.sh b/arch/ia64/kernel/syscalls/syscalltbl.sh
deleted file mode 100644
index 85d78d9309ad..000000000000
--- a/arch/ia64/kernel/syscalls/syscalltbl.sh
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-my_abi="$4"
-offset="$5"
-
-emit() {
-	t_nxt="$1"
-	t_nr="$2"
-	t_entry="$3"
-
-	while [ $t_nxt -lt $t_nr ]; do
-		printf "__SYSCALL(%s, sys_ni_syscall, )\n" "${t_nxt}"
-		t_nxt=$((t_nxt+1))
-	done
-	printf "__SYSCALL(%s, %s, )\n" "${t_nxt}" "${t_entry}"
-}
-
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	nxt=0
-	if [ -z "$offset" ]; then
-		offset=0
-	fi
-
-	while read nr abi name entry ; do
-		emit $((nxt+offset)) $((nr+offset)) $entry
-		nxt=$((nr+1))
-	done
-) > "$out"
-- 
2.27.0

