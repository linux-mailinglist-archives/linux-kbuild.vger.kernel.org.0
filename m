Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3673B35094A
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 23:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbhCaV2Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 17:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232728AbhCaV1k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 17:27:40 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E34BC06174A
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 14:27:40 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id x8so3714813ybo.6
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=VrfRHkoNzR+0/b/OZROtS1u75H9EO8EEUwf0vNpKXW4=;
        b=lPEGjGAWaiYjsz9zU+YHuadto6OsoV7V49BU7GsqscQe5wK/si5GABPDlQXYT+c+Z1
         mb0iBsdbFeDScYW+6Ep34gTydantp6e+uiENRCYegt6foDck+ev8w7TstW0kE3+NLA2x
         v/80R9LLk+21unRgCwZCixd3RJqek9N5I9CXu0emDkhkyEsavlD4eZJDBCQL0gdu1l/E
         KZGm5gBzVK3x6BXEL/DnxIp9qarxFEGoOoq89b7yhh3Cw4cdSZR5pG2lrq7dbUe5mN9x
         dxn8t65kLsbOAQqIUcrNXKM/V7HyJ5KLsL1PE/Xn5UzFRc43UqksnE95n14OqVoTrSwo
         KriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=VrfRHkoNzR+0/b/OZROtS1u75H9EO8EEUwf0vNpKXW4=;
        b=EYdm2nvLnfRPTpx5FzxFlnu8zAiByrN+ozUthz5H45EHvlVIY/xv8fxzrESLoUNeOK
         jRXPx/BBdG4k030VzqCqZgo0JMzDVI16A8bT/F2o3HhrSBqoZGrxKDv001Q/VYybCebf
         9eK6HTvgCf5EltB46fZxdoobYVc5lks4cvefT3mTXkfkl3yctnmFPiyyWbP0nOE121//
         HO8LHf5S7ow6mQBR0JipOiD5Hq7mqK/vng1dn0fKYVPU9r2d3r1aJxGtfjfa+QvJXMqh
         lUVIPUiwCzWA7C0o1jHk5RRxf/131zr3XDemXPdZIkPAwBZeui4brJxhzBqENkuLRfjE
         BFlQ==
X-Gm-Message-State: AOAM5335Z2hm1VY3lBfMM4uK7Sufv1BvCctgj1u4SEOLOlStYSJ5tazT
        K+oWCS8lP+cnO0E5W6TYhWRLbhjJQUpXpW4CWLQ=
X-Google-Smtp-Source: ABdhPJwxA0CtxdkWc6M/jwZJvtoqXk9nSdTKxmLyT5rwl9B6GB5FZIGHnM0kBXshVGaK6mnJ+f6IJx8IAQpBxGRL/Bk=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:7933:7015:a5d5:3835])
 (user=samitolvanen job=sendgmr) by 2002:a25:bb49:: with SMTP id
 b9mr8136529ybk.350.1617226059304; Wed, 31 Mar 2021 14:27:39 -0700 (PDT)
Date:   Wed, 31 Mar 2021 14:27:12 -0700
In-Reply-To: <20210331212722.2746212-1-samitolvanen@google.com>
Message-Id: <20210331212722.2746212-9-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210331212722.2746212-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH v4 08/17] bpf: disable CFI in dispatcher functions
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sedat Dilek <sedat.dilek@gmail.com>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

BPF dispatcher functions are patched at runtime to perform direct
instead of indirect calls. Disable CFI for the dispatcher functions to
avoid conflicts.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 include/linux/bpf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 3625f019767d..2f46f98479e1 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -650,7 +650,7 @@ struct bpf_dispatcher {
 	struct bpf_ksym ksym;
 };
 
-static __always_inline unsigned int bpf_dispatcher_nop_func(
+static __always_inline __nocfi unsigned int bpf_dispatcher_nop_func(
 	const void *ctx,
 	const struct bpf_insn *insnsi,
 	unsigned int (*bpf_func)(const void *,
@@ -678,7 +678,7 @@ void bpf_trampoline_put(struct bpf_trampoline *tr);
 }
 
 #define DEFINE_BPF_DISPATCHER(name)					\
-	noinline unsigned int bpf_dispatcher_##name##_func(		\
+	noinline __nocfi unsigned int bpf_dispatcher_##name##_func(	\
 		const void *ctx,					\
 		const struct bpf_insn *insnsi,				\
 		unsigned int (*bpf_func)(const void *,			\
-- 
2.31.0.291.g576ba9dcdaf-goog

