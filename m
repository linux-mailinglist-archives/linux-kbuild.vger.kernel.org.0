Return-Path: <linux-kbuild+bounces-11603-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDCUC9S1qWlEDAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11603-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:56:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE08215AEF
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E13F23054D17
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 16:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16E33DEAE6;
	Thu,  5 Mar 2026 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XRN00sYS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E453E3D9A
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729733; cv=none; b=Wh43rw1W91159cvUjYh29YgD1/V53DT4umSjLMJ1FFQXbukRDcpnLvTWxiQ7QwvgKQ7XpBMmkMuE59VFbvCzumCSMptl3O4EjI0xMcQXf6rgAJbsuZjKs1y7Nnn1P5/HmboEI5tGatMNV1pkbJgjZE6NzWXg7E+QSHb7x43kn88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729733; c=relaxed/simple;
	bh=/LRjn4DsKeVQZ4dzyANbTGqQ6W2rGj3js9YDFwrFWZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y/6gbnOGRhIGTCLuahg2XyOWW89mPG3yN0r6oZ0Db/1wSs6pVBkppDB9xr96xBn7La5DaU6m8m4xPxr9MQC4KswCIAU/2FSGTYNBUm0N2mRVvs+3lm6ptlq3MwUHTQRu92EtzcLFCy3BRXgKCzPA9HTrTMd0kNF+VrR1Bq+UhKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XRN00sYS; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so60573615e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 08:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729730; x=1773334530; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMu0xUqSjGdHKDTYMSydPkunIn5YCF8kNNeiDqHV0Wk=;
        b=XRN00sYS76fHR2WhMql3EVUbGqnJZ9UQonD7bhyVwG3MZeSYBBZTf5F+HfPjwf4ZJa
         r+5JJoMheBX9wUQSUqd73eVeVQJA76pLk/HeAayq5LpOeHQI53tDzJpagbvpBlNc26zv
         p0MXnpKrTsi29+HaUHozLgiAnRcjzI/qssOORbnxOoSADA8oGyFqwTQUSyk8qDGH1oOX
         pjONgY/zUzUTcrPTGyqRqRmDo7d8YANHy7S+OMG5/Aso6lZfgcVpbzYwfkP8CN2Q76b4
         yc1ab7C+BWG6za11wfJ8hDtlBfExVF6aIam9oifQgIZIQQDIsIeTK4ocs1Ncvs08nqJ0
         Obug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729730; x=1773334530;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMu0xUqSjGdHKDTYMSydPkunIn5YCF8kNNeiDqHV0Wk=;
        b=NfFHv3dx1P3f8JEnpbj+8I8VZUaxlGaUHBgHR/YTpG/XzN8zCjLG7Xw4CVm5UUUzZo
         cHRn6yDvvjg2D4xjweXqjGT1jpWcIVlmnAbjPzpI7IYjhelGjq+0w8gwM39j/QbyJMkY
         wfIG01Rh+jrTchr0eMssTQKP5BM1CnGzRTxguZ7YWQLw6FSeo73cnQHN6jeBbenqNocP
         QnbqAh1IfXrDswqefWpLJeFhWa58ufjhlJozQJ1n7tqiCBdXnki99CHw00tWjbDauZrJ
         V/sF2SfoiPPaRhextem50PXH4yNZRS50O0sIHAv/yLJFImLeY8pnU0oJR5g1YeSKTnxA
         zhKg==
X-Forwarded-Encrypted: i=1; AJvYcCXKGipz1FHV7tm75E+0WoPHRL4yohx0a1NO5NNjhvY44M/ojR2ZY+EWGaEickCIiwd4Mjcej+BS8tt3JLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSu65+8A81LNMGjb44VifpFXIFU+CJY579IKcFti3gYPbd9R0
	LDMzVqALjo5wHj/L/xv2iK4Yz2tDv0U1V0mhZ1vfvOTGToSjAS7qZO6CXof0jsDSt+4aQy6MgOg
	htZMy1y61BudLPQw+ZQ==
X-Received: from wmdd20.prod.google.com ([2002:a05:600c:a214:b0:480:4a03:7b6c])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c4a5:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-48519826fadmr111254425e9.5.1772729729537;
 Thu, 05 Mar 2026 08:55:29 -0800 (PST)
Date: Thu, 05 Mar 2026 16:55:24 +0000
In-Reply-To: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-8-6a76bf8b83c7@google.com>
Subject: [PATCH v4 8/8] documentation: remove references to *_gpl sections
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
X-Rspamd-Queue-Id: 0CE08215AEF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11603-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

*_gpl sections are no longer present in the kernel binary.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 Documentation/kbuild/modules.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index d0703605bfa4..b3a26a36ee17 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -426,11 +426,12 @@ Symbols From the Kernel (vmlinux + modules)
 Version Information Formats
 ---------------------------
 
-	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
-	sections. Symbol names and namespaces are stored in __ksymtab_strings,
-	using a format similar to the string table used for ELF. If
-	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
-	symbols will be added to the __kcrctab or __kcrctab_gpl.
+	Exported symbols have information stored in the __ksymtab and
+	__kflagstab sections. Symbol names and namespaces are stored in
+	__ksymtab_strings section, using a format similar to the string
+	table used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs
+	corresponding to exported symbols will be added to the
+	__kcrctab section.
 
 	If CONFIG_BASIC_MODVERSIONS is enabled (default with
 	CONFIG_MODVERSIONS), imported symbols will have their symbol name and

-- 
2.53.0.473.g4a7958ca14-goog


