Return-Path: <linux-kbuild+bounces-9106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1A7BD4A92
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 18:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 109F718A64E7
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 16:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83936311C32;
	Mon, 13 Oct 2025 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="abrZf60f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD1D31196B
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369993; cv=none; b=VCQCl7T03aYP9f+xho8lJOcyVR4b3WSCGW9jhyO6FBznzD+d0MLB6193pvq2OLAOtvKxm69lyVZGT13dpxJmxQx8/UOD1KpM/kSebYtGVyR+tlbQBptiLIf374zc/bod4SDT25+ZNpJEHLZoStAeYNM2fjBsuRhg7Ygm9fUShSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369993; c=relaxed/simple;
	bh=am6eR0+LUPty8s6xAM1cP/GUuFeuZfjlS3+RH+AoatY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H19+XSWOr0G0koBVRhCU7kuhFI4Ng9rALZuqmfFjzdFVkUx28ww2/5UZNjP2y8JiqqCZQ1Gf8cfYqvQaMG6e2oOCyygjWwcHFu9dmFHXmAb36TJF6UgKq0neDVuEJSIvl/VJJY9Llsf7ij45MWBKSLJKrvu80Sh+IOnXMoZR3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=abrZf60f; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e3e177893so29519995e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760369990; x=1760974790; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Myo1tBFgG2jkTnheFNaxzL0Ia+2mIIh3L6V96Qq92Y=;
        b=abrZf60fPhxOTc2Vhl9s9sQXRqj5FhOaPrvHNDKhWOXMyaZGIgBNDsbne/6ifcZkJD
         skf5hkz4IiKihRc00v5PjAnY1CKQVMIMBY17SMaK+uUl6g3D+dlq1jJVR58F014rqyU6
         wXJzrE4o2DYu4S3D9vR2Q304EJJIMPdDU0hnKRNR7Jyn5GoAtCQ3m4EPaIfGYUiy/yhi
         dLt5oP3DRfUEjJcva6F8n4SODpPU/AJzG460ytQohq2ZG91VGCaQaCEnpaNK8qmPxds5
         YjzaeEB8pTBLoOYjSp6VnpxLwGyoarS9SVajS5Dak3nnZo0JJUu0IhsJvT6YsR5OfPNh
         s1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369990; x=1760974790;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Myo1tBFgG2jkTnheFNaxzL0Ia+2mIIh3L6V96Qq92Y=;
        b=n3OlwHsOK2C11E8tZaSapxxgmCvSTmMwWy0Gur6SPSj5kBxIF8ZASmkEDyKq0iHgKa
         HQeqIGEHlmTUWCqcO0xek20HGit2YjfLwNbl/7B/6CR5LCAdCyyJY6pbCYkYTH2wvWOo
         f8bYIuDH28/+3DD7taWZ6VcptsWQSCuHEeNqcGTkZzv3j3b7dZpj4iYX9HRaxSWgP6ns
         OCYSvbNikLQa8twvbMTpzpsKiC7p97lQw3SacCEb1HTSoe2tpCe4+Ne/1fzJqqxBaZBi
         xu+yQEwd90ULxD6aZ+Tlb9rJQzLM5hDKmA/iUWv2C84oVnSxgdsfTEmLrGCrGlhCz5u4
         FzRg==
X-Forwarded-Encrypted: i=1; AJvYcCXkyMtPiaN9V+XdPRnncSSZz55q+M0bK+hTkpUai8R4T6mDOi0GdP5SwtbEVnCu0KJN4qIhYrtBIwKpSj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSAjixOHW2LMg3rJIHssaqavbs+SYeJl3NBeu8KC9bbP0/ZOLD
	cGz8plwTGdn7+Jw919UbfgIMUF61BSHmypzdQdSPJ2CwCEwTgoA7rpanJ98TuA0qMFUpFOCmTw5
	7+XbR824iIpTHngeknw==
X-Google-Smtp-Source: AGHT+IE5k2WNSHbbxjeh2VOaTDuZYIuyr+f8VRPTxapGvluVBHAsbTnBwim1QiDvl7TYkeZOfgF/UT+SPZHk5uk=
X-Received: from wmcn15.prod.google.com ([2002:a05:600c:c0cf:b0:46e:32e6:eb8f])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1a:b0:46e:4a78:dea9 with SMTP id 5b1f17b1804b1-46fa9af17d4mr148931395e9.17.1760369989707;
 Mon, 13 Oct 2025 08:39:49 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:39:11 +0000
In-Reply-To: <20251013153918.2206045-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251013153918.2206045-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251013153918.2206045-4-sidnayyar@google.com>
Subject: [PATCH v2 03/10] modpost: create entries for kflagstab
From: Siddharth Nayyar <sidnayyar@google.com>
To: petr.pavlu@suse.com
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	samitolvanen@google.com, sidnayyar@google.com, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/export-internal.h | 7 +++++++
 scripts/mod/modpost.c           | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
index d445705ac13c..4123c7592404 100644
--- a/include/linux/export-internal.h
+++ b/include/linux/export-internal.h
@@ -69,4 +69,11 @@
 	    ".long " #crc					"\n" \
 	    ".previous"						"\n")
 
+#define SYMBOL_FLAGS(sym, flags)					\
+	asm("	.section \"___kflagstab+" #sym "\",\"a\""	"\n"	\
+	    "__flags_" #sym ":"					"\n"	\
+	    "	.byte " #flags					"\n"	\
+	    "	.previous"					"\n"	\
+	)
+
 #endif /* __LINUX_EXPORT_INTERNAL_H__ */
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5ca7c268294e..f5ce7aeed52d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -244,6 +244,11 @@ static struct symbol *alloc_symbol(const char *name)
 	return s;
 }
 
+static uint8_t get_symbol_flags(const struct symbol *sym)
+{
+	return sym->is_gpl_only ? KSYM_FLAG_GPL_ONLY : 0;
+}
+
 /* For the hash of exported symbols */
 static void hash_add_symbol(struct symbol *sym)
 {
@@ -1865,6 +1870,9 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 		buf_printf(buf, "KSYMTAB_%s(%s, \"%s\", \"%s\");\n",
 			   sym->is_func ? "FUNC" : "DATA", sym->name,
 			   sym->is_gpl_only ? "_gpl" : "", sym->namespace);
+
+		buf_printf(buf, "SYMBOL_FLAGS(%s, 0x%02x);\n",
+			   sym->name, get_symbol_flags(sym));
 	}
 
 	if (!modversions)
-- 
2.51.0.740.g6adb054d12-goog


