Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 806481137F2
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2019 00:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfLDXCM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Dec 2019 18:02:12 -0500
Received: from forward104j.mail.yandex.net ([5.45.198.247]:36385 "EHLO
        forward104j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728011AbfLDXCM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 18:02:12 -0500
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Dec 2019 18:02:09 EST
Received: from mxback26o.mail.yandex.net (mxback26o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::77])
        by forward104j.mail.yandex.net (Yandex) with ESMTP id 100914A0BFF;
        Thu,  5 Dec 2019 01:55:27 +0300 (MSK)
Received: from myt2-416899e1d7e0.qloud-c.yandex.net (myt2-416899e1d7e0.qloud-c.yandex.net [2a02:6b8:c00:1caf:0:640:4168:99e1])
        by mxback26o.mail.yandex.net (mxback/Yandex) with ESMTP id CiCpCrHJu0-tQXeZx5L;
        Thu, 05 Dec 2019 01:55:27 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=golovin.in; s=mail; t=1575500127;
        bh=A0Ogu7gZHOBeP65sd0xtu2h11UWTeto1NUvcxcTaNio=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=jE0Xif/Fuj4dQpqsnEzIGuJnf00yVfKn/AwRBBClcsTLclfG67clFYiNlw4uGFxUz
         UrJD01D870ksmiuhUS7sNWx59LOmwf5ywibSBqWUF+Pv9NeRGVi4Cq2Kvfx+o5AM8j
         6etU6pOBx1cRhpNOfFkV/QXjuHZonbXPVLWh1btk=
Authentication-Results: mxback26o.mail.yandex.net; dkim=pass header.i=@golovin.in
Received: by myt2-416899e1d7e0.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id QEcSBchbvx-tOVumEJ1;
        Thu, 05 Dec 2019 01:55:25 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Dmitry Golovin <dima@golovin.in>
Cc:     Dmitry Golovin <dima@golovin.in>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        Ross Burton <ross.burton@intel.com>,
        Chao Fan <fanc.fnst@cn.fujitsu.com>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] x86/boot: kbuild: allow readelf executable to be specified
Date:   Thu,  5 Dec 2019 00:54:41 +0200
Message-Id: <20191204225446.202981-1-dima@golovin.in>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Introduce a new READELF variable to top-level Makefile, so the name of
readelf binary can be specified.

Before this change the name of the binary was hardcoded to
"$(CROSS_COMPILE)readelf" which might not be present for every
toolchain.

This allows to build with LLVM Object Reader by using make parameter
READELF=llvm-readelf.

Link: https://github.com/ClangBuiltLinux/linux/issues/771
Signed-off-by: Dmitry Golovin <dima@golovin.in>
Cc: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile                          | 3 ++-
 arch/x86/boot/compressed/Makefile | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 999a197d67d2..612a55d25442 100644
--- a/Makefile
+++ b/Makefile
@@ -414,6 +414,7 @@ STRIP		= $(CROSS_COMPILE)strip
 OBJCOPY		= $(CROSS_COMPILE)objcopy
 OBJDUMP		= $(CROSS_COMPILE)objdump
 OBJSIZE		= $(CROSS_COMPILE)size
+READELF		= $(CROSS_COMPILE)readelf
 PAHOLE		= pahole
 LEX		= flex
 YACC		= bison
@@ -472,7 +473,7 @@ GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
-export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE PAHOLE LEX YACC AWK INSTALLKERNEL
+export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index aa976adb7094..1dac210f7d44 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -103,7 +103,7 @@ vmlinux-objs-$(CONFIG_EFI_MIXED) += $(obj)/efi_thunk_$(BITS).o
 quiet_cmd_check_data_rel = DATAREL $@
 define cmd_check_data_rel
 	for obj in $(filter %.o,$^); do \
-		${CROSS_COMPILE}readelf -S $$obj | grep -qF .rel.local && { \
+		$(READELF) -S $$obj | grep -qF .rel.local && { \
 			echo "error: $$obj has data relocations!" >&2; \
 			exit 1; \
 		} || true; \
-- 
2.23.0

