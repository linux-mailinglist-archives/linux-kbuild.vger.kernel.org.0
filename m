Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366643382B9
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 01:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhCLAtx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 19:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbhCLAtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 19:49:36 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395D1C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:36 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id b127so15250783qkf.19
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YI9ktuFU/X+08fuezAEyeT/4YV7bN+r3OwkJvmEu6tA=;
        b=G4eTVdB9vYaxNQeExEZkD7EJkKoXsPP1Mh7LeCv9UXYddhsCLBhNTAoGc8Y7X0A8l2
         Eyxb/mtwuF7AwGkZiQuyYBMJmmM23sBMA3tcJOEtvTf0tH2JYPyDcNgFnaeQwXmmMDjM
         kT8iaz+E1+HtZZiLkju9VH1kkQDUYpLvvXxaYE5rDiD/TLuSHoi6XKfJWOSdgFSk556n
         Pr7pM6PcY4QwA2g5BI6EXwuZnKgI4oK61gOGJ8t362oU8kuePT3xDFXSPJlqe/NN7rJX
         muliusPDNXzM8lZ2u3UaTA3NwKZNAvbL6g0DQbhEZaD1olkczwuySFpVS6Q4wmahv7BJ
         gM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YI9ktuFU/X+08fuezAEyeT/4YV7bN+r3OwkJvmEu6tA=;
        b=jNFdi5ePIke9J/GSiNGSmTscbEjmxR29+fNyzd7lstpK4n5Om1KnPEzBFHOj/k6r/d
         00ZDRqn7kIclj+ZQOtK08jDxELrXEsc7dHZxxZhHbY6keCXujizV8w6XvN9vuXCEw4yC
         Bj8x+AmqIp0asu5aQ7BKkCFwzgPUWXaoeNhr6wnnszFrazRmmMVy1I10uyP6BdGJZgUX
         tDSdHYLm84/eOdeu939/FjOStDiBikBGDretWZPnFb7kwLS7K4N4q7VYwQIGoQVy/mBv
         XX4bgmW43srt7vQ/WINnvRxCJEla96wK6wXVVO3QRCGGE0xNHjaFjaNGzZI0NHG6D1wy
         fJPg==
X-Gm-Message-State: AOAM533NrW2W6NEhMX9hdcCfjDgUX2zaMAKI53Yoty6Yz659Q2ZMbCCt
        H1E2aBnrbQhE0ZsDIoeyhsITotsDMG7FGGWoaPA=
X-Google-Smtp-Source: ABdhPJzI9rK5QlDj5oqSuS2czS9rEOHva7EAYyuXoiJYgIvPrvHH3npr11wyk+ga7aI1sfu0nIaCQs6FMxQcyq1QB0Y=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:c86b:8269:af92:55a])
 (user=samitolvanen job=sendgmr) by 2002:ad4:4b6c:: with SMTP id
 m12mr9997739qvx.21.1615510175432; Thu, 11 Mar 2021 16:49:35 -0800 (PST)
Date:   Thu, 11 Mar 2021 16:49:10 -0800
In-Reply-To: <20210312004919.669614-1-samitolvanen@google.com>
Message-Id: <20210312004919.669614-9-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210312004919.669614-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH 08/17] bpf: disable CFI in dispatcher functions
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kbuild@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

BPF dispatcher functions are patched at runtime to perform direct
instead of indirect calls. Disable CFI for the dispatcher functions to
avoid conflicts.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/bpf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index cccaef1088ea..9acdca574527 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -635,7 +635,7 @@ struct bpf_dispatcher {
 	struct bpf_ksym ksym;
 };
 
-static __always_inline unsigned int bpf_dispatcher_nop_func(
+static __always_inline __nocfi unsigned int bpf_dispatcher_nop_func(
 	const void *ctx,
 	const struct bpf_insn *insnsi,
 	unsigned int (*bpf_func)(const void *,
@@ -663,7 +663,7 @@ void bpf_trampoline_put(struct bpf_trampoline *tr);
 }
 
 #define DEFINE_BPF_DISPATCHER(name)					\
-	noinline unsigned int bpf_dispatcher_##name##_func(		\
+	noinline __nocfi unsigned int bpf_dispatcher_##name##_func(	\
 		const void *ctx,					\
 		const struct bpf_insn *insnsi,				\
 		unsigned int (*bpf_func)(const void *,			\
-- 
2.31.0.rc2.261.g7f71774620-goog

