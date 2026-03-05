Return-Path: <linux-kbuild+bounces-11593-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAqLFq+1qWkZCwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11593-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:56:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F68C215A7F
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D98003076AD3
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 16:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E1C3DA5DC;
	Thu,  5 Mar 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fEMn0oXe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068483DEAC5
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729679; cv=none; b=WMRrgrgP4QOVz000Q/92lDDn4PtYxPEH/tWojoMsJlGOgN4uG011A0+B4gXtFaMM/hP0QSGyzPJXB/Liia/8pIStrloArBVt5rufP/DtCCfzaZ4cCZYNv+WtAAnO8vYKgUAAErhvLn3wDxpl+hsuUjP1j0pFtHwxCtfWzymiXWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729679; c=relaxed/simple;
	bh=kyfTe0G2VwV3QkAhN1GPs2mavv4U3uviJwI2JjtwqUI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=unZ89x+UftPRg/L9KpCoSGwrXs6fCFv4E2v6Spo1L99QbdDFVl7MOpcf7GUxg4P8LuKSUUdMehPog+CewKXMQcZMdf0tXRTm/BYOb6Xdw0iVVctNC2k6VcMoa5aCXXKWX007LoZuC6YFnU+ayv2LPSmwKEDPTiUS2mJwT1WsF3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fEMn0oXe; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4832c4621c2so91197305e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 08:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729676; x=1773334476; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ccvxigw2nS1gLrg2HufkX6BPzMKDvSVZXWPtcb4rQK0=;
        b=fEMn0oXeALXszMX28BgO0W+VojAMuYJpiNcN//H9MdPHUEIPNIy/NjiYbjq54PqWvk
         +J1PrBFdGSsyyVKRJpu4tdN/40GC+7I0bq7vh7VDCfaB4wBNa08893G9vIUV6ps7UmfI
         LvJfvRg4May4r++G5LDpJgfN+F9xsl498OPOnDuW4LJYNwW7Wi7RQLltmTQst5XUs0sq
         u9lMGaBYP64Me5qOb7s0ErqVhflKkn1r2/MOii0KR6U+WCuI7xlk6+Tsdtg4CgGQz0ix
         4XAv8hrjqlBlFTdybdY6xK9VqjeCJ2oL4zLwvL5rebdhBMADhWVca29qHlbmb42OOC9Z
         L3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729676; x=1773334476;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccvxigw2nS1gLrg2HufkX6BPzMKDvSVZXWPtcb4rQK0=;
        b=N80oX5hqzTI6/zLMcBrbU6yHWN/dUdQcuvrndd7CIdSPGRpVbhYwnXYSjsG+EhDGHQ
         rR99OMCPZX9UwWzOfgVxda0VX/ZUXfcxAlG8GQVLv1Qdmzv4g2bIELIvW/gN2nN7JRZ8
         RJqmXG/E3Od1gj+VqpoJDk+51aBE4TBRxAopRustPWNxr/e9KKGmtVd8jjUg1xpQquTS
         PUICATUc68PZeu+zvSTks3UteYQzUtZ0zb8jqpdfpMeLdK3Z2/17I7a9d6RgwV35pcMq
         /5Q+/Su6PfNiTKEYL1bO6w+Egfe7zgn3NEC5KYDnwfwhizgjgXsjJfFzTD2uBW0mddbM
         aNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt3rluB5LDjnBZunGSpwnFAHljcsn8lL/Bp8R65GhetcrkKSbZ6Np+lKRlfhf7HTEcV2dCiWLyoQn+xQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYxJb3OIPhWn3cXHbB//iWar5QmiRSy4gwMo5dghPiFmaz5lWx
	VyrZ3eX4ulSVJ5JEbsDtS/CiwUuvTLmBSb/DH4S8/iWLHqcCWsVYmaisg6Aeq3mfTcUkB11K+ZT
	w7ESj2n1BG0edAzMoPQ==
X-Received: from wmxb5-n2.prod.google.com ([2002:a05:600d:8445:20b0:47d:5bef:a379])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b99:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-4851983121emr109133495e9.6.1772729676375;
 Thu, 05 Mar 2026 08:54:36 -0800 (PST)
Date: Thu, 05 Mar 2026 16:54:27 +0000
In-Reply-To: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-7-4fe6eea27e30@google.com>
Subject: [PATCH v4 7/8] linker: remove *_gpl sections from vmlinux and modules
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
X-Rspamd-Queue-Id: 0F68C215A7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11593-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

These sections are not used anymore and can be removed from vmlinux and
modules.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 include/asm-generic/vmlinux.lds.h | 18 ++----------------
 scripts/module.lds.S              |  2 --
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 8f825dcbfae4..d2e4fa997316 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -508,34 +508,20 @@
 									\
 	PRINTK_INDEX							\
 									\
-	/* Kernel symbol table: Normal symbols */			\
+	/* Kernel symbol table */					\
 	__ksymtab         : AT(ADDR(__ksymtab) - LOAD_OFFSET) {		\
 		__start___ksymtab = .;					\
 		KEEP(*(SORT(___ksymtab+*)))				\
 		__stop___ksymtab = .;					\
 	}								\
 									\
-	/* Kernel symbol table: GPL-only symbols */			\
-	__ksymtab_gpl     : AT(ADDR(__ksymtab_gpl) - LOAD_OFFSET) {	\
-		__start___ksymtab_gpl = .;				\
-		KEEP(*(SORT(___ksymtab_gpl+*)))				\
-		__stop___ksymtab_gpl = .;				\
-	}								\
-									\
-	/* Kernel symbol table: Normal symbols */			\
+	/* Kernel symbol CRC table */					\
 	__kcrctab         : AT(ADDR(__kcrctab) - LOAD_OFFSET) {		\
 		__start___kcrctab = .;					\
 		KEEP(*(SORT(___kcrctab+*)))				\
 		__stop___kcrctab = .;					\
 	}								\
 									\
-	/* Kernel symbol table: GPL-only symbols */			\
-	__kcrctab_gpl     : AT(ADDR(__kcrctab_gpl) - LOAD_OFFSET) {	\
-		__start___kcrctab_gpl = .;				\
-		KEEP(*(SORT(___kcrctab_gpl+*)))				\
-		__stop___kcrctab_gpl = .;				\
-	}								\
-									\
 	/* Kernel symbol flags table */					\
 	__kflagstab       : AT(ADDR(__kflagstab) - LOAD_OFFSET) {	\
 		__start___kflagstab = .;				\
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index d7a8ba278dfc..23fa452eb16d 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -20,9 +20,7 @@ SECTIONS {
 	}
 
 	__ksymtab		0 : ALIGN(8) { *(SORT(___ksymtab+*)) }
-	__ksymtab_gpl		0 : ALIGN(8) { *(SORT(___ksymtab_gpl+*)) }
 	__kcrctab		0 : ALIGN(4) { *(SORT(___kcrctab+*)) }
-	__kcrctab_gpl		0 : ALIGN(4) { *(SORT(___kcrctab_gpl+*)) }
 	__kflagstab		0 : ALIGN(1) { *(SORT(___kflagstab+*)) }
 
 	.ctors			0 : ALIGN(8) { *(SORT(.ctors.*)) *(.ctors) }

-- 
2.53.0.473.g4a7958ca14-goog


