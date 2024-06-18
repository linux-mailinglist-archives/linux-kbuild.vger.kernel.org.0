Return-Path: <linux-kbuild+bounces-2176-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8AA90C986
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B89B01F2127F
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48E414E2C6;
	Tue, 18 Jun 2024 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1aB2qB+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733A1139D0C;
	Tue, 18 Jun 2024 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706948; cv=none; b=EBw4z55mmtYm8wb2BVBeWWHtWIhYbGzsB0M9UfGZycoORjGzMrkmcikMbcFY40Ck2SlqaWjmcL6cs8UKIAonKAlhSzaGuYG5wVXk3/gMabh5QifUBcoJMF6oHkkSjA+uZAR2lGMCKCOWMGCALkThxdqJIr0iCaBF+IVJ4QMbcHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706948; c=relaxed/simple;
	bh=cct31qT5EtxtPB03CrLKGfYhn4fytwzgxweQkJfmCrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQw4ZSgHb4m6wo0J/DBsTMRVI4g8Gd/vEBwGmHMoTKdEIdcyNTk7NMUcyAuBw+TGMcoh5Ohb6gy8RZ0TXVaCj0NSDpYktsmuC+jxfp6aSn75wPeESeNNp49FBbkjKc3yned+QgFnHT9QcvF5I5U6AWYg7rV+usZB/MaIvq6I/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1aB2qB+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023FAC3277B;
	Tue, 18 Jun 2024 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706947;
	bh=cct31qT5EtxtPB03CrLKGfYhn4fytwzgxweQkJfmCrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P1aB2qB+6Scdll16rdYMf4YXOOzD4xT6wAFVNPu84c6TNF80heJzjr2g2FJKjS5Jw
	 WZKB1jXLyLyqbccGsqVS293qoapYDH1gIGCzPlrgOr6GOnBkUD3RwdLHrjfLw4gyD6
	 MStFO2lqNukXc1Zl049uyJJE0QATEUD9EA6vtKbtWW4UpykyQZgLMnAtt6I08WUqDc
	 +NUsMMYzT9BXVOAti8VOnsydqXFCsCgNjPfGYOSIzFO8koyEfgbqs2O+GuSsJmjLFM
	 lJ60XV8gMC5U4206f9nb++1EAfG+v9Pj1yZkGAD+HceCUbkTxRJCutpYrQbINLycRj
	 Q5PuU8t6hirqw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 01/12] kconfig: import list_move(_tail) and list_for_each_entry_reverse macros
Date: Tue, 18 Jun 2024 19:35:20 +0900
Message-ID: <20240618103541.3508486-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618103541.3508486-1-masahiroy@kernel.org>
References: <20240618103541.3508486-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Import more macros from include/linux/list.h.

These will be used in the next commit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Import list_for_each_entry_reverse too

 scripts/kconfig/list.h | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/scripts/kconfig/list.h b/scripts/kconfig/list.h
index 882859ddf9f4..409201cd495b 100644
--- a/scripts/kconfig/list.h
+++ b/scripts/kconfig/list.h
@@ -127,6 +127,29 @@ static inline void list_del(struct list_head *entry)
 	entry->prev = LIST_POISON2;
 }
 
+/**
+ * list_move - delete from one list and add as another's head
+ * @list: the entry to move
+ * @head: the head that will precede our entry
+ */
+static inline void list_move(struct list_head *list, struct list_head *head)
+{
+	__list_del_entry(list);
+	list_add(list, head);
+}
+
+/**
+ * list_move_tail - delete from one list and add as another's tail
+ * @list: the entry to move
+ * @head: the head that will follow our entry
+ */
+static inline void list_move_tail(struct list_head *list,
+				  struct list_head *head)
+{
+	__list_del_entry(list);
+	list_add_tail(list, head);
+}
+
 /**
  * list_is_head - tests whether @list is the list @head
  * @list: the entry to test
@@ -166,6 +189,17 @@ static inline int list_empty(const struct list_head *head)
 #define list_first_entry(ptr, type, member) \
 	list_entry((ptr)->next, type, member)
 
+/**
+ * list_last_entry - get the last element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Note, that list is expected to be not empty.
+ */
+#define list_last_entry(ptr, type, member) \
+	list_entry((ptr)->prev, type, member)
+
 /**
  * list_next_entry - get the next element in list
  * @pos:	the type * to cursor
@@ -174,6 +208,14 @@ static inline int list_empty(const struct list_head *head)
 #define list_next_entry(pos, member) \
 	list_entry((pos)->member.next, typeof(*(pos)), member)
 
+/**
+ * list_prev_entry - get the prev element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_prev_entry(pos, member) \
+	list_entry((pos)->member.prev, typeof(*(pos)), member)
+
 /**
  * list_entry_is_head - test if the entry points to the head of the list
  * @pos:	the type * to cursor
@@ -194,6 +236,17 @@ static inline int list_empty(const struct list_head *head)
 	     !list_entry_is_head(pos, head, member);			\
 	     pos = list_next_entry(pos, member))
 
+/**
+ * list_for_each_entry_reverse - iterate backwards over list of given type.
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_reverse(pos, head, member)			\
+	for (pos = list_last_entry(head, typeof(*pos), member);		\
+	     !list_entry_is_head(pos, head, member); 			\
+	     pos = list_prev_entry(pos, member))
+
 /**
  * list_for_each_entry_safe - iterate over list of given type. Safe against removal of list entry
  * @pos:	the type * to use as a loop cursor.
-- 
2.43.0


