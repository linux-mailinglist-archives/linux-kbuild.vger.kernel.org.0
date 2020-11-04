Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DF22A5B48
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Nov 2020 01:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbgKDAxv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 19:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729144AbgKDAxt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 19:53:49 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6241FC0401C1
        for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2020 16:53:49 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id k7so19715768ybm.13
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2020 16:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=6nth1Ay7JTmqSTdpD6CAIOaNAdyMhdLz3pdbFkquv2w=;
        b=qCw8+F/+nLz5LxsUHleH+9cNH3m8jIH+wWmS6NvhkoTCDOMXb3tPmg8l3btrBOReNq
         Y3ULifDeAVzxVrvFjzWIP1iObBG+hhd9ukxP6x3WCo3dzJDy0kHhduok9ejP4WQQCnWh
         H++8qGkqToOvbQNp8Ja7apwvBL8Rcz4eq/A796u+jVOzUj8+5MXstB9lsmhVGkRLC7ZX
         tCuL/kx4KAa4n72lYDbz4OxAYWGyq+6j5y32iRTp90UQJFZZHX//2R00WF9QHVUvR6Uj
         YtzglSsEY6CUtUJ4ibwKiIJPwoyEryxCrqXFvsBu5z0g3ZXDq1VpbNx8dK5KvKco/zyo
         WyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6nth1Ay7JTmqSTdpD6CAIOaNAdyMhdLz3pdbFkquv2w=;
        b=mquCnmxuy3rclGYVnB7pJjnP+aVoPxJ6a0eXPtvs8ijt325fwXVoEUun0hNSgQaGhT
         UTFa6lU2uB9KfQ2I9IrRYAY+KAm9B4FNjzxwT+f3TQOx8JnhI5gvwza7LZGn1RLfSB8P
         StxaGRUa3p26Bf/snIa6sd+kjhEiOv/9l6j2dAlgpHMTIStHJ0iZfZKdcARloHDBDTZP
         TM9uWtHWOqNiYsv3HO8Rr5UjVX1RqzQYc14gNhpdNGcp+1P/lwivOAVRWDlvWw1a13BF
         sdSnv69fH9VszjrPQw9qgM3pp4VD2NDKULdsP5K0aTKnivWtiECV/aNQtso8nmthyWCt
         dwSg==
X-Gm-Message-State: AOAM532j52eJUgJE98orlnGwofYNFYozn9Yw8cdvGhFY2WhT2QcK2hgB
        FY37MvmQDagrWJhdsTnz0cLUjildyJ1UXaZ2sdU=
X-Google-Smtp-Source: ABdhPJx/YEnHn2ke8YQZ6NNMbl/+wfh/QJAeszOxk2mXyJULZvY9SeogSn5s2PHinLgK78CnPoKZgYLDaG7YOiu0+l8=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a25:3188:: with SMTP id
 x130mr31763518ybx.64.1604451228585; Tue, 03 Nov 2020 16:53:48 -0800 (PST)
Date:   Tue,  3 Nov 2020 16:53:40 -0800
In-Reply-To: <20201104005343.4192504-1-ndesaulniers@google.com>
Message-Id: <20201104005343.4192504-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v2 1/4] x86_64: Change .weak to SYM_FUNC_START_WEAK for arch/x86/lib/mem*_64.S
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>,
        Sami Tolvanen <samitolvanen@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Fangrui Song <maskray@google.com>

Commit 393f203f5fd5 ("x86_64: kasan: add interceptors for
memset/memmove/memcpy functions") added .weak directives to
arch/x86/lib/mem*_64.S instead of changing the existing ENTRY macros to
WEAK. This can lead to the assembly snippet `.weak memcpy ... .globl
memcpy` which will produce a STB_WEAK memcpy with GNU as but STB_GLOBAL
memcpy with LLVM's integrated assembler before LLVM 12. LLVM 12 (since
https://reviews.llvm.org/D90108) will error on such an overridden symbol
binding.

Commit ef1e03152cb0 ("x86/asm: Make some functions local") changed ENTRY in
arch/x86/lib/memcpy_64.S to SYM_FUNC_START_LOCAL, which was ineffective due to
the preceding .weak directive.

Use the appropriate SYM_FUNC_START_WEAK instead.

Fixes: 393f203f5fd5 ("x86_64: kasan: add interceptors for memset/memmove/memcpy functions")
Fixes: ef1e03152cb0 ("x86/asm: Make some functions local")
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Fangrui Song <maskray@google.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Cc: <stable@vger.kernel.org>
---
 arch/x86/lib/memcpy_64.S  | 4 +---
 arch/x86/lib/memmove_64.S | 4 +---
 arch/x86/lib/memset_64.S  | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index 037faac46b0c..1e299ac73c86 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -16,8 +16,6 @@
  * to a jmp to memcpy_erms which does the REP; MOVSB mem copy.
  */
 
-.weak memcpy
-
 /*
  * memcpy - Copy a memory block.
  *
@@ -30,7 +28,7 @@
  * rax original destination
  */
 SYM_FUNC_START_ALIAS(__memcpy)
-SYM_FUNC_START_LOCAL(memcpy)
+SYM_FUNC_START_WEAK(memcpy)
 	ALTERNATIVE_2 "jmp memcpy_orig", "", X86_FEATURE_REP_GOOD, \
 		      "jmp memcpy_erms", X86_FEATURE_ERMS
 
diff --git a/arch/x86/lib/memmove_64.S b/arch/x86/lib/memmove_64.S
index 7ff00ea64e4f..41902fe8b859 100644
--- a/arch/x86/lib/memmove_64.S
+++ b/arch/x86/lib/memmove_64.S
@@ -24,9 +24,7 @@
  * Output:
  * rax: dest
  */
-.weak memmove
-
-SYM_FUNC_START_ALIAS(memmove)
+SYM_FUNC_START_WEAK(memmove)
 SYM_FUNC_START(__memmove)
 
 	mov %rdi, %rax
diff --git a/arch/x86/lib/memset_64.S b/arch/x86/lib/memset_64.S
index 9ff15ee404a4..0bfd26e4ca9e 100644
--- a/arch/x86/lib/memset_64.S
+++ b/arch/x86/lib/memset_64.S
@@ -6,8 +6,6 @@
 #include <asm/alternative-asm.h>
 #include <asm/export.h>
 
-.weak memset
-
 /*
  * ISO C memset - set a memory block to a byte value. This function uses fast
  * string to get better performance than the original function. The code is
@@ -19,7 +17,7 @@
  *
  * rax   original destination
  */
-SYM_FUNC_START_ALIAS(memset)
+SYM_FUNC_START_WEAK(memset)
 SYM_FUNC_START(__memset)
 	/*
 	 * Some CPUs support enhanced REP MOVSB/STOSB feature. It is recommended
-- 
2.29.1.341.ge80a0c044ae-goog

