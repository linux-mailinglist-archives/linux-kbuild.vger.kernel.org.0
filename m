Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8AF33382B8
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 01:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhCLAtx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 19:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbhCLAti (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 19:49:38 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B15C061760
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:37 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id p136so27854811ybc.21
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=6JZKTL3cv5f+QsuwZswDwzrYuKZX5rkh1eIr4Zfx2fE=;
        b=SdFCtfB+Erk7sy687mtu53wuRF76AZGcEYo50hTsFl58FIcew0neCPwcU/JyE46Lyg
         8uupf7fpGQiaWZJfLEYQ0iXlShGOCOxPpJWgx6+iNKLuBORfG5z9+ozjbITPTcWG8Hp+
         krp3MjMp6k/F0pZwOXtdRZPjpcC9Nm+ia4KgnZ9oLej4ik6gd92kTLPwNqBbKFbK3zA5
         B9vR9YaYjXCmZHFwxIvqh6hEpiNTXSDXUsKDBpLApQYr5+dm/rhtWB/el9ryHg6pZMAI
         CbS9EPvPMgf2ILbU+iFK2S/kxe2X4eyXHiBnQjBNkmTdJFgT+3hcKhAMd9EtUZ2izmPG
         2tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6JZKTL3cv5f+QsuwZswDwzrYuKZX5rkh1eIr4Zfx2fE=;
        b=nbqFP2Ioxw8RoyFKx5RV2P/sVHVADQIZxIt+xGsxDEkd8rRNsg7r3K7Yc5perr5qh0
         zLfQRS1X2+C8CDPGtjOzJjDjfCpmh5OCQyDLDiNudOdBaJEz+IAztzP6t09DhtPLf0vI
         Y3OqvULZZBjlsCb91OZ6rg/Tl4Cg+SephLjHdznEb/zP95IYGB32fzTeGakwayT77pj8
         ngRWg3ZM6T5sKovAfZBTCpHqPPc8kahjXMIQk9I5SHJdwz88M8TaOy61FOYxebAHf9ev
         j5X8eK4RVAnkbe7P7NLbJHYGeFd004AeOisZqPTbBp3OruVHJ9i9sTXLEFJx0rD0a3up
         sm8w==
X-Gm-Message-State: AOAM533vHKiWpO/hfgImEBiDBihCzayg1QFs8Ty2fu8OBUiwzI2vLDFL
        zrhA2eChRldu0atD0xVriZ4Xe6wrj0fpqqKlAT0=
X-Google-Smtp-Source: ABdhPJx1YGkGp7cqKP4eWzC8MMNMuq4xIKNrPn1tsOPZo78IMlccqylVp5+hUcgOYd8xYJ5Qbwkysj1kalvbYUi0TXY=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:c86b:8269:af92:55a])
 (user=samitolvanen job=sendgmr) by 2002:a25:4ce:: with SMTP id
 197mr15054589ybe.462.1615510177158; Thu, 11 Mar 2021 16:49:37 -0800 (PST)
Date:   Thu, 11 Mar 2021 16:49:11 -0800
In-Reply-To: <20210312004919.669614-1-samitolvanen@google.com>
Message-Id: <20210312004919.669614-10-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210312004919.669614-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH 09/17] lib/list_sort: fix function type mismatches
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kbuild@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Casting the comparison function to a different type trips indirect
call Control-Flow Integrity (CFI) checking. Remove the additional
consts from cmp_func, and the now unneeded casts.

Fixes: 043b3f7b6388 ("lib/list_sort: simplify and remove MAX_LIST_LENGTH_BITS")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 lib/list_sort.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/list_sort.c b/lib/list_sort.c
index 52f0c258c895..b14accf4ef83 100644
--- a/lib/list_sort.c
+++ b/lib/list_sort.c
@@ -8,7 +8,7 @@
 #include <linux/list.h>
 
 typedef int __attribute__((nonnull(2,3))) (*cmp_func)(void *,
-		struct list_head const *, struct list_head const *);
+		struct list_head *, struct list_head *);
 
 /*
  * Returns a list organized in an intermediate format suited
@@ -227,7 +227,7 @@ void list_sort(void *priv, struct list_head *head,
 		if (likely(bits)) {
 			struct list_head *a = *tail, *b = a->prev;
 
-			a = merge(priv, (cmp_func)cmp, b, a);
+			a = merge(priv, cmp, b, a);
 			/* Install the merged result in place of the inputs */
 			a->prev = b->prev;
 			*tail = a;
@@ -249,10 +249,10 @@ void list_sort(void *priv, struct list_head *head,
 
 		if (!next)
 			break;
-		list = merge(priv, (cmp_func)cmp, pending, list);
+		list = merge(priv, cmp, pending, list);
 		pending = next;
 	}
 	/* The final merge, rebuilding prev links */
-	merge_final(priv, (cmp_func)cmp, head, pending, list);
+	merge_final(priv, cmp, head, pending, list);
 }
 EXPORT_SYMBOL(list_sort);
-- 
2.31.0.rc2.261.g7f71774620-goog

