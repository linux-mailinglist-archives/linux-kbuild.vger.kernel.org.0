Return-Path: <linux-kbuild+bounces-7062-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D32AB1AC6
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 18:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF6227AA55F
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 16:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA82238C10;
	Fri,  9 May 2025 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lInGQIvg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC8423817A;
	Fri,  9 May 2025 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809018; cv=none; b=hgUZgTiOhocFyNZxD4cB7Ir/GWfr/68PAtNdFWThTGeyMeulYUKyvOXlknoMbShnKf7bc6+gjv2/VobbV3qf/CtvpynnVdVF04QXabx6DnFP9kymq8fsN74bGnaPTKlTj4nr5LhHEmuByqvngx6nHV4Rb4zVH01fBsvvVeh53yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809018; c=relaxed/simple;
	bh=Gys0UxncsUXqYng0kL/1XGhcPlTGV1yDI8jqbaVZifA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KkRGt+AByZ3tYPRhiMm2BiKv7OLwGMpxPuJbsfN/Kt72AM4Hi8x9bC4dO+aYOsl4U2p3zL4eDt8xNJU5844cGfz6lZ2Nta0P47HJMFCzDgYQzoeG74U4Wdt8hDuT1K2uU0qe/vfE6zTP1l9/44H38WcynwYV5dmq6gk6//sLpq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lInGQIvg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37910C4CEE4;
	Fri,  9 May 2025 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746809018;
	bh=Gys0UxncsUXqYng0kL/1XGhcPlTGV1yDI8jqbaVZifA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lInGQIvgzZd6gwkq5kZ+TFTTWVViM/B8A2JDX2oR9l+Nq33gKViu4P2jgSQDBoGNu
	 9ugLW052Pt9H6e5VK073pHyotseQ2I+HSCfeS3iMrEkpAYJ8ocXsbaSNXylny7TfFl
	 pUp5mtnptqJrr65ZJZZ9VN+2+Iq3F5uk0MEqUi3koTvackCNdvNWWzrzDrhF4+b9B1
	 PkiUpLRerYu/tKbmDs8pWXE35vY4V4adZ3xoVIyhy9wAvJvKqT55q3M0YjbYFm2rpb
	 l8XQy4K+XTHJuHPqIirikUNdVuPZkS152CB1GJj+KZKIvZfay3w3mCrY3Yj6v0SE1Q
	 Pin02OF0VI7rg==
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
Subject: [PATCH v2 2/6] modules: Add macros to specify modinfo prefix
Date: Fri,  9 May 2025 18:42:33 +0200
Message-ID: <20250509164237.2886508-3-legion@kernel.org>
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
index b3329110d668..de0da7c7cf03 100644
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


