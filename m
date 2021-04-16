Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBDD361E8C
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 13:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242479AbhDPLY4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 07:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242414AbhDPLYy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 07:24:54 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812C0C061756;
        Fri, 16 Apr 2021 04:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=sb+Ugjsd0tAaDPpJs5cCihgu8wnXOCRedQVd+/pDZMc=; b=oTQOxnF8z6GepfXYmcNaITTJ8J
        BQKqIXFBNrrj+WsWUsizw7P/Mm/aFxwvDFsxUZBf+4IUVINWC4ikel759t8pZXuRRoEC8unOKqGEj
        PSG73vXSMMgdAE4lX2eWR0s4MrAOeVd0Tc5/4RxWkqyVBqAphGNu7ozOJ/4uM2gei2v2wQKlyrLAg
        NNjzoxj29MsAzohIPJ92Rjv+lfx4ZCpOFGcTMg8qmRKuQ5Cs5N7EuTgPtJ32/GgvpZgbS2BZHO9To
        +atJUR8B2KtZ3ryXu1knNaY1+Cngp9xhf2hLF8Jq3OS6cuwRB4+j0gQo5L0gtLILdKzAfQbtLoKfM
        PQNltwoA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lXMaG-001uWR-Eu; Fri, 16 Apr 2021 11:24:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0507C300212;
        Fri, 16 Apr 2021 13:24:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id E762C2C30CA77; Fri, 16 Apr 2021 13:24:23 +0200 (CEST)
Date:   Fri, 16 Apr 2021 13:24:23 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:
>   - Featureful language: sum types, pattern matching, generics,
>     RAII, lifetimes, shared & exclusive references, modules &
>     visibility, powerful hygienic and procedural macros...

IMO RAII is over-valued, but just in case you care, the below seems to
work just fine. No fancy new language needed, works today. Similarly you
can create refcount_t guards, or with a little more work full blown
smart_ptr crud.

---
diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index e19323521f9c..f03a72dd8cea 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -197,4 +197,22 @@ extern void mutex_unlock(struct mutex *lock);
 
 extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
 
+struct mutex_guard {
+	struct mutex *mutex;
+};
+
+static inline struct mutex_guard mutex_guard_lock(struct mutex *mutex)
+{
+	mutex_lock(mutex);
+	return (struct mutex_guard){ .mutex = mutex, };
+}
+
+static inline void mutex_guard_unlock(struct mutex_guard *guard)
+{
+	mutex_unlock(guard->mutex);
+}
+
+#define DEFINE_MUTEX_GUARD(name, lock)			\
+	struct mutex_guard __attribute__((__cleanup__(mutex_guard_unlock))) name = mutex_guard_lock(lock)
+
 #endif /* __LINUX_MUTEX_H */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 8ee3249de2f0..603d197a83b8 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5715,16 +5715,15 @@ static long perf_compat_ioctl(struct file *file, unsigned int cmd,
 
 int perf_event_task_enable(void)
 {
+	DEFINE_MUTEX_GUARD(event_mutex, &current->perf_event_mutex);
 	struct perf_event_context *ctx;
 	struct perf_event *event;
 
-	mutex_lock(&current->perf_event_mutex);
 	list_for_each_entry(event, &current->perf_event_list, owner_entry) {
 		ctx = perf_event_ctx_lock(event);
 		perf_event_for_each_child(event, _perf_event_enable);
 		perf_event_ctx_unlock(event, ctx);
 	}
-	mutex_unlock(&current->perf_event_mutex);
 
 	return 0;
 }
