Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD24182510
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2020 23:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731330AbgCKWil (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Mar 2020 18:38:41 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:26361 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbgCKWik (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 18:38:40 -0400
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 02BMbYqg019805;
        Thu, 12 Mar 2020 07:37:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 02BMbYqg019805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583966256;
        bh=eV641mEtJcxSe/x4CJ7sZRwpUKMRqHWiX6uSM6ikt7k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0Qv5mtexJ95oplfw3jKx4O598pCAJ9biXotcsFjwC37RUh5mjkalSW2Su/e7k5GrF
         CS+dF74fN/6vnlWySkPqixNggjqPy8/vvoeZI/XfCS8+MT55iddwww1YHT2NIcvd9H
         L7eToIXaLjE/X+We9JBBFEIVZaiI2urFw0llbu8b8UGdOaKOsjXnflKOIXLS9Q+E2r
         kH2uBh+8b4vIuVYQ3X+EdkrkSfZS8jgjFnNKWw0V3D0sueyPh6wmd3sh66n3b0+dX8
         5RI5gFGxW3DikjUcQbcGMRHsUpX/8Lo/z7yIbB73Z3AfdoAWlwm5f5h3JTqnkLXMz8
         xLmnzEShuHyjQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     sparclinux@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        clang-built-linux@googlegroups.com,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v2 2/2] kbuild: link lib-y objects to vmlinux forcibly when CONFIG_MODULES=y
Date:   Thu, 12 Mar 2020 07:37:25 +0900
Message-Id: <20200311223725.27662-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311223725.27662-1-masahiroy@kernel.org>
References: <20200311223725.27662-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Kbuild supports not only obj-y but also lib-y to list objects linked to
vmlinux.

The difference between them is that all the objects from obj-y are
forcibly linked to vmlinux by using --whole-archive, whereas the objects
from lib-y are linked as needed; if there is no user of a lib-y object,
it is not linked.

lib-y is intended to list utility functions that may be called from all
over the place (and may be unused at all), but it is a problem for
EXPORT_SYMBOL(). Even if there is no call-site in the vmlinux, we need
to keep exported symbols for the use from loadable modules.

Commit 7f2084fa55e6 ("[kbuild] handle exports in lib-y objects reliably")
worked around it by linking a dummy object, lib-ksyms.o, which contains
references to all the symbols exported from lib.a in that directory.
It uses the linker script command, EXTERN. Unfortunately, the meaning of
EXTERN of ld.lld is different from that of ld.bfd. Therefore, this does
not work with LD=ld.lld (CBL issue #515).

Anyway, the build rule of lib-ksyms.o is somewhat tricky. So, I want to
get rid of it.

At first, I was thinking of accumulating lib-y objects into obj-y
(or even replacing lib-y with obj-y entirely), but the lib-y syntax
is used beyond the ordinary use in lib/ and arch/*/lib/.

Examples:

 - drivers/firmware/efi/libstub/Makefile builds lib.a, which is linked
   into vmlinux in the own way (arm64), or linked to the decompressor
   (arm, x86).

 - arch/alpha/lib/Makefile builds lib.a which is linked not only to
   vmlinux, but also to bootloaders in arch/alpha/boot/Makefile.

 - arch/xtensa/boot/lib/Makefile builds lib.a for use from
   arch/xtensa/boot/boot-redboot/Makefile.

One more thing, adding everything to obj-y would increase the vmlinux
size of allnoconfig (or tinyconfig).

For less impact, I tweaked the destination of lib.a at the top Makefile;
when CONFIG_MODULES=y, lib.a goes to KBUILD_VMLINUX_OBJS, which is
forcibly linked to vmlinux, otherwise lib.a goes to KBUILD_VMLINUX_LIBS
as before.

The size impact for normal usecases is quite small since at lease one
symbol in every lib-y object is eventually called by someone. In case
you are intrested, here are the figures.

x86_64_defconfig:

   text	   data	    bss	    dec	    hex	filename
19566602 5422072 1589328 26578002 1958c52 vmlinux.before
19566932 5422104 1589328 26578364 1958dbc vmlinux.after

The case with the biggest impact is allnoconfig + CONFIG_MODULES=y.

ARCH=x86 allnoconfig + CONFIG_MODULES=y:

   text	   data	    bss	    dec	    hex	filename
1175162	 254740	1220608	2650510	 28718e	vmlinux.before
1177974	 254836	1220608	2653418	 287cea	vmlinux.after

Hopefully this is still not a big deal. The per-file trimming with the
static library is not so effective after all.

If fine-grained optimization is desired, some architectures support
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION, which trims dead code per-symbol
basis. When LTO is supported in mainline, even better optimization will
be possible.

Link: https://github.com/ClangBuiltLinux/linux/issues/515
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reported-by: kbuild test robot <lkp@intel.com>
---

Changes in v2: None

 Makefile               |  7 ++++++-
 scripts/Makefile.build | 17 -----------------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 6a538b79e61e..2cdbd4b3e36d 100644
--- a/Makefile
+++ b/Makefile
@@ -1034,8 +1034,13 @@ init-y		:= $(patsubst %/, %/built-in.a, $(init-y))
 core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
 drivers-y	:= $(patsubst %/, %/built-in.a, $(drivers-y))
 net-y		:= $(patsubst %/, %/built-in.a, $(net-y))
+libs-y2		:= $(patsubst %/, %/built-in.a, $(filter %/, $(libs-y)))
+ifdef CONFIG_MODULES
+libs-y1		:= $(filter-out %/, $(libs-y))
+libs-y2		+= $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
+else
 libs-y1		:= $(patsubst %/, %/lib.a, $(libs-y))
-libs-y2		:= $(patsubst %/, %/built-in.a, $(filter-out %.a, $(libs-y)))
+endif
 virt-y		:= $(patsubst %/, %/built-in.a, $(virt-y))
 
 # Externally visible symbols (used by link-vmlinux.sh)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a1730d42e5f3..356601994f3a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -65,7 +65,6 @@ endif
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
 lib-target := $(obj)/lib.a
-real-obj-y += $(obj)/lib-ksyms.o
 endif
 
 ifdef need-builtin
@@ -410,22 +409,6 @@ $(lib-target): $(lib-y) FORCE
 
 targets += $(lib-target)
 
-dummy-object = $(obj)/.lib_exports.o
-ksyms-lds = $(dot-target).lds
-
-quiet_cmd_export_list = EXPORTS $@
-cmd_export_list = $(OBJDUMP) -h $< | \
-	sed -ne '/___ksymtab/s/.*+\([^ ]*\).*/EXTERN(\1)/p' >$(ksyms-lds);\
-	rm -f $(dummy-object);\
-	echo | $(CC) $(a_flags) -c -o $(dummy-object) -x assembler -;\
-	$(LD) $(ld_flags) -r -o $@ -T $(ksyms-lds) $(dummy-object);\
-	rm $(dummy-object) $(ksyms-lds)
-
-$(obj)/lib-ksyms.o: $(lib-target) FORCE
-	$(call if_changed,export_list)
-
-targets += $(obj)/lib-ksyms.o
-
 endif
 
 # NOTE:
-- 
2.17.1

