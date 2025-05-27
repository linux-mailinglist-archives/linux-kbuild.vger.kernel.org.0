Return-Path: <linux-kbuild+bounces-7281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E77AC4B27
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 11:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D146517D159
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 09:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F535253944;
	Tue, 27 May 2025 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzYY1JSB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639AF253931;
	Tue, 27 May 2025 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336901; cv=none; b=XhJKkdWtfcp7Vra/vXh4fzgfPlpWwZq18zIrgmXziPgCcNyBhoLyCQVuWccF9ukkgA3YZoWUTAqQN6dCL8PiTWL0esHYXwa5Yv/k8rQKeP6p+97x+oTNEe2PKso7czxzw6GKcUmfSCLZtu06RDjFGQS8uNBj5jIvax1WnNlBA+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336901; c=relaxed/simple;
	bh=DKOaNGI5NZtDaEHT/OdeqlteuIvyX6aHBbn+vBanltk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Szv8BEzuJ8P2N2WW88Dzgr5ZBj4Ce5T0RPO7WeUrOKK9RxreKbIbkgkgy6y701xbbA4NLg/L9Ouh49Q0lb+8t3Q6OKczVSjqgLAsGZdChX4s0XF4rrIGOAK1xd/7Xu1e+ezQ6rS4FgzYGCKOyr1RrzFkEgxkMfFZCcO3YT3708A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzYY1JSB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895F5C4CEF2;
	Tue, 27 May 2025 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748336899;
	bh=DKOaNGI5NZtDaEHT/OdeqlteuIvyX6aHBbn+vBanltk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TzYY1JSBNdNZDfLr+3/hyd/HKQCOFSWycptt2HyAW20dv1AYXyV8EoFsmPjOOVdck
	 QuqqiMTgTFNZ1pNNfIpY1Uljg3Hy7bXoXgUjm6XZ7hC9lXsQgQvceW8voiEvW1Gwqv
	 mHRy9k7Cxc2wlRZilBpcSWZYUyS1Hv3QeTrWAT5GxlskP7w4oYY6iSoxovBSHE6bme
	 sYkM4oDps5fLC/C+DbNbzzMRiWDplx1myP3nEchWryJooNFzuBybJkaxyaP1rqe1U9
	 Cbis8Q3ssTf5oLqGqa4cIDAnuIWEJKO3ymj9Uid0C4B3xju9zR1Qg/B/16MNkTVUXC
	 o2o9CwDiz838g==
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
Subject: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
Date: Tue, 27 May 2025 11:07:57 +0200
Message-ID: <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
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

In order to avoid symbol conflicts if they appear in the same binary, a
more unique alias identifier can be generated.

Signed-off-by: Alexey Gladkov <legion@kernel.org>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module.h   | 14 ++++++++++++--
 scripts/mod/file2alias.c | 18 ++++++++++++++----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 88048561360f..e7506684069d 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -249,10 +249,20 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
 /* What your module does. */
 #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
 
+/* Format: __mod_device_table__<counter>__kmod_<modname>__<type>__<name> */
+#define __mod_device_table(type, name)	\
+	__PASTE(__mod_device_table__,	\
+	__PASTE(__COUNTER__,		\
+	__PASTE(__,			\
+	__PASTE(__KBUILD_MODNAME,	\
+	__PASTE(__,			\
+	__PASTE(type,			\
+	__PASTE(__, name)))))))
+
 #ifdef MODULE
 /* Creates an alias so file2alias.c can find device table. */
-#define MODULE_DEVICE_TABLE(type, name)					\
-extern typeof(name) __mod_device_table__##type##__##name		\
+#define MODULE_DEVICE_TABLE(type, name)			\
+extern typeof(name) __mod_device_table(type, name)	\
   __attribute__ ((unused, alias(__stringify(name))))
 #else  /* !MODULE */
 #define MODULE_DEVICE_TABLE(type, name)
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 00586119a25b..dff1799a4c79 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1476,8 +1476,8 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 {
 	void *symval;
 	char *zeros = NULL;
-	const char *type, *name;
-	size_t typelen;
+	const char *type, *name, *modname;
+	size_t typelen, modnamelen;
 	static const char *prefix = "__mod_device_table__";
 
 	/* We're looking for a section relative symbol */
@@ -1488,10 +1488,20 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
 		return;
 
-	/* All our symbols are of form __mod_device_table__<type>__<name>. */
+	/* All our symbols are of form __mod_device_table__<counter>__kmod_<modname>__<type>__<name>. */
 	if (!strstarts(symname, prefix))
 		return;
-	type = symname + strlen(prefix);
+
+	modname = strstr(symname, "__kmod_");
+	if (!modname)
+		return;
+	modname += strlen("__kmod_");
+
+	type = strstr(modname, "__");
+	if (!type)
+		return;
+	modnamelen = type - modname;
+	type += strlen("__");
 
 	name = strstr(type, "__");
 	if (!name)
-- 
2.49.0


