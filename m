Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92A2346A24
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Mar 2021 21:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbhCWUkh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Mar 2021 16:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbhCWUkF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Mar 2021 16:40:05 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FADC0613DF
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 13:40:04 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id c1so132836qke.8
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 13:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=hHyY7qre9OXEm5PJ4BWXLYwsH5KdHQkHk/skTedwvAs=;
        b=XrXpk80QpW18uEoFzgTskAcjmvDwp4KkI6czCZLCI2LllpcLlxdrxTo1ItDmNHN8O3
         bTKrEPYdAX8nqjUwEIjMGeZsRGCVSfDL1H2a3iHP2ngOiAKHMzDoZoN0zJI6U4uE7k4F
         VmweQXHEF/+JfAZFlAnZ8tr59hnNtlg0Zu2hks4+H3cinnrhxWtfOBc/gs/UrtgKxOLm
         BhVL1pP08EBbqj7+0X2iUTjwgv413Vz8hEc3BGPp0zOsqaAbAJtmiERhqTuyjM44Skll
         xAU/PM/Gg5Aoxn2Inc/k5V8U3wmSxVTzMEVnRHN2lA+v/IcNPy7/8t7fb9X4R/xp1aHQ
         xZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hHyY7qre9OXEm5PJ4BWXLYwsH5KdHQkHk/skTedwvAs=;
        b=WJ/BtCLw1fjTLsnUc5gRMHeJFN+Ucq4AJqX+bNGQ6NcsnqNUSWcKj7qebvURe0Rq5r
         vhQOSWT5/9JYCRsP2fxNlGmgZNCGyjV7Rkl/mHHl7ZBWINVJXsLvaCh3FBLrvhxYsSSI
         zirtfDQWMqSh2Vwak3OX82pVTlQtLnPsu5LnVF5h/wdjJkI4P2bLMI9QWmvAIz/dMcoZ
         w72Dg5q61iUklYGVjTyfGavdr+QRoL1vGv3XBswECJM75RA6rcJ2k26M2z7shXPQ8vJt
         3FWtwNNMUeI2Sa0LoDAxZ15hUnANA1bbeypaajjIhLlLpLla6uNGqE3avL/QdbWr0AQ5
         qhrg==
X-Gm-Message-State: AOAM530LzL3e9/9GfMAh7KUsPRcL82obB9Jz6vZ8g3yTSNCrzV+pc7fN
        DGIslvuiGHwiEzbPU1d0w3FtvBh2ULIHrSocn4I=
X-Google-Smtp-Source: ABdhPJzK5aKSbLwoPjOa/fZ+4wQdl/i/PHvrBqs1DnRZn9DH8KD/9yfcQQbrZv/qBxwpr5GT4qC2fq5WQsc1rIzUeMY=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e9a3:260d:763b:67dc])
 (user=samitolvanen job=sendgmr) by 2002:ad4:542b:: with SMTP id
 g11mr7093888qvt.47.1616532003425; Tue, 23 Mar 2021 13:40:03 -0700 (PDT)
Date:   Tue, 23 Mar 2021 13:39:37 -0700
In-Reply-To: <20210323203946.2159693-1-samitolvanen@google.com>
Message-Id: <20210323203946.2159693-9-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210323203946.2159693-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH v3 08/17] bpf: disable CFI in dispatcher functions
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
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
2.31.0.291.g576ba9dcdaf-goog

