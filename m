Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9F03EE0D7
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbhHQAWC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235031AbhHQAWB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:22:01 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD80C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:29 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id p123-20020a378d810000b02903ad5730c883so14345873qkd.22
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=lCzitv5KqDP2zQ/J1/ah211/+gv0A0rekzxCvgbF1SI=;
        b=EgGa8cEH+cvjhc8CYpQIpJ9bQQSvcQJ4L4U3Q5pjjb9uWqW39zYx2jd0FMB+lQnkbE
         An0x6lIh6/Eb2RnktrEIvf4PTAzr48EtGUDig7J1RtSF2QntYJsXF2laVbd3JKdeWe/U
         Dd1CG6gSytOTHWjxCEP5knKL//vo4QDmc3+Su6ZXS12JcBpMxATFmGNvSV5oUmELdjvp
         cklZsCd9ke/DGS8HtZTndN2TZtMVSwF/DvZVRsmNZbpY68PaGQv49ftiR3ETwF8gw45d
         m0nHO0GBN5jO3l25eLmqwcvjegOBZ7UsyONdq+Jc1YRwXhAhqClvgw2YdkHWidHf7mjI
         ksNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=lCzitv5KqDP2zQ/J1/ah211/+gv0A0rekzxCvgbF1SI=;
        b=EKf88UtT0AbXRtexJIpZIn+qWh4h/jrBQ7aHWsO56tJYVyGiUIw9aBhsyJ5BR2jJTo
         wz8fq7afDiUrBUYQokZeLjtTxSoks5s1rb8WU3rlRxDJvekcZ3jTaapy04yiITbjPxO4
         4yx8boAMClGpMfyWGl+llucHhW6p6Jj25jxWYzgv8pPu3blw/d2OJZLjPt7YhjHptQAE
         27l4vXBBwJJ7bT5pZJ6pfH14vheQO0OYMRzA7Vmy7LJIGStOgswrG7A2TKbNGEOvyuI4
         CAL+OjORn0MZFplqic3y/GGl8IaprnHLEcNoe7MMcyMqhvWTcMgZ9UcwtQfgAt+Zq4in
         kkKA==
X-Gm-Message-State: AOAM530RqpU2zBPYfv9284izmYza8IdOcs35HfzpobRJYLwb27+lzClD
        2HE5PA57m9rl5r9w2tjG09EAQ+2jpTPAztrPo0c=
X-Google-Smtp-Source: ABdhPJxi7Y4buskEdvwZ/sGx9Lmt0Tg50dSSuBLHSqynJCtblkmu1ij0dsS1ePWyu6nksQuQq/VUBS3KV2lZvZZh+vs=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:2408:: with SMTP id
 fv8mr715411qvb.4.1629159688552; Mon, 16 Aug 2021 17:21:28 -0700 (PDT)
Date:   Mon, 16 Aug 2021 17:21:07 -0700
In-Reply-To: <20210817002109.2736222-1-ndesaulniers@google.com>
Message-Id: <20210817002109.2736222-6-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 5/7] x86: remove cc-option-yn test for -mtune=
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As noted in the comment, -mtune= has been supported since GCC 3.4. The
minimum required version of GCC to build the kernel (as specified in
Documentation/process/changes.rst) is GCC 4.9.

tune is not immediately expanded. Instead it defines a macro that will
test via cc-option later values for -mtune=. But we can skip the test
whether to use -mtune= vs. -mcpu=.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: x86@kernel.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/x86/Makefile_32.cpu | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index cd3056759880..e7355f8b51c2 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -2,13 +2,7 @@
 # CPU tuning section - shared with UML.
 # Must change only cflags-y (or [yn]), not CFLAGS! That makes a difference for UML.
 
-#-mtune exists since gcc 3.4
-HAS_MTUNE	:= $(call cc-option-yn, -mtune=i386)
-ifeq ($(HAS_MTUNE),y)
 tune		= $(call cc-option,-mtune=$(1),$(2))
-else
-tune		= $(call cc-option,-mcpu=$(1),$(2))
-endif
 
 cflags-$(CONFIG_M486SX)		+= -march=i486
 cflags-$(CONFIG_M486)		+= -march=i486
-- 
2.33.0.rc1.237.g0d66db33f3-goog

