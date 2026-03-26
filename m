Return-Path: <linux-kbuild+bounces-12302-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Hd4JWSkxWnBAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12302-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:25:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61233BD8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B92C8303B2F9
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10123A8724;
	Thu, 26 Mar 2026 21:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NJbP2TmX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CE91CAA79
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560329; cv=none; b=p4GUwDb3hziH9xYG/QCtz/PJmDByZzz8WPRYzj4st1XPhE37zcChqHdfFjRFl0UFW31SMVenX2oq8g0WZRcq0aKwedcHk65pN+Zqp77h9sgfLCx2kRvKKndGTtLSzTWvQJm77yO/J+cTwdcgHMaI3GeIqqhKKkrn5DL2fmH7dKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560329; c=relaxed/simple;
	bh=IMqZKd1uN1FnLrufR1Vtu+d5jfNCK7QjuAG3cXhKCg8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iTzK7NPerGg82wtAsjKIhWynkYic2ou9DKDlvf9Hao5leMi9eTwpb6l8hyuVwnTGdH7y5fsIYfpZTOukqRDKUJrz5bSm190+jwqY60v3qW7pzxPNTyc/xfmwaCYQnRSffjPv4NVtvJIdogMK0mHRi/3gpmHECAQviMs1O4Tf5Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NJbP2TmX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48534941525so19667025e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560327; x=1775165127; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=woqFHYkUrW1f2z9oyqhnpwQO2sR6jhXkFvm21NeDZng=;
        b=NJbP2TmXX1PaPlaltakZh7+M/KZt9H62AzEfr18yZhzga8pSxsM+cNSkqWqjDPCUHh
         8GKUI3xp5Z42YY4+ospEieiHSd/N0g4HbUjRsG2O3yyGlHwnvkktUL2ap3PXX+Op0YBs
         DQUOUzmv8QYGghzA5n9KWoN+v2mruxNb+yio8y3aS9bx8BfWHxq/bAEuzWI1w0p8L48C
         tecCvtR/P/ClNrpVwTYqcWCMorOD4NX8JqiXoyxr8t9NUZwtqqRhH/7/Tvrys6XlMJJr
         37Pzr2Uc4VyE508UHa4OfP01ahGBWKf2PHkOodVfDO9DYtrLq850IN5j4muw2zNmuWZl
         UsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560327; x=1775165127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woqFHYkUrW1f2z9oyqhnpwQO2sR6jhXkFvm21NeDZng=;
        b=QVvKa4NQmiVyTKJuAdVeVJ7x9I/4JTl8tDR17Z2Nj2KUIHqrPwNrYxPyQbDUIWoGPF
         pVAidZAr37NLq4uacMTjgPaEC2bMj7XKSW1ueuXokIFDObmU/TiAiUDPc7bVj3q91APD
         5DTzjyEkLacOzBYjvb35nBVcDgIuVh/+S+VFVIqePX3EKDrDzQBCW6Rjw9dO0kUjuEfa
         JfmTFdZmTq5m+w/AAtKSgalLtJ+J7apHIi1ccu9JQDE/oPrnd9DDiZjWc7IsDn3Al4GK
         gkqJwi3P9oTGikCR1su6CeCVzsJWmtSC3lFZvwiBcCHgRn71FIv3ZcRnC7opEzDFzJ+v
         PgOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8wD86kFK61jnGRQ54Xnl6A95FTlB0GIp9M2oKf4CC03pi7GA1qJKqpX3xQLFHdP9DhUSo1+BldyAA0Nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEkLIUSY/0VWnnPdkHC1XQOOl0PGivrrordCxe1KgFTL8yo7qG
	JrHhTXqhPAv+Vxrkv2Dl/LBSUmUgcOnASp4VN8HrptochfjtOeDt4Y3trQAnBOu0DPo2wgrwgWk
	8338mi1+6w788nir+Kg==
X-Received: from wmf24.prod.google.com ([2002:a05:600c:2298:b0:483:80e5:6e03])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6487:b0:487:1c2:6a4c with SMTP id 5b1f17b1804b1-48727d6790dmr3401815e9.4.1774560326661;
 Thu, 26 Mar 2026 14:25:26 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:25:04 +0000
In-Reply-To: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-3-fa0796fe88d9@google.com>
Subject: [PATCH v5 3/7] module: populate kflagstab in modpost
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12302-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B61233BD8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds the ability to create entries for kernel symbol flag
bitsets in kflagstab. Modpost populates only the GPL-only flag for now.

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
index 0c25b5ad497b..1d721fe67caf 100644
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
@@ -1874,6 +1879,9 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 		buf_printf(buf, "KSYMTAB_%s(%s, \"%s\", \"%s\");\n",
 			   sym->is_func ? "FUNC" : "DATA", sym->name,
 			   sym->is_gpl_only ? "_gpl" : "", sym->namespace);
+
+		buf_printf(buf, "SYMBOL_FLAGS(%s, 0x%02x);\n",
+			   sym->name, get_symbol_flags(sym));
 	}
 
 	if (!modversions)

-- 
2.53.0.1018.g2bb0e51243-goog


