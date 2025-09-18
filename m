Return-Path: <linux-kbuild+bounces-8890-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BFB851C1
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A08E7BA4E6
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1013731CA4E;
	Thu, 18 Sep 2025 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OPjlIcRs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9D431CA49
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204421; cv=none; b=Jh2VGvmzLqSpUSmdgPY4u9l6DMh2apR1b+QNs6aWnwLV/nNr7KC5VOrZV7L3jzXGvKNzi5QVx4QUE7eYxIED+l5sPbHFZ+DCFVhdnZeZYE6A2E/gJBi/xA0TXI1ckluwf/moKf92TfTUrvobKqI7kWeHGsfX5E814m4lqIUEDSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204421; c=relaxed/simple;
	bh=6HxksaWRpy4AyOyOEWKPs06Z0ahvKaglX3TytDWk2+k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UsMFCbVB7lrLk65op1K7GwoZ1pmIsgDONVYA50FkCST3OpJfYnVd5Bz4p1x48t8smR0ujwPgvvDWFJCLtsDoLOBY4n+xpOZBFrE5vr0wF1kaEZUjOJYJp5Bu+2qyHsLEzSSO4/1UY7xeplUgZPQshGHZCfvBfqR8DBhWquzzCN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OPjlIcRs; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45f2c1556aeso3816565e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204416; x=1758809216; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MXcZGKIMIxxFQi23PLqOts04ByToejjZc/xHog/2Br0=;
        b=OPjlIcRsh0NJ6jmsEH3ifN3meOEx4NjR6NGuDwiBhsG5IpyBk35ey8IHTJkAIOLXsq
         5FfAtiiKP9CdZU/pEgbUZGmQwV+lqHw34s348bvKTNf+xPR/9NAilByk/lSvu2pXsQk5
         z2divbyKP8jQ2QM7Vr5bvKBAuvFXg2hzYQ55d2OXbgoMCw4XLm/pic+I3EW8KsCVUnGE
         ZMFOO4SRvWajhnN72usqewF1kbk7mYauQMGba5OQlGbTORkrhv/LAH5pnj0WI5IJNrng
         LWFAV0UwK0hG5r7T7MhoJMJK5X4SzJf02spaatGQEJJtdms5M9c9soZEMj+YauqWzGpH
         WL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204416; x=1758809216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXcZGKIMIxxFQi23PLqOts04ByToejjZc/xHog/2Br0=;
        b=j5z7CTz9fQqjuJ8aWZy4fnObsT4m+koWxyfteZv3ZovRlUEsts6VehM5FHMgK7lg4u
         zyd457qSlplPaUhjibLhGiXTdcpGWv+cL1KflTv6NGxOezxTTxOn1ai+DPnooTFTFQ7/
         RBiLY7sroiPkBt+IVuWvFsguulq0UmoI/C+EaezRPliLPBRyHnKSx7Zi1f178qf7KsGt
         xs2sVNoYWV//BESVRNcQRXLvbqMWwySyR2/qSUE6mn9RiLAYVTFxIOuJNTe68H14/vIa
         CopvhM7DYXJwiIlek5KeBWNNFhsqxoIKNZ9aDAGU2gEocMyMI16r48Mr/zufONiqF+8y
         lAHA==
X-Forwarded-Encrypted: i=1; AJvYcCXmX5qsarZZnL38iJcCESrtVUql6CkPIK2ADDyA7702t3K1SSeDZUP/AtsP70GtXuz8i+TLeN1Z4zoeCWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMPekAqPihnz/S9ce5S2Yv8Y3yjHiviJ3m1/pyT2RVjspB7vlQ
	F1se3Li3iJrsQB2ZKHd1BflVjW581xcCrOhcplQFs33X6tmPMBWqykkIeyYMnoB1mFtwrydX1LV
	yDg==
X-Google-Smtp-Source: AGHT+IGFTw5Jp+KdcoylOu/M1mAUs1TJV0ya6gJJgJfniNuf0MgDQc+kNyDljFyyJpwlsMe7EwutlD5L0Q==
X-Received: from wmbel25.prod.google.com ([2002:a05:600c:3e19:b0:45c:d828:e351])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4eca:b0:45b:79fd:cb3d
 with SMTP id 5b1f17b1804b1-4634c528acamr45510295e9.36.1758204416080; Thu, 18
 Sep 2025 07:06:56 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:44 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-34-elver@google.com>
Subject: [PATCH v3 33/35] security/tomoyo: Enable capability analysis
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

Enable capability analysis for security/tomoyo.

This demonstrates a larger conversion to use Clang's capability
analysis. The benefit is additional static checking of locking rules,
along with better documentation.

Tomoyo makes use of several synchronization primitives, yet its clear
design made it relatively straightforward to enable capability analysis.

One notable finding was:

  security/tomoyo/gc.c:664:20: error: reading variable 'write_buf' requires holding mutex '&tomoyo_io_buffer::io_sem'
    664 |                 is_write = head->write_buf != NULL;

For which Tetsuo writes:

  "Good catch. This should be data_race(), for tomoyo_write_control()
   might concurrently update head->write_buf from non-NULL to non-NULL
   with head->io_sem held."

Signed-off-by: Marco Elver <elver@google.com>
Cc: Kentaro Takeda <takedakn@nttdata.co.jp>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
v2:
* New patch.
---
 security/tomoyo/Makefile  |  2 +
 security/tomoyo/common.c  | 52 ++++++++++++++++++++++++--
 security/tomoyo/common.h  | 77 ++++++++++++++++++++-------------------
 security/tomoyo/domain.c  |  1 +
 security/tomoyo/environ.c |  1 +
 security/tomoyo/file.c    |  5 +++
 security/tomoyo/gc.c      | 28 ++++++++++----
 security/tomoyo/mount.c   |  2 +
 security/tomoyo/network.c |  3 ++
 9 files changed, 122 insertions(+), 49 deletions(-)

diff --git a/security/tomoyo/Makefile b/security/tomoyo/Makefile
index 55c67b9846a9..6b395ca4e3d2 100644
--- a/security/tomoyo/Makefile
+++ b/security/tomoyo/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+CAPABILITY_ANALYSIS := y
+
 obj-y = audit.o common.o condition.o domain.o environ.o file.o gc.o group.o load_policy.o memory.o mount.o network.o realpath.o securityfs_if.o tomoyo.o util.o
 
 targets += builtin-policy.h
diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c
index 0f78898bce09..fa9fd134c9cc 100644
--- a/security/tomoyo/common.c
+++ b/security/tomoyo/common.c
@@ -268,6 +268,7 @@ static void tomoyo_io_printf(struct tomoyo_io_buffer *head, const char *fmt,
  */
 static void tomoyo_io_printf(struct tomoyo_io_buffer *head, const char *fmt,
 			     ...)
+	__must_hold(&head->io_sem)
 {
 	va_list args;
 	size_t len;
@@ -416,8 +417,9 @@ static void tomoyo_print_name_union_quoted(struct tomoyo_io_buffer *head,
  *
  * Returns nothing.
  */
-static void tomoyo_print_number_union_nospace
-(struct tomoyo_io_buffer *head, const struct tomoyo_number_union *ptr)
+static void
+tomoyo_print_number_union_nospace(struct tomoyo_io_buffer *head, const struct tomoyo_number_union *ptr)
+	__must_hold(&head->io_sem)
 {
 	if (ptr->group) {
 		tomoyo_set_string(head, "@");
@@ -466,6 +468,7 @@ static void tomoyo_print_number_union_nospace
  */
 static void tomoyo_print_number_union(struct tomoyo_io_buffer *head,
 				      const struct tomoyo_number_union *ptr)
+	__must_hold(&head->io_sem)
 {
 	tomoyo_set_space(head);
 	tomoyo_print_number_union_nospace(head, ptr);
@@ -664,6 +667,7 @@ static int tomoyo_set_mode(char *name, const char *value,
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_write_profile(struct tomoyo_io_buffer *head)
+	__must_hold(&head->io_sem)
 {
 	char *data = head->write_buf;
 	unsigned int i;
@@ -719,6 +723,7 @@ static int tomoyo_write_profile(struct tomoyo_io_buffer *head)
  * Caller prints functionality's name.
  */
 static void tomoyo_print_config(struct tomoyo_io_buffer *head, const u8 config)
+	__must_hold(&head->io_sem)
 {
 	tomoyo_io_printf(head, "={ mode=%s grant_log=%s reject_log=%s }\n",
 			 tomoyo_mode[config & 3],
@@ -734,6 +739,7 @@ static void tomoyo_print_config(struct tomoyo_io_buffer *head, const u8 config)
  * Returns nothing.
  */
 static void tomoyo_read_profile(struct tomoyo_io_buffer *head)
+	__must_hold(&head->io_sem)
 {
 	u8 index;
 	struct tomoyo_policy_namespace *ns =
@@ -852,6 +858,7 @@ static bool tomoyo_same_manager(const struct tomoyo_acl_head *a,
  */
 static int tomoyo_update_manager_entry(const char *manager,
 				       const bool is_delete)
+	__must_hold_shared(&tomoyo_ss)
 {
 	struct tomoyo_manager e = { };
 	struct tomoyo_acl_param param = {
@@ -883,6 +890,8 @@ static int tomoyo_update_manager_entry(const char *manager,
  * Caller holds tomoyo_read_lock().
  */
 static int tomoyo_write_manager(struct tomoyo_io_buffer *head)
+	__must_hold_shared(&tomoyo_ss)
+	__must_hold(&head->io_sem)
 {
 	char *data = head->write_buf;
 
@@ -901,6 +910,7 @@ static int tomoyo_write_manager(struct tomoyo_io_buffer *head)
  * Caller holds tomoyo_read_lock().
  */
 static void tomoyo_read_manager(struct tomoyo_io_buffer *head)
+	__must_hold_shared(&tomoyo_ss)
 {
 	if (head->r.eof)
 		return;
@@ -927,6 +937,7 @@ static void tomoyo_read_manager(struct tomoyo_io_buffer *head)
  * Caller holds tomoyo_read_lock().
  */
 static bool tomoyo_manager(void)
+	__must_hold_shared(&tomoyo_ss)
 {
 	struct tomoyo_manager *ptr;
 	const char *exe;
@@ -981,6 +992,8 @@ static struct tomoyo_domain_info *tomoyo_find_domain_by_qid
  */
 static bool tomoyo_select_domain(struct tomoyo_io_buffer *head,
 				 const char *data)
+	__must_hold_shared(&tomoyo_ss)
+	__must_hold(&head->io_sem)
 {
 	unsigned int pid;
 	struct tomoyo_domain_info *domain = NULL;
@@ -1051,6 +1064,7 @@ static bool tomoyo_same_task_acl(const struct tomoyo_acl_info *a,
  * Caller holds tomoyo_read_lock().
  */
 static int tomoyo_write_task(struct tomoyo_acl_param *param)
+	__must_hold_shared(&tomoyo_ss)
 {
 	int error = -EINVAL;
 
@@ -1079,6 +1093,7 @@ static int tomoyo_write_task(struct tomoyo_acl_param *param)
  * Caller holds tomoyo_read_lock().
  */
 static int tomoyo_delete_domain(char *domainname)
+	__must_hold_shared(&tomoyo_ss)
 {
 	struct tomoyo_domain_info *domain;
 	struct tomoyo_path_info name;
@@ -1118,6 +1133,7 @@ static int tomoyo_delete_domain(char *domainname)
 static int tomoyo_write_domain2(struct tomoyo_policy_namespace *ns,
 				struct list_head *list, char *data,
 				const bool is_delete)
+	__must_hold_shared(&tomoyo_ss)
 {
 	struct tomoyo_acl_param param = {
 		.ns = ns,
@@ -1162,6 +1178,8 @@ const char * const tomoyo_dif[TOMOYO_MAX_DOMAIN_INFO_FLAGS] = {
  * Caller holds tomoyo_read_lock().
  */
 static int tomoyo_write_domain(struct tomoyo_io_buffer *head)
+	__must_hold_shared(&tomoyo_ss)
+	__must_hold(&head->io_sem)
 {
 	char *data = head->write_buf;
 	struct tomoyo_policy_namespace *ns;
@@ -1223,6 +1241,7 @@ static int tomoyo_write_domain(struct tomoyo_io_buffer *head)
  */
 static bool tomoyo_print_condition(struct tomoyo_io_buffer *head,
 				   const struct tomoyo_condition *cond)
+	__must_hold(&head->io_sem)
 {
 	switch (head->r.cond_step) {
 	case 0:
@@ -1364,6 +1383,7 @@ static bool tomoyo_print_condition(struct tomoyo_io_buffer *head,
  */
 static void tomoyo_set_group(struct tomoyo_io_buffer *head,
 			     const char *category)
+	__must_hold(&head->io_sem)
 {
 	if (head->type == TOMOYO_EXCEPTIONPOLICY) {
 		tomoyo_print_namespace(head);
@@ -1383,6 +1403,7 @@ static void tomoyo_set_group(struct tomoyo_io_buffer *head,
  */
 static bool tomoyo_print_entry(struct tomoyo_io_buffer *head,
 			       struct tomoyo_acl_info *acl)
+	__must_hold(&head->io_sem)
 {
 	const u8 acl_type = acl->type;
 	bool first = true;
@@ -1588,6 +1609,8 @@ static bool tomoyo_print_entry(struct tomoyo_io_buffer *head,
  */
 static bool tomoyo_read_domain2(struct tomoyo_io_buffer *head,
 				struct list_head *list)
+	__must_hold_shared(&tomoyo_ss)
+	__must_hold(&head->io_sem)
 {
 	list_for_each_cookie(head->r.acl, list) {
 		struct tomoyo_acl_info *ptr =
@@ -1608,6 +1631,8 @@ static bool tomoyo_read_domain2(struct tomoyo_io_buffer *head,
  * Caller holds tomoyo_read_lock().
  */
 static void tomoyo_read_domain(struct tomoyo_io_buffer *head)
+	__must_hold_shared(&tomoyo_ss)
+	__must_hold(&head->io_sem)
 {
 	if (head->r.eof)
 		return;
@@ -1686,6 +1711,7 @@ static int tomoyo_write_pid(struct tomoyo_io_buffer *head)
  * using read()/write() interface rather than sysctl() interface.
  */
 static void tomoyo_read_pid(struct tomoyo_io_buffer *head)
+	__must_hold(&head->io_sem)
 {
 	char *buf = head->write_buf;
 	bool global_pid = false;
@@ -1746,6 +1772,8 @@ static const char *tomoyo_group_name[TOMOYO_MAX_GROUP] = {
  * Caller holds tomoyo_read_lock().
  */
 static int tomoyo_write_exception(struct tomoyo_io_buffer *head)
+	__must_hold_shared(&tomoyo_ss)
+	__must_hold(&head->io_sem)
 {
 	const bool is_delete = head->w.is_delete;
 	struct tomoyo_acl_param param = {
@@ -1787,6 +1815,8 @@ static int tomoyo_write_exception(struct tomoyo_io_buffer *head)
  * Caller holds tomoyo_read_lock().
  */
 static bool tomoyo_read_group(struct tomoyo_io_buffer *head, const int idx)
+	__must_hold_shared(&tomoyo_ss)
+	__must_hold(&head->io_sem)
 {
 	struct tomoyo_policy_namespace *ns =
 		container_of(head->r.ns, typeof(*ns), namespace_list);
@@ -1846,6 +1876,7 @@ static bool tomoyo_read_group(struct tomoyo_io_buffer *head, const int idx)
  * Caller holds tomoyo_read_lock().
  */
 static bool tomoyo_read_policy(struct tomoyo_io_buffer *head, const int idx)
+	__must_hold_shared(&tomoyo_ss)
 {
 	struct tomoyo_policy_namespace *ns =
 		container_of(head->r.ns, typeof(*ns), namespace_list);
@@ -1906,6 +1937,8 @@ static bool tomoyo_read_policy(struct tomoyo_io_buffer *head, const int idx)
  * Caller holds tomoyo_read_lock().
  */
 static void tomoyo_read_exception(struct tomoyo_io_buffer *head)
+	__must_hold_shared(&tomoyo_ss)
+	__must_hold(&head->io_sem)
 {
 	struct tomoyo_policy_namespace *ns =
 		container_of(head->r.ns, typeof(*ns), namespace_list);
@@ -2097,6 +2130,7 @@ static void tomoyo_patternize_path(char *buffer, const int len, char *entry)
  * Returns nothing.
  */
 static void tomoyo_add_entry(struct tomoyo_domain_info *domain, char *header)
+	__must_hold_shared(&tomoyo_ss)
 {
 	char *buffer;
 	char *realpath = NULL;
@@ -2301,6 +2335,7 @@ static __poll_t tomoyo_poll_query(struct file *file, poll_table *wait)
  * @head: Pointer to "struct tomoyo_io_buffer".
  */
 static void tomoyo_read_query(struct tomoyo_io_buffer *head)
+	__must_hold(&head->io_sem)
 {
 	struct list_head *tmp;
 	unsigned int pos = 0;
@@ -2362,6 +2397,7 @@ static void tomoyo_read_query(struct tomoyo_io_buffer *head)
  * Returns 0 on success, -EINVAL otherwise.
  */
 static int tomoyo_write_answer(struct tomoyo_io_buffer *head)
+	__must_hold(&head->io_sem)
 {
 	char *data = head->write_buf;
 	struct list_head *tmp;
@@ -2401,6 +2437,7 @@ static int tomoyo_write_answer(struct tomoyo_io_buffer *head)
  * Returns version information.
  */
 static void tomoyo_read_version(struct tomoyo_io_buffer *head)
+	__must_hold(&head->io_sem)
 {
 	if (!head->r.eof) {
 		tomoyo_io_printf(head, "2.6.0");
@@ -2449,6 +2486,7 @@ void tomoyo_update_stat(const u8 index)
  * Returns nothing.
  */
 static void tomoyo_read_stat(struct tomoyo_io_buffer *head)
+	__must_hold(&head->io_sem)
 {
 	u8 i;
 	unsigned int total = 0;
@@ -2493,6 +2531,7 @@ static void tomoyo_read_stat(struct tomoyo_io_buffer *head)
  * Returns 0.
  */
 static int tomoyo_write_stat(struct tomoyo_io_buffer *head)
+	__must_hold(&head->io_sem)
 {
 	char *data = head->write_buf;
 	u8 i;
@@ -2717,6 +2756,8 @@ ssize_t tomoyo_read_control(struct tomoyo_io_buffer *head, char __user *buffer,
  * Caller holds tomoyo_read_lock().
  */
 static int tomoyo_parse_policy(struct tomoyo_io_buffer *head, char *line)
+	__must_hold_shared(&tomoyo_ss)
+	__must_hold(&head->io_sem)
 {
 	/* Delete request? */
 	head->w.is_delete = !strncmp(line, "delete ", 7);
@@ -2969,8 +3010,11 @@ void __init tomoyo_load_builtin_policy(void)
 				break;
 			*end = '\0';
 			tomoyo_normalize_line(start);
-			head.write_buf = start;
-			tomoyo_parse_policy(&head, start);
+			/* head is stack-local and not shared. */
+			capability_unsafe(
+				head.write_buf = start;
+				tomoyo_parse_policy(&head, start);
+			);
 			start = end + 1;
 		}
 	}
diff --git a/security/tomoyo/common.h b/security/tomoyo/common.h
index 0e8e2e959aef..2ff05653743c 100644
--- a/security/tomoyo/common.h
+++ b/security/tomoyo/common.h
@@ -827,13 +827,13 @@ struct tomoyo_io_buffer {
 		bool is_delete;
 	} w;
 	/* Buffer for reading.                  */
-	char *read_buf;
+	char *read_buf		__guarded_by(&io_sem);
 	/* Size of read buffer.                 */
-	size_t readbuf_size;
+	size_t readbuf_size	__guarded_by(&io_sem);
 	/* Buffer for writing.                  */
-	char *write_buf;
+	char *write_buf		__guarded_by(&io_sem);
 	/* Size of write buffer.                */
-	size_t writebuf_size;
+	size_t writebuf_size	__guarded_by(&io_sem);
 	/* Type of this interface.              */
 	enum tomoyo_securityfs_interface_index type;
 	/* Users counter protected by tomoyo_io_buffer_list_lock. */
@@ -922,6 +922,35 @@ struct tomoyo_task {
 	struct tomoyo_domain_info *old_domain_info;
 };
 
+/********** External variable definitions. **********/
+
+extern bool tomoyo_policy_loaded;
+extern int tomoyo_enabled;
+extern const char * const tomoyo_condition_keyword
+[TOMOYO_MAX_CONDITION_KEYWORD];
+extern const char * const tomoyo_dif[TOMOYO_MAX_DOMAIN_INFO_FLAGS];
+extern const char * const tomoyo_mac_keywords[TOMOYO_MAX_MAC_INDEX
+					      + TOMOYO_MAX_MAC_CATEGORY_INDEX];
+extern const char * const tomoyo_mode[TOMOYO_CONFIG_MAX_MODE];
+extern const char * const tomoyo_path_keyword[TOMOYO_MAX_PATH_OPERATION];
+extern const char * const tomoyo_proto_keyword[TOMOYO_SOCK_MAX];
+extern const char * const tomoyo_socket_keyword[TOMOYO_MAX_NETWORK_OPERATION];
+extern const u8 tomoyo_index2category[TOMOYO_MAX_MAC_INDEX];
+extern const u8 tomoyo_pn2mac[TOMOYO_MAX_PATH_NUMBER_OPERATION];
+extern const u8 tomoyo_pnnn2mac[TOMOYO_MAX_MKDEV_OPERATION];
+extern const u8 tomoyo_pp2mac[TOMOYO_MAX_PATH2_OPERATION];
+extern struct list_head tomoyo_condition_list;
+extern struct list_head tomoyo_domain_list;
+extern struct list_head tomoyo_name_list[TOMOYO_MAX_HASH];
+extern struct list_head tomoyo_namespace_list;
+extern struct mutex tomoyo_policy_lock;
+extern struct srcu_struct tomoyo_ss;
+extern struct tomoyo_domain_info tomoyo_kernel_domain;
+extern struct tomoyo_policy_namespace tomoyo_kernel_namespace;
+extern unsigned int tomoyo_memory_quota[TOMOYO_MAX_MEMORY_STAT];
+extern unsigned int tomoyo_memory_used[TOMOYO_MAX_MEMORY_STAT];
+extern struct lsm_blob_sizes tomoyo_blob_sizes;
+
 /********** Function prototypes. **********/
 
 bool tomoyo_address_matches_group(const bool is_ipv6, const __be32 *address,
@@ -969,10 +998,10 @@ const struct tomoyo_path_info *tomoyo_path_matches_group
 int tomoyo_check_open_permission(struct tomoyo_domain_info *domain,
 				 const struct path *path, const int flag);
 void tomoyo_close_control(struct tomoyo_io_buffer *head);
-int tomoyo_env_perm(struct tomoyo_request_info *r, const char *env);
+int tomoyo_env_perm(struct tomoyo_request_info *r, const char *env) __must_hold_shared(&tomoyo_ss);
 int tomoyo_execute_permission(struct tomoyo_request_info *r,
-			      const struct tomoyo_path_info *filename);
-int tomoyo_find_next_domain(struct linux_binprm *bprm);
+			      const struct tomoyo_path_info *filename) __must_hold_shared(&tomoyo_ss);
+int tomoyo_find_next_domain(struct linux_binprm *bprm) __must_hold_shared(&tomoyo_ss);
 int tomoyo_get_mode(const struct tomoyo_policy_namespace *ns, const u8 profile,
 		    const u8 index);
 int tomoyo_init_request_info(struct tomoyo_request_info *r,
@@ -1000,6 +1029,7 @@ int tomoyo_socket_listen_permission(struct socket *sock);
 int tomoyo_socket_sendmsg_permission(struct socket *sock, struct msghdr *msg,
 				     int size);
 int tomoyo_supervisor(struct tomoyo_request_info *r, const char *fmt, ...)
+	__must_hold_shared(&tomoyo_ss)
 	__printf(2, 3);
 int tomoyo_update_domain(struct tomoyo_acl_info *new_entry, const int size,
 			 struct tomoyo_acl_param *param,
@@ -1059,7 +1089,7 @@ void tomoyo_print_ulong(char *buffer, const int buffer_len,
 			const unsigned long value, const u8 type);
 void tomoyo_put_name_union(struct tomoyo_name_union *ptr);
 void tomoyo_put_number_union(struct tomoyo_number_union *ptr);
-void tomoyo_read_log(struct tomoyo_io_buffer *head);
+void tomoyo_read_log(struct tomoyo_io_buffer *head) __must_hold(&head->io_sem);
 void tomoyo_update_stat(const u8 index);
 void tomoyo_warn_oom(const char *function);
 void tomoyo_write_log(struct tomoyo_request_info *r, const char *fmt, ...)
@@ -1067,35 +1097,6 @@ void tomoyo_write_log(struct tomoyo_request_info *r, const char *fmt, ...)
 void tomoyo_write_log2(struct tomoyo_request_info *r, int len, const char *fmt,
 		       va_list args) __printf(3, 0);
 
-/********** External variable definitions. **********/
-
-extern bool tomoyo_policy_loaded;
-extern int tomoyo_enabled;
-extern const char * const tomoyo_condition_keyword
-[TOMOYO_MAX_CONDITION_KEYWORD];
-extern const char * const tomoyo_dif[TOMOYO_MAX_DOMAIN_INFO_FLAGS];
-extern const char * const tomoyo_mac_keywords[TOMOYO_MAX_MAC_INDEX
-					      + TOMOYO_MAX_MAC_CATEGORY_INDEX];
-extern const char * const tomoyo_mode[TOMOYO_CONFIG_MAX_MODE];
-extern const char * const tomoyo_path_keyword[TOMOYO_MAX_PATH_OPERATION];
-extern const char * const tomoyo_proto_keyword[TOMOYO_SOCK_MAX];
-extern const char * const tomoyo_socket_keyword[TOMOYO_MAX_NETWORK_OPERATION];
-extern const u8 tomoyo_index2category[TOMOYO_MAX_MAC_INDEX];
-extern const u8 tomoyo_pn2mac[TOMOYO_MAX_PATH_NUMBER_OPERATION];
-extern const u8 tomoyo_pnnn2mac[TOMOYO_MAX_MKDEV_OPERATION];
-extern const u8 tomoyo_pp2mac[TOMOYO_MAX_PATH2_OPERATION];
-extern struct list_head tomoyo_condition_list;
-extern struct list_head tomoyo_domain_list;
-extern struct list_head tomoyo_name_list[TOMOYO_MAX_HASH];
-extern struct list_head tomoyo_namespace_list;
-extern struct mutex tomoyo_policy_lock;
-extern struct srcu_struct tomoyo_ss;
-extern struct tomoyo_domain_info tomoyo_kernel_domain;
-extern struct tomoyo_policy_namespace tomoyo_kernel_namespace;
-extern unsigned int tomoyo_memory_quota[TOMOYO_MAX_MEMORY_STAT];
-extern unsigned int tomoyo_memory_used[TOMOYO_MAX_MEMORY_STAT];
-extern struct lsm_blob_sizes tomoyo_blob_sizes;
-
 /********** Inlined functions. **********/
 
 /**
@@ -1104,6 +1105,7 @@ extern struct lsm_blob_sizes tomoyo_blob_sizes;
  * Returns index number for tomoyo_read_unlock().
  */
 static inline int tomoyo_read_lock(void)
+	__acquires_shared(&tomoyo_ss)
 {
 	return srcu_read_lock(&tomoyo_ss);
 }
@@ -1116,6 +1118,7 @@ static inline int tomoyo_read_lock(void)
  * Returns nothing.
  */
 static inline void tomoyo_read_unlock(int idx)
+	__releases_shared(&tomoyo_ss)
 {
 	srcu_read_unlock(&tomoyo_ss, idx);
 }
diff --git a/security/tomoyo/domain.c b/security/tomoyo/domain.c
index 5f9ccab26e9a..5b7989ad85bf 100644
--- a/security/tomoyo/domain.c
+++ b/security/tomoyo/domain.c
@@ -611,6 +611,7 @@ struct tomoyo_domain_info *tomoyo_assign_domain(const char *domainname,
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_environ(struct tomoyo_execve *ee)
+	__must_hold_shared(&tomoyo_ss)
 {
 	struct tomoyo_request_info *r = &ee->r;
 	struct linux_binprm *bprm = ee->bprm;
diff --git a/security/tomoyo/environ.c b/security/tomoyo/environ.c
index 7f0a471f19b2..bcb05910facc 100644
--- a/security/tomoyo/environ.c
+++ b/security/tomoyo/environ.c
@@ -32,6 +32,7 @@ static bool tomoyo_check_env_acl(struct tomoyo_request_info *r,
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_audit_env_log(struct tomoyo_request_info *r)
+	__must_hold_shared(&tomoyo_ss)
 {
 	return tomoyo_supervisor(r, "misc env %s\n",
 				 r->param.environ.name->name);
diff --git a/security/tomoyo/file.c b/security/tomoyo/file.c
index 8f3b90b6e03d..e9b67dbb38e7 100644
--- a/security/tomoyo/file.c
+++ b/security/tomoyo/file.c
@@ -164,6 +164,7 @@ static bool tomoyo_get_realpath(struct tomoyo_path_info *buf, const struct path
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_audit_path_log(struct tomoyo_request_info *r)
+	__must_hold_shared(&tomoyo_ss)
 {
 	return tomoyo_supervisor(r, "file %s %s\n", tomoyo_path_keyword
 				 [r->param.path.operation],
@@ -178,6 +179,7 @@ static int tomoyo_audit_path_log(struct tomoyo_request_info *r)
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_audit_path2_log(struct tomoyo_request_info *r)
+	__must_hold_shared(&tomoyo_ss)
 {
 	return tomoyo_supervisor(r, "file %s %s %s\n", tomoyo_mac_keywords
 				 [tomoyo_pp2mac[r->param.path2.operation]],
@@ -193,6 +195,7 @@ static int tomoyo_audit_path2_log(struct tomoyo_request_info *r)
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_audit_mkdev_log(struct tomoyo_request_info *r)
+	__must_hold_shared(&tomoyo_ss)
 {
 	return tomoyo_supervisor(r, "file %s %s 0%o %u %u\n",
 				 tomoyo_mac_keywords
@@ -210,6 +213,7 @@ static int tomoyo_audit_mkdev_log(struct tomoyo_request_info *r)
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_audit_path_number_log(struct tomoyo_request_info *r)
+	__must_hold_shared(&tomoyo_ss)
 {
 	const u8 type = r->param.path_number.operation;
 	u8 radix;
@@ -572,6 +576,7 @@ static int tomoyo_update_path2_acl(const u8 perm,
  */
 static int tomoyo_path_permission(struct tomoyo_request_info *r, u8 operation,
 				  const struct tomoyo_path_info *filename)
+	__must_hold_shared(&tomoyo_ss)
 {
 	int error;
 
diff --git a/security/tomoyo/gc.c b/security/tomoyo/gc.c
index 026e29ea3796..34912f120854 100644
--- a/security/tomoyo/gc.c
+++ b/security/tomoyo/gc.c
@@ -23,11 +23,10 @@ static inline void tomoyo_memory_free(void *ptr)
 	tomoyo_memory_used[TOMOYO_MEMORY_POLICY] -= ksize(ptr);
 	kfree(ptr);
 }
-
-/* The list for "struct tomoyo_io_buffer". */
-static LIST_HEAD(tomoyo_io_buffer_list);
 /* Lock for protecting tomoyo_io_buffer_list. */
 static DEFINE_SPINLOCK(tomoyo_io_buffer_list_lock);
+/* The list for "struct tomoyo_io_buffer". */
+static __guarded_by(&tomoyo_io_buffer_list_lock) LIST_HEAD(tomoyo_io_buffer_list);
 
 /**
  * tomoyo_struct_used_by_io_buffer - Check whether the list element is used by /sys/kernel/security/tomoyo/ users or not.
@@ -385,6 +384,7 @@ static inline void tomoyo_del_number_group(struct list_head *element)
  */
 static void tomoyo_try_to_gc(const enum tomoyo_policy_id type,
 			     struct list_head *element)
+	__must_hold(&tomoyo_policy_lock)
 {
 	/*
 	 * __list_del_entry() guarantees that the list element became no longer
@@ -484,6 +484,7 @@ static void tomoyo_try_to_gc(const enum tomoyo_policy_id type,
  */
 static void tomoyo_collect_member(const enum tomoyo_policy_id id,
 				  struct list_head *member_list)
+	__must_hold(&tomoyo_policy_lock)
 {
 	struct tomoyo_acl_head *member;
 	struct tomoyo_acl_head *tmp;
@@ -504,6 +505,7 @@ static void tomoyo_collect_member(const enum tomoyo_policy_id id,
  * Returns nothing.
  */
 static void tomoyo_collect_acl(struct list_head *list)
+	__must_hold(&tomoyo_policy_lock)
 {
 	struct tomoyo_acl_info *acl;
 	struct tomoyo_acl_info *tmp;
@@ -627,8 +629,11 @@ static int tomoyo_gc_thread(void *unused)
 			if (head->users)
 				continue;
 			list_del(&head->list);
-			kfree(head->read_buf);
-			kfree(head->write_buf);
+			/* Safe destruction because no users are left. */
+			capability_unsafe(
+				kfree(head->read_buf);
+				kfree(head->write_buf);
+			);
 			kfree(head);
 		}
 		spin_unlock(&tomoyo_io_buffer_list_lock);
@@ -656,11 +661,18 @@ void tomoyo_notify_gc(struct tomoyo_io_buffer *head, const bool is_register)
 		head->users = 1;
 		list_add(&head->list, &tomoyo_io_buffer_list);
 	} else {
-		is_write = head->write_buf != NULL;
+		/*
+		 * tomoyo_write_control() can concurrently update write_buf from
+		 * a non-NULL to new non-NULL pointer with io_sem held.
+		 */
+		is_write = data_race(head->write_buf != NULL);
 		if (!--head->users) {
 			list_del(&head->list);
-			kfree(head->read_buf);
-			kfree(head->write_buf);
+			/* Safe destruction because no users are left. */
+			capability_unsafe(
+				kfree(head->read_buf);
+				kfree(head->write_buf);
+			);
 			kfree(head);
 		}
 	}
diff --git a/security/tomoyo/mount.c b/security/tomoyo/mount.c
index 2755971f50df..322dfd188ada 100644
--- a/security/tomoyo/mount.c
+++ b/security/tomoyo/mount.c
@@ -28,6 +28,7 @@ static const char * const tomoyo_mounts[TOMOYO_MAX_SPECIAL_MOUNT] = {
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_audit_mount_log(struct tomoyo_request_info *r)
+	__must_hold_shared(&tomoyo_ss)
 {
 	return tomoyo_supervisor(r, "file mount %s %s %s 0x%lX\n",
 				 r->param.mount.dev->name,
@@ -78,6 +79,7 @@ static int tomoyo_mount_acl(struct tomoyo_request_info *r,
 			    const char *dev_name,
 			    const struct path *dir, const char *type,
 			    unsigned long flags)
+	__must_hold_shared(&tomoyo_ss)
 {
 	struct tomoyo_obj_info obj = { };
 	struct path path;
diff --git a/security/tomoyo/network.c b/security/tomoyo/network.c
index 8dc61335f65e..cfc2a019de1e 100644
--- a/security/tomoyo/network.c
+++ b/security/tomoyo/network.c
@@ -363,6 +363,7 @@ int tomoyo_write_unix_network(struct tomoyo_acl_param *param)
 static int tomoyo_audit_net_log(struct tomoyo_request_info *r,
 				const char *family, const u8 protocol,
 				const u8 operation, const char *address)
+	__must_hold_shared(&tomoyo_ss)
 {
 	return tomoyo_supervisor(r, "network %s %s %s %s\n", family,
 				 tomoyo_proto_keyword[protocol],
@@ -377,6 +378,7 @@ static int tomoyo_audit_net_log(struct tomoyo_request_info *r,
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_audit_inet_log(struct tomoyo_request_info *r)
+	__must_hold_shared(&tomoyo_ss)
 {
 	char buf[128];
 	int len;
@@ -402,6 +404,7 @@ static int tomoyo_audit_inet_log(struct tomoyo_request_info *r)
  * Returns 0 on success, negative value otherwise.
  */
 static int tomoyo_audit_unix_log(struct tomoyo_request_info *r)
+	__must_hold_shared(&tomoyo_ss)
 {
 	return tomoyo_audit_net_log(r, "unix", r->param.unix_network.protocol,
 				    r->param.unix_network.operation,
-- 
2.51.0.384.g4c02a37b29-goog


