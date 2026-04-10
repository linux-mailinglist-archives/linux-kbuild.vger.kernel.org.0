Return-Path: <linux-kbuild+bounces-12757-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGZFEopq2Wn5pQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12757-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:24:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB8E3DCDFE
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0F5C3018180
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD8B3E1215;
	Fri, 10 Apr 2026 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="WdKg/BOc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31083DBD5C;
	Fri, 10 Apr 2026 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856239; cv=none; b=HnEWtHfQgkQ1j4h2uI0ElSh5TnW4eIfM0snFNjA6fv+dULEGXkE21KDil/0t0jS5ElYjHd5iO4JTtO/n2B3/V+1ZrB6nlscioq8n2r1MQPu4Tta71zv6KyQ1YKKQNm7WIcrUXwpWaGXHLaeyFNBbUEogoUDctHfhZzqJn1YL6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856239; c=relaxed/simple;
	bh=W35fiRSNigatiVprYsyS02blTAKC75vX01d+FmheGRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sotI9qUTAGgYTR4I5UJ9RISz6eZPD+cr6kZnKiRylOM8Z0P7Sin9BLckyPsf8tQLO8Eof2DY8HC1/fZvxzFvpb3Is+FQPJXWX7Hy2yYFHJsUh3/IOEwPrTnz7pf31CtHVm5Bhyb7yaiR5HNWM9vN4tf0eyI/DZk+CcxGBHVnTfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=WdKg/BOc; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id BB5E63FAFD;
	Fri, 10 Apr 2026 23:23:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id A81311FAE85;
	Fri, 10 Apr 2026 23:23:49 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 7UkXRkgrFwV6; Fri, 10 Apr 2026 23:23:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 827D61FAED2;
	Fri, 10 Apr 2026 23:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 827D61FAED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856227;
	bh=QWaH06u8sfh/bzCERI9BkfhsJtWFnDDGA18Y7s8EGOU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WdKg/BOc+6BUQK73cEngfBbnkTeTUm9uu6d3tRtc47LmRd0dEau88qc3JkC3hZ0Le
	 6MVGjJQRDDH/qjq3g+7Buvvgo+nriZs8B60qJJ8C9mckYIZsIOEHLtOq7HoaqaLV60
	 YtAHE0bzzcV7PW4IoSN4EvWSycgBtH9Qm925MfwjbHGqyPr2oExYUnxYPcTcoBs7qb
	 iuaVu5p5/WBpd3iUk33OD/WOeVYtGopm7PSzM+3YhNSfZO40KxHYHGTw7Xun5hNXZa
	 KIvfdjHwpPIBSfrXEss/5lt4QzFdG+eu9spAZp7yH00fEnC0NzMA7z7IJWXIc7Sa+d
	 pAJtGebQEMGHw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id AbWs_gGnq0bL; Fri, 10 Apr 2026 23:23:47 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 1A7751FAEC1;
	Fri, 10 Apr 2026 23:23:47 +0200 (CEST)
From: Luis <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v5 14/15] scripts/sbom: add unit tests for command parsers
Date: Fri, 10 Apr 2026 23:22:54 +0200
Message-ID: <20260410212255.9883-15-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410212255.9883-1-luis.augenstein@tngtech.com>
References: <20260410212255.9883-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12757-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tngtech.com:dkim,tngtech.com:email,tngtech.com:mid,orc_hash.sh:url,syscalltbl.sh:url,xen-hypercalls.sh:url,link-vmlinux.sh:url,gen_initramfs.sh:url,syscallhdr.sh:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[tngtech.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: CDB8E3DCDFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Luis Augenstein <luis.augenstein@tngtech.com>

Add unit tests to verify that command parsers correctly extract
input files from build commands.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/tests/__init__.py                |   0
 scripts/sbom/tests/cmd_graph/__init__.py      |   0
 .../tests/cmd_graph/test_savedcmd_parser.py   | 412 ++++++++++++++++++
 3 files changed, 412 insertions(+)
 create mode 100644 scripts/sbom/tests/__init__.py
 create mode 100644 scripts/sbom/tests/cmd_graph/__init__.py
 create mode 100644 scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py

diff --git a/scripts/sbom/tests/__init__.py b/scripts/sbom/tests/__init__.py
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/scripts/sbom/tests/cmd_graph/__init__.py b/scripts/sbom/tests/=
cmd_graph/__init__.py
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py b/scripts=
/sbom/tests/cmd_graph/test_savedcmd_parser.py
new file mode 100644
index 00000000000..469d932a341
--- /dev/null
+++ b/scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py
@@ -0,0 +1,412 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import os
+import unittest
+
+from sbom.cmd_graph.savedcmd_parser import parse_inputs_from_commands
+from sbom.cmd_graph.savedcmd_parser.command_parser_registry import Command=
ParserRegistry
+import sbom.sbom_logging as sbom_logging
+
+
+class TestSavedCmdParser(unittest.TestCase):
+    def _assert_parsing(self, cmd: str, expected: str, registry: CommandPa=
rserRegistry | None =3D None) -> None:
+        sbom_logging.init()
+        parsed =3D parse_inputs_from_commands(cmd, fail_on_unknown_build_c=
ommand=3DFalse, registry=3Dregistry)
+        target =3D [] if expected =3D=3D "" else expected.split(" ")
+        self.assertEqual(parsed, target)
+        errors =3D sbom_logging._error_logger.messages  # type: ignore
+        self.assertEqual(errors, {})
+
+    # Compound command tests
+    def test_dd_cat(self):
+        cmd =3D "(dd if=3Darch/x86/boot/setup.bin bs=3D4k conv=3Dsync stat=
us=3Dnone; cat arch/x86/boot/vmlinux.bin) >arch/x86/boot/bzImage"
+        expected =3D "arch/x86/boot/setup.bin arch/x86/boot/vmlinux.bin"
+        self._assert_parsing(cmd, expected)
+
+    def test_manual_file_creation(self):
+        cmd =3D """{ symbase=3D__dtbo_overlay_bad_unresolved; echo '$(poun=
d)include <asm-generic/vmlinux.lds.h>'; echo '.section .rodata,"a"'; echo '=
.balign STRUCT_ALIGNMENT'; echo ".global $${symbase}_begin"; echo "$${symba=
se}_begin:"; echo '.incbin "drivers/of/unittest-data/overlay_bad_unresolved=
.dtbo" '; echo ".global $${symbase}_end"; echo "$${symbase}_end:"; echo '.b=
align STRUCT_ALIGNMENT'; } > drivers/of/unittest-data/overlay_bad_unresolve=
d.dtbo.S"""
+        expected =3D ""
+        self._assert_parsing(cmd, expected)
+
+    def test_cat_xz_wrap(self):
+        cmd =3D "{ cat arch/x86/boot/compressed/vmlinux.bin | sh ../script=
s/xz_wrap.sh; printf \\130\\064\\024\\000; } > arch/x86/boot/compressed/vml=
inux.bin.xz"
+        expected =3D "arch/x86/boot/compressed/vmlinux.bin"
+        self._assert_parsing(cmd, expected)
+
+    def test_printf_sed(self):
+        cmd =3D r"""{  printf 'static char tomoyo_builtin_profile[] __init=
data =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/\(.*\)/\t"\1\\n"/' =
-- /dev/null; printf '\t"";\n';  printf 'static char tomoyo_builtin_excepti=
on_policy[] __initdata =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/\=
(.*\)/\t"\1\\n"/' -- ../security/tomoyo/policy/exception_policy.conf.defaul=
t; printf '\t"";\n';  printf 'static char tomoyo_builtin_domain_policy[] __=
initdata =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/\(.*\)/\t"\1\\n=
"/' -- /dev/null; printf '\t"";\n';  printf 'static char tomoyo_builtin_man=
ager[] __initdata =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/\(.*\)=
/\t"\1\\n"/' -- /dev/null; printf '\t"";\n';  printf 'static char tomoyo_bu=
iltin_stat[] __initdata =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/=
\(.*\)/\t"\1\\n"/' -- /dev/null; printf '\t"";\n'; } > security/tomoyo/buil=
tin-policy.h"""
+        expected =3D "../security/tomoyo/policy/exception_policy.conf.defa=
ult"
+        self._assert_parsing(cmd, expected)
+
+    def test_bin2c_echo(self):
+        cmd =3D """(echo "static char tomoyo_builtin_profile[] __initdata =
=3D"; ./scripts/bin2c </dev/null; echo ";"; echo "static char tomoyo_builti=
n_exception_policy[] __initdata =3D"; ./scripts/bin2c <../security/tomoyo/p=
olicy/exception_policy.conf.default; echo ";"; echo "static char tomoyo_bui=
ltin_domain_policy[] __initdata =3D"; ./scripts/bin2c </dev/null; echo ";";=
 echo "static char tomoyo_builtin_manager[] __initdata =3D"; ./scripts/bin2=
c </dev/null; echo ";"; echo "static char tomoyo_builtin_stat[] __initdata =
=3D"; ./scripts/bin2c </dev/null; echo ";") >security/tomoyo/builtin-policy=
.h"""
+        expected =3D "../security/tomoyo/policy/exception_policy.conf.defa=
ult"
+        self._assert_parsing(cmd, expected)
+
+    def test_cat_colon(self):
+        cmd =3D "{   cat init/modules.order;   cat usr/modules.order;   ca=
t arch/x86/modules.order;   cat arch/x86/boot/startup/modules.order;   cat =
kernel/modules.order;   cat certs/modules.order;   cat mm/modules.order;   =
cat fs/modules.order;   cat ipc/modules.order;   cat security/modules.order=
;   cat crypto/modules.order;   cat block/modules.order;   cat io_uring/mod=
ules.order;   cat lib/modules.order;   cat arch/x86/lib/modules.order;   ca=
t drivers/modules.order;   cat sound/modules.order;   cat samples/modules.o=
rder;   cat net/modules.order;   cat virt/modules.order;   cat arch/x86/pci=
/modules.order;   cat arch/x86/power/modules.order;   cat arch/x86/video/mo=
dules.order; :; } > modules.order"
+        expected =3D "init/modules.order usr/modules.order arch/x86/module=
s.order arch/x86/boot/startup/modules.order kernel/modules.order certs/modu=
les.order mm/modules.order fs/modules.order ipc/modules.order security/modu=
les.order crypto/modules.order block/modules.order io_uring/modules.order l=
ib/modules.order arch/x86/lib/modules.order drivers/modules.order sound/mod=
ules.order samples/modules.order net/modules.order virt/modules.order arch/=
x86/pci/modules.order arch/x86/power/modules.order arch/x86/video/modules.o=
rder"
+        self._assert_parsing(cmd, expected)
+
+    def test_cat_zstd(self):
+        cmd =3D "{ cat arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/=
compressed/vmlinux.relocs | zstd -22 --ultra; printf \\340\\362\\066\\003; =
} > arch/x86/boot/compressed/vmlinux.bin.zst"
+        expected =3D "arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/c=
ompressed/vmlinux.relocs"
+        self._assert_parsing(cmd, expected)
+
+    # cat command tests
+    def test_cat_redirect(self):
+        cmd =3D "cat ../fs/unicode/utf8data.c_shipped > fs/unicode/utf8dat=
a.c"
+        expected =3D "../fs/unicode/utf8data.c_shipped"
+        self._assert_parsing(cmd, expected)
+
+    def test_cat_piped(self):
+        cmd =3D "cat arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/co=
mpressed/vmlinux.relocs | gzip -n -f -9 > arch/x86/boot/compressed/vmlinux.=
bin.gz"
+        expected =3D "arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/c=
ompressed/vmlinux.relocs"
+        self._assert_parsing(cmd, expected)
+
+    # sed command tests
+    def test_sed(self):
+        cmd =3D "sed -n 's/.*define *BLIST_\\([A-Z0-9_]*\\) *.*/BLIST_FLAG=
_NAME(\\1),/p' ../include/scsi/scsi_devinfo.h > drivers/scsi/scsi_devinfo_t=
bl.c"
+        expected =3D "../include/scsi/scsi_devinfo.h"
+        self._assert_parsing(cmd, expected)
+
+    # awk command tests
+    def test_awk(self):
+        cmd =3D "awk -f ../arch/arm64/tools/gen-cpucaps.awk ../arch/arm64/=
tools/cpucaps > arch/arm64/include/generated/asm/cpucap-defs.h"
+        expected =3D "../arch/arm64/tools/cpucaps"
+        self._assert_parsing(cmd, expected)
+
+    def test_awk_with_input_redirection(self):
+        cmd =3D "awk -v N=3D1 -f ../lib/raid6/unroll.awk < ../lib/raid6/in=
t.uc > lib/raid6/int1.c"
+        expected =3D "../lib/raid6/int.uc"
+        self._assert_parsing(cmd, expected)
+
+    # openssl command tests
+    def test_openssl(self):
+        cmd =3D "openssl req -new -nodes -utf8 -sha256 -days 36500 -batch =
-x509 -config certs/x509.genkey -outform PEM -out certs/signing_key.pem -ke=
yout certs/signing_key.pem  2>&1"
+        expected =3D ""
+        self._assert_parsing(cmd, expected)
+
+    # gcc/clang command tests
+    def test_gcc(self):
+        cmd =3D (
+            "gcc -Wp,-MMD,arch/x86/pci/.i386.o.d -nostdinc -I../arch/x86/i=
nclude -I./arch/x86/include/generated -I../include -I./include -I../arch/x8=
6/include/uapi -I./arch/x86/include/generated/uapi -I../include/uapi -I./in=
clude/generated/uapi -include ../include/linux/compiler-version.h -include =
../include/linux/kconfig.h -include ../include/linux/compiler_types.h -D__K=
ERNEL__ -fmacro-prefix-map=3D../=3D -Werror -std=3Dgnu11 -fshort-wchar -fun=
signed-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mn=
o-sse2 -mno-3dnow -mno-avx -fcf-protection=3Dbranch -fno-jump-tables -m64 -=
falign-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferre=
d-stack-boundary=3D3 -mskip-rax-setup -march=3Dx86-64 -mtune=3Dgeneric -mno=
-red-zone -mcmodel=3Dkernel -mstack-protector-guard-reg=3Dgs -mstack-protec=
tor-guard-symbol=3D__ref_stack_chk_guard -Wno-sign-compare -fno-asynchronou=
s-unwind-tables -mindirect-branch=3Dthunk-extern -mindirect-branch-register=
 -mindirect-branch-cs-prefix -mfunction-return=3Dthunk-extern -fno-jump-tab=
les -fpatchable-function-entry=3D16,16 -fno-delete-null-pointer-checks -O2 =
-fno-allow-store-data-races -fstack-protector-strong -fomit-frame-pointer -=
fno-stack-clash-protection -falign-functions=3D16 -fno-strict-overflow -fno=
-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -We=
rror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dretur=
n-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno=
-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissi=
ng-prototypes -Wframe-larger-than=3D2048 -Wno-main -Wvla-larger-than=3D1 -W=
no-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-stringop-overfl=
ow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D5 -Werror=3Ddate-ti=
me -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wenum-co=
nversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -=
Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-str=
ingop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-ty=
pe-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-comp=
are -Wno-unused-parameter -I../arch/x86/pci -Iarch/x86/pci    -DKBUILD_MODF=
ILE=3D"
+            "arch/x86/pci/i386"
+            " -DKBUILD_BASENAME=3D"
+            "i386"
+            " -DKBUILD_MODNAME=3D"
+            "i386"
+            " -D__KBUILD_MODNAME=3Dkmod_i386 -c -o arch/x86/pci/i386.o ../=
arch/x86/pci/i386.c  "
+        )
+        expected =3D "../arch/x86/pci/i386.c"
+        self._assert_parsing(cmd, expected)
+
+    def test_gcc_linking(self):
+        cmd =3D "gcc   -o arch/x86/tools/relocs arch/x86/tools/relocs_32.o=
 arch/x86/tools/relocs_64.o arch/x86/tools/relocs_common.o"
+        expected =3D "arch/x86/tools/relocs_32.o arch/x86/tools/relocs_64.=
o arch/x86/tools/relocs_common.o"
+        self._assert_parsing(cmd, expected)
+
+    def test_gcc_without_compile_flag(self):
+        cmd =3D "gcc -Wp,-MMD,arch/x86/boot/compressed/.mkpiggy.d -Wall -W=
missing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu1=
1   -I ../scripts/include -I../tools/include  -I arch/x86/boot/compressed  =
 -o arch/x86/boot/compressed/mkpiggy ../arch/x86/boot/compressed/mkpiggy.c"
+        expected =3D "../arch/x86/boot/compressed/mkpiggy.c"
+        self._assert_parsing(cmd, expected)
+
+    def test_gcc_with_env_override(self):
+        os.environ["CC"] =3D "ccache gcc"
+        registry =3D CommandParserRegistry.create()
+        cmd =3D "gcc   -o arch/x86/tools/relocs arch/x86/tools/relocs_32.o=
 arch/x86/tools/relocs_64.o arch/x86/tools/relocs_common.o"
+        expected =3D "arch/x86/tools/relocs_32.o arch/x86/tools/relocs_64.=
o arch/x86/tools/relocs_common.o"
+        self._assert_parsing(cmd, expected, registry)
+        self._assert_parsing(f"ccache {cmd}", expected, registry)
+
+    def test_gcc_dts_preprocessing(self):
+        cmd =3D "gcc -E -Wp,-MMD,drivers/of/.empty_root.dtb.d.pre.tmp -nos=
tdinc -I ../scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with=
-cpp -o drivers/of/.empty_root.dtb.dts.tmp ../drivers/of/empty_root.dts"
+        expected =3D "../drivers/of/empty_root.dts"
+        self._assert_parsing(cmd, expected)
+
+    def test_clang(self):
+        cmd =3D """clang -Wp,-MMD,arch/x86/entry/.entry_64_compat.o.d -nos=
tdinc -I../arch/x86/include -I./arch/x86/include/generated -I../include -I.=
/include -I../arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I.=
./include/uapi -I./include/generated/uapi -include ../include/linux/compile=
r-version.h -include ../include/linux/kconfig.h -D__KERNEL__ --target=3Dx86=
_64-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dig=
nored-optimization-argument -Werror=3Doption-ignored -Werror=3Dunused-comma=
nd-line-argument -fmacro-prefix-map=3D../=3D -Werror -D__ASSEMBLY__ -fno-PI=
E -m64 -I../arch/x86/entry -Iarch/x86/entry    -DKBUILD_MODFILE=3D'"arch/x8=
6/entry/entry_64_compat"' -DKBUILD_MODNAME=3D'"entry_64_compat"' -D__KBUILD=
_MODNAME=3Dkmod_entry_64_compat -c -o arch/x86/entry/entry_64_compat.o ../a=
rch/x86/entry/entry_64_compat.S"""
+        expected =3D "../arch/x86/entry/entry_64_compat.S"
+        self._assert_parsing(cmd, expected)
+
+    # ld command tests
+    def test_ld(self):
+        cmd =3D 'ld -o arch/x86/entry/vdso/vdso64.so.dbg -shared --hash-st=
yle=3Dboth --build-id=3Dsha1 --no-undefined  --eh-frame-hdr -Bsymbolic -z n=
oexecstack -m elf_x86_64 -soname linux-vdso.so.1 -z max-page-size=3D4096 -T=
 arch/x86/entry/vdso/vdso.lds arch/x86/entry/vdso/vdso-note.o arch/x86/entr=
y/vdso/vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso/v=
getrandom.o arch/x86/entry/vdso/vgetrandom-chacha.o; if readelf -rW arch/x8=
6/entry/vdso/vdso64.so.dbg | grep -v _NONE | grep -q " R_\w*_"; then (echo =
>&2 "arch/x86/entry/vdso/vdso64.so.dbg: dynamic relocations are not support=
ed"; rm -f arch/x86/entry/vdso/vdso64.so.dbg; /bin/false); fi'  # type: ign=
ore
+        expected =3D "arch/x86/entry/vdso/vdso-note.o arch/x86/entry/vdso/=
vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso/vgetrand=
om.o arch/x86/entry/vdso/vgetrandom-chacha.o"
+        self._assert_parsing(cmd, expected)
+
+    def test_ld_with_env_override(self):
+        os.environ["LD"] =3D "some-tool ld"
+        registry =3D CommandParserRegistry.create()
+        cmd =3D 'ld -o arch/x86/entry/vdso/vdso64.so.dbg -shared --hash-st=
yle=3Dboth --build-id=3Dsha1 --no-undefined  --eh-frame-hdr -Bsymbolic -z n=
oexecstack -m elf_x86_64 -soname linux-vdso.so.1 -z max-page-size=3D4096 -T=
 arch/x86/entry/vdso/vdso.lds arch/x86/entry/vdso/vdso-note.o arch/x86/entr=
y/vdso/vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso/v=
getrandom.o arch/x86/entry/vdso/vgetrandom-chacha.o; if readelf -rW arch/x8=
6/entry/vdso/vdso64.so.dbg | grep -v _NONE | grep -q " R_\w*_"; then (echo =
>&2 "arch/x86/entry/vdso/vdso64.so.dbg: dynamic relocations are not support=
ed"; rm -f arch/x86/entry/vdso/vdso64.so.dbg; /bin/false); fi'  # type: ign=
ore
+        expected =3D "arch/x86/entry/vdso/vdso-note.o arch/x86/entry/vdso/=
vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso/vgetrand=
om.o arch/x86/entry/vdso/vgetrandom-chacha.o"
+        self._assert_parsing(cmd, expected, registry)
+        self._assert_parsing(f"some-tool {cmd}", expected, registry)
+
+    def test_ld_whole_archive(self):
+        cmd =3D "ld -m elf_x86_64 -z noexecstack -r -o vmlinux.o   --whole=
-archive vmlinux.a --no-whole-archive --start-group  --end-group"
+        expected =3D "vmlinux.a"
+        self._assert_parsing(cmd, expected)
+
+    def test_ld_with_at_symbol(self):
+        cmd =3D "ld.lld -m elf_x86_64 -z noexecstack   -r -o fs/efivarfs/e=
fivarfs.o @fs/efivarfs/efivarfs.mod  ; ./tools/objtool/objtool --hacks=3Dju=
mp_label --hacks=3Dnoinstr --hacks=3Dskylake --ibt --orc --retpoline --reth=
unk --static-call --uaccess --prefix=3D16  --link  --module fs/efivarfs/efi=
varfs.o"
+        expected =3D "@fs/efivarfs/efivarfs.mod"
+        self._assert_parsing(cmd, expected)
+
+    def test_ld_if_objdump(self):
+        cmd =3D """ld -o arch/x86/entry/vdso/vdso64.so.dbg -shared --hash-=
style=3Dboth --build-id=3Dsha1  --eh-frame-hdr -Bsymbolic -z noexecstack -m=
 elf_x86_64 -soname linux-vdso.so.1 --no-undefined -z max-page-size=3D4096 =
-T arch/x86/entry/vdso/vdso.lds arch/x86/entry/vdso/vdso-note.o arch/x86/en=
try/vdso/vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso=
/vsgx.o && sh ./arch/x86/entry/vdso/checkundef.sh 'nm' 'arch/x86/entry/vdso=
/vdso64.so.dbg'; if objdump -R arch/x86/entry/vdso/vdso64.so.dbg | grep -E =
-h "R_X86_64_JUMP_SLOT|R_X86_64_GLOB_DAT|R_X86_64_RELATIVE| R_386_GLOB_DAT|=
R_386_JMP_SLOT|R_386_RELATIVE"; then (echo >&2 "arch/x86/entry/vdso/vdso64.=
so.dbg: dynamic relocations are not supported"; rm -f arch/x86/entry/vdso/v=
dso64.so.dbg; /bin/false); fi"""
+        expected =3D "arch/x86/entry/vdso/vdso-note.o arch/x86/entry/vdso/=
vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso/vsgx.o"
+        self._assert_parsing(cmd, expected)
+
+    # printf | xargs ar command tests
+    def test_ar_printf(self):
+        cmd =3D 'rm -f built-in.a;  printf "./%s " init/built-in.a usr/bui=
lt-in.a arch/x86/built-in.a arch/x86/boot/startup/built-in.a kernel/built-i=
n.a certs/built-in.a mm/built-in.a fs/built-in.a ipc/built-in.a security/bu=
ilt-in.a crypto/built-in.a block/built-in.a io_uring/built-in.a lib/built-i=
n.a arch/x86/lib/built-in.a drivers/built-in.a sound/built-in.a net/built-i=
n.a virt/built-in.a arch/x86/pci/built-in.a arch/x86/power/built-in.a arch/=
x86/video/built-in.a | xargs ar cDPrST built-in.a'
+        expected =3D "./init/built-in.a ./usr/built-in.a ./arch/x86/built-=
in.a ./arch/x86/boot/startup/built-in.a ./kernel/built-in.a ./certs/built-i=
n.a ./mm/built-in.a ./fs/built-in.a ./ipc/built-in.a ./security/built-in.a =
./crypto/built-in.a ./block/built-in.a ./io_uring/built-in.a ./lib/built-in=
.a ./arch/x86/lib/built-in.a ./drivers/built-in.a ./sound/built-in.a ./net/=
built-in.a ./virt/built-in.a ./arch/x86/pci/built-in.a ./arch/x86/power/bui=
lt-in.a ./arch/x86/video/built-in.a"
+        self._assert_parsing(cmd, expected)
+
+    def test_ar_printf_nested(self):
+        cmd =3D 'rm -f arch/x86/pci/built-in.a;  printf "arch/x86/pci/%s "=
 i386.o init.o mmconfig_64.o direct.o mmconfig-shared.o fixup.o acpi.o lega=
cy.o irq.o common.o early.o bus_numa.o amd_bus.o | xargs ar cDPrST arch/x86=
/pci/built-in.a'
+        expected =3D "arch/x86/pci/i386.o arch/x86/pci/init.o arch/x86/pci=
/mmconfig_64.o arch/x86/pci/direct.o arch/x86/pci/mmconfig-shared.o arch/x8=
6/pci/fixup.o arch/x86/pci/acpi.o arch/x86/pci/legacy.o arch/x86/pci/irq.o =
arch/x86/pci/common.o arch/x86/pci/early.o arch/x86/pci/bus_numa.o arch/x86=
/pci/amd_bus.o"
+        self._assert_parsing(cmd, expected)
+
+    # ar command tests
+    def test_ar_reordering(self):
+        cmd =3D "rm -f vmlinux.a; ar cDPrST vmlinux.a built-in.a  lib/lib.=
a arch/x86/lib/lib.a; ar mPiT $$(ar t vmlinux.a | sed -n 1p) vmlinux.a $$(a=
r t vmlinux.a | grep -F -f ../scripts/head-object-list.txt)"
+        expected =3D "built-in.a lib/lib.a arch/x86/lib/lib.a"
+        self._assert_parsing(cmd, expected)
+
+    def test_ar_default(self):
+        cmd =3D "rm -f lib/lib.a; ar cDPrsT lib/lib.a lib/argv_split.o lib=
/bug.o lib/buildid.o lib/clz_tab.o lib/cmdline.o lib/cpumask.o lib/ctype.o =
lib/dec_and_lock.o lib/decompress.o lib/decompress_bunzip2.o lib/decompress=
_inflate.o lib/decompress_unlz4.o lib/decompress_unlzma.o lib/decompress_un=
lzo.o lib/decompress_unxz.o lib/decompress_unzstd.o lib/dump_stack.o lib/ea=
rlycpio.o lib/extable.o lib/flex_proportions.o lib/idr.o lib/iomem_copy.o l=
ib/irq_regs.o lib/is_single_threaded.o lib/klist.o lib/kobject.o lib/kobjec=
t_uevent.o lib/logic_pio.o lib/maple_tree.o lib/memcat_p.o lib/nmi_backtrac=
e.o lib/objpool.o lib/plist.o lib/radix-tree.o lib/ratelimit.o lib/rbtree.o=
 lib/seq_buf.o lib/siphash.o lib/string.o lib/sys_info.o lib/timerqueue.o l=
ib/union_find.o lib/vsprintf.o lib/win_minmax.o lib/xarray.o"
+        expected =3D "lib/argv_split.o lib/bug.o lib/buildid.o lib/clz_tab=
.o lib/cmdline.o lib/cpumask.o lib/ctype.o lib/dec_and_lock.o lib/decompres=
s.o lib/decompress_bunzip2.o lib/decompress_inflate.o lib/decompress_unlz4.=
o lib/decompress_unlzma.o lib/decompress_unlzo.o lib/decompress_unxz.o lib/=
decompress_unzstd.o lib/dump_stack.o lib/earlycpio.o lib/extable.o lib/flex=
_proportions.o lib/idr.o lib/iomem_copy.o lib/irq_regs.o lib/is_single_thre=
aded.o lib/klist.o lib/kobject.o lib/kobject_uevent.o lib/logic_pio.o lib/m=
aple_tree.o lib/memcat_p.o lib/nmi_backtrace.o lib/objpool.o lib/plist.o li=
b/radix-tree.o lib/ratelimit.o lib/rbtree.o lib/seq_buf.o lib/siphash.o lib=
/string.o lib/sys_info.o lib/timerqueue.o lib/union_find.o lib/vsprintf.o l=
ib/win_minmax.o lib/xarray.o"
+        self._assert_parsing(cmd, expected)
+
+    def test_ar_llvm(self):
+        cmd =3D "llvm-ar mPiT $$(llvm-ar t vmlinux.a | sed -n 1p) vmlinux.=
a $$(llvm-ar t vmlinux.a | grep -F -f ../scripts/head-object-list.txt)"
+        expected =3D ""
+        self._assert_parsing(cmd, expected)
+
+    # nm command tests
+    def test_nm(self):
+        cmd =3D """llvm-nm -p --defined-only rust/core.o | awk '$$2~/(T|R|=
D|B)/ && $$3!~/__(pfx|cfi|odr_asan)/ { printf "EXPORT_SYMBOL_RUST_GPL(%s);\=
n",$$3 }' > rust/exports_core_generated.h"""
+        expected =3D "rust/core.o"
+        self._assert_parsing(cmd, expected)
+
+    def test_nm_vmlinux(self):
+        cmd =3D r"nm vmlinux | sed -n -e 's/^\([0-9a-fA-F]*\) [ABbCDGRSTtV=
W] \(_text\|__start_rodata\|__bss_start\|_end\)$/#define VO_\2 _AC(0x\1,UL)=
/p' > arch/x86/boot/voffset.h"
+        expected =3D "vmlinux"
+        self._assert_parsing(cmd, expected)
+
+    # objcopy command tests
+    def test_objcopy(self):
+        cmd =3D "objcopy --remove-section=3D'.rel*' --remove-section=3D!'.=
rel*.dyn' vmlinux.unstripped vmlinux"
+        expected =3D "vmlinux.unstripped"
+        self._assert_parsing(cmd, expected)
+
+    def test_objcopy_llvm(self):
+        cmd =3D "llvm-objcopy --remove-section=3D'.rel*' --remove-section=
=3D!'.rel*.dyn' vmlinux.unstripped vmlinux"
+        expected =3D "vmlinux.unstripped"
+        self._assert_parsing(cmd, expected)
+
+    # strip command tests
+    def test_strip(self):
+        cmd =3D "strip --strip-debug -o drivers/firmware/efi/libstub/mem.s=
tub.o drivers/firmware/efi/libstub/mem.o"
+        expected =3D "drivers/firmware/efi/libstub/mem.o"
+        self._assert_parsing(cmd, expected)
+
+    # rustc command tests
+    def test_rustc(self):
+        cmd =3D """OBJTREE=3D/workspace/linux/kernel_build rustc -Zbinary_=
dep_depinfo=3Dy -Astable_features -Dnon_ascii_idents -Dunsafe_op_in_unsafe_=
fn -Wmissing_docs -Wrust_2018_idioms -Wclippy::all -Wclippy::as_ptr_cast_mu=
t -Wclippy::as_underscore -Wclippy::cast_lossless -Wclippy::ignored_unit_pa=
tterns -Wclippy::mut_mut -Wclippy::needless_bitwise_bool -Aclippy::needless=
_lifetimes -Wclippy::no_mangle_with_rust_abi -Wclippy::ptr_as_ptr -Wclippy:=
:ptr_cast_constness -Wclippy::ref_as_ptr -Wclippy::undocumented_unsafe_bloc=
ks -Wclippy::unnecessary_safety_comment -Wclippy::unnecessary_safety_doc -W=
rustdoc::missing_crate_level_docs -Wrustdoc::unescaped_backticks -Cpanic=3D=
abort -Cembed-bitcode=3Dn -Clto=3Dn -Cforce-unwind-tables=3Dn -Ccodegen-uni=
ts=3D1 -Csymbol-mangling-version=3Dv0 -Crelocation-model=3Dstatic -Zfunctio=
n-sections=3Dn -Wclippy::float_arithmetic --target=3D./scripts/target.json =
-Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2 -Zcf-=
protection=3Dbranch -Zno-jump-tables -Ctarget-cpu=3Dx86-64 -Ztune-cpu=3Dgen=
eric -Cno-redzone=3Dy -Ccode-model=3Dkernel -Zfunction-return=3Dthunk-exter=
n -Zpatchable-function-entry=3D16,16 -Copt-level=3D2 -Cdebug-assertions=3Dn=
 -Coverflow-checks=3Dy -Dwarnings @./include/generated/rustc_cfg --edition=
=3D2021 --cfg no_fp_fmt_parse --emit=3Ddep-info=3Drust/.core.o.d --emit=3Do=
bj=3Drust/core.o --emit=3Dmetadata=3Drust/libcore.rmeta --crate-type rlib -=
L./rust --crate-name core /usr/lib/rust-1.84/lib/rustlib/src/rust/library/c=
ore/src/lib.rs --sysroot=3D/dev/null ;llvm-objcopy --redefine-sym __addsf3=
=3D__rust__addsf3 --redefine-sym __eqsf2=3D__rust__eqsf2 --redefine-sym __e=
xtendsfdf2=3D__rust__extendsfdf2 --redefine-sym __gesf2=3D__rust__gesf2 --r=
edefine-sym __lesf2=3D__rust__lesf2 --redefine-sym __ltsf2=3D__rust__ltsf2 =
--redefine-sym __mulsf3=3D__rust__mulsf3 --redefine-sym __nesf2=3D__rust__n=
esf2 --redefine-sym __truncdfsf2=3D__rust__truncdfsf2 --redefine-sym __unor=
dsf2=3D__rust__unordsf2 --redefine-sym __adddf3=3D__rust__adddf3 --redefine=
-sym __eqdf2=3D__rust__eqdf2 --redefine-sym __ledf2=3D__rust__ledf2 --redef=
ine-sym __ltdf2=3D__rust__ltdf2 --redefine-sym __muldf3=3D__rust__muldf3 --=
redefine-sym __unorddf2=3D__rust__unorddf2 --redefine-sym __muloti4=3D__rus=
t__muloti4 --redefine-sym __multi3=3D__rust__multi3 --redefine-sym __udivmo=
dti4=3D__rust__udivmodti4 --redefine-sym __udivti3=3D__rust__udivti3 --rede=
fine-sym __umodti3=3D__rust__umodti3 rust/core.o"""
+        expected =3D "/usr/lib/rust-1.84/lib/rustlib/src/rust/library/core=
/src/lib.rs rust/core.o"
+        self._assert_parsing(cmd, expected)
+
+    # rustdoc command tests
+    def test_rustdoc(self):
+        cmd =3D """OBJTREE=3D/workspace/linux/kernel_build rustdoc --test =
--edition=3D2021 -Zbinary_dep_depinfo=3Dy -Astable_features -Dnon_ascii_ide=
nts -Dunsafe_op_in_unsafe_fn -Wmissing_docs -Wrust_2018_idioms -Wunreachabl=
e_pub -Wclippy::all -Wclippy::as_ptr_cast_mut -Wclippy::as_underscore -Wcli=
ppy::cast_lossless -Wclippy::ignored_unit_patterns -Wclippy::mut_mut -Wclip=
py::needless_bitwise_bool -Aclippy::needless_lifetimes -Wclippy::no_mangle_=
with_rust_abi -Wclippy::ptr_as_ptr -Wclippy::ptr_cast_constness -Wclippy::r=
ef_as_ptr -Wclippy::undocumented_unsafe_blocks -Wclippy::unnecessary_safety=
_comment -Wclippy::unnecessary_safety_doc -Wrustdoc::missing_crate_level_do=
cs -Wrustdoc::unescaped_backticks -Cpanic=3Dabort -Cembed-bitcode=3Dn -Clto=
=3Dn -Cforce-unwind-tables=3Dn -Ccodegen-units=3D1 -Csymbol-mangling-versio=
n=3Dv0 -Crelocation-model=3Dstatic -Zfunction-sections=3Dn -Wclippy::float_=
arithmetic --target=3Daarch64-unknown-none -Ctarget-feature=3D"-neon" -Cfor=
ce-unwind-tables=3Dn -Zbranch-protection=3Dpac-ret -Copt-level=3D2 -Cdebug-=
assertions=3Dy -Coverflow-checks=3Dy -Dwarnings -Cforce-frame-pointers=3Dy =
-Zsanitizer=3Dkernel-address -Zsanitizer-recover=3Dkernel-address -Cllvm-ar=
gs=3D-asan-mapping-offset=3D0xdfff800000000000 -Cpasses=3Dsancov-module -Cl=
lvm-args=3D-sanitizer-coverage-level=3D3 -Cllvm-args=3D-sanitizer-coverage-=
trace-pc -Cllvm-args=3D-sanitizer-coverage-trace-compares @./include/genera=
ted/rustc_cfg -L./rust --extern ffi --extern pin_init --extern kernel --ext=
ern build_error --extern macros --extern bindings --extern uapi --no-run --=
crate-name kernel -Zunstable-options --sysroot=3D/dev/null  --test-builder =
./scripts/rustdoc_test_builder ../rust/kernel/lib.rs >/dev/null"""
+        expected =3D "../rust/kernel/lib.rs"
+        self._assert_parsing(cmd, expected)
+
+    def test_rustdoc_test_gen(self):
+        cmd =3D "./scripts/rustdoc_test_gen"
+        expected =3D ""
+        self._assert_parsing(cmd, expected)
+
+    # flex command tests
+    def test_flex(self):
+        cmd =3D "flex -oscripts/kconfig/lexer.lex.c -L ../scripts/kconfig/=
lexer.l"
+        expected =3D "../scripts/kconfig/lexer.l"
+        self._assert_parsing(cmd, expected)
+
+    # bison command tests
+    def test_bison(self):
+        cmd =3D "bison -o scripts/kconfig/parser.tab.c --defines=3Dscripts=
/kconfig/parser.tab.h -t -l ../scripts/kconfig/parser.y"
+        expected =3D "../scripts/kconfig/parser.y"
+        self._assert_parsing(cmd, expected)
+
+    # bindgen command tests
+    def test_bindgen(self):
+        cmd =3D (
+            "bindgen ../rust/bindings/bindings_helper.h "
+            "--blocklist-type __kernel_s?size_t --blocklist-type __kernel_=
ptrdiff_t "
+            "--opaque-type xregs_state --opaque-type desc_struct --no-doc-=
comments "
+            "--rust-target 1.68 --use-core --with-derive-default -o rust/b=
indings/bindings_generated.rs "
+            "-- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc =
-I../arch/x86/include "
+            "-include ../include/linux/compiler-version.h -D__KERNEL__ -fi=
ntegrated-as -fno-builtin -DMODULE; "
+            "sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub co=
nst \\1/g' rust/bindings/bindings_generated.rs"
+        )
+        expected =3D "../rust/bindings/bindings_helper.h ../include/linux/=
compiler-version.h"
+        self._assert_parsing(cmd, expected)
+
+    # perl command tests
+    def test_perl(self):
+        cmd =3D "perl ../lib/crypto/x86/poly1305-x86_64-cryptogams.pl > li=
b/crypto/x86/poly1305-x86_64-cryptogams.S"
+        expected =3D "../lib/crypto/x86/poly1305-x86_64-cryptogams.pl"
+        self._assert_parsing(cmd, expected)
+
+    # link-vmlinux.sh command tests
+    def test_link_vmlinux(self):
+        cmd =3D '../scripts/link-vmlinux.sh "ld" "-m elf_x86_64 -z noexecs=
tack" "-z max-page-size=3D0x200000 --build-id=3Dsha1 --orphan-handling=3Der=
ror --emit-relocs --discard-none" "vmlinux.unstripped";  true'
+        expected =3D "vmlinux.a"
+        self._assert_parsing(cmd, expected)
+
+    def test_link_vmlinux_postlink(self):
+        cmd =3D '../scripts/link-vmlinux.sh "ld" "-m elf_x86_64 -z noexecs=
tack --no-warn-rwx-segments" "--emit-relocs --discard-none -z max-page-size=
=3D0x200000 --build-id=3Dsha1 -X --orphan-handling=3Derror";  make -f ../ar=
ch/x86/Makefile.postlink vmlinux'
+        expected =3D "vmlinux.a"
+        self._assert_parsing(cmd, expected)
+
+    # syscallhdr.sh command tests
+    def test_syscallhdr(self):
+        cmd =3D "sh ../scripts/syscallhdr.sh --abis common,64 --emit-nr   =
../arch/x86/entry/syscalls/syscall_64.tbl arch/x86/include/generated/uapi/a=
sm/unistd_64.h"
+        expected =3D "../arch/x86/entry/syscalls/syscall_64.tbl"
+        self._assert_parsing(cmd, expected)
+
+    # syscalltbl.sh command tests
+    def test_syscalltbl(self):
+        cmd =3D "sh ../scripts/syscalltbl.sh --abis common,64 ../arch/x86/=
entry/syscalls/syscall_64.tbl arch/x86/include/generated/asm/syscalls_64.h"
+        expected =3D "../arch/x86/entry/syscalls/syscall_64.tbl"
+        self._assert_parsing(cmd, expected)
+
+    # mkcapflags.sh command tests
+    def test_mkcapflags(self):
+        cmd =3D "sh ../arch/x86/kernel/cpu/mkcapflags.sh arch/x86/kernel/c=
pu/capflags.c ../arch/x86/kernel/cpu/../../include/asm/cpufeatures.h ../arc=
h/x86/kernel/cpu/../../include/asm/vmxfeatures.h ../arch/x86/kernel/cpu/mkc=
apflags.sh FORCE"
+        expected =3D "../arch/x86/kernel/cpu/../../include/asm/cpufeatures=
.h ../arch/x86/kernel/cpu/../../include/asm/vmxfeatures.h"
+        self._assert_parsing(cmd, expected)
+
+    # orc_hash.sh command tests
+    def test_orc_hash(self):
+        cmd =3D "mkdir -p arch/x86/include/generated/asm/; sh ../scripts/o=
rc_hash.sh < ../arch/x86/include/asm/orc_types.h > arch/x86/include/generat=
ed/asm/orc_hash.h"
+        expected =3D "../arch/x86/include/asm/orc_types.h"
+        self._assert_parsing(cmd, expected)
+
+    # xen-hypercalls.sh command tests
+    def test_xen_hypercalls(self):
+        cmd =3D "sh '../scripts/xen-hypercalls.sh' arch/x86/include/genera=
ted/asm/xen-hypercalls.h ../include/xen/interface/xen-mca.h ../include/xen/=
interface/xen.h ../include/xen/interface/xenpmu.h"
+        expected =3D "../include/xen/interface/xen-mca.h ../include/xen/in=
terface/xen.h ../include/xen/interface/xenpmu.h"
+        self._assert_parsing(cmd, expected)
+
+    # gen_initramfs.sh command tests
+    def test_gen_initramfs(self):
+        cmd =3D "sh ../usr/gen_initramfs.sh -o usr/initramfs_data.cpio -l =
usr/.initramfs_data.cpio.d    ../usr/default_cpio_list"
+        expected =3D "../usr/default_cpio_list"
+        self._assert_parsing(cmd, expected)
+
+    # vdso2c command tests
+    def test_vdso2c(self):
+        cmd =3D "arch/x86/entry/vdso/vdso2c arch/x86/entry/vdso/vdso64.so.=
dbg arch/x86/entry/vdso/vdso64.so arch/x86/entry/vdso/vdso-image-64.c"
+        expected =3D "arch/x86/entry/vdso/vdso64.so.dbg arch/x86/entry/vds=
o/vdso64.so"
+        self._assert_parsing(cmd, expected)
+
+    # mkpiggy command tests
+    def test_mkpiggy(self):
+        cmd =3D "arch/x86/boot/compressed/mkpiggy arch/x86/boot/compressed=
/vmlinux.bin.gz > arch/x86/boot/compressed/piggy.S"
+        expected =3D "arch/x86/boot/compressed/vmlinux.bin.gz"
+        self._assert_parsing(cmd, expected)
+
+    # relocs command tests
+    def test_relocs(self):
+        cmd =3D "arch/x86/tools/relocs vmlinux.unstripped > arch/x86/boot/=
compressed/vmlinux.relocs;arch/x86/tools/relocs --abs-relocs vmlinux.unstri=
pped"
+        expected =3D "vmlinux.unstripped"
+        self._assert_parsing(cmd, expected)
+
+    def test_relocs_with_realmode(self):
+        cmd =3D (
+            "arch/x86/tools/relocs --realmode arch/x86/realmode/rm/realmod=
e.elf > arch/x86/realmode/rm/realmode.relocs"
+        )
+        expected =3D "arch/x86/realmode/rm/realmode.elf"
+        self._assert_parsing(cmd, expected)
+
+    # mk_elfconfig command tests
+    def test_mk_elfconfig(self):
+        cmd =3D "scripts/mod/mk_elfconfig < scripts/mod/empty.o > scripts/=
mod/elfconfig.h"
+        expected =3D "scripts/mod/empty.o"
+        self._assert_parsing(cmd, expected)
+
+    # tools/build command tests
+    def test_build(self):
+        cmd =3D "arch/x86/boot/tools/build arch/x86/boot/setup.bin arch/x8=
6/boot/vmlinux.bin arch/x86/boot/zoffset.h arch/x86/boot/bzImage"
+        expected =3D "arch/x86/boot/setup.bin arch/x86/boot/vmlinux.bin ar=
ch/x86/boot/zoffset.h"
+        self._assert_parsing(cmd, expected)
+
+    # extract-cert command tests
+    def test_extract_cert(self):
+        cmd =3D 'certs/extract-cert ""  certs/signing_key.x509'
+        expected =3D ""
+        self._assert_parsing(cmd, expected)
+
+    # dtc command tests
+    def test_dtc_cat(self):
+        cmd =3D "./scripts/dtc/dtc -o drivers/of/empty_root.dtb -b 0 -i../=
drivers/of/ -i../scripts/dtc/include-prefixes -Wno-unique_unit_address -Wno=
-unit_address_vs_reg -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno=
-graph_child_address -Wno-simple_bus_reg   -d drivers/of/.empty_root.dtb.d.=
dtc.tmp drivers/of/.empty_root.dtb.dts.tmp ; cat drivers/of/.empty_root.dtb=
.d.pre.tmp drivers/of/.empty_root.dtb.d.dtc.tmp > drivers/of/.empty_root.dt=
b.d"
+        expected =3D "drivers/of/.empty_root.dtb.dts.tmp drivers/of/.empty=
_root.dtb.d.pre.tmp drivers/of/.empty_root.dtb.d.dtc.tmp"
+        self._assert_parsing(cmd, expected)
+
+    # pnmtologo command tests
+    def test_pnmtologo(self):
+        cmd =3D "drivers/video/logo/pnmtologo -t clut224 -n logo_linux_clu=
t224 -o drivers/video/logo/logo_linux_clut224.c ../drivers/video/logo/logo_=
linux_clut224.ppm"
+        expected =3D "../drivers/video/logo/logo_linux_clut224.ppm"
+        self._assert_parsing(cmd, expected)
+
+    # relacheck command tests
+    def test_relacheck(self):
+        cmd =3D "arch/arm64/kernel/pi/relacheck arch/arm64/kernel/pi/idreg=
-override.pi.o arch/arm64/kernel/pi/idreg-override.o"
+        expected =3D "arch/arm64/kernel/pi/idreg-override.pi.o"
+        self._assert_parsing(cmd, expected)
+
+    # gen-hyprel command tests
+    def test_gen_hyprel(self):
+        cmd =3D "arch/arm64/kvm/hyp/nvhe/gen-hyprel arch/arm64/kvm/hyp/nvh=
e/kvm_nvhe.tmp.o > arch/arm64/kvm/hyp/nvhe/hyp-reloc.S"
+        expected =3D "arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o"
+        self._assert_parsing(cmd, expected)
+
+    # mkregtable command tests
+    def test_mkregtable(self):
+        cmd =3D "drivers/gpu/drm/radeon/mkregtable ../drivers/gpu/drm/rade=
on/reg_srcs/r100 > drivers/gpu/drm/radeon/r100_reg_safe.h"
+        expected =3D "../drivers/gpu/drm/radeon/reg_srcs/r100"
+        self._assert_parsing(cmd, expected)
+
+    # genheaders command tests
+    def test_genheaders(self):
+        cmd =3D "security/selinux/genheaders security/selinux/flask.h secu=
rity/selinux/av_permissions.h"
+        expected =3D ""
+        self._assert_parsing(cmd, expected)
+
+    # mkcpustr command tests
+    def test_mkcpustr(self):
+        cmd =3D "arch/x86/boot/mkcpustr > arch/x86/boot/cpustr.h"
+        expected =3D ""
+        self._assert_parsing(cmd, expected)
+
+    # polgen command tests
+    def test_polgen(self):
+        cmd =3D "scripts/ipe/polgen/polgen security/ipe/boot_policy.c"
+        expected =3D ""
+        self._assert_parsing(cmd, expected)
+
+    # gen_header.py command tests
+    def test_gen_header(self):
+        cmd =3D "mkdir -p drivers/gpu/drm/msm/generated && python3 ../driv=
ers/gpu/drm/msm/registers/gen_header.py --no-validate --rnn ../drivers/gpu/=
drm/msm/registers --xml ../drivers/gpu/drm/msm/registers/adreno/a2xx.xml c-=
defines > drivers/gpu/drm/msm/generated/a2xx.xml.h"
+        expected =3D "../drivers/gpu/drm/msm/registers/adreno/a2xx.xml"
+        self._assert_parsing(cmd, expected)
+
+
+if __name__ =3D=3D "__main__":
+    unittest.main()
--=20
2.43.0


