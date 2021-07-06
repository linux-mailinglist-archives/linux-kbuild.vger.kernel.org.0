Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA843BC650
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jul 2021 08:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbhGFGSe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jul 2021 02:18:34 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:41597 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhGFGSe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jul 2021 02:18:34 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1666FVP2027052;
        Tue, 6 Jul 2021 15:15:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1666FVP2027052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625552132;
        bh=SaZceyP9xTNKX1lHjMBQfVI/q1r1Z78diQ9ERG7Nkf8=;
        h=From:To:Cc:Subject:Date:From;
        b=iYG/HxDOubc6dgXk1mZwI3zy1oeVGM6COzaVP2BleYmx6VH7T37IW32dI0yE2N+yh
         veXZOHPEDTlH28wYiFevBMCJVhjPTrMbEE35RaEukHeSkTETSYAwdtVju0pk6LGW+A
         dEl2h9Xn72W+0idoDHEVBXnjbeyj09E0xbXX1LBMalvmco3+rF5Wj0wRzJoWlNA7P1
         QymfcIHzpKFbfNerjZw0hVEETYyc5ETnQ+eAl9e93TuPplUdW6qsSRRfBSF/33DCq/
         74CoWTSYhpUc3cZ/+22o3L4kX/dfoIDzvmMaBkrbRphmZUHJR18NZT8Waq6UVEdZWI
         TYAqKv8oK9JeA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: add generic syscallnr.sh
Date:   Tue,  6 Jul 2021 15:15:29 +0900
Message-Id: <20210706061530.501176-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Like syscallhdr.sh and syscalltbl.sh, add a simple script to generate
the __NR_syscalls, which should not be exported to userspace.

This script is useful to replace arch/mips/kernel/syscalls/syscallnr.sh,
refactor arch/s390/kernel/syscalls/syscalltbl, and eliminate the code
surrounded by #ifdef __KERNEL__ / #endif from exported uapi/asm/unistd_*.h
files.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/syscallnr.sh | 74 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 scripts/syscallnr.sh

diff --git a/scripts/syscallnr.sh b/scripts/syscallnr.sh
new file mode 100644
index 000000000000..3aa29e0dcc52
--- /dev/null
+++ b/scripts/syscallnr.sh
@@ -0,0 +1,74 @@
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
+set -e
+
+usage() {
+	echo >&2 "usage: $0 [--abis ABIS] [--prefix PREFIX] INFILE OUTFILE" >&2
+	echo >&2
+	echo >&2 "  INFILE    input syscall table"
+	echo >&2 "  OUTFILE   output header file"
+	echo >&2
+	echo >&2 "options:"
+	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
+	echo >&2 "  --prefix PREFIX    The prefix to the macro like __NR_<PREFIX><NAME>"
+	exit 1
+}
+
+# default unless specified by options
+abis=
+prefix=
+
+while [ $# -gt 0 ]
+do
+	case $1 in
+	--abis)
+		abis=$(echo "($2)" | tr ',' '|')
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
+guard=_ASM_$(basename "$outfile" |
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
+		max=$nr
+	done
+
+	echo "#define __NR_${prefix}syscalls $(($max + 1))"
+	echo
+	echo "#endif /* $guard */"
+} > "$outfile"
-- 
2.27.0

