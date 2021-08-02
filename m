Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 281483DDF68
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 20:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbhHBSje (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 14:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbhHBSjc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 14:39:32 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC0BC061760
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Aug 2021 11:39:22 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id n192-20020a25dac90000b029054c59edf217so19957206ybf.3
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Aug 2021 11:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=4dz3SiE+uajglxOG7tZCdstmLAOcBmHBPB4xfwqxLic=;
        b=FX1LwuZZPbRbk1DMzYK7B8cWdA3VPi3/o+qSc6Irmgjg0miBtcXtlgER5JxNsybBdQ
         +enZTkX5KmqA/d/EUeaqZP9xEjJ0XVVXpV3Sx/d7AY98dNgBbKxtgO8Mmojs96l/ysqO
         esGFPVs9cP1EOrOHavZb1ZqqfaM3CoUlIJzUYLAv3zvAABfDszQzCYjhLXuPby/7uFS+
         PytaCzDJTHz09ng4rM5CyVDfK+UdbKlBCI1DAARjBsPx1RK+DwJrmlCmpSDCNXqQPOLu
         el9r3jFBQ7/7JKmkXSavaJWneWF9Yq6boWl/Km7G4IpZId2+U50vcEhCup7v7A1foqT3
         9xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=4dz3SiE+uajglxOG7tZCdstmLAOcBmHBPB4xfwqxLic=;
        b=EaZjyR0/wVQEUPfvj6wDkthdg4tUzaDOMdGtRfHKoiGax2Wq2YQEsU4h5wstFZQ9N0
         xaW8tBbCMaGzDYMrmNUTKPodKRgX+ayJZgzDI3wctJXZ4IIkF9BmLDH6vjEGlHTp9VBA
         cHqOu4nSmHlj1ZPavCUbFcyNLr1b5NLHg7r60v5lxpplKbQwaWBrRYn0e0P5NaQNWX00
         qPern6MfWkiqceDbK9UI/x6LWktQLK3GqKm3kWP9/TkhgFl7JNPnQxzGnQUxuYwi6pE2
         L7++JHV1zNa0SaH0Ydpvib5c5gr0kru7vVHiOUTjY7e0NcCui8fA7DbKXABe2a1oesBZ
         PGQA==
X-Gm-Message-State: AOAM533MLD2D1EKnH6OoTWjwkPgX8XuoXOyhB0VSiYbGYHRYBYqAoIG6
        zy5aDgHlQO5AZ0BJYqgPIAYj6qs3Fqy5VIXrqPk=
X-Google-Smtp-Source: ABdhPJwLijclpfvgqa2ibRACKCRjdetSzF0+dGX6mfkpN/yjZFBUsDXL4j4VoCcV0YE/IrAhd8BK2xeCvPrPj3+W+8o=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:3db0:42c:8665:a4ae])
 (user=ndesaulniers job=sendgmr) by 2002:a25:8445:: with SMTP id
 r5mr24083636ybm.20.1627929561736; Mon, 02 Aug 2021 11:39:21 -0700 (PDT)
Date:   Mon,  2 Aug 2021 11:39:09 -0700
In-Reply-To: <20210802183910.1802120-1-ndesaulniers@google.com>
Message-Id: <20210802183910.1802120-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v6 2/3] Makefile: infer --target from ARCH for CC=clang
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We get constant feedback that the command line invocation of make is too
long when compiling with LLVM. CROSS_COMPILE is helpful when a toolchain
has a prefix of the target triple, or is an absolute path outside of
$PATH.

Since a Clang binary is generally multi-targeted, we can infer a given
target from SRCARCH/ARCH.  If CROSS_COMPILE is not set, simply set
--target= for CLANG_FLAGS, KBUILD_CFLAGS, and KBUILD_AFLAGS based on
$SRCARCH.

Previously, we'd cross compile via:
$ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1
Now:
$ ARCH=arm64 make LLVM=1 LLVM_IAS=1

For native builds (not involving cross compilation) we now explicitly
specify a target triple rather than rely on the implicit host triple.

Link: https://github.com/ClangBuiltLinux/linux/issues/1399
Suggested-by: Arnd Bergmann <arnd@kernel.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v5 -> v6:
* Use indirection as per Linus. We now have CLANG_TARGET_FLAGS and a
  few variables suffixed with $SRCARCH.
* Add Linus' SB tag.
* Change hexagon target triple from -gnu to -musl.

Changes v3 -> v4:
* Reword commit message and oneline, as per Nathan.
* Drop documentation change (it's the next patch, could be squashed in,
  I guess).
* Drop LLVM_IAS=1 requirement, as per Masahiro.
* Carry Arnd's and Nathan's AB/RB/TB tags, confirmed OK on IRC+Discord.

Changes v2 -> v3:
* Drop check/requirement for LLVM=1, as per Masahiro.
* Change oneliner from LLVM=1 LLVM_IAS=1 to CC=clang LLVM_IAS=1.
* Don't carry forward Nathan's RB/TB tags. :( Sorry Nathan, but thank
  you for testing+reviewing v2.
* Update wording of docs slightly.

Changes v1 -> v2:
* Fix typos in commit message as per Geert and Masahiro.
* Use SRCARCH instead of ARCH, simplifying x86 handling, as per
  Masahiro. Add his sugguested by tag.
* change commit oneline from 'drop' to 'infer.'
* Add detail about explicit host --target and relationship of ARCH to
  SRCARCH, as per Masahiro.

Changes RFC -> v1:
* Rebase onto linux-kbuild/for-next
* Keep full target triples since missing the gnueabi suffix messes up
  32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
  drop references to arm64.
* Flush out TODOS.
* Add note about -EL/-EB, -m32/-m64.
* Add note to Documentation/.

 scripts/Makefile.clang | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 297932e973d4..1f4e3eb70f88 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -1,6 +1,27 @@
-ifneq ($(CROSS_COMPILE),)
+# Individual arch/{arch}/Makefiles should use -EL/-EB to set intended
+# endianness and -m32/-m64 to set word size based on Kconfigs instead of
+# relying on the target triple.
+CLANG_TARGET_FLAGS_arm		:= arm-linux-gnueabi
+CLANG_TARGET_FLAGS_arm64	:= aarch64-linux-gnu
+CLANG_TARGET_FLAGS_hexagon	:= hexagon-linux-musl
+CLANG_TARGET_FLAGS_m68k		:= m68k-linux-gnu
+CLANG_TARGET_FLAGS_mips		:= mipsel-linux-gnu
+CLANG_TARGET_FLAGS_powerpc	:= powerpc64le-linux-gnu
+CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
+CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
+CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
+CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))
+
+ifeq ($(CROSS_COMPILE),)
+ifeq ($(CLANG_TARGET_FLAGS),)
+$(error Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang)
+else
+CLANG_FLAGS	+= --target=$(CLANG_TARGET_FLAGS)
+endif # CLANG_TARGET_FLAGS
+else
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
-endif
+endif # CROSS_COMPILE
+
 ifeq ($(LLVM_IAS),1)
 CLANG_FLAGS	+= -integrated-as
 else
-- 
2.32.0.554.ge1b32706d8-goog

