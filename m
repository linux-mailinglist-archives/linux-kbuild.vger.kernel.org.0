Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CAB28C79F
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 05:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730412AbgJMDlU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 23:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbgJMDlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 23:41:19 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB81C0613D0;
        Mon, 12 Oct 2020 20:41:19 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so16588884pgl.2;
        Mon, 12 Oct 2020 20:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QnFBf559stGtGycK6x7rPCyISX6Wjd0zGUVwkdWXItY=;
        b=Ic1DgpAtmYSK3H9X+FshZNBMed9A+u0Is3uJTYQoFwqpNo+dm0KU8kCJcTVb8aijJO
         NK36xXlolH80VTP3ZdEXEWliYUj/9+t2Al50Q3uN68xRJyGb4Hnw71fxBsLcxJX5ACDc
         +N0zKKQhQUq0Jri3ZDZC/DfQVsd7rFWFRxRjkXjtqqfEdZM+u5Y70pVzCHx/WRj/Fd1A
         NHuc7y6eYwfORXPksrbbGewbaU6JWX0HDs3jcQC1l1Bdyrqjzdyy3DaEl3vfo1j7pqEt
         ooz3ezPuNcvKFoxUGKoMKRGFTITVvudk3ZNtOf/O4Gpk1ymVmXzLMMu+IblYmQn4G4pp
         7C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QnFBf559stGtGycK6x7rPCyISX6Wjd0zGUVwkdWXItY=;
        b=cWN7h3GdP3qEiT+8E7n5nUoC5r/YX89SJnGJ+SYzkMuBaPFhM0VUP543lguhLK7k+S
         P8wvz8d3ODZ5/yDbMWB8EXYztGMp1nbAL80gI8r0Fv/AQwSxs4DAMHFoUZ1PlM2n3EgE
         mEQIPYnTT875A2MM6br8sz0zee+KEYECkcKDN+8vnSi+Yx5exSvviR+H/3xNgWLlHAbS
         S/uSKocYgpJf5gVU0cFSRMJvuD7lqut7kIG6PcqQrRyJDIknBtbm8LaUcE51pkLeubZL
         bVRlUPt8bVFSgybHcXVdIhSN7vum2Ovyy8Bc8b6kp1PpkA9RGdXEsP5vsivIimpBZGDF
         KolQ==
X-Gm-Message-State: AOAM531mgzomrEibww19ZWgqier5D/D7JT7dz+8QNmsU/OvUwaIZ9jUx
        dOQCZViQHqdZWkh3NbHzAOCJhNFR/4o=
X-Google-Smtp-Source: ABdhPJyGwYce2sNmmbxXit4l2re9HBR70WjzKY24wEySbkGo9wMoKKJVaEd2pbN7PkAVsKz3HH/ksQ==
X-Received: by 2002:a17:90a:62c5:: with SMTP id k5mr23551844pjs.100.1602560479246;
        Mon, 12 Oct 2020 20:41:19 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:45e1:2200::1])
        by smtp.gmail.com with ESMTPSA id b21sm13944484pfb.97.2020.10.12.20.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 20:41:18 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] arm64: vdso32: Allow ld.lld to properly link the VDSO
Date:   Mon, 12 Oct 2020 20:39:48 -0700
Message-Id: <20201013033947.2257501-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.29.0.rc0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As it stands now, the vdso32 Makefile hardcodes the linker to ld.bfd
using -fuse-ld=bfd with $(CC). This was taken from the arm vDSO
Makefile, as the comment notes, done in commit d2b30cd4b722 ("ARM:
8384/1: VDSO: force use of BFD linker").

Commit fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to
link VDSO") changed that Makefile to use $(LD) directly instead of
through $(CC), which matches how the rest of the kernel operates. Since
then, LD=ld.lld means that the arm vDSO will be linked with ld.lld,
which has shown no problems so far.

Allow ld.lld to link this vDSO as we do the regular arm vDSO. To do
this, we need to do a few things:

* Add a LD_COMPAT variable, which defaults to $(CROSS_COMPILE_COMPAT)ld
  with gcc and $(LD) if LLVM is 1, which will be ld.lld, or
  $(CROSS_COMPILE_COMPAT)ld if not, which matches the logic of the main
  Makefile. It is overrideable for further customization and avoiding
  breakage.

* Eliminate cc32-ldoption, which matches commit 055efab3120b ("kbuild:
  drop support for cc-ldoption").

With those, we can use $(LD_COMPAT) in cmd_ldvdso and change the flags
from compiler linker flags to linker flags directly. We eliminate
-mfloat-abi=soft because it is not handled by the linker.

Link: https://github.com/ClangBuiltLinux/linux/issues/1033
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

NOTE: This patch is currently based on the kbuild tree due to the
--build-id -> --build-id=sha1 change that Bill did. If the arm64
maintainers would prefer to take this patch, I can rebase it (althought
presumably this won't hit mainline until at least 5.11 so it can
probably just stay as is for now).

 arch/arm64/kernel/vdso32/Makefile | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 7f96a1a9f68c..1cf00c58805d 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -22,16 +22,21 @@ endif
 
 CC_COMPAT ?= $(CC)
 CC_COMPAT += $(CC_COMPAT_CLANG_FLAGS)
+
+ifeq ($(LLVM),1)
+LD_COMPAT ?= $(LD)
+else
+LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
+endif
 else
 CC_COMPAT ?= $(CROSS_COMPILE_COMPAT)gcc
+LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
 endif
 
 cc32-option = $(call try-run,\
         $(CC_COMPAT) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
 cc32-disable-warning = $(call try-run,\
 	$(CC_COMPAT) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
-cc32-ldoption = $(call try-run,\
-        $(CC_COMPAT) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
 cc32-as-instr = $(call try-run,\
 	printf "%b\n" "$(1)" | $(CC_COMPAT) $(VDSO_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
 
@@ -122,14 +127,10 @@ dmbinstr := $(call cc32-as-instr,dmb ishld,-DCONFIG_AS_DMB_ISHLD=1)
 VDSO_CFLAGS += $(dmbinstr)
 VDSO_AFLAGS += $(dmbinstr)
 
-VDSO_LDFLAGS := $(VDSO_CPPFLAGS)
 # From arm vDSO Makefile
-VDSO_LDFLAGS += -Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1
-VDSO_LDFLAGS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
-VDSO_LDFLAGS += -nostdlib -shared -mfloat-abi=soft
-VDSO_LDFLAGS += -Wl,--hash-style=sysv
-VDSO_LDFLAGS += -Wl,--build-id=sha1
-VDSO_LDFLAGS += $(call cc32-ldoption,-fuse-ld=bfd)
+VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
+VDSO_LDFLAGS += -z max-page-size=4096 -z common-page-size=4096
+VDSO_LDFLAGS += -nostdlib -shared --hash-style=sysv --build-id=sha1
 
 
 # Borrow vdsomunge.c from the arm vDSO
@@ -189,8 +190,8 @@ quiet_cmd_vdsold_and_vdso_check = LD32    $@
       cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check)
 
 quiet_cmd_vdsold = LD32    $@
-      cmd_vdsold = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_LDFLAGS) \
-                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
+      cmd_vdsold = $(LD_COMPAT) $(VDSO_LDFLAGS) \
+                   -T $(filter %.lds,$^) $(filter %.o,$^) -o $@
 quiet_cmd_vdsocc = CC32    $@
       cmd_vdsocc = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_CFLAGS) -c -o $@ $<
 quiet_cmd_vdsocc_gettimeofday = CC32    $@

base-commit: 172aad81a882443eefe1bd860c4eddc81b14dd5b
-- 
2.29.0.rc0

