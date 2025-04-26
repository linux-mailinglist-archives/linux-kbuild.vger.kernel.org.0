Return-Path: <linux-kbuild+bounces-6755-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B586FA9DC2F
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 18:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2975F1BA5914
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 16:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DC91DED6F;
	Sat, 26 Apr 2025 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqp0Ur/X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7279325D8E6;
	Sat, 26 Apr 2025 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684323; cv=none; b=JU65q8PVHLE/xGJDPM3iYNIpbwvzypkyYKPrpTeiS0evRK0WJ/hDqN+jh9Q7z7xNaBR38dqYbLn2qqqewS/Lj4guy/xnGrLb8+vJn5EA5GeRs40SKrV24yqJvDuHtBQ/L5918tUyr0L+xYClxpeCdZqN3zA8NWYuZo3l/FWgvuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684323; c=relaxed/simple;
	bh=u/rgGXysHqdAHOBHwPCbOsiPp8jtsmvA++VbJ6nHPns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eitUjNROvuZZeR53uuloVfKIEXo8XGN9hpRHu01Yf8RlWCrgFAaSOBbsroFqUjmL8hS8km2bTrD1wStDTfWpFHftc+ogPC6kGkRu5ipjQOkjNo0zj9yDqRZXM1e5fgrNpLSW6mUx3a+X9U7/Sz/vYUekna6Q/HRQU2qid7VnQJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqp0Ur/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20BBC4CEE2;
	Sat, 26 Apr 2025 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745684323;
	bh=u/rgGXysHqdAHOBHwPCbOsiPp8jtsmvA++VbJ6nHPns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eqp0Ur/XoKpvFemrWmE6peZzK3C87j7Iha3pU/6/5YT0Uoq3tUMjp0nnNu/p8l8AH
	 thy+oo7YDzg2JipxEBEwEPZ67QC/Rc8NGC1nSYNMdeMJo76DZh5kOxcHVZmkGYZUzi
	 E18ABOTnXwQc3guk802fg/iNWyPdvaCisBVeSFpB10R6IqQb2H3Lq4ycvV9qDxXTkM
	 BDInOgi0RIQZ2KrZzvrhYELG2bPs2qJ39OEZ++vxV2lVVr07jRw3J58B/CHowHGM+x
	 eEE4007MftDxchgGEkiUagzdBGw9RKBzUFmCSvqnyo2K4IU6u4fjpE9UuXwwCjN3DU
	 QvEGt/N+2wreg==
From: Alexey Gladkov <legion@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v1 3/7] modules: Add macros to specify modinfo prefix
Date: Sat, 26 Apr 2025 18:16:34 +0200
Message-ID: <e26953d82abdb61fd66061638c61d7e46f638c91.1745591072.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
References: <cover.1745591072.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __MODULE_INFO macros always use __MODULE_INFO_PREFIX. The only way
to use a different prefix is to override __MODULE_INFO_PREFIX, which is
not very useful.

The new macro will be used in file2alias.c to generate modalias for
builtin modules.

Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 include/linux/module.h      | 3 +++
 include/linux/moduleparam.h | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index d94b196d5a34..e987fd62c734 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -168,6 +168,9 @@ extern void cleanup_module(void);
 /* For userspace: you can also call me... */
 #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
 
+#define MODULE_ALIAS_MODNAME(_modname, _alias) \
+	__MODULE_INFO_WITH_PREFIX(_modname ".", alias, alias, _alias)
+
 /* Soft module dependencies. See man modprobe.d for details.
  * Example: MODULE_SOFTDEP("pre: module-foo module-bar post: module-baz")
  */
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index bfb85fd13e1f..3f819fc67c43 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -20,10 +20,13 @@
 /* Chosen so that structs with an unsigned long line up. */
 #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
 
-#define __MODULE_INFO(tag, name, info)					  \
+#define __MODULE_INFO_WITH_PREFIX(prefix, tag, name, info)		  \
 	static const char __UNIQUE_ID(name)[]				  \
 		__used __section(".modinfo") __aligned(1)		  \
-		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
+		= prefix __stringify(tag) "=" info
+
+#define __MODULE_INFO(tag, name, info)					  \
+	__MODULE_INFO_WITH_PREFIX(__MODULE_INFO_PREFIX, tag, name, info)
 
 #define __MODULE_PARM_TYPE(name, _type)					  \
 	__MODULE_INFO(parmtype, name##type, #name ":" _type)
-- 
2.49.0


