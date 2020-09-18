Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294AC27067C
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgIRUQG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgIRUPp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:15:45 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2186C0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:44 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id y17so5578880qkf.15
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=vY4wvL91lX+XoPJtjETBJ0Jod2fr7hSe9gEwviH1PQg=;
        b=qivt17C4c3k3DwY8yxkDax/XSYLbBnJNnBYPw2ZM9Gn/ZE0fIpcsHSVm+mQlhKjakH
         ACLHPBDSrN9QhIs+2oMundPSpouSZPRbj9HW414qGcxUL8RP/Qw81qBg3hFyQmOJVd70
         36vk+fW3SMvGQBxWNMXr5dCR/MCgbY301VpVmDNnr0VCgN2sZLUw+BrVWaduLhzw5SZv
         rv8S8puJ+RnceNDh0B4fMoiQfngBeVpOdbwRVQ/hhKlaWSqX5BsgHyNznIZZ8LnydZBh
         YrVXnwczP2gFi6vqoYxTjLvwOSb3+MWNcxlFSbiyja8iKC/0zZ8liDgrrBt8Hk4cr/64
         UQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vY4wvL91lX+XoPJtjETBJ0Jod2fr7hSe9gEwviH1PQg=;
        b=kbzob54gRlJ59bmIr+q1L/DFuLD/gwFc7pZO6nR97oa5Gcj4odx0yFrTNJXpq3filv
         CH7+YxhBuFjrEmvLP+EzV9mNhVkjH9J6JxzvaKQQuWT4aPlqccESKFwo0CWeSrG3R7Va
         YZ4cm7/0dkonzar91JQ4oKhs+x6aDMFDaiGBdHPWfRFFGRauKyOGQtAp0vw53slYk3nx
         mVKYbAPaZK4X1fKxAyloFY1hK1YrxxYuza45ktxoz9LK+7XERoMEM7Dz0kOXsO9pjdYg
         J30fKGg1dTQ+3yD72lcVwTt4cR7meyMONP56uqSeWaeg1D/Nv5urPt8quCfxPAjwNr/X
         mBWg==
X-Gm-Message-State: AOAM532lgFFpgFbA168P6GmAZon7PoD1rJ6uQZkGagVV5Gv+Tkllp+qv
        /aUX3NWRwITn+wk6TSYDnO4ajsT4w2lM1DyUfBY=
X-Google-Smtp-Source: ABdhPJxx/ZB+iAIYYGWthfZ5MCRw4ljJiAxyhQbM9fSoZJcW8J3//Xuvzi/v3xFDYUKOn6kD1n3mDEB16b4Qbpmiyyg=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:55ec:: with SMTP id
 bu12mr35584454qvb.0.1600460143930; Fri, 18 Sep 2020 13:15:43 -0700 (PDT)
Date:   Fri, 18 Sep 2020 13:14:33 -0700
In-Reply-To: <20200918201436.2932360-1-samitolvanen@google.com>
Message-Id: <20200918201436.2932360-28-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 27/30] arm64: allow LTO_CLANG and THINLTO to be selected
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

Allow CONFIG_LTO_CLANG and CONFIG_THINLTO to be enabled.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/arm64/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6d232837cbee..2699fc5d332e 100644
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
2.28.0.681.g6f77f65b4e-goog

