Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162A0288E65
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Oct 2020 18:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389877AbgJIQPh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 12:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389833AbgJIQOw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 12:14:52 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8B5C0613B7
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2020 09:14:31 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id s14so9388026ybl.10
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2020 09:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=ikrbNi1n+JHv/v6pgNeNHRRr1Bi+YQ52wR6bQ2Iekes=;
        b=tcYmIPBmAJ4LMMF7Goo8MPewpphHHyqOReS8Yzjkp758pdRkXSRJFwYPN4LJhRf5aA
         pN9Uh5BwkuYUqZQemLzTTRXc2IUbCtQKHNjN5mIcJ0Yo/YCauyC18trSfmUSzycFDhkQ
         Mw/NRr5iZqjHUGg7OFZdC6jshO1bqHZmLEAcRj1iPIhFpHCfYo3PJz5q+q/Uk+lDZyQS
         v2YSMSnN1TCWlH3GRIGFB5nX31muKzjkKWdKT2ld17JmgpAwOruVsIlTZw6HcTZPePYd
         us6oLH9w7WGbGMX1ZGw9yoahG1e8nob8rvJYyjTD8MyQlv2UIB6ZpCnVJZSKFxMRhVx5
         0KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ikrbNi1n+JHv/v6pgNeNHRRr1Bi+YQ52wR6bQ2Iekes=;
        b=pCYkC/tYE7rPZ4uNGUyeF+T5XoPIQFHA+ybFxmJXulsNZHIGE1F+iPX9XOqiugOzWi
         eLz8ASQ70dVkMOhvUwjCfp1DdHwAuiGUll5TBd/OpO12c/jAHR9gp+2Ezy+kadKOBnHj
         Sps923Jmh3ThQVcDkD3jHe6smHlMm8oFzQ50ND/94h7oyK4aRRwTa9tuTJ2g6os0ScPr
         rxcBOOiTipVZ5ylrYE3EBKsXnAOI7oUVypzY6YU9kYEVYteDwMcYxI/XiAeHmr/fnC4F
         MXHQiqlQlnu6FxtOciFt4MlP0FQZ0cSCUCwptlOx4edR37m5XMfixPXcB3JjuJT+pCBK
         OoJw==
X-Gm-Message-State: AOAM530Q2rR1C+7aYRwklgHkbAide14mjH9xsThCHhR09ZnWIRkmuCGp
        saONi4UL9VysEjgFzcJKu5lHqk1lXjp/JAWpHJY=
X-Google-Smtp-Source: ABdhPJxXVPk5t6WuDRtw2kDT1l/kkKrV5Ux4Ln/BVu0jbM2WltiZb9XyefgV8OgdP7tNsodZl6ZQz6Mkv7JwoOsKQcI=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:388d:: with SMTP id
 f135mr18426175yba.54.1602260070433; Fri, 09 Oct 2020 09:14:30 -0700 (PDT)
Date:   Fri,  9 Oct 2020 09:13:34 -0700
In-Reply-To: <20201009161338.657380-1-samitolvanen@google.com>
Message-Id: <20201009161338.657380-26-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201009161338.657380-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v5 25/29] arm64: allow LTO_CLANG and THINLTO to be selected
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

Allow CONFIG_LTO_CLANG and CONFIG_THINLTO to be enabled.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/arm64/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ad522b021f35..7016d193864f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -72,6 +72,8 @@ config ARM64
 	select ARCH_USE_SYM_ANNOTATIONS
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
+	select ARCH_SUPPORTS_LTO_CLANG
+	select ARCH_SUPPORTS_THINLTO
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && (GCC_VERSION >= 50000 || CC_IS_CLANG)
 	select ARCH_SUPPORTS_NUMA_BALANCING
-- 
2.28.0.1011.ga647a8990f-goog

