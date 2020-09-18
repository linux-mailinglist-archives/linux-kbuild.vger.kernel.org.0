Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B234F27069C
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIRUQe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgIRUP5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:15:57 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022ADC0613D4
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:47 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id j5so5586073qka.7
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=EemRcLRZpf4yhUCeConvvCXzQf4ZIu8nUiUP+DipgvE=;
        b=OCV4Zse7oPgDcT96RPBXKapnnI9L/7OK6JFTGp6JDIVB8reBmtTJ8x+TgIHV1bQNT1
         yODGYby9kVyQ8p61SLU/yg6HA3AOyBDoEQN4GCtsWbyfUxYsi9LakuSQeiu8C00FOlZC
         nXQlthrKXhecqdBCG42wjEu4ZA8UwNU7ri1WD8DdF01m27taT1VRMqPpDB7d1xzavjQ8
         MAseVvLfwDnKz7Gcqkbl036OnUwQ4zBvKuexGNe7hy44z1WPbLj+0871OLhE9gceGoVn
         2klPRgv3y+JB0+4x23CmEway5+Cp0Bo479FvHgqkdJAIc2SvpuGCJORrGOpziKgZ24iA
         XC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EemRcLRZpf4yhUCeConvvCXzQf4ZIu8nUiUP+DipgvE=;
        b=Qhr8VoSNP6oItahL5vQc3zODx7eyg4cfCgAYu+N9IE/rMPm22RMjeukF0MvebubIky
         h6hE01dgoko/mm9I46sVpQkO4s0g4Crd8Xt36SLIkdzUA63F2/BN722Mz2v1Euq1Usb6
         jTxcDsxgnyrnRIy2K+jX2D9ii80dBOLWdQQ7s6PMfL+AYpuHgKgcEMDSKsHG9u06HfRv
         ankCx9x/tn0GdMlZ49LcO+ngNmQk09liOfsCoqF7s/ck/uAnS8ZvgfTOeXXT9a0RqtQw
         UUCCVi107n+4UQBQtiZOfV0J5RiWzNuRdtqsGFqeooxZ6yn6ThCDO8IFx0VWvdgKLoor
         Oxxw==
X-Gm-Message-State: AOAM533dGdmWEf0cBfc9CmB3vxNxgg5SXLpN/uMiJBa+eUcU0O6wpPMU
        68su0PCBlSsar9gFLxJRFTez/E1EEChx2LUIokY=
X-Google-Smtp-Source: ABdhPJy7xp/LOuFwPpGGCHEVYRylz0MppKOo/jERMBhhbHtsIbQOQ34wy2DpN2K3SkM1Tla+jQrOeY2Z0njz9hLTvIY=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:4891:: with SMTP id
 bv17mr34873677qvb.20.1600460146163; Fri, 18 Sep 2020 13:15:46 -0700 (PDT)
Date:   Fri, 18 Sep 2020 13:14:34 -0700
In-Reply-To: <20200918201436.2932360-1-samitolvanen@google.com>
Message-Id: <20200918201436.2932360-29-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 28/30] x86, vdso: disable LTO only for vDSO
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
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

Disable LTO for the vDSO. Note that while we could use Clang's LTO
for the 64-bit vDSO, it won't add noticeable benefit for the small
amount of C code.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/entry/vdso/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index ecc27018ae13..9b742f21d2db 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -90,7 +90,7 @@ ifneq ($(RETPOLINE_VDSO_CFLAGS),)
 endif
 endif
 
-$(vobjs): KBUILD_CFLAGS := $(filter-out $(GCC_PLUGINS_CFLAGS) $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
+$(vobjs): KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO) $(GCC_PLUGINS_CFLAGS) $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
 
 #
 # vDSO code runs in userspace and -pg doesn't help with profiling anyway.
@@ -148,6 +148,7 @@ KBUILD_CFLAGS_32 := $(filter-out -fno-pic,$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out -mfentry,$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS_32))
+KBUILD_CFLAGS_32 := $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 += -m32 -msoft-float -mregparm=0 -fpic
 KBUILD_CFLAGS_32 += -fno-stack-protector
 KBUILD_CFLAGS_32 += $(call cc-option, -foptimize-sibling-calls)
-- 
2.28.0.681.g6f77f65b4e-goog

