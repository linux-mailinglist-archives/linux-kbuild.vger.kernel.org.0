Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A3A31C53B
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Feb 2021 03:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhBPCFX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 21:05:23 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:35395 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhBPCFX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 21:05:23 -0500
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 11G24M7L027793;
        Tue, 16 Feb 2021 11:04:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 11G24M7L027793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613441063;
        bh=81li7nxJ92BqT9gDIifD0OE17q+dS/4h3UhsmmXnxME=;
        h=From:To:Cc:Subject:Date:From;
        b=elPlDTSq+wYYg9P+/QmuFFkzUOKw8hSkai1EX0I2w5OdpVukBLlFLpDSiFnE1FHyY
         WDNFor3U5fVQ6KQTwv/7c4Mk9kLXIliC91yiIHRBBas53k3IOsB8IiNKEItt+QgDHg
         6V40m9t/LVPQJrZTSJUi8k4lO+uQ4em6hqUuIWkuhkgOdMMlD2AHDO4/BrLfZzyzSg
         GG+EB5nvtLxsvssUbBwg9VMiHhFFE9DK9GC6q70NZi62uctGblBPBT4MgnCNLiM/4e
         Ulj1vQN4a5q6TazTqfvgkUvdSL03mYNP6PvUEjvderOm7oFEtVsmNC2v2ew8IpSrgI
         iup1s2ZN/txgw==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] scripts: add generic syscalltbl.sh
Date:   Tue, 16 Feb 2021 11:04:11 +0900
Message-Id: <20210216020412.800836-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Most of architectures generate syscall headers at the compile time
in a similar way.

The syscall table has the same format for all architectures. Each line
has up to 5 fields; syscall number, ABI, syscall name, native entry
point, and compat entry point. The syscall table is processed by
syscalltbl.sh script into header files.

Despite the same pattern, scripts are maintained per architecture,
which results in code duplication and bad maintainability.

As of v5.11-rc1, 12 architectures duplicate similar shell scripts:

  $ find arch -name syscalltbl.sh | sort
  arch/alpha/kernel/syscalls/syscalltbl.sh
  arch/arm/tools/syscalltbl.sh
  arch/ia64/kernel/syscalls/syscalltbl.sh
  arch/m68k/kernel/syscalls/syscalltbl.sh
  arch/microblaze/kernel/syscalls/syscalltbl.sh
  arch/mips/kernel/syscalls/syscalltbl.sh
  arch/parisc/kernel/syscalls/syscalltbl.sh
  arch/powerpc/kernel/syscalls/syscalltbl.sh
  arch/sh/kernel/syscalls/syscalltbl.sh
  arch/sparc/kernel/syscalls/syscalltbl.sh
  arch/x86/entry/syscalls/syscalltbl.sh
  arch/xtensa/kernel/syscalls/syscalltbl.sh

My goal is to unify them into scripts/syscalltbl.sh.

__SYSCALL_WITH_COMPAT should be defined as follows:

32-bit kernel:
  #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, native)

64-bit kernel:

  #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, compat)

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/syscalltbl.sh | 73 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100755 scripts/syscalltbl.sh

diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
new file mode 100755
index 000000000000..aa6ab156301c
--- /dev/null
+++ b/scripts/syscalltbl.sh
@@ -0,0 +1,73 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Generate a syscall table header.
+#
+# Each line of the syscall table should have the following format:
+#
+# NR ABI NAME [NATIVE] [COMPAT]
+#
+# NR       syscall number
+# ABI      ABI name
+# NAME     syscall name
+# NATIVE   native entry point (optional)
+# COMPAT   compat entry point (optional)
+
+set -e
+
+usage() {
+	echo >&2 "usage: $0 [--abis ABIS] INFILE OUTFILE" >&2
+	echo >&2
+	echo >&2 "  INFILE    input syscall table"
+	echo >&2 "  OUTFILE   output header file"
+	echo >&2
+	echo >&2 "options:"
+	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
+	exit 1
+}
+
+# default unless specified by options
+abis=
+
+while [ $# -gt 0 ]
+do
+	case $1 in
+	--abis)
+		abis=$(echo "($2)" | tr ',' '|')
+		shift 2;;
+	-*)
+		echo "$1: unknown option" >&2
+		usage;;
+	*)
+		break;;
+	esac
+done
+
+if [ $# -ne 2 ]; then
+	usage
+fi
+
+infile="$1"
+outfile="$2"
+
+nxt=0
+
+grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | sort -n | {
+
+	while read nr abi name native compat ; do
+
+		while [ $nxt -lt $nr ]; do
+			echo "__SYSCALL($nxt, sys_ni_syscall)"
+			nxt=$((nxt + 1))
+		done
+
+		if [ -n "$compat" ]; then
+			echo "__SYSCALL_WITH_COMPAT($nr, $native, $compat)"
+		elif [ -n "$native" ]; then
+			echo "__SYSCALL($nr, $native)"
+		else
+			echo "__SYSCALL($nr, sys_ni_syscall)"
+		fi
+		nxt=$((nr + 1))
+	done
+} > "$outfile"
-- 
2.27.0

