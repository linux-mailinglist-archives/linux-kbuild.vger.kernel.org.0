Return-Path: <linux-kbuild+bounces-3384-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411696CB6A
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 01:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2CAD1F24A4F
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 23:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537DF17BEA7;
	Wed,  4 Sep 2024 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTDgAQxG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1DA13A869;
	Wed,  4 Sep 2024 23:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725494111; cv=none; b=ftwg5snFps17OnJASIBaBuiu6/1lyr01qCVo+ZIDSUzSwyfR5m6xzJWz3po/B/s6Arza9jcFfz2AJBjQ86PKsSURnDTeIZlzOg/90VUZZx7pQIZFtVcs5C7FNGduiaA4f65VHBoA9V/tKCwddg0CRGNohVccwbCkHZr8JvLgaFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725494111; c=relaxed/simple;
	bh=BIWiOj1H+ZFwiF+oFVkGfvnA5zqOFWrWZxN3DAtfo4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o76mZefQXQlsq0N5Geaf3MC8i3LMZlHvFr8yU8PxQ8iHm6NtLJib+fNG5CThto++T8Wd9EoUfAukRAmBL1L0he/MtkkeODxxUwQof38HTD+6XsZjxSX7NEhQFJxOQfeGNLI/wjms5Cyw7KYBH137+NhHC3VHcFznrsz60oR4/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTDgAQxG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59F8C4CEC2;
	Wed,  4 Sep 2024 23:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725494109;
	bh=BIWiOj1H+ZFwiF+oFVkGfvnA5zqOFWrWZxN3DAtfo4s=;
	h=From:To:Cc:Subject:Date:From;
	b=bTDgAQxGrLUlfvPfnnHOYpaQ4jd7W6Bqmvlslpku6VlDY+cWYaW03lQAmW6emT6vx
	 MCQVuNe775esyAkI2A2uU6lC/ATBFQOWI9itWs5hnjXx4OmC1uF6QArVkRTgJYEEe1
	 hAbuU+i87dQXrr5lmop5qiKoAK8sBeqwkBdUCoVOGfCfIT44Lyo6MlWVQbIICRIgng
	 nrWGEY7iaEoCq0Gl4vhAUVkfKRFbsDNOGZbXTneKGHnPQsorGUhfYcxOqy23VFrDZI
	 AnuwRY7xs3I3W2HlLQQ+fm4Vx52I+CKdzHEBnfSCIOoVEvtjCH6popLRGgVZMqJWI6
	 gCuM3gncjOjxw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] scripts: import more hash table macros
Date: Thu,  5 Sep 2024 08:54:48 +0900
Message-ID: <20240904235500.700432-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add more macros used for removing hash table entries.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

A potential user is gendwarfksyms

 scripts/include/hashtable.h | 50 +++++++++++++++++++++++++++
 scripts/include/list.h      | 69 +++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/scripts/include/hashtable.h b/scripts/include/hashtable.h
index a0a2c8f5f639..45abcb12bfce 100644
--- a/scripts/include/hashtable.h
+++ b/scripts/include/hashtable.h
@@ -15,6 +15,23 @@
 
 #define hash_head(table, key)		(&(table)[(key) % HASH_SIZE(table)])
 
+static inline void __hash_init(struct hlist_head *ht, unsigned int sz)
+{
+	unsigned int i;
+
+	for (i = 0; i < sz; i++)
+		INIT_HLIST_HEAD(&ht[i]);
+}
+
+/**
+ * hash_init - initialize a hash table
+ * @table: hashtable to be initialized
+ *
+ * This has to be a macro since HASH_SIZE() will not work on pointers since
+ * it calculates the size during preprocessing.
+ */
+#define hash_init(table) __hash_init(table, HASH_SIZE(table))
+
 /**
  * hash_add - add an object to a hashtable
  * @table: hashtable to add to
@@ -24,6 +41,15 @@
 #define hash_add(table, node, key)						\
 	hlist_add_head(node, hash_head(table, key))
 
+/**
+ * hash_del - remove an object from a hashtable
+ * @node: &struct hlist_node of the object to remove
+ */
+static inline void hash_del(struct hlist_node *node)
+{
+	hlist_del_init(node);
+}
+
 /**
  * hash_for_each - iterate over a hashtable
  * @table: hashtable to iterate
@@ -34,6 +60,18 @@
 	for (int _bkt = 0; _bkt < HASH_SIZE(table); _bkt++)		\
 		hlist_for_each_entry(obj, &table[_bkt], member)
 
+/**
+ * hash_for_each_safe - iterate over a hashtable safe against removal of
+ * hash entry
+ * @table: hashtable to iterate
+ * @obj: the type * to use as a loop cursor for each entry
+ * @tmp: a &struct hlist_node used for temporary storage
+ * @member: the name of the hlist_node within the struct
+ */
+#define hash_for_each_safe(table, obj, tmp, member)			\
+	for (int _bkt = 0; _bkt < HASH_SIZE(table); _bkt++)		\
+		hlist_for_each_entry_safe(obj, tmp, &table[_bkt], member)
+
 /**
  * hash_for_each_possible - iterate over all possible objects hashing to the
  * same bucket
@@ -45,4 +83,16 @@
 #define hash_for_each_possible(table, obj, member, key)			\
 	hlist_for_each_entry(obj, hash_head(table, key), member)
 
+/**
+ * hash_for_each_possible_safe - iterate over all possible objects hashing to the
+ * same bucket safe against removals
+ * @table: hashtable to iterate
+ * @obj: the type * to use as a loop cursor for each entry
+ * @tmp: a &struct hlist_node used for temporary storage
+ * @member: the name of the hlist_node within the struct
+ * @key: the key of the objects to iterate over
+ */
+#define hash_for_each_possible_safe(table, obj, tmp, member, key)	\
+	hlist_for_each_entry_safe(obj, tmp, hash_head(table, key), member)
+
 #endif /* HASHTABLE_H */
diff --git a/scripts/include/list.h b/scripts/include/list.h
index 409201cd495b..fea1e2b79063 100644
--- a/scripts/include/list.h
+++ b/scripts/include/list.h
@@ -268,6 +268,63 @@ static inline int list_empty(const struct list_head *head)
  */
 
 #define HLIST_HEAD_INIT { .first = NULL }
+#define INIT_HLIST_HEAD(ptr) ((ptr)->first = NULL)
+static inline void INIT_HLIST_NODE(struct hlist_node *h)
+{
+	h->next = NULL;
+	h->pprev = NULL;
+}
+
+/**
+ * hlist_unhashed - Has node been removed from list and reinitialized?
+ * @h: Node to be checked
+ *
+ * Not that not all removal functions will leave a node in unhashed
+ * state.  For example, hlist_nulls_del_init_rcu() does leave the
+ * node in unhashed state, but hlist_nulls_del() does not.
+ */
+static inline int hlist_unhashed(const struct hlist_node *h)
+{
+	return !h->pprev;
+}
+
+static inline void __hlist_del(struct hlist_node *n)
+{
+	struct hlist_node *next = n->next;
+	struct hlist_node **pprev = n->pprev;
+
+	*pprev = next;
+	if (next)
+		next->pprev = pprev;
+}
+
+/**
+ * hlist_del - Delete the specified hlist_node from its list
+ * @n: Node to delete.
+ *
+ * Note that this function leaves the node in hashed state.  Use
+ * hlist_del_init() or similar instead to unhash @n.
+ */
+static inline void hlist_del(struct hlist_node *n)
+{
+	__hlist_del(n);
+	n->next = LIST_POISON1;
+	n->pprev = LIST_POISON2;
+}
+
+/**
+ * hlist_del_init - Delete the specified hlist_node from its list and initialize
+ * @n: Node to delete.
+ *
+ * Note that this function leaves the node in unhashed state.
+ */
+static inline void hlist_del_init(struct hlist_node *n)
+{
+	if (!hlist_unhashed(n)) {
+		__hlist_del(n);
+		INIT_HLIST_NODE(n);
+	}
+}
 
 /**
  * hlist_add_head - add a new entry at the beginning of the hlist
@@ -306,4 +363,16 @@ static inline void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
 	     pos;							\
 	     pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
 
+/**
+ * hlist_for_each_entry_safe - iterate over list of given type safe against removal of list entry
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		a &struct hlist_node to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the hlist_node within the struct.
+ */
+#define hlist_for_each_entry_safe(pos, n, head, member) 		\
+	for (pos = hlist_entry_safe((head)->first, typeof(*pos), member);\
+	     pos && ({ n = pos->member.next; 1; });			\
+	     pos = hlist_entry_safe(n, typeof(*pos), member))
+
 #endif /* LIST_H */
-- 
2.43.0


