Return-Path: <linux-kbuild+bounces-7280-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96CAC4B28
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 11:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CC387A147F
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 09:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44B72512D7;
	Tue, 27 May 2025 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKOduVeI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CB42505CE;
	Tue, 27 May 2025 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336897; cv=none; b=GMigSALsbVs/uqDAffBbO8PJ0BnzFy1AbiD4KVW8addMQ/WIgrJCNwNYV+dTapagyZqBpp6PhOTmljY06kLAgu6//xJQ+uK8ycSnvpekF5tTAiLJ7Nb2WrgkSCZ/yuSDrr9XpIB/h4VhPtO1xAmCGcD5JEKfgwXflpNQ0pPCNtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336897; c=relaxed/simple;
	bh=hX/12tgr8auIKj10dYH9wCEnSPJXZ5bPUlkNsw0TL8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF2I5mBUXlAkWxRYRgEpN1jRZYUL4SZojcLRGsT7uJ0ZhbCWYunDk2+GJmeX1SQQcNMUVvXix7SOESJVFOt/cBrxP5q0zCerXsjjHA4VbXTJJif2o+DOpzyuxZcU1GqKKEImbo8pFfRjtHySfFogKStGACXuyDZLCA7fhsIr+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKOduVeI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38E5C4CEE9;
	Tue, 27 May 2025 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748336897;
	bh=hX/12tgr8auIKj10dYH9wCEnSPJXZ5bPUlkNsw0TL8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OKOduVeI4QYRoItNfElW3TQcXzqPt5ow67PnTpFJAYi+b7+6/734v0+VADKsU3IsJ
	 yANcp17yZsMCEhSkE0Mx3BSarzR7PiYlb26bcfEWcuEJSZmX064ZItgmjh7XjJ6j9/
	 5if7Z3/12uG4h7N19XVpjF1dRJDweT+aa8jIgEJwBlBaJ1zcUZMN1+GLddsCHoL0SB
	 K19SFYO3+7jC35w9jYKFSJuBA0vYZ2epCX1iyK6GGhlVThpfxMZIEvsySI6MUc+Ozi
	 JuZvoqTKQJt6ww1qTD4spUl0l+xRD2p9XVS0HlXUoNHnaOhvtLEOQvDoWZm6cdZqRO
	 3u6frEKb/55yw==
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v3 2/6] modules: Add macros to specify modinfo prefix
Date: Tue, 27 May 2025 11:07:56 +0200
Message-ID: <5cd53f6a4bca5186d3c9c47c070883131826c5eb.1748335606.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748335606.git.legion@kernel.org>
References: <cover.1748335606.git.legion@kernel.org>
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
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module.h      | 3 +++
 include/linux/moduleparam.h | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 8050f77c3b64..88048561360f 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -170,6 +170,9 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
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


