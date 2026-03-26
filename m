Return-Path: <linux-kbuild+bounces-12300-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD9uFj2lxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12300-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:29:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE1C33BE4B
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 683713045014
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9AF3A782C;
	Thu, 26 Mar 2026 21:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JrnCHHLB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4A73A6B70
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560327; cv=none; b=DTqL3Y4HBHdFwp/fJ8yTN/6p26RcGoGvh2j2oG4VUC7KT/1wX0oDYFpEZIgdwwGjCs5Nk7/l+N8sPvRo2wzXWp9r3SwgeyMHTlI+gFNcoZFb2HHjT/Xi9orLXhG6Gc9t/etsLaqHEo573V7BswDNV5tNecYLy3yKMxXWt76Co8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560327; c=relaxed/simple;
	bh=yxWFKfFkKHmuOpsxGuTO4vPY99a8JR43U1hClfLdqBk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l1xW0bROqthj88Y5o42sq8biU0c4VmOzLnzxGbYoUTLQmUHcjEfslgSM6gejCiRS0jN1d4nWaP3StXeCyOIHMQSblDneSmNOqO30E2f4FXQCV/VptYq5eIZgsoxbnL+JAI1OnHjWwNOOXXD0HWemCpukrwUpinbcIwARNaiv5U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JrnCHHLB; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-66a719d8008so1531219a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560324; x=1775165124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWI54gUN+/1z0II7jAJ2ytcdqsD5FtTzHZqzZAkbnP4=;
        b=JrnCHHLBnnSdj37f/7KmfJMneZEXt24dNLLaqP6aGRkUHDGp2Q1x/BzSMmGO/QKwFL
         KtadSgexEhD+xdjaMztTmCEXOLINZmEmuWfhQsjZ7iAPaNeXfuRJRVdUWasIywOjShZM
         J4CZ6KhcQv1v2301sVyyhQ06RclkaPtVuToP3CzhWJB/FYaNXXxWSDFAjaFz2YJiqTDl
         CJQs8ZJZrN2VloBEB2PTcAtLitArxDRDKZXNYfr98NRKbVw95wkCzNdF9O/b0ApPVyuN
         SA+Sr7qmjydMEnSGbOf0EY4OFwp5UBDXesNjR9813fui0iqU6tJ+c0s2m3LanlE2Stvn
         EMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560324; x=1775165124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWI54gUN+/1z0II7jAJ2ytcdqsD5FtTzHZqzZAkbnP4=;
        b=c8osM9BnncdIHTmjU0jKKqeR6erf7J7I+TgJhHFqMo488sPeE78/VDKswp3S8IP/H4
         ezmsSr86hA7kGu8VlwW4voxI1roCiRKwZI1YoWLWGvvoi+WDegCTW2e/R7NrkAXMUjRv
         5aoOzlHJHB/uJ5fVpBnWk0aNoh2f12/mbek5MT08R6HcxdO5IjbTmGMMhE2T+Tx3ctvk
         Qu/PC1GKxunCh+tWnboxcHaKtnVDVMVG/V4kAxLJIx6dMAqB2L1ZdfaRUuU35q8i6o76
         8owMQzATDKFTXpZmkRrKR1bPz0kAj2TpJEds1HkH4NtczK20dKzDB6W6dg84bqRhaZ09
         yDqw==
X-Forwarded-Encrypted: i=1; AJvYcCWH78B/QG0lQzy45XZFQhE44qVRG+8c26tfKIBkipXIY4rCjNuGm7ow7ESbDzcwTiBm0yeFQQn7m8AUWzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3uazHG7koVHtGmMYVQI8v942IYeo66R15jA/pKrPIo+qtTat
	vLvg7H8SiF8/hkDMWJWA9McC9iaO7P0v36omFbO5WQuQ+sMrUbUnmVZvCXImRDEEgBjhw1OagxV
	tLjBhHDqpUVH+ljweqQ==
X-Received: from edf13.prod.google.com ([2002:a05:6402:21cd:b0:667:53b3:300f])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:458d:b0:669:2043:ec13 with SMTP id 4fb4d7f45d1cf-66a82672771mr5923271a12.21.1774560323929;
 Thu, 26 Mar 2026 14:25:23 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:25:02 +0000
In-Reply-To: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-1-fa0796fe88d9@google.com>
Subject: [PATCH v5 1/7] module: define ksym_flags enumeration to represent
 kernel symbol flags
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12300-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ECE1C33BE4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Symbol flags is an enumeration used to represent flags as a bitset, for
example a flag to tell if a symbol is GPL only.

The said bitset is introduced in subsequent patches and will contain
values of kernel symbol flags. These bitset will then be used to infer
flag values rather than fragmenting ksymtab for separating symbols with
different flag values, thereby eliminating the need to fragment the
ksymtab.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module_symbol.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/module_symbol.h b/include/linux/module_symbol.h
index 77c9895b9ddb..574609aced99 100644
--- a/include/linux/module_symbol.h
+++ b/include/linux/module_symbol.h
@@ -2,6 +2,11 @@
 #ifndef _LINUX_MODULE_SYMBOL_H
 #define _LINUX_MODULE_SYMBOL_H
 
+/* Kernel symbol flags bitset. */
+enum ksym_flags {
+	KSYM_FLAG_GPL_ONLY	= 1 << 0,
+};
+
 /* This ignores the intensely annoying "mapping symbols" found in ELF files. */
 static inline bool is_mapping_symbol(const char *str)
 {

-- 
2.53.0.1018.g2bb0e51243-goog


