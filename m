Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26679281E19
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Oct 2020 00:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJBWPe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Oct 2020 18:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgJBWPd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Oct 2020 18:15:33 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAEEC0613E3
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Oct 2020 15:15:33 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id j8so50154pjy.5
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Oct 2020 15:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lFN4zJJOAxPrUtWe6T2NWxoPvGYNWmt8xiSR4tEk7Xo=;
        b=DQVnedVCMrlyIBVeUrp9oJui2OTAjnE1hnY+RkK1tyss0PkR4sdHxA/IKXkQH9c6Sh
         bYl3z5fp98ppPZIL90zkL26tvN0mEM3XK3gwTh747XMH+VzNnYjExcaoh7MNRv0l/ewg
         s1GW+3jl0Olq7FCtH586NGEAyuoqij0CiQUmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lFN4zJJOAxPrUtWe6T2NWxoPvGYNWmt8xiSR4tEk7Xo=;
        b=jh+iT+4Wp+Cy+lxhG2qaRjoiFBF5+eyTFlQMhdhJ533uDItB74Um0NHv28yk3zSe0V
         LJUh+fo1L9bmpiHGAtttbG5mNsl8pN07+jmLwFMDuqu42H1wF0UinesiH8Zb1svuE+VC
         PBxgWMID6UVDVNHT9rf6WpqZkkmx/G8/5m0PqXlVsTeajeSA2XCdrjdT/U9fhoG9gJA5
         b2KDuQWWAW7t2PjhzWvUPstkz7lJ2HQYo23F6hKCETR03g8plK/sbxoClECTNspEkl8m
         Jy1V/nul11eIARxaAKA5A/TBPW0Jqwt/xSPeZWNuBZY9NWhfBE7TMwJF1RC4GuasbFWv
         PDWw==
X-Gm-Message-State: AOAM532ekr10mOiTsubxbN+DvAfo/JFWnVfS0RTYBVHnMSrHC5eeeToa
        55T34YmzDci3zNaBNPUl6s6g3w==
X-Google-Smtp-Source: ABdhPJzW4OR+PaSKxteuBOb7B5Lq/dL8VJesrDAtiFmhs3tlfU+OpJB977KxlRZ7LqAh+6+KIC5Igw==
X-Received: by 2002:a17:90a:9505:: with SMTP id t5mr4886210pjo.121.1601676932889;
        Fri, 02 Oct 2020 15:15:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id fz22sm2557221pjb.46.2020.10.02.15.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:15:29 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ubsan: Force -Wno-maybe-uninitialized only for GCC
Date:   Fri,  2 Oct 2020 15:15:26 -0700
Message-Id: <20201002221527.177500-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002221527.177500-1-keescook@chromium.org>
References: <20201002221527.177500-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Clang handles 'maybe-uninitialized' better in the face of using UBSAN,
so do not make this universally disabled for UBSAN builds.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.ubsan      | 6 ++++++
 scripts/Makefile.ubsan | 6 +++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index aeb2cdea0b94..1fc07f936e06 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -36,6 +36,12 @@ config UBSAN_KCOV_BROKEN
 	  See https://bugs.llvm.org/show_bug.cgi?id=45831 for the status
 	  in newer releases.
 
+config UBSAN_DISABLE_MAYBE_UNINITIALIZED
+	def_bool CC_IS_GCC
+	help
+	  -fsanitize=* options makes GCC less smart than usual and
+	  increases the number of 'maybe-uninitialized' false-positives.
+
 config CC_HAS_UBSAN_BOUNDS
 	def_bool $(cc-option,-fsanitize=bounds)
 
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 72862da47baf..c5ef6bac09d4 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
-# -fsanitize=* options makes GCC less smart than usual and
-# increases the number of 'maybe-uninitialized' false-positives.
-ubsan-cflags-$(CONFIG_UBSAN) += $(call cc-disable-warning, maybe-uninitialized)
+# The "maybe-uninitialized" warning can be very noisy.
+ubsan-cflags-$(CONFIG_UBSAN_DISABLE_MAYBE_UNINITIALIZED) += \
+						$(call cc-disable-warning, maybe-uninitialized)
 
 # Enable available and selected UBSAN features.
 ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
-- 
2.25.1

