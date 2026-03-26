Return-Path: <linux-kbuild+bounces-12304-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO+xCbKlxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12304-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:31:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B66633BECB
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 601AE30874B5
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606E73A7F55;
	Thu, 26 Mar 2026 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hrulh1gG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4163A7835
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560335; cv=none; b=rJrLLD5/EAv76rtCzjmcyY6uArVmPdWkJPwBaLjxe+LPTa6hUtaSuaoIbYGTAf1p8yIgw5FLxb0LNCuaSLkZdm1qHj0vBAhKUpb1cWDUzI0JrNu3vxkP5jZl0x5TcbZMj5ufWRjOlgL1tv3uCJ9r1E1aXTKInqMLywoVhsrlv5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560335; c=relaxed/simple;
	bh=YJ12M66JVdOPpUyl/ZnRqsezMQxQSFmDChR9hjNAYhg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MXaAvl3j1MsNUt27l9TvoHUjW4YaZmzmwicD3QGmtgOu6IweY/QsA+ZA/zVwGFBQYUvPFwm1zCLin7izsttgd36DNDOLuq0N+vLOMeQYGtJK8Ju63Ad67x941urMCXU8ihJUF2pgjuc0DfWGLd9cSK0/VW0feyJ7YygPF5//kYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hrulh1gG; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-487018c8244so12384235e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560331; x=1775165131; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGYiW8Rqw4kRzbw632ADCfNRFJHG+c2ihwrVrUq2DSI=;
        b=hrulh1gGqhNnuV8fxCE6id19q2iVakr4ShCWs7LspkNhac3nIFZ7p/VDmTR0B4Urn1
         G+7e+a7DM5dnjX9yT8M8dwczz66cIEIQTk41GH0q497fMdtx3UqKa4CwXEk8tnmRQtFx
         oUdHcb2mEAFTmswhO0/cy89+vNOfbwIGOgna3nbpGweDy+XU4W4HwA9J/WFGFfQUbl+f
         +OxHzc2ls8TqBFrYOIwLnX6Yum9z0V4hOdDzCBom7AAA9sYX2HgcZ2klSYpUrXIhRRo9
         0Rloep76eThZ44MuBVRGXEb1FakMaihGH/BLePmCRZcyZAGhya/ijWmI+CJnbObd/ufs
         Xbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560331; x=1775165131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGYiW8Rqw4kRzbw632ADCfNRFJHG+c2ihwrVrUq2DSI=;
        b=Xy20uhJl5U+3ET99KRD1JzjpiG6uFSWqeIYfXE6uSECnxX6XtCtlI73X78iikBOLJa
         b5QYVluDOv5WEUSdBlgDTHkNAjHHcCJwt+2x1oRddvOqPHsa4x4fZoURiO/DWbIYhUNP
         6h52unxG8C6btKAsdksOAy1DZRu5X4ZCz3/DTascwfO2F4N3+HMQIkcaiDo6wU9dpxQQ
         Jgz0Mk/TT1spmYuGQpuANe6DnqbAe7S9CHP4ZwqvRjxRXdg9cQw5t+ZDOY/UEcWDU+T6
         gDqFK45eLR8zu5LjgN6KQYTsr0agRoge8wa2LOG4+G7G7kAWlYsapRhdbNSvj3ahfRLY
         pGXA==
X-Forwarded-Encrypted: i=1; AJvYcCVAjbkjqI7OdIijKRPL6spwAfqR0Gm9x9yzDlSs5PS76eMXrm1bebIBz8perfVp/k9yRBDpqUnrEZbotGw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4bLRqDZKn6J5P32HF9oE7tkeVMD3kG+Aj75IcuC07tseHy5Wk
	PnH7I+sObhcOq/c+vLYWExQcxtZ6EKfljXXLoZm/O/haQVUAG36RL32grXYAxXtMv3orVYkC6jW
	BaDpXhS4Jar3HQjtnmQ==
X-Received: from wmsm27.prod.google.com ([2002:a05:600c:3b1b:b0:485:3b4c:3e34])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1c:b0:485:6bcc:87dc with SMTP id 5b1f17b1804b1-48727f27c5fmr3066095e9.14.1774560330845;
 Thu, 26 Mar 2026 14:25:30 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:25:07 +0000
In-Reply-To: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-6-fa0796fe88d9@google.com>
Subject: [PATCH v5 6/7] module: remove *_gpl sections from vmlinux and modules
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
	TAGGED_FROM(0.00)[bounces-12304-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 9B66633BECB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These sections are not used anymore and can be removed from vmlinux and
modules during linking.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/asm-generic/vmlinux.lds.h | 18 ++----------------
 scripts/module.lds.S              |  2 --
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index d64a475c468a..6f47c4c56574 100644
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
2.53.0.1018.g2bb0e51243-goog


