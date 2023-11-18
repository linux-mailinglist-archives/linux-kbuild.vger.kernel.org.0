Return-Path: <linux-kbuild+bounces-58-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D200F7EFE7C
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 09:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26F7F28105A
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 08:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55634DDD6;
	Sat, 18 Nov 2023 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpvjZlBm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD0F1078A
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 08:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63ADC433C7;
	Sat, 18 Nov 2023 08:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700295258;
	bh=CWLOUlaUDcSdXmXx8kyIUvb+xenuir3wMxbwXCYCaQU=;
	h=From:To:Cc:Subject:Date:From;
	b=GpvjZlBmZ+xuExHdfa3veTtTuKQZmddDiJAgt8veLEXTCW/wk5GTlBsaSCIRp/qKh
	 gdi6rmxZVWgtlsKCfyiVYUCxl1IRKRxaImDTxJR42b5cI427FdW7Ob+R7HNntsTza/
	 G/pTiWih9GLZH0PcLrLb+VOwtG2fDkj7B4lP9CHu8TA3uZz3sxDpUwQo8vb5+43hgB
	 xrmcD0bBcloK/vaumEGRNUTS3hS7QIZfTOEFGuWs7A9+Q4A967nnUl6J8D19thsl7o
	 fzfLUnUwIY7dz2Sv+p8M8Ubg+kwbwnRcO6e+qu72mkv0GgY9ML7uNMSV0wus343ng0
	 NMU/CDvqwHDuQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] scripts: clean up IA-64 code
Date: Sat, 18 Nov 2023 17:13:34 +0900
Message-Id: <20231118081334.1308242-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A little more janitorial work after commit cf8e8658100d ("arch: Remove
Itanium (IA-64) architecture").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/checkstack.pl        |  3 ---
 scripts/gdb/linux/tasks.py   | 15 +++------------
 scripts/head-object-list.txt |  1 -
 scripts/kconfig/mconf.c      |  2 +-
 scripts/kconfig/nconf.c      |  2 +-
 scripts/package/kernel.spec  |  6 ------
 scripts/package/mkdebian     |  2 +-
 scripts/recordmcount.pl      |  7 -------
 scripts/xz_wrap.sh           |  1 -
 9 files changed, 6 insertions(+), 33 deletions(-)

diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index 84f5fb7f1cec..35fefdfd6ef2 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -68,9 +68,6 @@ my (@stack, $re, $dre, $sub, $x, $xs, $funcre, $min_stack);
 		#    2f60:    48 81 ec e8 05 00 00       sub    $0x5e8,%rsp
 		$re = qr/^.*[as][du][db]    \$(0x$x{1,8}),\%(e|r)sp$/o;
 		$dre = qr/^.*[as][du][db]    (%.*),\%(e|r)sp$/o;
-	} elsif ($arch eq 'ia64') {
-		#e0000000044011fc:       01 0f fc 8c     adds r12=-384,r12
-		$re = qr/.*adds.*r12=-(([0-9]{2}|[3-9])[0-9]{2}),r12/o;
 	} elsif ($arch eq 'm68k') {
 		#    2b6c:       4e56 fb70       linkw %fp,#-1168
 		#  1df770:       defc ffe4       addaw #-28,%sp
diff --git a/scripts/gdb/linux/tasks.py b/scripts/gdb/linux/tasks.py
index 17ec19e9b5bf..5be53b372a69 100644
--- a/scripts/gdb/linux/tasks.py
+++ b/scripts/gdb/linux/tasks.py
@@ -86,21 +86,12 @@ LxPs()
 
 thread_info_type = utils.CachedType("struct thread_info")
 
-ia64_task_size = None
-
 
 def get_thread_info(task):
     thread_info_ptr_type = thread_info_type.get_type().pointer()
-    if utils.is_target_arch("ia64"):
-        global ia64_task_size
-        if ia64_task_size is None:
-            ia64_task_size = gdb.parse_and_eval("sizeof(struct task_struct)")
-        thread_info_addr = task.address + ia64_task_size
-        thread_info = thread_info_addr.cast(thread_info_ptr_type)
-    else:
-        if task.type.fields()[0].type == thread_info_type.get_type():
-            return task['thread_info']
-        thread_info = task['stack'].cast(thread_info_ptr_type)
+    if task.type.fields()[0].type == thread_info_type.get_type():
+        return task['thread_info']
+    thread_info = task['stack'].cast(thread_info_ptr_type)
     return thread_info.dereference()
 
 
diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
index 26359968744e..890f69005bab 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -17,7 +17,6 @@ arch/arm/kernel/head-nommu.o
 arch/arm/kernel/head.o
 arch/csky/kernel/head.o
 arch/hexagon/kernel/head.o
-arch/ia64/kernel/head.o
 arch/loongarch/kernel/head.o
 arch/m68k/68000/head.o
 arch/m68k/coldfire/head.o
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index eccc87a441e7..3795c36a9181 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -247,7 +247,7 @@ search_help[] =
 	"      -> PCI support (PCI [=y])\n"
 	"(1)     -> PCI access mode (<choice> [=y])\n"
 	"  Defined at drivers/pci/Kconfig:47\n"
-	"  Depends on: X86_LOCAL_APIC && X86_IO_APIC || IA64\n"
+	"  Depends on: X86_LOCAL_APIC && X86_IO_APIC\n"
 	"  Selects: LIBCRC32\n"
 	"  Selected by: BAR [=n]\n"
 	"-----------------------------------------------------------------\n"
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 143a2c351d57..8cd72fe25974 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -216,7 +216,7 @@ search_help[] =
 "Symbol: FOO [ = m]\n"
 "Prompt: Foo bus is used to drive the bar HW\n"
 "Defined at drivers/pci/Kconfig:47\n"
-"Depends on: X86_LOCAL_APIC && X86_IO_APIC || IA64\n"
+"Depends on: X86_LOCAL_APIC && X86_IO_APIC\n"
 "Location:\n"
 "  -> Bus options (PCI, PCMCIA, EISA, ISA)\n"
 "    -> PCI support (PCI [ = y])\n"
diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 3eee0143e0c5..89298983a169 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -56,13 +56,7 @@ patch -p1 < %{SOURCE2}
 
 %install
 mkdir -p %{buildroot}/boot
-%ifarch ia64
-mkdir -p %{buildroot}/boot/efi
-cp $(%{make} %{makeflags} -s image_name) %{buildroot}/boot/efi/vmlinuz-%{KERNELRELEASE}
-ln -s efi/vmlinuz-%{KERNELRELEASE} %{buildroot}/boot/
-%else
 cp $(%{make} %{makeflags} -s image_name) %{buildroot}/boot/vmlinuz-%{KERNELRELEASE}
-%endif
 %{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} modules_install
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
 cp System.map %{buildroot}/boot/System.map-%{KERNELRELEASE}
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 5044224cf671..c1a36da85e84 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -26,7 +26,7 @@ set_debarch() {
 
 	# Attempt to find the correct Debian architecture
 	case "$UTS_MACHINE" in
-	i386|ia64|alpha|m68k|riscv*)
+	i386|alpha|m68k|riscv*)
 		debarch="$UTS_MACHINE" ;;
 	x86_64)
 		debarch=amd64 ;;
diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index 6a4645a57976..f84df9e383fd 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -275,13 +275,6 @@ if ($arch eq "x86_64") {
     $section_type = '%progbits';
     $mcount_regex = "^\\s*([0-9a-fA-F]+):\\s*R_AARCH64_CALL26\\s+_mcount\$";
     $type = ".quad";
-} elsif ($arch eq "ia64") {
-    $mcount_regex = "^\\s*([0-9a-fA-F]+):.*\\s_mcount\$";
-    $type = "data8";
-
-    if ($is_module eq "0") {
-	$cc .= " -mconstant-gp";
-    }
 } elsif ($arch eq "sparc64") {
     # In the objdump output there are giblets like:
     # 0000000000000000 <igmp_net_exit-0x18>:
diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
index 76e9cbcfbeab..d06baf626abe 100755
--- a/scripts/xz_wrap.sh
+++ b/scripts/xz_wrap.sh
@@ -15,7 +15,6 @@ LZMA2OPTS=
 case $SRCARCH in
 	x86)            BCJ=--x86 ;;
 	powerpc)        BCJ=--powerpc ;;
-	ia64)           BCJ=--ia64; LZMA2OPTS=pb=4 ;;
 	arm)            BCJ=--arm ;;
 	sparc)          BCJ=--sparc ;;
 esac
-- 
2.40.1


