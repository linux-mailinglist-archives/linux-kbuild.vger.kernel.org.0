Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCAF6FCC92
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 19:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfKNSER (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 13:04:17 -0500
Received: from mail-qk1-f201.google.com ([209.85.222.201]:43835 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfKNSEQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 13:04:16 -0500
Received: by mail-qk1-f201.google.com with SMTP id a16so4491930qka.10
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Nov 2019 10:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=96xEs+lJYo0V1womdbdeC7cnwgPWDGKGu93eR6OWopc=;
        b=IcRlS/dVG/yHoLpUqrFonkreYomsiHhkkrl6VYCjwGgeNozljGzE7fVKZv2Ssna1k8
         1LzS+QCxkC5KHpnsTf2qXBJVStxBgXX4u/O4LQdZK9+jYIPMXHTqe6Nm3353E673RYzR
         tv5PgG6hmcfdvrqqaDTUgP4qJoJGJpLNU1xNJo6sFHJseHDw6SZ8fVh6/n4Br0qOJHh5
         WJXazfV7vWPrPneFu9J2a4U+aToz+/wnOYE2oyh063VxBbUNpr06NyaV699hWg0WDYt2
         YVnyTr7mGDVnEO2JcyvrLr/ihMtib36aaOFIiZNSTGvyzEB6gksmNZx1c054MGPXd/ng
         axNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=96xEs+lJYo0V1womdbdeC7cnwgPWDGKGu93eR6OWopc=;
        b=mMnGgD19P6pqUSN6vKPQytWZOmiDhpuwecWPZACbC9SEX1ncm9mjaDihfKwdn04DFO
         jbW6NI9MCLeloDbfoloCuWFiKeMO4H26b7kHVbW64nq2yIkb4Q6FpCvb49M8oFtnXTOw
         Qxt83UKiCpIGs1V7LLdEr2GV78dNDPXioN0JNm1R6B+UFlkXhxcqluogGLMp7A/EardA
         RZzxipgAyINym0bscU2k/Lbu+6XprnWR51t4IluSbwSKi2l8oSZouhZKNNtb2VgRjKEl
         O/X2xkc0Djw4irFrfb96NGWcU+eteDpojqgGQoIoAkeTWGeABRynfX3rmckpvdcVUNJ3
         ueEw==
X-Gm-Message-State: APjAAAWf6759tB7T2BP2smQAY0fdt8tq7Am5qyWt+6EyuW9C9s7X9bqO
        CerXmqy8x/9ukQmZzrG/kdAd+EwIWQ==
X-Google-Smtp-Source: APXvYqy9G23BfTtDP6DLRm/+dyC4HyMfQj+e3C86SeKn5yp6ansmdfintOUGctl96DGNbXdQ3o32tHVhbA==
X-Received: by 2002:aed:2cc5:: with SMTP id g63mr9497984qtd.205.1573754653698;
 Thu, 14 Nov 2019 10:04:13 -0800 (PST)
Date:   Thu, 14 Nov 2019 19:02:58 +0100
In-Reply-To: <20191114180303.66955-1-elver@google.com>
Message-Id: <20191114180303.66955-6-elver@google.com>
Mime-Version: 1.0
References: <20191114180303.66955-1-elver@google.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
Subject: [PATCH v4 05/10] build, kcsan: Add KCSAN build exceptions
From:   Marco Elver <elver@google.com>
To:     elver@google.com
Cc:     akiyks@gmail.com, stern@rowland.harvard.edu, glider@google.com,
        parri.andrea@gmail.com, andreyknvl@google.com, luto@kernel.org,
        ard.biesheuvel@linaro.org, arnd@arndb.de, boqun.feng@gmail.com,
        bp@alien8.de, dja@axtens.net, dlustig@nvidia.com,
        dave.hansen@linux.intel.com, dhowells@redhat.com,
        dvyukov@google.com, hpa@zytor.com, mingo@redhat.com,
        j.alglave@ucl.ac.uk, joel@joelfernandes.org, corbet@lwn.net,
        jpoimboe@redhat.com, luc.maranget@inria.fr, mark.rutland@arm.com,
        npiggin@gmail.com, paulmck@kernel.org, peterz@infradead.org,
        tglx@linutronix.de, will@kernel.org, edumazet@google.com,
        kasan-dev@googlegroups.com, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This blacklists several compilation units from KCSAN. See the respective
inline comments for the reasoning.

Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
---
v3:
* Moved EFI stub build exception hunk from x86-specific patch, since
  it's not x86-specific.
* Spelling "data-race" -> "data race".
---
 drivers/firmware/efi/libstub/Makefile | 2 ++
 kernel/Makefile                       | 5 +++++
 kernel/sched/Makefile                 | 6 ++++++
 mm/Makefile                           | 8 ++++++++
 4 files changed, 21 insertions(+)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index ee0661ddb25b..5d0a645c0de8 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -31,7 +31,9 @@ KBUILD_CFLAGS			:= $(cflags-y) -DDISABLE_BRANCH_PROFILING \
 				   -D__DISABLE_EXPORTS
 
 GCOV_PROFILE			:= n
+# Sanitizer runtimes are unavailable and cannot be linked here.
 KASAN_SANITIZE			:= n
+KCSAN_SANITIZE			:= n
 UBSAN_SANITIZE			:= n
 OBJECT_FILES_NON_STANDARD	:= y
 
diff --git a/kernel/Makefile b/kernel/Makefile
index 74ab46e2ebd1..cc53f7c25446 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -23,6 +23,9 @@ endif
 # Prevents flicker of uninteresting __do_softirq()/__local_bh_disable_ip()
 # in coverage traces.
 KCOV_INSTRUMENT_softirq.o := n
+# Avoid KCSAN instrumentation in softirq ("No shared variables, all the data
+# are CPU local" => assume no data races), to reduce overhead in interrupts.
+KCSAN_SANITIZE_softirq.o = n
 # These are called from save_stack_trace() on slub debug path,
 # and produce insane amounts of uninteresting coverage.
 KCOV_INSTRUMENT_module.o := n
@@ -30,6 +33,7 @@ KCOV_INSTRUMENT_extable.o := n
 # Don't self-instrument.
 KCOV_INSTRUMENT_kcov.o := n
 KASAN_SANITIZE_kcov.o := n
+KCSAN_SANITIZE_kcov.o := n
 CFLAGS_kcov.o := $(call cc-option, -fno-conserve-stack -fno-stack-protector)
 
 # cond_syscall is currently not LTO compatible
@@ -118,6 +122,7 @@ obj-$(CONFIG_RSEQ) += rseq.o
 
 obj-$(CONFIG_GCC_PLUGIN_STACKLEAK) += stackleak.o
 KASAN_SANITIZE_stackleak.o := n
+KCSAN_SANITIZE_stackleak.o := n
 KCOV_INSTRUMENT_stackleak.o := n
 
 $(obj)/configs.o: $(obj)/config_data.gz
diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index 21fb5a5662b5..e9307a9c54e7 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -7,6 +7,12 @@ endif
 # that is not a function of syscall inputs. E.g. involuntary context switches.
 KCOV_INSTRUMENT := n
 
+# There are numerous races here, however, most of them due to plain accesses.
+# This would make it even harder for syzbot to find reproducers, because these
+# bugs trigger without specific input. Disable by default, but should re-enable
+# eventually.
+KCSAN_SANITIZE := n
+
 ifneq ($(CONFIG_SCHED_OMIT_FRAME_POINTER),y)
 # According to Alan Modra <alan@linuxcare.com.au>, the -fno-omit-frame-pointer is
 # needed for x86 only.  Why this used to be enabled for all architectures is beyond
diff --git a/mm/Makefile b/mm/Makefile
index d996846697ef..56c1964bb3a1 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -7,6 +7,14 @@ KASAN_SANITIZE_slab_common.o := n
 KASAN_SANITIZE_slab.o := n
 KASAN_SANITIZE_slub.o := n
 
+# These produce frequent data race reports: most of them are due to races on
+# the same word but accesses to different bits of that word. Re-enable KCSAN
+# for these when we have more consensus on what to do about them.
+KCSAN_SANITIZE_slab_common.o := n
+KCSAN_SANITIZE_slab.o := n
+KCSAN_SANITIZE_slub.o := n
+KCSAN_SANITIZE_page_alloc.o := n
+
 # These files are disabled because they produce non-interesting and/or
 # flaky coverage that is not a function of syscall inputs. E.g. slab is out of
 # free pages, or a task is migrated between nodes.
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

