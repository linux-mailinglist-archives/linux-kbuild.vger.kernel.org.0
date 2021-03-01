Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31F832809C
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Mar 2021 15:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbhCAOWF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Mar 2021 09:22:05 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:49033 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbhCAOVU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Mar 2021 09:21:20 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 121EJkLK020575;
        Mon, 1 Mar 2021 23:19:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 121EJkLK020575
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614608387;
        bh=y3S+scxxnEX0LvlWFo7n0DnDiPgUJy4nfG2wjHo2emc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fPjxyzqzZEvHu1sJ36NqKuI+pRKg1KtO5h+EBjGof9f3+KfS5GTNY5IxLGH3ZpWdJ
         S+32TrLyxJg2RZjJ5bYnz/+S36sVLhje3F+CG7qCGsOHYG7pc9N4g8obXRL+M5F4p5
         vIzWS/j9SIIUgIKeH4zBHiBK80daSRrECVJfGOCqQNCGqWKHw2LOGNA0Ad3/z7t0UO
         SAkKQgONbssNvCw33qA8mc3P0WzNAArCwq49ZnXMxES46GkNwpsmk0zDX+nTokR2Oj
         K8YE4g5ajXGiWcNc9p1fwbKsBSXrfsJ7a4dbNVyQwmeSsCMZhev2sMqlSkmcc0u/Pi
         suxn+O58CBgeA==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-ia64@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Stefan Asserhall <stefan.asserhall@xilinx.com>
Subject: [PATCH 2/2] ia64: syscalls: switch to generic syscallhdr.sh
Date:   Mon,  1 Mar 2021 23:19:37 +0900
Message-Id: <20210301141937.342604-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301141937.342604-1-masahiroy@kernel.org>
References: <20210301141937.342604-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Many architectures duplicate similar shell scripts.

This commit converts ia64 to use scripts/syscallhdr.sh.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/ia64/kernel/syscalls/Makefile      |  8 ++----
 arch/ia64/kernel/syscalls/syscallhdr.sh | 36 -------------------------
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 arch/ia64/kernel/syscalls/syscallhdr.sh

diff --git a/arch/ia64/kernel/syscalls/Makefile b/arch/ia64/kernel/syscalls/Makefile
index 2d2e420749b0..14f40ecf8b65 100644
--- a/arch/ia64/kernel/syscalls/Makefile
+++ b/arch/ia64/kernel/syscalls/Makefile
@@ -6,19 +6,15 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/$(src)/syscallhdr.sh
+syshdr := $(srctree)/scripts/syscallhdr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
-		   '$(syshdr_abis_$(basetarget))'		\
-		   '$(syshdr_pfx_$(basetarget))'		\
-		   '$(syshdr_offset_$(basetarget))'
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr --offset __NR_Linux $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
 
-syshdr_offset_unistd_64 := __NR_Linux
 $(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
diff --git a/arch/ia64/kernel/syscalls/syscallhdr.sh b/arch/ia64/kernel/syscalls/syscallhdr.sh
deleted file mode 100644
index f407b6e53283..000000000000
--- a/arch/ia64/kernel/syscalls/syscallhdr.sh
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-prefix="$4"
-offset="$5"
-
-fileguard=_UAPI_ASM_IA64_`basename "$out" | sed \
-	-e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
-	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g'`
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	printf "#ifndef %s\n" "${fileguard}"
-	printf "#define %s\n" "${fileguard}"
-	printf "\n"
-
-	nxt=0
-	while read nr abi name entry ; do
-		if [ -z "$offset" ]; then
-			printf "#define __NR_%s%s\t%s\n" \
-				"${prefix}" "${name}" "${nr}"
-		else
-			printf "#define __NR_%s%s\t(%s + %s)\n" \
-				"${prefix}" "${name}" "${offset}" "${nr}"
-		fi
-		nxt=$((nr+1))
-	done
-
-	printf "\n"
-	printf "#ifdef __KERNEL__\n"
-	printf "#define __NR_syscalls\t%s\n" "${nxt}"
-	printf "#endif\n"
-	printf "\n"
-	printf "#endif /* %s */\n" "${fileguard}"
-) > "$out"
-- 
2.27.0

