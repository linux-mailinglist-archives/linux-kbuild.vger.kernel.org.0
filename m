Return-Path: <linux-kbuild+bounces-3643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F9A97D312
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 10:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C30283231
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 08:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A67713B2A8;
	Fri, 20 Sep 2024 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f45deTzf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FF913AA4E;
	Fri, 20 Sep 2024 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726822611; cv=none; b=BuVE/pkF8UgioXR5iF3PlTT8vsbStAnjpjIj2rK7W7yU1l2Btg+E7nXrlr+jqXt8x/or/ttrDk8jJpIAubDotYNFzdIMh9bhDzax2CQxA05GdYTDHgyM9XJuopybuGLb1qzz01fE3dbVU0Nk3AT2ez9efx5EXikDYQ/v8Twf0KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726822611; c=relaxed/simple;
	bh=5BvIsrv/SYo12MNQp2fGXf9p61NAqzS/ebLIY4c714I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kGXE7bkDYO5+3l0xwKefOz4JPyhOP7gH7Ayr75yB57xD95YAGfbCu/T/tljix2O3X4MnUahiVAMVuafh6irHdurOoewb8Km5Ehg9APGHkNShxxU9wa2p42iYrcoblvtOQhqiYT7aw+cyUTx7jFjKq5WKgxUkmqF7R4tJOnCATSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f45deTzf; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso3090609e87.2;
        Fri, 20 Sep 2024 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726822607; x=1727427407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvBAAu8Benq3E7BygRhUhfDHzBHVGBUbyRnXkgCn8P8=;
        b=f45deTzfj7bagbZJ6qXUCoryMkTmrzA5/6ii1yOuH2VIRN88ZrVrh389NXP1X4d95M
         uMqTcjxfs+voJ267r3LgmCQxdkwTykSCLP8e1zrDjXmqkAjh8myEfouPBQiVjYs3T2yu
         HZPVjJLoBtAmIfMWOSqyHQvdaQUW/tRIOeQMDeZiO1vTe/NPXfJIXDPGR74mi3i+9YJX
         qI3b7LIEpQ4cKJTOOybv7BV1aUIjR/vtwRX2mw/XrAyRl2aq7KgW/+dSXvby3Y2PWU+p
         j8r3s7mfdm4u8E2Om20VgNqjYH3B5jv7OiNu/iC1SG/S5D1ACc1xdooBzwtwXXMs1k8w
         RAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726822607; x=1727427407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvBAAu8Benq3E7BygRhUhfDHzBHVGBUbyRnXkgCn8P8=;
        b=JtqI/uHVRjJ7NPTJs2nq4b9D5E2J/IrFImCo3ct68SpvQoyZdb309O4zxDeBLRgzpt
         QoG8JA6ZrXN8urNBEjL4XY4CXsFlbNhr8riuWruOvqRLWxcI7zxMeo3lQ3CtKSEUVi/i
         yIulbXnq13ibeWZ4RePQH+PuCNq2t83zO3sMOcfe8nbf0tWf+13q4TOcts4ccF1PQ7GK
         0NtrwZ/L3IQHMk5ysxOpfai7mvpdF0v5A7Bo062zOnXS/aLJs6ZSlBR4a1lKQ/6DTfvS
         WRXNiHqyPje0f6ZjrKqTjAauBG3pBXdspxQR9yAhlUc43ZArUfOe/wIv6uxAc37/YEVT
         5c/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8XyDnh/8/6oAUdZAbQlRyGFrihDbV2+yKdSz4wxnlCwcGX9DwFl/qJHw03O0fdZG5sXzFUKuNTyCoVwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMmcWUL2EVdCsCnPAaaJquCwpJxcl+ZkUgtcRcBELa1yx1KfbV
	CbVNV70LLP/QcBubE2eF+dHTCaR0lcEz6Cce1j4v9J9hgVUM1cTxHKK/MA==
X-Google-Smtp-Source: AGHT+IFnVKVosd4YHg+3YEFot/4uRKU9Gi186/8x6lrf4mVHCvvIZH8uzTapBg1xgXcsa4s1ZHXLdA==
X-Received: by 2002:a05:6512:3d0e:b0:535:6baa:8c5d with SMTP id 2adb3069b0e04-536ac2e5a42mr1630964e87.20.1726822607146;
        Fri, 20 Sep 2024 01:56:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:422c:48db:9094:2fa9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109637esm817861866b.40.2024.09.20.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:56:46 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Subject: [PATCH v5 02/11] kbuild: Add list_is_{first,last}, list_size, list_at_index, list_for_each_from
Date: Fri, 20 Sep 2024 10:56:19 +0200
Message-Id: <20240920085628.51863-3-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920085628.51863-1-ole0811sch@gmail.com>
References: <20240920085628.51863-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

list_is_first and list_is_last respectively check whether an entry is
the first or last entry of the list. list_size counts the number of
entries. list_at_index retrieves the entry at an index.
list_for_each_from iterates over a list from some entry to the end.

Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/include/list.h | 71 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/scripts/include/list.h b/scripts/include/list.h
index fea1e2b79063..f7aff1749a0b 100644
--- a/scripts/include/list.h
+++ b/scripts/include/list.h
@@ -169,6 +169,43 @@ static inline int list_empty(const struct list_head *head)
 	return head->next == head;
 }
 
+/**
+ * list_is_first - tests whether @list belongs to the first entry
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_first(const struct list_head *list,
+				const struct list_head *head)
+{
+	return list == head->next;
+}
+
+/**
+ * list_is_last - tests whether @list belongs to the last entry
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_last(const struct list_head *list,
+			       const struct list_head *head)
+{
+	return list == head->prev;
+}
+
+/**
+ * list_size - counts the number of entries in a list
+ * @head: the list whose entries are counted
+ */
+static inline size_t list_size(const struct list_head *head)
+{
+	size_t ret = 0;
+
+	for (struct list_head *curr = head->next; curr != head;
+	     curr = curr->next)
+		++ret;
+
+	return ret;
+}
+
 /**
  * list_entry - get the struct for this entry
  * @ptr:	the &struct list_head pointer.
@@ -260,6 +297,40 @@ static inline int list_empty(const struct list_head *head)
 	     !list_entry_is_head(pos, head, member);			\
 	     pos = n, n = list_next_entry(n, member))
 
+/**
+ * list_for_each_entry_from - iterate over list of given type starting at a given node
+ * @pos:	the type * to use as a loop cursor.
+ * @start:	the node to start iterating at
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_from(pos, start, head, member)  \
+	for (pos = list_entry(start, typeof(*pos), member); \
+	     !list_entry_is_head(pos, head, member);        \
+	     pos = list_next_entry(pos, member))
+
+/**
+ * list_at_index - retrieve the entry at index i in O(n)
+ * @i:		index of entry to retrieve.
+ * @head:	the head for your list.
+ * @type:	the type of the struct the entries are embedded in.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_at_index(i, head, type, member)               \
+	({                                                 \
+		type *__pos;                               \
+		size_t __counter = 0;                      \
+		list_for_each_entry(__pos, head, member) { \
+			if (__counter++ == i)              \
+				break;                     \
+			if (__pos->member.next == head) {  \
+				__pos = NULL;              \
+				break;                     \
+			}                                  \
+		}                                          \
+		__pos;                                     \
+	})
+
 /*
  * Double linked lists with a single pointer list head.
  * Mostly useful for hash tables where the two pointer list head is
-- 
2.39.2


