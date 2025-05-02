Return-Path: <linux-kbuild+bounces-6880-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E09AA74F8
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 16:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97E2B7B2722
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E7E255F5E;
	Fri,  2 May 2025 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GgT39S32"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C409256C9B;
	Fri,  2 May 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195971; cv=none; b=Ot/aTKbMzPwsXBoUuHbq+WkjQvvh0gM1adWOyJrqxmaDLVrbM0Ri1q+dQ202DiTxRbu2umT8eHNjrSL+7UEd/RC4eS3izjn36L6eXtNXln4it33C2rq6k547vVVQrllCm0nVnCXv0YmDYSLmwvniBUuswDdFjDDuPaCg9+5WLbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195971; c=relaxed/simple;
	bh=r7bJ04rxm1egxZUxKBy0DaRcOzZy9pv4ih3VucjjqiQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=sjFh3T5p5BIRX2tHFqAu+MKJfAmzD22MmTsyETTng4nQqqI7eYyDV97JanRnLdb+R5MAAgkVhzeJPcAXUHQdEICXqOcxJMw7G+hfShefUezU+HWqCmcIoJ+xDryKubbj1F8PGKprWOHnC4mk4UL697Yta0qFh/j7BGs185OI8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GgT39S32; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=9/d9HGSmnu1K8plMQ/z7T8XUHN+iiRR+u0jykNWAszU=; b=GgT39S32uyjySX0HPX7e53L9DP
	AvRt81KovfDOhWpovtyAUNYEVYV/JjQQzre1FzF9JgXabkYzt1IQZtRyZaQ/6maBbwZ4Pl97yboaV
	odume75X6YelhfWEXof2oNUHJzTAahD6ebnv0NggIE7LlHyO1424l+2KtiD4pyI735wWQQFSPruKC
	D8ZTo3W9ILct4rrJnPd72KWodSRBe2yQo/o8WBdVLGSINUYasjWF6tuZarfGVEUnvCoM/CyJHBWKW
	JsNeMjyjUROqI9APYnebo7AYIqV7CWFqh8wBmzpAg8zxBd+lxCz0bu3P8euWp+5PzzwzUUGlEb8y0
	xqw0TNLA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArKE-00000002iJh-3iXp;
	Fri, 02 May 2025 14:25:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id EBEDD30078C; Fri,  2 May 2025 16:24:59 +0200 (CEST)
Message-ID: <20250502141844.154517322@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 02 May 2025 16:12:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org
Cc: x86@kernel.org,
 hpa@zytor.com,
 petr.pavlu@suse.com,
 samitolvanen@google.com,
 da.gomez@samsung.com,
 masahiroy@kernel.org,
 nathan@kernel.org,
 nicolas@fjasle.eu,
 linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 hch@infradead.org,
 gregkh@linuxfoundation.org,
 roypat@amazon.co.uk,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 3/5] module: Extend the MODULE_ namespace parsing
References: <20250502141204.500293812@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Instead of only accepting "module:${name}", extend it with a comma
separated list of module names and add tail glob support.

That is, something like: "module:foo-*,bar" is now possible.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/module/main.c  |   36 ++++++++++++++++++++++++++++++++++--
 scripts/mod/modpost.c |   36 ++++++++++++++++++++++++++++++++++--
 2 files changed, 68 insertions(+), 4 deletions(-)

--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1083,12 +1083,44 @@ static char *get_modinfo(const struct lo
 	return get_next_modinfo(info, tag, NULL);
 }
 
+/**
+ * verify_module_namespace() - does @modname have access to this symbol's @namespace
+ * @namespace: export symbol namespace
+ * @modname: module name
+ *
+ * If @namespace is prefixed with "module:" to indicate it is a module namespace
+ * then test if @modname matches any of the comma separated patterns.
+ *
+ * The patterns only support tail-glob.
+ */
 static bool verify_module_namespace(const char *namespace, const char *modname)
 {
+	size_t len, modlen = strlen(modname);
 	const char *prefix = "module:";
+	const char *sep;
+	bool glob;
 
-	return strstarts(namespace, prefix) &&
-	       !strsmp(namespace + strlen(prefix), modname);
+	if (!strstarts(namespace, prefix))
+		return false;
+
+	for (namespace += strlen(prefix); *namespace; namespace = sep) {
+		sep = strchrnul(namespace, ',');
+		len = sep - namespace;
+
+		glob = false;
+		if (sep[-1] == '*') {
+			len--;
+			glob = true;
+		}
+
+		if (*sep)
+			sep++;
+
+		if (strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
+			return true;
+	}
+
+	return false;
 }
 
 static int verify_namespace_is_imported(const struct load_info *info,
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1682,12 +1682,44 @@ void buf_write(struct buffer *buf, const
 	buf->pos += len;
 }
 
+/**
+ * verify_module_namespace() - does @modname have access to this symbol's @namespace
+ * @namespace: export symbol namespace
+ * @modname: module name
+ *
+ * If @namespace is prefixed with "module:" to indicate it is a module namespace
+ * then test if @modname matches any of the comma separated patterns.
+ *
+ * The patterns only support tail-glob.
+ */
 static bool verify_module_namespace(const char *namespace, const char *modname)
 {
+	size_t len, modlen = strlen(modname);
 	const char *prefix = "module:";
+	const char *sep;
+	bool glob;
 
-	return strstarts(namespace, prefix) &&
-	       !strcmp(namespace + strlen(prefix), modname);
+	if (!strstarts(namespace, prefix))
+		return false;
+
+	for (namespace += strlen(prefix); *namespace; namespace = sep) {
+		sep = strchrnul(namespace, ',');
+		len = sep - namespace;
+
+		glob = false;
+		if (sep[-1] == '*') {
+			len--;
+			glob = true;
+		}
+
+		if (*sep)
+			sep++;
+
+		if (strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
+			return true;
+	}
+
+	return false;
 }
 
 static void check_exports(struct module *mod)



