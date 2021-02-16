Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF9C31C53A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Feb 2021 03:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhBPCFX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 21:05:23 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:35396 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhBPCFX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 21:05:23 -0500
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 11G24M7M027793;
        Tue, 16 Feb 2021 11:04:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 11G24M7M027793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613441063;
        bh=wC7YsNg4x5zm3Wuog28CMrBEe6OHge+3aaSRx9rQOfE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IYeE8GIOG3gEcpLaENZGap+G0AyzWfWTrxShgBeuxyT8jBSgdgXSINJre1Ym5Bdg1
         eB0Fq+HqkOoT7qFz2o3Jhf5/AG0NYtRzDFZTe9jXhv66JwzKGH/vfWQ60LiXCObP+b
         3dgQGuL1A9YM8O1+sT7ayJxwujGyJ8ngPtjrzKBW53VNVzl3KyTA2qoZipO0hXvEpb
         zKewLKrDQhDKieSeyonEMRTAR1bvtWArZjVMx+LC1s7QlU3VDD9h/8AvHspPlRihZR
         5qiLw7tglZkvJ/TIdhwxf+ITCvxDgp6oEjmNdycPEaca1NZ7R9JaoVIvqwNKeoyhhG
         HVME8GxLE4H3g==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] scripts: add generic syscallhdr.sh
Date:   Tue, 16 Feb 2021 11:04:12 +0900
Message-Id: <20210216020412.800836-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210216020412.800836-1-masahiroy@kernel.org>
References: <20210216020412.800836-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Most of architectures generate syscall headers at the compile time
in a similar way.

As of v5.11-rc1, 12 architectures duplicate similar shell scripts:

  $ find arch -name syscallhdr.sh | sort
  arch/alpha/kernel/syscalls/syscallhdr.sh
  arch/arm/tools/syscallhdr.sh
  arch/ia64/kernel/syscalls/syscallhdr.sh
  arch/m68k/kernel/syscalls/syscallhdr.sh
  arch/microblaze/kernel/syscalls/syscallhdr.sh
  arch/mips/kernel/syscalls/syscallhdr.sh
  arch/parisc/kernel/syscalls/syscallhdr.sh
  arch/powerpc/kernel/syscalls/syscallhdr.sh
  arch/sh/kernel/syscalls/syscallhdr.sh
  arch/sparc/kernel/syscalls/syscallhdr.sh
  arch/x86/entry/syscalls/syscallhdr.sh
  arch/xtensa/kernel/syscalls/syscallhdr.sh

My goal is to unify them into scripts/syscallhdr.sh.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/syscallhdr.sh | 98 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100755 scripts/syscallhdr.sh

diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
new file mode 100755
index 000000000000..848ac2735115
--- /dev/null
+++ b/scripts/syscallhdr.sh
@@ -0,0 +1,98 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Generate a syscall number header.
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
+	echo >&2 "usage: $0 [--abis ABIS] [--emit-nr] [--offset OFFSET] [--prefix PREFIX] INFILE OUTFILE" >&2
+	echo >&2
+	echo >&2 "  INFILE    input syscall table"
+	echo >&2 "  OUTFILE   output header file"
+	echo >&2
+	echo >&2 "options:"
+	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
+	echo >&2 "  --emit-nr          Emit the macro of the number of syscalls (__NR_syscalls)"
+	echo >&2 "  --offset OFFSET    The offset of syscall numbers"
+	echo >&2 "  --prefix PREFIX    The prefix to the macro like __NR_<PREFIX><NAME>"
+	exit 1
+}
+
+# default unless specified by options
+abis=
+emit_nr=
+offset=
+prefix=
+
+while [ $# -gt 0 ]
+do
+	case $1 in
+	--abis)
+		abis=$(echo "($2)" | tr ',' '|')
+		shift 2;;
+	--emit-nr)
+		emit_nr=1
+		shift 1;;
+	--offset)
+		offset=$2
+		shift 2;;
+	--prefix)
+		prefix=$2
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
+guard=_UAPI_ASM_$(basename "$outfile" |
+	sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
+	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g')
+
+grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$infile" | sort -n | {
+	echo "#ifndef $guard"
+	echo "#define $guard"
+	echo
+
+	max=0
+	while read nr abi name native compat ; do
+
+		max=$nr
+
+		if [ -n "$offset" ]; then
+			nr="($offset + $nr)"
+		fi
+
+		echo "#define __NR_$prefix$name $nr"
+	done
+
+	if [ -n "$emit_nr" ]; then
+		echo
+		echo "#ifdef __KERNEL__"
+		echo "#define __NR_${prefix}syscalls $(($max + 1))"
+		echo "#endif"
+	fi
+
+	echo
+	echo "#endif /* $guard */"
+} > "$outfile"
-- 
2.27.0

