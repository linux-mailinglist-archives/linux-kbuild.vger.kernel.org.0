Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A91288E51
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Oct 2020 18:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389650AbgJIQPW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 12:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389868AbgJIQPN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 12:15:13 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE24C0610DF
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2020 09:14:39 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id c9so7419582ybs.8
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2020 09:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=NB4DqWz6+fIfMXcokXEeMggmgfFph8OJ/Hk6TSxy9cU=;
        b=AhkHxYzRBPj/XJc+I+tSr0RiU0OcKXhG858USQ2XCMZuaxZyiy+g6jLac1sKgPZkmQ
         IpfxzQBVHjJbu7XyXKnwuU3h2iDU3Qo9Q9riCIuYsiJStNj7+zP6DobDo6JUsTt/uU5X
         sS/Ud4WqyktJlMHCohe00S3oN1qQnvtTIGMf5PjJ/AebsJSm5HJAmbK3jI1/r22MsS8j
         aBycGq29qN3837fJuinfVGidbF61PWBOcwM8avPXijIUbf320rf5bPez6o8eyG4GJcqo
         8GrTNB9eNsr7XmafE+UUkeoqI72v1L7GOJR8z8Dl93xKDV5FHpCenkhAfBV/XfH7Ojhe
         Qy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=NB4DqWz6+fIfMXcokXEeMggmgfFph8OJ/Hk6TSxy9cU=;
        b=mQtTBqQ2MuSvzxcodMIHxk8EKm3ccS4jnFGv0Ik/+ib6n2Oxg5J3DAzGBKatudH64u
         lsLfuz5prAYcoBkxmYlLa0qeTl+5X6RlavkPLF8Akxy6UWGghPHB1/FDhqjv6KDp/Ad+
         pMkTPHcd72Gx5CObzx6yepAcvq6q5neB/TqJ10HMK666rYyyM+4+FqlmNxKiIAvLpEMd
         GYXSnHe0rgXP32AwREWUNOzOospsJ8s+3OwomdRAfVLQL2yQs0bjk5CnjFuiqkomT4F9
         /OnCrhvAPd2x4DNcJ3RwrjzUiLhRUqMFmDb/2ZP2ECr5K26kgjcXW9fQZe0/RN5Z56N8
         M7AA==
X-Gm-Message-State: AOAM533XjDRK9txL87d3R7LaFXdLwKui6DhOf25nzIDeWsTK0pyGlvhH
        Zr29vNiBYm7TZUmyin5caZo5YfaRv0hxgTzJdoU=
X-Google-Smtp-Source: ABdhPJxaJS43CCLL31/jkDf8wz6tkxfGqxkaqI+Vp1g2cuChf4yD2OTPN2MaVCPnWOi9s9tnyrnkwRjGNGy9G2wlsVE=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:df91:: with SMTP id
 w139mr1273962ybg.13.1602260078214; Fri, 09 Oct 2020 09:14:38 -0700 (PDT)
Date:   Fri,  9 Oct 2020 09:13:38 -0700
In-Reply-To: <20201009161338.657380-1-samitolvanen@google.com>
Message-Id: <20201009161338.657380-30-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201009161338.657380-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v5 29/29] x86, build: allow LTO_CLANG and THINLTO to be selected
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Pass code model and stack alignment to the linker as these are
not stored in LLVM bitcode, and allow both CONFIG_LTO_CLANG and
CONFIG_THINLTO to be selected.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/Kconfig  | 2 ++
 arch/x86/Makefile | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 6d67646153bc..c579d7000b67 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -92,6 +92,8 @@ config X86
 	select ARCH_SUPPORTS_ACPI
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
+	select ARCH_SUPPORTS_LTO_CLANG		if X86_64
+	select ARCH_SUPPORTS_THINLTO		if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 154259f18b8b..774a7debb27c 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -173,6 +173,11 @@ ifeq ($(ACCUMULATE_OUTGOING_ARGS), 1)
 	KBUILD_CFLAGS += $(call cc-option,-maccumulate-outgoing-args,)
 endif
 
+ifdef CONFIG_LTO_CLANG
+KBUILD_LDFLAGS	+= -plugin-opt=-code-model=kernel \
+		   -plugin-opt=-stack-alignment=$(if $(CONFIG_X86_32),4,8)
+endif
+
 # Workaround for a gcc prelease that unfortunately was shipped in a suse release
 KBUILD_CFLAGS += -Wno-sign-compare
 #
-- 
2.28.0.1011.ga647a8990f-goog

