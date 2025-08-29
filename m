Return-Path: <linux-kbuild+bounces-8661-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBAB3B96C
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 12:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44D403BB17F
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 10:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDF4314A60;
	Fri, 29 Aug 2025 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1HL9SLyC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C123313E04
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464879; cv=none; b=DclFBHTHGzDtCXbZXkWmLm2pJTgBTyoads2V+uxSTLezzGXVd8HQpFhXD0vG+VtW7VQwcpuKWCXrN9CJKrGxq2z1NsUe4JHZ7epq//rSGGO4bAurnl0/CY1bYCbwPKlJHMiXbsadk56ltKQ2IgbisiPSHbfFGSElJJyS5GvOClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464879; c=relaxed/simple;
	bh=yF9Nwmba/jevaBt9hbUSzr8VO0GmzyMKV6WaC+bYVkE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TOMmyBIfL7oG+JFl8PweETSuclAFcx32+g5wwNzYcEA/4MF+LIkZti71aLYoD1CUjhhLSkpnR8veNRfSVBA1taJEJy0TQuQ/+JSSi4S7MI0dHRMiCn1K1tk9OS/Vy83wBOhaT1171iIaIz9mJotDwurXfnEVaIVnp9V1AAwMR/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1HL9SLyC; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3cef6debe96so587187f8f.1
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756464875; x=1757069675; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tl5xVMQDO9rOC+YVNnG9Us77dRWtm4Hbzqq49mGE7X4=;
        b=1HL9SLyCWtP72z5Frih2DAXSDv2wkd6m/xBbjdqovr6f6NfpVtl2xqyE6rRatrG1Bd
         wiStsWJ3B6Bd47iz2uAG/W59jWupTtjCRwznH3inMY27Gq9mlAOHVb70vEuppvhkuH6E
         gK9+4H9/iwOjBzd9HwBzB8+7EkeGBKl0Cj4BkjsaeB1mztPa0ABMAxs28TqF+DXqYb/N
         z07eHi2BG7ffHGahF7MGkskNPlLlUrGdsaR4yjUkDvkeWR7stT9zrK0vSVC+TW/TnbQN
         psrQCvQJlxl935z0oidoXB8InHVwOCuixlUU5+YZBrgUuUO4X17Usa2BfShPASXTduQD
         LFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756464875; x=1757069675;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tl5xVMQDO9rOC+YVNnG9Us77dRWtm4Hbzqq49mGE7X4=;
        b=ZwnwMlt8qPOU+Snhx9U9prNt7olCbi60L89DKI13D8EfQRR6czl5pULLxl/xGgkqkm
         ZTgtHluLkTkFti5dZaWfwudlW63hoRRPs4kVWjkXe0pQVCcRwhQLLZ0qKiaulP1fAw3t
         G75MAE12bLJIbvxvyt5CFOJ+UBq9trwcShp2/O41fhzgnswEib9LCRrrNDffkadJGgTL
         K5PKM/yfj/TkU4p8B5qIUaaYwvId5t1PZwc2wwFUZTuLMYlbX9HC9cwPA5ko1SocNYCh
         IjmISQq+X8tG76bd+PfbCqdlIZgj08dx4sBOpDyyguod4OlbR4JIJoBbRua7Lk4UUm0E
         RZjA==
X-Forwarded-Encrypted: i=1; AJvYcCUX2osSrOCLmLu4guMBADFLYOos7rzPBPtlgqUjXa5jFgZFlgrD1JpOJgx8xSrXt4+WZp5MijT723ONQ8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmy4680tpJ7jQ8+QUU9csKsdegLvIIsdpN2VSbfeYb7pfKTaN4
	pnLS6QorGYLliOYMIU+iOCiqF2SakByHSHpacMZvSYQ0auTEkON601iSxv1I+pYZMHwyOx4kCgJ
	mxAsW4rz71fsto9/7mw==
X-Google-Smtp-Source: AGHT+IHBrOSPoi0y2RsxzWW1F4le7Bf1Bk/4RMIS0LXXWN2TETItYHW5HWXVVsxZ+L4PXPSHZLojUsL4tRay638=
X-Received: from wmpz22.prod.google.com ([2002:a05:600c:a16:b0:45b:520a:6656])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2582:b0:3cf:a44b:26fd with SMTP id ffacd0b85a97d-3cfa44b2b45mr1213005f8f.8.1756464875293;
 Fri, 29 Aug 2025 03:54:35 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:54:14 +0000
In-Reply-To: <20250829105418.3053274-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250829105418.3053274-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250829105418.3053274-7-sidnayyar@google.com>
Subject: [PATCH 06/10] module loader: remove references of *_gpl sections
From: Siddharth Nayyar <sidnayyar@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, Petr Pavlu <petr.pavlu@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"

The *_gpl section are not being used populated by modpost anymore. Hence
the module loader doesn't need to find and process these sections in
modules.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 include/linux/module.h   |  3 ---
 kernel/module/internal.h |  3 ---
 kernel/module/main.c     | 40 ++++++++++++----------------------------
 3 files changed, 12 insertions(+), 34 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 9ba6ce433ac3..1a9c41318e22 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -431,9 +431,6 @@ struct module {
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
index 400d59a7f44b..4437c2a451ea 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1464,29 +1464,18 @@ EXPORT_SYMBOL_GPL(__symbol_get);
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
+			pr_err("%s: exports duplicate symbol %s"
+				" (owned by %s)\n",
+				mod->name, kernel_symbol_name(s),
+				module_name(fsa.owner));
+			return -ENOEXEC;
 		}
 	}
 	return 0;
@@ -2601,10 +2590,6 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->syms = section_objs(info, "__ksymtab",
 				 sizeof(*mod->syms), &mod->num_syms);
 	mod->crcs = section_addr(info, "__kcrctab");
-	mod->gpl_syms = section_objs(info, "__ksymtab_gpl",
-				     sizeof(*mod->gpl_syms),
-				     &mod->num_gpl_syms);
-	mod->gpl_crcs = section_addr(info, "__kcrctab_gpl");
 	mod->flagstab = section_addr(info, "__kflagstab");
 
 #ifdef CONFIG_CONSTRUCTORS
@@ -2812,8 +2797,7 @@ static int move_module(struct module *mod, struct load_info *info)
 static int check_export_symbol_versions(struct module *mod)
 {
 #ifdef CONFIG_MODVERSIONS
-	if ((mod->num_syms && !mod->crcs) ||
-	    (mod->num_gpl_syms && !mod->gpl_crcs)) {
+	if (mod->num_syms && !mod->crcs) {
 		return try_to_force_load(mod,
 					 "no versions for exported symbols");
 	}
-- 
2.51.0.338.gd7d06c2dae-goog


