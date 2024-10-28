Return-Path: <linux-kbuild+bounces-4352-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C8D9B23A4
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 04:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C58DDB2187D
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 03:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAC318BC36;
	Mon, 28 Oct 2024 03:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1ucgzVN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C875618A959;
	Mon, 28 Oct 2024 03:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087411; cv=none; b=DnE0Jh5OMzu3YqomC75WLPNuvySK/HReroW122aJo627IykcL29khuqS6xMi7qCCn5XmnCb0t+usxlWmQvcrIpyLUZ9KsydhYCnMI2VmHhikZy7Vf3iWkLR455n/9SxiR0QymGAqcSvj6GBhZmTyspAbLQ5GXhiZrMScDV7CrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087411; c=relaxed/simple;
	bh=ifCKAl8xVCdFFQlr8xJlI3ddk6mjeoWe5hPaL6oEUPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NxVCd+fmuDNh3pDqRfr3jbN2lQiX7eNi6QCxFmCRonkmQflLv86TOTWjY8CbUhMwjeQnHyTS3D7fHvSmKCULAPOKmJgVNJYZkVdUNY+lHPG6DYZyr99tNGVdGjGlrqdbpizY53sDjUb+eptvKkJqxvsT9I+s8F0YOEDxEVUX/mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1ucgzVN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so4319041a12.1;
        Sun, 27 Oct 2024 20:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730087408; x=1730692208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQ7mAumYZVzVpV3VI37dduP6ySzc3FV45gfVD05zAaY=;
        b=K1ucgzVNacubTGZ2ry2dQQCBFSpQlU73aneM5AzDlgUN6H0rWhy4plaUwUbYLzAkbR
         9dnSbfKjqjFB5zxzxdTH58nAU42cPuq4smK5MKY1m/ZS9sxbhZt4kX2+rmDX1mJB/4oJ
         xA+V402rjUZaQSOa33hupVu5ljwcWRdxlZPBxTwFHqdW+UhnJLPqlcYwwx2ydvSrQx04
         ojJw9/b5j4n5dDW0pKWzYssJZmlDM8Cq9XPAQ7t4h/3M+XeKo33KpoaSDqUeKbA32Uh6
         et9sXAU6TttIhJkq71uAKd/o1wl8aoBaRty77KfsD+2fefwLgQ/HefnBTXYXvwn0ltaC
         PcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730087408; x=1730692208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQ7mAumYZVzVpV3VI37dduP6ySzc3FV45gfVD05zAaY=;
        b=LogmZwMxrceoLMQyjTVnHxZx7UPHJKunsaTHeJQkz+1eciqyyFZtvoAUrXjVmfHSQ2
         FYpvfUWiMAbFNG5kInPLYNKCTc2jZ+v6FDUQBMhq0109bOZfolBPltBNpNNC6Y4NvBlL
         K1eWntkZeWmwgPVW+eKKjfL9JKvBO9wHebnzjmn9IccYYaqzuUNqDmF3zrV7wqPWTOAN
         8aGoDxA0TKy1uJ8qern8TnMcXdkC4z1MYPnXR4LBuchez5iK0KCiDUJ09mw7f13RMw65
         rDm/2c326KqULBGROO02coUodrCCN+UvDzZ2O3pgwD0YdPv3bpucog1EytSYy6yWQqnl
         5hTA==
X-Forwarded-Encrypted: i=1; AJvYcCXmzDG/fGvdqC9dXqAVzBn5XoAK2vArsyRrAlDDx7feVswGdCr+1cAcRU03xpjIJlNLBMVZjpw8DQqXHvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+wCUM+3zde8wBraI6Sby22kfv+RZySKM7GbUWcmJ6OE6GMiE
	wAgpS/SqB6wxpB4Twfb+lIGHDsnauniSblEa9CQSsiO37dkTFYa6YQMFQg==
X-Google-Smtp-Source: AGHT+IGPoetqkVQatYQdf1xY6hWJjL2RJpJBhg/calw+5WbdnT80kmLvxL3nvh0UoXepLgJMbrXuuA==
X-Received: by 2002:a17:907:8686:b0:a99:4615:f58c with SMTP id a640c23a62f3a-a9de5d6eb9emr683602066b.2.1730087407876;
        Sun, 27 Oct 2024 20:50:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:78b:e59b:2b0:d2e9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f5932fsm334599366b.168.2024.10.27.20.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:50:07 -0700 (PDT)
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
Subject: [PATCH v6 02/11] kbuild: Add list_size, list_at_index, list_for_each_from
Date: Mon, 28 Oct 2024 04:49:40 +0100
Message-Id: <20241028034949.95322-3-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028034949.95322-1-ole0811sch@gmail.com>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

list_size counts the number of entries. list_at_index retrieves the
entry at an index. list_for_each_from iterates over a list from some
entry to the end.

Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/include/list.h | 49 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/scripts/include/list.h b/scripts/include/list.h
index 8bdcaadca709..0c50774606c2 100644
--- a/scripts/include/list.h
+++ b/scripts/include/list.h
@@ -219,6 +219,21 @@ static inline int list_empty(const struct list_head *head)
 	return head->next == head;
 }
 
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
@@ -310,6 +325,40 @@ static inline int list_empty(const struct list_head *head)
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
2.39.5


