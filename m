Return-Path: <linux-kbuild+bounces-12305-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBblJ6mkxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12305-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:27:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868633BDFD
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9CA0307416C
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2C43AA50F;
	Thu, 26 Mar 2026 21:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p3tC3AEr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301943A7846
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560336; cv=none; b=tm/63oS1upEPJBBrW5wnN4mu67j/A/gSeJIvwFHUDd9Hc0YxGp8emBcgGPIl/HH3QsLoM2xViOledxvHGCyEsxS//1aTnD2ziqan0Y2qAVaCBjgln3RQSeAgGV3XBA4cRMGyQ9qLWCrpo/gAnAIq8UZd3QsSf7jKytyCShreE0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560336; c=relaxed/simple;
	bh=dhaz9oRBN2LrlO9PSGOfI7otVV2KGMDVKhDfQTLvm0g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tg2AeuAmFmlBZYJBN7amZk79DmioBZdfCr8UU4kj/92AEnC2KrNQBI+BfrZxxcgagzFnydUMZZEgU8FFnwn2c++H8Xil/vE8NdikpqGGHtB4DMHqZaR9CggJIuXZ/NE1np3u/BkgbSPm7bkDxFPHBXOQczoaRSsS1BBXY+yz11M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p3tC3AEr; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4852cf0318dso15516975e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560330; x=1775165130; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE42C9hekLpveGyF6RMfwZOJjelI4nIxMgNfnUlAiOM=;
        b=p3tC3AEre5xAVW2LylVKd1EIfy016r3jFDobGF8J/Bqj5+kSmsT0DD9Gxpa0wXveje
         vgJzL9Q/zPPkbfnrG/RZAk/XqdagAs8+9jG/3LszkBaxWOP07tNnooiIv1F6JvCOkBeh
         MuR03IxB9awt/9QvS2gxlDgFGzt/miQwVDMVaPTFA3UYXGdUn+ZTaAHpywTRdIQantOV
         xWv0fcXyDWVAwo7+3BBHgQzJjKNfx2HEIgzZURETPKKiPdb0KTfFldA0RZ2apk69PiuT
         XQUBE5MULaBYvVwRe8hEjSUhhvb4g1a1NBsrJas2yVnDI9bsXaKCTxKG6Uwrt79SaxTW
         BYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560330; x=1775165130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE42C9hekLpveGyF6RMfwZOJjelI4nIxMgNfnUlAiOM=;
        b=Z3fmvcJ9/l1kLr4ZsYUUHTtBUgURv+30xO+g/r7sBtOg7aWYqMKIKk0zXNwif9QfVW
         FoqoiD9KNZwJUPWXm8wZms3BbTulkN8CJj69ux7FzWQJTqAII7PBU5DHsnypA7Lfpq1r
         wWFXajtOG/Kvm8VN5Q4llYiVZARvsRVB8hVqvHN2G/dzY9k28At9bLup84snjIz0w1Cl
         X/K7AgyDnPqQ4oKwjB5GbOkTAeRCCB2SAI+/VEra3LJThkk0nV1thX/QE7zL4jGcRi/l
         ykDbjJtTqyGPqkztOFzwNL5q+pb4IWFxOzfbACrxKGrM9iEKY7PQQt41CWqdv35EniMc
         nOlA==
X-Forwarded-Encrypted: i=1; AJvYcCUlmGT5vjyGGQeO6coj2iF3md2w04bikHMtP9hqS0gdwdYuoblQIYrPzKZBhrRNGH1IQQnWfjdHZNb8P1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+tFCRNqXV3/Sfa70Iu9ww38salvc7daezJJiK3m43QMK1xTx
	zDli1vIaSuNX3bqPBJi2rdnLtY5eRRUByZRFSAvFBcgPvJL8AAS8kVgwJWUQF2lTCGOmJ2rMPqV
	CgsF7u0QtJofLY+W+Dw==
X-Received: from wmga17.prod.google.com ([2002:a05:600c:2d51:b0:485:3a14:a74e])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:927:b0:485:3dfc:57d with SMTP id 5b1f17b1804b1-48727efab7emr1875075e9.30.1774560329539;
 Thu, 26 Mar 2026 14:25:29 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:25:06 +0000
In-Reply-To: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-5-fa0796fe88d9@google.com>
Subject: [PATCH v5 5/7] module: deprecate usage of *_gpl sections in module loader
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12305-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5868633BDFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The *_gpl section are not being used populated by modpost anymore. Hence
the module loader doesn't need to find and process these sections in
modules.

This patch also simplifies symbol finding logic in module loader since
*_gpl sections don't have to be searched anymore.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module.h   |  3 ---
 kernel/module/internal.h |  3 ---
 kernel/module/main.c     | 46 ++++++++++++++++++----------------------------
 3 files changed, 18 insertions(+), 34 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index aee3accba73c..a0ec1a9f97b4 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -434,9 +434,6 @@ struct module {
 	unsigned int num_kp;
 
 	/* GPL-only exported symbols. */
-	unsigned int num_gpl_syms;
-	const struct kernel_symbol *gpl_syms;
-	const u32 *gpl_crcs;
 	bool using_gplonly_symbols;
 
 #ifdef CONFIG_MODULE_SIG
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 69b84510e097..061161cc79d9 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -53,10 +53,7 @@ extern const size_t modinfo_attrs_count;
 /* Provided by the linker */
 extern const struct kernel_symbol __start___ksymtab[];
 extern const struct kernel_symbol __stop___ksymtab[];
-extern const struct kernel_symbol __start___ksymtab_gpl[];
-extern const struct kernel_symbol __stop___ksymtab_gpl[];
 extern const u32 __start___kcrctab[];
-extern const u32 __start___kcrctab_gpl[];
 extern const u8 __start___kflagstab[];
 
 #define KMOD_PATH_LEN 256
diff --git a/kernel/module/main.c b/kernel/module/main.c
index d237fa4e0737..189e18b8103d 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1464,29 +1464,17 @@ EXPORT_SYMBOL_GPL(__symbol_get);
  */
 static int verify_exported_symbols(struct module *mod)
 {
-	unsigned int i;
 	const struct kernel_symbol *s;
-	struct {
-		const struct kernel_symbol *sym;
-		unsigned int num;
-	} arr[] = {
-		{ mod->syms, mod->num_syms },
-		{ mod->gpl_syms, mod->num_gpl_syms },
-	};
-
-	for (i = 0; i < ARRAY_SIZE(arr); i++) {
-		for (s = arr[i].sym; s < arr[i].sym + arr[i].num; s++) {
-			struct find_symbol_arg fsa = {
-				.name	= kernel_symbol_name(s),
-				.gplok	= true,
-			};
-			if (find_symbol(&fsa)) {
-				pr_err("%s: exports duplicate symbol %s"
-				       " (owned by %s)\n",
-				       mod->name, kernel_symbol_name(s),
-				       module_name(fsa.owner));
-				return -ENOEXEC;
-			}
+	for (s = mod->syms; s < mod->syms + mod->num_syms; s++) {
+		struct find_symbol_arg fsa = {
+			.name	= kernel_symbol_name(s),
+			.gplok	= true,
+		};
+		if (find_symbol(&fsa)) {
+			pr_err("%s: exports duplicate symbol %s (owned by %s)\n",
+				mod->name, kernel_symbol_name(s),
+				module_name(fsa.owner));
+			return -ENOEXEC;
 		}
 	}
 	return 0;
@@ -2608,12 +2596,15 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->syms = section_objs(info, "__ksymtab",
 				 sizeof(*mod->syms), &mod->num_syms);
 	mod->crcs = section_addr(info, "__kcrctab");
-	mod->gpl_syms = section_objs(info, "__ksymtab_gpl",
-				     sizeof(*mod->gpl_syms),
-				     &mod->num_gpl_syms);
-	mod->gpl_crcs = section_addr(info, "__kcrctab_gpl");
 	mod->flagstab = section_addr(info, "__kflagstab");
 
+	if (section_addr(info, "__ksymtab_gpl"))
+		pr_warn("%s: ignoring obsolete section __ksymtab_gpl\n",
+			mod->name);
+	if (section_addr(info, "__kcrctab_gpl"))
+		pr_warn("%s: ignoring obsolete section __kcrctab_gpl\n",
+			mod->name);
+
 #ifdef CONFIG_CONSTRUCTORS
 	mod->ctors = section_objs(info, ".ctors",
 				  sizeof(*mod->ctors), &mod->num_ctors);
@@ -2823,8 +2814,7 @@ static int check_export_symbol_sections(struct module *mod)
 		return -ENOEXEC;
 	}
 #ifdef CONFIG_MODVERSIONS
-	if ((mod->num_syms && !mod->crcs) ||
-	    (mod->num_gpl_syms && !mod->gpl_crcs)) {
+	if (mod->num_syms && !mod->crcs) {
 		return try_to_force_load(mod,
 					 "no versions for exported symbols");
 	}

-- 
2.53.0.1018.g2bb0e51243-goog


