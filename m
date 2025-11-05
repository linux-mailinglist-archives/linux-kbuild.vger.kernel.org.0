Return-Path: <linux-kbuild+bounces-9412-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F112C349AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 09:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02B3A4FC809
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895812E6CC3;
	Wed,  5 Nov 2025 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="EN1zYRuK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B08D2E6CB2;
	Wed,  5 Nov 2025 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332557; cv=pass; b=Hj9m3ABexzI6cT7nWam2EaqnzqsitxkzmrXuFPSmAIZSGMcg6qeT7Q0AsFHf27sijd/Djc7q+s1KifJhtkgMkT8F8Mmgsqh8zO3pPjcfAnEkDpxAVP/3Co5rdUaBpoGMs6RNbjEIv1c69MEU552KHrXbsnwzSCHBgXYqCWLno/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332557; c=relaxed/simple;
	bh=yiGrjs75fyLTFiMwVzXEQJt4oKYvb0+AYFi5krlpasY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seYUqS90LmD+MYXVqUCWscMIpeBH2iMus31Eel/FZtYedqannO8zEPdEXNZn9ODP5YrCL06yNyOc91x5mA7Ub8+0qWWTJ/EUGYM2egzHCgebR4HQnHSdivPyLRXK1bn+HofozWK4Vy+BexecHvvKK9FEGJyl1PAk+jQzCWp1+g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=EN1zYRuK; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1762332483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FpVYjTSmvcPB7erhasSLPnYblzXgmY4BpZiIo7gpiI9XBn0a36q8lYc39Yu87BnoqNLxL7Ii5NIRjrHC8rsxw8BYE8mQUWr4rO238WX2t0DjQZDQlioEV8cSoiOc4XJdTCUj3Pt+4lGI6Kuf7BOd0JaV0+oGkgTyxxJelHEPsBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762332483; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=wrRPwt6IkvJ4ZhCaQOdwli+v3sIwVOexH2dQi6/JPzE=; 
	b=cHfeTCiXWawsFmPD76cyigoFKYtWWhah85Rdi/c056jL9l7ADyonBh/SKNXz2nmH+YwH8kXQAq1KEwM80XpIgkMx9H2NizvkiKeSdOn/hPV+7si3dogVnFd/uv/Mm5C4IcNtwJTIDKqidzRbAY/escF3y5VvYFSA6MLaNwi/gAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762332483;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=wrRPwt6IkvJ4ZhCaQOdwli+v3sIwVOexH2dQi6/JPzE=;
	b=EN1zYRuKGT2Lzgq0JO+4fO0pyLx3vGvjJuDR6fyk6kaoz90EqvNmdmlRWaQ8Kru6
	giDiL4hDKT3GXdEqoPW0lD5p0u7Kzq0eren8u0IqgATNpRpKD3GVimor1aYFW2VEvfT
	3CGS5+xfCslc1ASVUBZmiyl4t7Xqg99Wkz2H057A=
Received: by mx.zohomail.com with SMTPS id 1762332480777684.5516940794636;
	Wed, 5 Nov 2025 00:48:00 -0800 (PST)
From: Li Chen <me@linux.beauty>
To: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [RFC PATCH 2/2] gcc-plugins: cleanup_plugin: detect NULL init
Date: Wed,  5 Nov 2025 16:46:57 +0800
Message-ID: <20251105084733.3598704-7-me@linux.beauty>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105084733.3598704-1-me@linux.beauty>
References: <20251105084733.3598704-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

The cleanup_plugin should warn about both uninitialized cleanup variables
and those initialized to NULL, as documented in include/linux/cleanup.h.
The "__free(...) = NULL" pattern at function top poses interdependency
problems.

Also, plugin warnings should not be converted to errors by -Werror, as
they are informational warnings meant to guide developers, not block
builds.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 scripts/gcc-plugins/Kconfig          |   2 +-
 scripts/gcc-plugins/cleanup_plugin.c | 122 ++++++++++++++++++++++++---
 2 files changed, 111 insertions(+), 13 deletions(-)

diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index 906d50eb5efa6..ae6f79c617149 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -40,6 +40,6 @@ config GCC_PLUGIN_CLEANUP_ATTRIBUTE_WARN
 	def_bool y
 	help
 	  Warn when local automatic variables annotated with
-	  __attribute__((cleanup(...))) are declared without an initializer.
+	  __attribute__((cleanup(...))) are declared without an constructor.
 
 endif
diff --git a/scripts/gcc-plugins/cleanup_plugin.c b/scripts/gcc-plugins/cleanup_plugin.c
index d28f8969186de..c0744bbb7ef15 100644
--- a/scripts/gcc-plugins/cleanup_plugin.c
+++ b/scripts/gcc-plugins/cleanup_plugin.c
@@ -1,7 +1,69 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Warn about uninitialized automatic variables that use the
- * __attribute__((cleanup(...))) attribute.
+ * Copyright 2025 by Li Chen <me@linux.beauty>
+ *
+ * This gcc plugin warns about problematic patterns when using variables
+ * with __attribute__((cleanup(...))). The cleanup attribute helpers
+ * (__free, DEFINE_FREE, etc.) are designed to automatically clean up
+ * resources when variables go out of scope, following LIFO ordering.
+ * However, certain patterns can lead to interdependency issues.
+ *
+ * The plugin detects two problematic patterns:
+ *
+ * 1. Uninitialized cleanup variables:
+ *    Variables declared with cleanup attributes but not initialized can
+ *    cause issues when cleanup functions are called on undefined values.
+ *
+ *    Example:
+ *    void func(void)
+ *    {
+ *        struct resource *res __free(cleanup);  // Warning: not initialized
+ *        res = acquire_resource();
+ *        // ...
+ *    }
+ *
+ *    Should be:
+ *    void func(void)
+ *    {
+ *        struct resource *res __free(cleanup) = acquire_resource();
+ *        // ...
+ *    }
+ *
+ * 2. NULL-initialized cleanup variables:
+ *    The "__free(...) = NULL" pattern at function top can cause
+ *    interdependency problems, especially when combined with guards or
+ *    multiple cleanup variables, as documented in include/linux/cleanup.h.
+ *
+ *    Example:
+ *    void func(void)
+ *    {
+ *        struct resource *res __free(cleanup) = NULL;  // Warning: NULL init
+ *        guard(mutex)(&lock);
+ *        res = acquire_resource();
+ *        // cleanup may run without lock held!
+ *    }
+ *
+ *    Should be:
+ *    void func(void)
+ *    {
+ *        guard(mutex)(&lock);
+ *        struct resource *res __free(cleanup) = acquire_resource();
+ *        // ...
+ *    }
+ *
+ * The plugin provides clear warnings to help developers identify these
+ * patterns during compilation. Importantly, these warnings are not
+ * converted to errors by -Werror, allowing builds to continue while
+ * still alerting developers to potential issues.
+ *
+ * Options:
+ * - None currently supported
+ *
+ * Attribute: __attribute__((cleanup(...)))
+ *  The cleanup gcc attribute can be used on automatic variables to
+ *  specify a function to be called when the variable goes out of scope.
+ *  This plugin validates that such variables are properly initialized
+ *  at declaration time to avoid interdependency issues.
  */
 
 #include "gcc-common.h"
@@ -41,38 +103,74 @@ static bool is_candidate_decl(tree var)
 	return true;
 }
 
-static bool has_declaration_initializer(tree var)
+static bool is_null_initializer(tree initial)
 {
-	if (DECL_INITIAL(var))
+	if (!initial)
+		return false;
+
+	/* Check if the initializer is NULL pointer constant */
+	if (initial == null_pointer_node)
 		return true;
 
-#ifdef DECL_INITIALIZED_P
-	if (DECL_INITIALIZED_P(var))
+	/* Check if it's an integer constant zero (which can be NULL) */
+	if (TREE_CODE(initial) == INTEGER_CST && integer_zerop(initial))
 		return true;
-#endif
 
 	return false;
 }
 
+static bool has_valid_declaration_initializer(tree var)
+{
+	tree initial = DECL_INITIAL(var);
+
+	/* No initializer at all */
+	if (!initial) {
+#ifdef DECL_INITIALIZED_P
+		if (DECL_INITIALIZED_P(var))
+			return true;
+#endif
+		return false;
+	}
+
+	/* NULL initialization is considered invalid for cleanup variables */
+	if (is_null_initializer(initial))
+		return false;
+
+	/* Any other non-NULL initializer is valid */
+	return true;
+}
+
 static void warn_if_uninitialized(tree var)
 {
 	location_t loc;
 	bool saved_warning_as_error;
+	tree initial = DECL_INITIAL(var);
+	bool is_null_init = false;
 
-	if (has_declaration_initializer(var))
+	if (has_valid_declaration_initializer(var))
 		return;
 
 	loc = DECL_SOURCE_LOCATION(var);
 	if (loc == UNKNOWN_LOCATION)
 		return;
 
+	/* Check if it's a NULL initialization */
+	is_null_init = initial && is_null_initializer(initial);
+
 	/* Temporarily disable treating warnings as errors for this specific warning */
 	saved_warning_as_error = global_dc->warning_as_error_requested_p();
 	global_dc->set_warning_as_error_requested(false);
-	warning_at(
-		loc, 0,
-		"%qD declared with cleanup attribute is not initialized at declaration",
-		var);
+	if (is_null_init) {
+		warning_at(
+			loc, 0,
+			"%qD declared with cleanup attribute is initialized to NULL at declaration",
+			var);
+	} else {
+		warning_at(
+			loc, 0,
+			"%qD declared with cleanup attribute is not initialized at declaration",
+			var);
+	}
 	/* Restore the original setting */
 	global_dc->set_warning_as_error_requested(saved_warning_as_error);
 }
-- 
2.51.0


