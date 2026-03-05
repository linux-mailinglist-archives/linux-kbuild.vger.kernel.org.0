Return-Path: <linux-kbuild+bounces-11602-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF5dCcC1qWkZCwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11602-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:56:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0176215AAF
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0018A3050219
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 16:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80833E3DB5;
	Thu,  5 Mar 2026 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cC8ZJTDH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FECF3DBD45
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 16:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729731; cv=none; b=avtbGPH357Uqa691gT8lAoSFwkzDDcox7bJU4/pgRFoVCsuV7DdsZ6cxT7qdSbk0m66Kc0XASSCjjxGGxGlSAjSgQot+VQImM5FVBkz6v1YWtT9cMWUYxOiHhEYmFxblEtkx+52dP8qF8bX3PvoYOSDiTHWXxq6UZoyz973Hl7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729731; c=relaxed/simple;
	bh=kyfTe0G2VwV3QkAhN1GPs2mavv4U3uviJwI2JjtwqUI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BQ5Oe5qyXmwkfAowTVI68wMwHfApRuoBsh/qTE2mrY38W6biG3+KD3HKOzkaba66XC704zT3apwn4+u2sTB600jxPa9pH6NrEBSB8VeTwX6+mk3GiOPXlR3ijJ1NagVLqAYQVKqhKTIdMRSlRBWNm5Bv4VY7AIN47qV7n9jURiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cC8ZJTDH; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837246211bso105918515e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 08:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729728; x=1773334528; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ccvxigw2nS1gLrg2HufkX6BPzMKDvSVZXWPtcb4rQK0=;
        b=cC8ZJTDHsEOUERfOO+VELFjTZgC0vgZ2ahVXL61lahaw/YFTNecUy+briW/84/VoCh
         vOS3V/edFll/gegaRtHTH6nvQVbgRuDTmBwZdl7fUNE6yGPxZLMynX3hKIxRu7PLYrIc
         qiutKgpHfnFPucTSlnkXLLSIzrZdJoUnG5Lkg8rRxcYPKHG3IEAC/P2abfyWOsH7TtLY
         WEt7Ap6FD3A3jEdk9nb7FUS/XPzyy6j71/FgDLJbes6SCIxEB3ZNKaT46CvWA/rs+ILM
         aFn5vkqlWKB9QW6UtG4v7Scl2Z1UR2AyGRQALzwElepBtTJVU+42Tfqq42cG6d6IPMQ8
         L0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729728; x=1773334528;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccvxigw2nS1gLrg2HufkX6BPzMKDvSVZXWPtcb4rQK0=;
        b=cwxV7Oudd1cgJnSjMDCWm/lL9jSWlYywr8HXdRLiJGx1Gx+OJrhOOX6l5m0IAvUUgB
         aaqig+TScJ5UmpJ2/lUtSLyEXgKvtRcy9r/teW//rz7CntrHH0Xuf8hw9tgkEAjOfxfX
         Nnpd6WKx3iNAzJLFFL2rHO2QgQKfUQ8D7I/tTfs2Uks/2ZvBMRrz7+RHLFKbn/Wrrz1D
         xyLVJ7vTD2gERxZybgmaRCUxylMLHFzwa4mH2RsrBLYt87vFP1Rfqu0vZJ5oHjSmO6lj
         D8MTpB2yrsq1YUNoDQpwITyUJIXlKBBYXNvEqkk3u3FgYmtGoa8Y8Zlqpm929YnVRIGV
         aDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjglLu73BtExXMoAUgpbvEA+Jga4xmuc/CzedADxcQ90NYVqfW5gILgXynmsaJ12W4o+kWkltRAFlmzD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCrwKsfGxUKgMrvW17ll7C53uMWfEmKRIaaHb4seE505XeaIId
	IF3jUGzB8pqmwxZxFLyRlkNyjoZmnePygKEc86WkQXo8jvPQp3WaZDK+vo1FGuIfXwdtHOcO/yo
	xmFSbeYeVEjkJ7GalIg==
X-Received: from wrbfn1.prod.google.com ([2002:a05:6000:2881:b0:439:c449:ae0])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d12:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-485235c53bfmr2353085e9.14.1772729728341;
 Thu, 05 Mar 2026 08:55:28 -0800 (PST)
Date: Thu, 05 Mar 2026 16:55:23 +0000
In-Reply-To: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-7-6a76bf8b83c7@google.com>
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
X-Rspamd-Queue-Id: C0176215AAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11602-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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


