Return-Path: <linux-kbuild+bounces-13402-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOR3NjNNGWrzuQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13402-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 10:24:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D7B5FF1F4
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 10:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D98BA3028B07
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 08:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB382DEA89;
	Fri, 29 May 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NcPohvVm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B62338593
	for <linux-kbuild@vger.kernel.org>; Fri, 29 May 2026 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042974; cv=none; b=hDfWKSsD5ZRIWRkfgbrP5U+47d6Bf3nYUsAVw8BcwGOj7b7v3iQYwJgt1XkIqMMylLMrwp6acYBV+xmrwY1uynSaS20KoB4ibouMiKbSDaTKjPqX8lTWwdlrv1HF997gx2fanAK9KpsfpxWG892SykFKFnC24/dPjWBJdSw7NGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042974; c=relaxed/simple;
	bh=c3oVVD6kZvlrKQRQvI7PdW/g+oWg8omgZYlotFsXuOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aI2QfnAuI34qZnLSs2E0pFpxZzpWyp2BRfEgpwbTE8TqXKEQDkhSyXPesmCmEuU/VAetWdkvE6niRN+ov5omXTFu4RQv38i9eCT7QwwwP/KjYS2Jkb5sHRaSEuTEHphrdSByVS7SJH4OxahAopCIgCHG0UN414v6OFbm0GjEsBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NcPohvVm; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780042970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H8yeksQo1mEg5JLCpBGlOlGyi2qg/6Wyyghbci5eAvc=;
	b=NcPohvVmzk2HHJgvfc8glbnO6ktN4D6mVn38+H5vyN2PwuVzEvBsnRs6mEQtRNM7PcLozE
	37yxPaXALzSgEn9R3ht1K0cpKG5dh4K6HaYp/EWbmzzcPMgG79qnfbj8UXzaXhaz7pE2AQ
	HpAjKxT7/Ts7zLYLon3Yf8T7oVuATOU=
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: nsc@kernel.org,
	nathan@kernel.org
Cc: paulmck@kernel.org,
	andriy.shevchenko@linux.intel.com,
	akpm@linux-foundation.org,
	dhowells@redhat.com,
	rdunlap@infradead.org,
	luca.ceresoli@bootlin.com,
	chengkaitao@kylinos.cn,
	acme@redhat.com,
	irogers@google.com,
	peterz@infradead.org,
	namhyung@kernel.org,
	swapnil.sapkal@amd.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] list: Add safe entry iterators without an explicit n cursor
Date: Fri, 29 May 2026 16:21:49 +0800
Message-ID: <20260529082149.76764-1-kaitao.cheng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13402-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kaitao.cheng@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[17];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,kylinos.cn:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 33D7B5FF1F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Kaitao Cheng <chengkaitao@kylinos.cn>

The list_for_each_entry_safe*() helpers are useful for loops which may
remove the current entry, but they require callers to provide a second
cursor named by convention as n. Some users do not need to inspect or
reset that cursor; they only need the iterator to keep the next entry
available while the current entry may be removed.

Add entry iterators which hide that temporary next cursor while otherwise
following the traversal pattern of the corresponding
list_for_each_entry_safe*() helpers.

Do not fold this behavior into list_for_each_entry(). That iterator
advances from pos after the loop body, and a few existing callers rely
on that semantics to observe list changes made during the body. For
example, stress_reorder_work() in kernel/locking/test-ww_mutex.c moves
the current entry to the list head with list_move(&ll->link, &locks) and
documents that this restarts iteration. If list_for_each_entry() cached
the next entry before running the body, the loop would continue from the
stale saved next entry instead of honoring the modified list order.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 include/linux/list.h       | 60 ++++++++++++++++++++++++++++++++++++++
 scripts/include/list.h     | 13 +++++++++
 tools/include/linux/list.h | 60 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)

diff --git a/include/linux/list.h b/include/linux/list.h
index 09d979976b3b..d3597da3e952 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -908,6 +908,19 @@ static inline size_t list_count_nodes(struct list_head *head)
 	     !list_entry_is_head(pos, head, member); 			\
 	     pos = n, n = list_next_entry(n, member))
 
+/**
+ * list_for_each_entry_mutable - iterate over list of given type safe against
+ * removal of list entry
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_mutable(pos, head, member)			\
+	for (typeof(pos) __temp__ = list_next_entry(pos =		\
+	     list_first_entry(head, typeof(*pos), member), member);	\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = __temp__, __temp__ = list_next_entry(__temp__, member))
+
 /**
  * list_for_each_entry_safe_continue - continue list iteration safe against removal
  * @pos:	the type * to use as a loop cursor.
@@ -924,6 +937,22 @@ static inline size_t list_count_nodes(struct list_head *head)
 	     !list_entry_is_head(pos, head, member);				\
 	     pos = n, n = list_next_entry(n, member))
 
+/**
+ * list_for_each_entry_mutable_continue - continue list iteration safe against
+ * removal of list entry
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing after current point,
+ * safe against removal of list entry.
+ */
+#define list_for_each_entry_mutable_continue(pos, head, member)		\
+	for (typeof(pos) __temp__ = list_next_entry(pos =		\
+	     list_next_entry(pos, member), member);			\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = __temp__, __temp__ = list_next_entry(__temp__, member))
+
 /**
  * list_for_each_entry_safe_from - iterate over list from current point safe against removal
  * @pos:	the type * to use as a loop cursor.
@@ -939,6 +968,21 @@ static inline size_t list_count_nodes(struct list_head *head)
 	     !list_entry_is_head(pos, head, member);				\
 	     pos = n, n = list_next_entry(n, member))
 
+/**
+ * list_for_each_entry_mutable_from - iterate over list from current point safe
+ * against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type from current point, safe against
+ * removal of list entry.
+ */
+#define list_for_each_entry_mutable_from(pos, head, member)		\
+	for (typeof(pos) __temp__ = list_next_entry(pos, member);	\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = __temp__, __temp__ = list_next_entry(__temp__, member))
+
 /**
  * list_for_each_entry_safe_reverse - iterate backwards over list safe against removal
  * @pos:	the type * to use as a loop cursor.
@@ -955,6 +999,22 @@ static inline size_t list_count_nodes(struct list_head *head)
 	     !list_entry_is_head(pos, head, member); 			\
 	     pos = n, n = list_prev_entry(n, member))
 
+/**
+ * list_for_each_entry_mutable_reverse - iterate backwards over list safe against
+ * removal
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate backwards over list of given type, safe against removal
+ * of list entry.
+ */
+#define list_for_each_entry_mutable_reverse(pos, head, member)		\
+	for (typeof(pos) __temp__ = list_prev_entry(pos =		\
+	     list_last_entry(head, typeof(*pos), member), member);	\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = __temp__, __temp__ = list_prev_entry(__temp__, member))
+
 /**
  * list_safe_reset_next - reset a stale list_for_each_entry_safe loop
  * @pos:	the loop cursor used in the list_for_each_entry_safe loop
diff --git a/scripts/include/list.h b/scripts/include/list.h
index 8bdcaadca709..ab84e3f70793 100644
--- a/scripts/include/list.h
+++ b/scripts/include/list.h
@@ -286,6 +286,19 @@ static inline int list_empty(const struct list_head *head)
 	     !list_entry_is_head(pos, head, member);			\
 	     pos = list_next_entry(pos, member))
 
+/**
+ * list_for_each_entry_mutable - iterate over list of given type safe against
+ * removal of list entry
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_mutable(pos, head, member)			\
+	for (typeof(pos) __temp__ = list_next_entry(pos =		\
+	     list_first_entry(head, typeof(*pos), member), member);	\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = __temp__, __temp__ = list_next_entry(__temp__, member))
+
 /**
  * list_for_each_entry_reverse - iterate backwards over list of given type.
  * @pos:	the type * to use as a loop cursor.
diff --git a/tools/include/linux/list.h b/tools/include/linux/list.h
index a692ff7aed5c..8aa394832aba 100644
--- a/tools/include/linux/list.h
+++ b/tools/include/linux/list.h
@@ -544,6 +544,19 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     &pos->member != (head); 					\
 	     pos = n, n = list_next_entry(n, member))
 
+/**
+ * list_for_each_entry_mutable - iterate over list of given type safe against
+ * removal of list entry
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_mutable(pos, head, member)			\
+	for (typeof(pos) __temp__ = list_next_entry(pos =		\
+	     list_first_entry(head, typeof(*pos), member), member);	\
+	     &pos->member != (head);					\
+	     pos = __temp__, __temp__ = list_next_entry(__temp__, member))
+
 /**
  * list_for_each_entry_safe_continue - continue list iteration safe against removal
  * @pos:	the type * to use as a loop cursor.
@@ -560,6 +573,22 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     &pos->member != (head);						\
 	     pos = n, n = list_next_entry(n, member))
 
+/**
+ * list_for_each_entry_mutable_continue - continue list iteration safe against
+ * removal of list entry
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing after current point,
+ * safe against removal of list entry.
+ */
+#define list_for_each_entry_mutable_continue(pos, head, member)		\
+	for (typeof(pos) __temp__ = list_next_entry(pos =		\
+	     list_next_entry(pos, member), member);			\
+	     &pos->member != (head);					\
+	     pos = __temp__, __temp__ = list_next_entry(__temp__, member))
+
 /**
  * list_for_each_entry_safe_from - iterate over list from current point safe against removal
  * @pos:	the type * to use as a loop cursor.
@@ -575,6 +604,21 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     &pos->member != (head);						\
 	     pos = n, n = list_next_entry(n, member))
 
+/**
+ * list_for_each_entry_mutable_from - iterate over list from current point safe
+ * against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type from current point, safe against
+ * removal of list entry.
+ */
+#define list_for_each_entry_mutable_from(pos, head, member)		\
+	for (typeof(pos) __temp__ = list_next_entry(pos, member);	\
+	     &pos->member != (head);					\
+	     pos = __temp__, __temp__ = list_next_entry(__temp__, member))
+
 /**
  * list_for_each_entry_safe_reverse - iterate backwards over list safe against removal
  * @pos:	the type * to use as a loop cursor.
@@ -591,6 +635,22 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     &pos->member != (head); 					\
 	     pos = n, n = list_prev_entry(n, member))
 
+/**
+ * list_for_each_entry_mutable_reverse - iterate backwards over list safe
+ * against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate backwards over list of given type, safe against removal
+ * of list entry.
+ */
+#define list_for_each_entry_mutable_reverse(pos, head, member)		\
+	for (typeof(pos) __temp__ = list_prev_entry(pos =		\
+	     list_last_entry(head, typeof(*pos), member), member);	\
+	     &pos->member != (head);					\
+	     pos = __temp__, __temp__ = list_prev_entry(__temp__, member))
+
 /**
  * list_safe_reset_next - reset a stale list_for_each_entry_safe loop
  * @pos:	the loop cursor used in the list_for_each_entry_safe loop
-- 
2.50.1 (Apple Git-155)


