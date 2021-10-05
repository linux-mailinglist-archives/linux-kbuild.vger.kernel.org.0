Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45571422439
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 13:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbhJELCT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 07:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234343AbhJELBy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 07:01:54 -0400
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72252C061768
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 04:00:03 -0700 (PDT)
Received: by mail-wr1-x449.google.com with SMTP id r25-20020adfab59000000b001609ddd5579so2568009wrc.21
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xsbn5DHOInVTvHdCjIbH8F7lYj2M2KByY98qL4y3tHQ=;
        b=GzYNn8BbV6HkxgVdAh/WhkAVRVFifsX3fAkp8fuVoAbra5X82gtJ5hOoDMKsnHhLwC
         mnx7wKKhxnC9J06fLnhTs/xSclQNx4hwLNnYCZymjlGPonilYIh7ZmRmdGaX29tLzIRe
         M/j6QrWCMbfWV4Uu86XFyHKI9s9H6sXo+yJKUz1mUCWwgwYOJGiFIolnc4BC6eKk7wcc
         6o3T4EGFdqZ5IxBb7RCK1gZZcmJPDF/AUCprOJ4NoNdyrcmFb3fuHUWzHWh165fY7Y+9
         yWwiA81IolLhAEqe9OyucVzO5vf2e4p0TazEtV3o/92kFxe0WM8a08FV6GXuJapgpPZu
         qmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xsbn5DHOInVTvHdCjIbH8F7lYj2M2KByY98qL4y3tHQ=;
        b=GAY9md3q2jaKTiqDWohuCt8EsqMhqBx/ZsgvjB4V0dV71t2S4AD6P++7UTt84erl/C
         R88D4/uAwrv25D4LIXLG3vCgojDuhzs8SCFHlJfH1NzP7AROVH9fKpuPx6aCXE2D2wpu
         IHF5fNkzzeq6qRypkaSdfNMqpEMKq4k0dUs/Sg37/mo+P6mdX9IULO6jjSiMYoU9znkt
         E0s+ezApY99mtgvtBq1jcLnhe16kTC093m2QkwP/aBO/QTTl+xIOFEOT0w3et63q7AEg
         gmlKNM021rVYBR//FfJX62VaRhVLkRCYzwrNb/DPw5tu2+Cp3E25w07o59OdK6eKIJhj
         mhcQ==
X-Gm-Message-State: AOAM532DksDKNsHcW2S9YKemGjlUxWXPh5O0OWfFtOyzAMwdixSUPlfQ
        FFLSd8YG0ZjwQS3t/8CVIlm+s2B2SA==
X-Google-Smtp-Source: ABdhPJyQ9+XR3YU56FBJU8DeE3vu/iZuM2wNV7QdNqbMLHMu3vYpUyN6kv4zopypBzI8an4m0Im5e2ujqw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:adf:a35d:: with SMTP id d29mr20140800wrb.318.1633431601839;
 Tue, 05 Oct 2021 04:00:01 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:58:50 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-9-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 08/23] kcsan: Show location access was reordered to
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E . McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Also show the location the access was reordered to. An example report:

| ==================================================================
| BUG: KCSAN: data-race in test_kernel_wrong_memorder / test_kernel_wrong_memorder
|
| read-write to 0xffffffffc01e61a8 of 8 bytes by task 2311 on cpu 5:
|  test_kernel_wrong_memorder+0x57/0x90
|  access_thread+0x99/0xe0
|  kthread+0x2ba/0x2f0
|  ret_from_fork+0x22/0x30
|
| read-write (reordered) to 0xffffffffc01e61a8 of 8 bytes by task 2310 on cpu 7:
|  test_kernel_wrong_memorder+0x57/0x90
|  access_thread+0x99/0xe0
|  kthread+0x2ba/0x2f0
|  ret_from_fork+0x22/0x30
|   |
|   +-> reordered to: test_kernel_wrong_memorder+0x80/0x90
|
| Reported by Kernel Concurrency Sanitizer on:
| CPU: 7 PID: 2310 Comm: access_thread Not tainted 5.14.0-rc1+ #18
| Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
| ==================================================================

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/report.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/kernel/kcsan/report.c b/kernel/kcsan/report.c
index 1b0e050bdf6a..67794404042a 100644
--- a/kernel/kcsan/report.c
+++ b/kernel/kcsan/report.c
@@ -308,10 +308,12 @@ static int get_stack_skipnr(const unsigned long stack_entries[], int num_entries
 
 /*
  * Skips to the first entry that matches the function of @ip, and then replaces
- * that entry with @ip, returning the entries to skip.
+ * that entry with @ip, returning the entries to skip with @replaced containing
+ * the replaced entry.
  */
 static int
-replace_stack_entry(unsigned long stack_entries[], int num_entries, unsigned long ip)
+replace_stack_entry(unsigned long stack_entries[], int num_entries, unsigned long ip,
+		    unsigned long *replaced)
 {
 	unsigned long symbolsize, offset;
 	unsigned long target_func;
@@ -330,6 +332,7 @@ replace_stack_entry(unsigned long stack_entries[], int num_entries, unsigned lon
 		func -= offset;
 
 		if (func == target_func) {
+			*replaced = stack_entries[skip];
 			stack_entries[skip] = ip;
 			return skip;
 		}
@@ -342,9 +345,10 @@ replace_stack_entry(unsigned long stack_entries[], int num_entries, unsigned lon
 }
 
 static int
-sanitize_stack_entries(unsigned long stack_entries[], int num_entries, unsigned long ip)
+sanitize_stack_entries(unsigned long stack_entries[], int num_entries, unsigned long ip,
+		       unsigned long *replaced)
 {
-	return ip ? replace_stack_entry(stack_entries, num_entries, ip) :
+	return ip ? replace_stack_entry(stack_entries, num_entries, ip, replaced) :
 			  get_stack_skipnr(stack_entries, num_entries);
 }
 
@@ -360,6 +364,14 @@ static int sym_strcmp(void *addr1, void *addr2)
 	return strncmp(buf1, buf2, sizeof(buf1));
 }
 
+static void
+print_stack_trace(unsigned long stack_entries[], int num_entries, unsigned long reordered_to)
+{
+	stack_trace_print(stack_entries, num_entries, 0);
+	if (reordered_to)
+		pr_err("  |\n  +-> reordered to: %pS\n", (void *)reordered_to);
+}
+
 static void print_verbose_info(struct task_struct *task)
 {
 	if (!task)
@@ -378,10 +390,12 @@ static void print_report(enum kcsan_value_change value_change,
 			 struct other_info *other_info,
 			 u64 old, u64 new, u64 mask)
 {
+	unsigned long reordered_to = 0;
 	unsigned long stack_entries[NUM_STACK_ENTRIES] = { 0 };
 	int num_stack_entries = stack_trace_save(stack_entries, NUM_STACK_ENTRIES, 1);
-	int skipnr = sanitize_stack_entries(stack_entries, num_stack_entries, ai->ip);
+	int skipnr = sanitize_stack_entries(stack_entries, num_stack_entries, ai->ip, &reordered_to);
 	unsigned long this_frame = stack_entries[skipnr];
+	unsigned long other_reordered_to = 0;
 	unsigned long other_frame = 0;
 	int other_skipnr = 0; /* silence uninit warnings */
 
@@ -394,7 +408,7 @@ static void print_report(enum kcsan_value_change value_change,
 	if (other_info) {
 		other_skipnr = sanitize_stack_entries(other_info->stack_entries,
 						      other_info->num_stack_entries,
-						      other_info->ai.ip);
+						      other_info->ai.ip, &other_reordered_to);
 		other_frame = other_info->stack_entries[other_skipnr];
 
 		/* @value_change is only known for the other thread */
@@ -434,10 +448,9 @@ static void print_report(enum kcsan_value_change value_change,
 		       other_info->ai.cpu_id);
 
 		/* Print the other thread's stack trace. */
-		stack_trace_print(other_info->stack_entries + other_skipnr,
+		print_stack_trace(other_info->stack_entries + other_skipnr,
 				  other_info->num_stack_entries - other_skipnr,
-				  0);
-
+				  other_reordered_to);
 		if (IS_ENABLED(CONFIG_KCSAN_VERBOSE))
 			print_verbose_info(other_info->task);
 
@@ -451,9 +464,7 @@ static void print_report(enum kcsan_value_change value_change,
 		       get_thread_desc(ai->task_pid), ai->cpu_id);
 	}
 	/* Print stack trace of this thread. */
-	stack_trace_print(stack_entries + skipnr, num_stack_entries - skipnr,
-			  0);
-
+	print_stack_trace(stack_entries + skipnr, num_stack_entries - skipnr, reordered_to);
 	if (IS_ENABLED(CONFIG_KCSAN_VERBOSE))
 		print_verbose_info(current);
 
-- 
2.33.0.800.g4c38ced690-goog

