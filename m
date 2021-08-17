Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D65E3EE0D1
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbhHQAV5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbhHQAV4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:21:56 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EA3C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:24 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b9-20020a5b07890000b0290558245b7eabso18632048ybq.10
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=3mIJT3ikKBz70xHqPeYP9DUuj3yJmyYSvnlROWprNU0=;
        b=jkUmqiWkUIn11XZwndfNewlhPuEQQy8ysb2pdFSiPo5hAHF2dxek21dMO+EdjI7641
         /QeXZBfXv0zovdWxI0x5OjZ30z+ss9QsEBiRa/67SyuQm48imip28lKvf9UeImZt1uUe
         ZS2zuIMf3X5fCZCnXYrDxAu/NxPAN/UPBHgVFRlgUOHFpU3WZWgNosd4NNATCZ8666aR
         HQ2Ubw0j/af2Yhf0zeBGo8lD7GmzghODJyC0K6zT6/xIpOVOHUi6ID/HVcsW2Aadifqo
         K7fO0AGZlV23M+MHKq/xh76t24+tK9cwHpW34jjrZYXB5aDlRZU3STy/oLio97USMv+4
         f8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3mIJT3ikKBz70xHqPeYP9DUuj3yJmyYSvnlROWprNU0=;
        b=PSzIEfz7OCRsDEUjSDrZLSEnFNxuLHFqHNYG0yoG0d3H1kjxjS0IjHs93+XREsh64l
         rgXvhDYirTUo+9uKNZea3jOs71il7tz0aqYDTMp3a11Hd3cUdfpSsE1zxIbhf51Xizms
         U/c7wzrASfUV8ffUuAkcKPtGuOmhdnLKANX9llMUG50qrSxCDn/hjdKPiKgp0ITEIt9f
         nOBhueW3/H5mtPyTYjHbVCkfzws6lHoOuBBdOrxxoew7Lpes7cGMFh3qiEqG2u/UwVp5
         pVRi797Sczm/MwvD8HRIChD5ZGekwg5XFzrLLUBGnBICdrIIg6dqbBZb94SqZle6+aEd
         W9WA==
X-Gm-Message-State: AOAM530vOv3Fueq+IN7+ZWJFgIi5X+lLBaI/2rbSLw86BxqomrWXtgil
        D3COm/HNqBbwjX/dMuosplHpaTOY35URLDKlKcc=
X-Google-Smtp-Source: ABdhPJz+WFisbuTUhA9xMZaACAa+nhKyIKSUZly6CfYDeYL5RkUfu40rrbH/kYqR1wHiskhIB9bQNCgkGJwAypmpY8g=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a25:ca8b:: with SMTP id
 a133mr882102ybg.339.1629159683765; Mon, 16 Aug 2021 17:21:23 -0700 (PDT)
Date:   Mon, 16 Aug 2021 17:21:05 -0700
In-Reply-To: <20210817002109.2736222-1-ndesaulniers@google.com>
Message-Id: <20210817002109.2736222-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 3/7] powerpc: replace cc-option-yn uses with cc-option
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cc-option-yn can be replaced with cc-option. ie.
Checking for support:
ifeq ($(call cc-option-yn,$(FLAG)),y)
becomes:
ifneq ($(call cc-option,$(FLAG)),)

Checking for lack of support:
ifeq ($(call cc-option-yn,$(FLAG)),n)
becomes:
ifeq ($(call cc-option,$(FLAG)),)

This allows us to pursue removing cc-option-yn.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/Makefile      | 12 ++++++------
 arch/powerpc/boot/Makefile |  5 +----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9aaf1abbc641..85e224536cf7 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -12,12 +12,12 @@
 # Rewritten by Cort Dougan and Paul Mackerras
 #
 
-HAS_BIARCH	:= $(call cc-option-yn, -m32)
+HAS_BIARCH	:= $(call cc-option,-m32)
 
 # Set default 32 bits cross compilers for vdso and boot wrapper
 CROSS32_COMPILE ?=
 
-ifeq ($(HAS_BIARCH),y)
+ifeq ($(HAS_BIARCH),-m32)
 ifeq ($(CROSS32_COMPILE),)
 ifdef CONFIG_PPC32
 # These options will be overridden by any -mcpu option that the CPU
@@ -107,7 +107,7 @@ cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 
-ifeq ($(HAS_BIARCH),y)
+ifeq ($(HAS_BIARCH),-m32)
 KBUILD_CFLAGS	+= -m$(BITS)
 KBUILD_AFLAGS	+= -m$(BITS) -Wl,-a$(BITS)
 KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
@@ -125,7 +125,9 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
 ifdef CONFIG_PPC64
-ifeq ($(call cc-option-yn,-mcmodel=medium),y)
+ifeq ($(call cc-option,-mcmodel=medium),)
+	export NO_MINIMAL_TOC := -mno-minimal-toc
+else
 	# -mcmodel=medium breaks modules because it uses 32bit offsets from
 	# the TOC pointer to create pointers where possible. Pointers into the
 	# percpu data area are created by this method.
@@ -135,8 +137,6 @@ ifeq ($(call cc-option-yn,-mcmodel=medium),y)
 	# kernel percpu data space (starting with 0xc...). We need a full
 	# 64bit relocation for this to work, hence -mcmodel=large.
 	KBUILD_CFLAGS_MODULE += -mcmodel=large
-else
-	export NO_MINIMAL_TOC := -mno-minimal-toc
 endif
 endif
 
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 10c0fb306f15..33e1de5d1c95 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -66,10 +66,7 @@ ifdef CONFIG_DEBUG_INFO
 BOOTCFLAGS	+= -g
 endif
 
-ifeq ($(call cc-option-yn, -fstack-protector),y)
-BOOTCFLAGS	+= -fno-stack-protector
-endif
-
+BOOTCFLAGS	+= $(call cc-option,-fstack-protector)
 BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
 
 DTC_FLAGS	?= -p 1024
-- 
2.33.0.rc1.237.g0d66db33f3-goog

