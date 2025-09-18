Return-Path: <linux-kbuild+bounces-8881-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6859BB851F4
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FFC1163531
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE972317701;
	Thu, 18 Sep 2025 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L1uA/9VD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462713164DB
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204397; cv=none; b=s1D7ZR2DvO2/+CkLsQm6x4UyW1+yKrvCXsw8jPjfuf/vaEcge+bCp4LQeLi338KBVobNiS1BFJFrm3tY4XbR+2BtZRrm/hHtmal4TOsHthxDRLE9TtlnivFYI/sn1NaheDY4MQwqv50oAwSMpGHHUPjICAWiOCvguZ4U56qzq6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204397; c=relaxed/simple;
	bh=SpUgVrjaDm3RLrxadQdn2hAFpCJXInTkIERb02PmxvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jJZCKzB0RfKpHuQJggSguE1TLfGm9SO704TF48yl9H1SyVasvXsm99oYZ0f0abYzvfW1E7nRpGHXkKwOqZX6PR3XUMte/kbVa94cU0BtEY09C0hWRSN5RQA0pfzztJ9gx2/+4X7DBctQxttTUE4uuBjHADlxNUbG0BduOMeZpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L1uA/9VD; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3ee10a24246so556899f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204393; x=1758809193; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i8w2QAEoYIuf5bb1DymlH6d9mwXwlVHoZjcMp7ct6B4=;
        b=L1uA/9VDqbJaGdqqtHo/OL9pnsP8oet6onqIEH64y/qeODBcf7lSJZJSaH/hHRPYkY
         dlgrkhIeLf4I97h6NnGur/dlQ1RAPZqgw3VZ0GN4XdUVf5WTptQhyJyUTSvp4KZV52fM
         Lo/VEZRxHYlL02fc5oOgEv7OwFHaa4EeWB6ALKOU2ZzWmZgN8MiJcwSOn+mhSdj9JOzW
         HS8CbzdvYms6ni44YeEWBJwkI+5/AesME0Ss0qhiXunz1w1eMe29CL3GiYM2zA7KZIOu
         42B99SWk4E1XN3oitKhOu19HTKdKpPYhjGcO3wd76hXf/opzI/F2RIxBb2baAbcZmuNk
         MWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204393; x=1758809193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8w2QAEoYIuf5bb1DymlH6d9mwXwlVHoZjcMp7ct6B4=;
        b=EDttbU7aHElnxHQ9DJ+O8tFzhxejupjkilu/03VDTBeIU5TvvFq0eJrG1QqrivytfP
         uweR2ghY514qTtt7kj76MTRbu1CncPTJA3jtEHOjoLj3lvH0zre1XjBDSH0yPsVfRJpO
         fw0EW/vJL0oF9KfpEjyHMRhP/J30LD5+YRIsr9ry0pTcCZantP19Sx2QC1t6vDPeOYpr
         Ion2HY8GjEqYjGfIAqchwrKNNbVcQbJRf3y8gJKU7bGEsoMqbuS76T6XlXGf85BzpHZt
         YNKhEOJJsO1FLqoIeRMWT8mxchUw7Ap8kKVnLObiT4Za9VwVAG9MRFkKikbOta7I3/8O
         HgEg==
X-Forwarded-Encrypted: i=1; AJvYcCWCsJEQwWwekRG1S6sJ66z5foxYQkE7C2afro1D7obi/Aslkd9rQkeof9XRpCqaccSyLfLf+FOPx0E97CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbrXU7535V6f0PQ5weDiaE5XMZNc8nfljwGljLNYPPKDLsSAZa
	bCnGqHi7fmw2cqC+TCA91IZhaKUZc80yU0MLIDupqey8OCTKzXZuTAzmI2DFxrJrFvxfPdBkXRE
	FWw==
X-Google-Smtp-Source: AGHT+IHWNzp66JVSJfWTxCRHilc0nDbHIqmddDpVoeLyiEVjC/MpaqVSH0JrUfOsI8FVYQkmBD96f8iDCw==
X-Received: from wrbfr7.prod.google.com ([2002:a05:6000:2a87:b0:3e7:6467:c475])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2506:b0:3da:27c2:f51d
 with SMTP id ffacd0b85a97d-3ecdfa5f1bamr5332225f8f.45.1758204392094; Thu, 18
 Sep 2025 07:06:32 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:35 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-25-elver@google.com>
Subject: [PATCH v3 24/35] compiler-capability-analysis: Introduce header suppressions
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

While we can opt in individual subsystems which add the required
annotations, such subsystems inevitably include headers from other
subsystems which may not yet have the right annotations, which then
result in false positive warnings.

Making compatible by adding annotations across all common headers
currently requires an excessive number of __no_capability_analysis
annotations, or carefully analyzing non-trivial cases to add the correct
annotations. While this is desirable long-term, providing an incremental
path causes less churn and headaches for maintainers not yet interested
in dealing with such warnings.

Rather than clutter headers unnecessary and mandate all subsystem
maintainers to keep their headers working with capability analysis,
suppress all -Wthread-safety warnings in headers. Explicitly opt in
headers with capability-enabled primitives.

With this in place, we can start enabling the analysis on more complex
subsystems in subsequent changes.

Signed-off-by: Marco Elver <elver@google.com>
---
 scripts/Makefile.capability-analysis        |  4 +++
 scripts/capability-analysis-suppression.txt | 32 +++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 scripts/capability-analysis-suppression.txt

diff --git a/scripts/Makefile.capability-analysis b/scripts/Makefile.capability-analysis
index e137751a4c9a..76ef93ce2466 100644
--- a/scripts/Makefile.capability-analysis
+++ b/scripts/Makefile.capability-analysis
@@ -4,4 +4,8 @@ capability-analysis-cflags := -DWARN_CAPABILITY_ANALYSIS	\
 	-fexperimental-late-parse-attributes -Wthread-safety	\
 	-Wthread-safety-pointer -Wthread-safety-beta
 
+ifndef CONFIG_WARN_CAPABILITY_ANALYSIS_ALL
+capability-analysis-cflags += --warning-suppression-mappings=$(srctree)/scripts/capability-analysis-suppression.txt
+endif
+
 export CFLAGS_CAPABILITY_ANALYSIS := $(capability-analysis-cflags)
diff --git a/scripts/capability-analysis-suppression.txt b/scripts/capability-analysis-suppression.txt
new file mode 100644
index 000000000000..95fb0b65a8e6
--- /dev/null
+++ b/scripts/capability-analysis-suppression.txt
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# The suppressions file should only match common paths such as header files.
+# For individual subsytems use Makefile directive CAPABILITY_ANALYSIS := [yn].
+#
+# The suppressions are ignored when CONFIG_WARN_CAPABILITY_ANALYSIS_ALL is
+# selected.
+
+[thread-safety]
+src:*arch/*/include/*
+src:*include/acpi/*
+src:*include/asm-generic/*
+src:*include/linux/*
+src:*include/net/*
+
+# Opt-in headers:
+src:*include/linux/bit_spinlock.h=emit
+src:*include/linux/cleanup.h=emit
+src:*include/linux/kref.h=emit
+src:*include/linux/list*.h=emit
+src:*include/linux/local_lock*.h=emit
+src:*include/linux/lockdep.h=emit
+src:*include/linux/mutex*.h=emit
+src:*include/linux/rcupdate.h=emit
+src:*include/linux/refcount.h=emit
+src:*include/linux/rhashtable.h=emit
+src:*include/linux/rwlock*.h=emit
+src:*include/linux/rwsem.h=emit
+src:*include/linux/seqlock*.h=emit
+src:*include/linux/spinlock*.h=emit
+src:*include/linux/srcu*.h=emit
+src:*include/linux/ww_mutex.h=emit
-- 
2.51.0.384.g4c02a37b29-goog


