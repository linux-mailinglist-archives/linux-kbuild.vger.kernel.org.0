Return-Path: <linux-kbuild+bounces-12298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Dy+MYykxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12298-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:26:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2A033BDC2
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C1030BFF2D
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB1F346E43;
	Thu, 26 Mar 2026 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A66LlWSn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C143A7F5D
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560113; cv=none; b=T+nU3dC9fiqr9Ee7dIn6BXXq5ng+9I+QRwYynmOZTQaVY0cUoOb112VHBLMqIWtULJ7N9MK0ZihE8tAKaxvzHrQlMxgzb649rkUBsBHqxEwcGaiYte8/3+xMttKjixLTGvgLtR6ILcs12RGMs7gwfoJud9OOFQazq063cifOW+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560113; c=relaxed/simple;
	bh=YJ12M66JVdOPpUyl/ZnRqsezMQxQSFmDChR9hjNAYhg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UANVIDV1LmnxDhdN1IpLLVTq7JTExUuabulIIjyaJJZioTHESETB7Zo2ZHj16rTVwEY9dfzdCGMRBlBcpfYg1YkzjunCIASZHxjLaTMYdPV4DBvJafdDdyN1yWcS+Kv5WTWconLYPOgx+Lp8dVh+ppRiyekhorTq12FYISkM61k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A66LlWSn; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b9820e80ce3so105135366b.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560100; x=1775164900; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGYiW8Rqw4kRzbw632ADCfNRFJHG+c2ihwrVrUq2DSI=;
        b=A66LlWSnTmXuhiNodjP1e0XL9V+0cM3AjT/FGZ1x6y1rc7R2YdvFKisvEF6seR+Qhh
         8gn7ZGeYWattf87yAWHl7vBPdJP8w7dcmzDrPU7F7BQWAaO++QNMtAz1z3TWBe7WZsUO
         n18KBfH1Pbf6rYj9iKRFfR653P2D0nPoa/Nqr3OCabhUQDtjMvb8dQPUB7Et0WWFDYZb
         BDs9HGxUiClz7kTC+JS7CcrOdYzk+YIIkzwFgM5pSO8tDO31uu5H3p3Ify6ppNwTUSjc
         wxy5MBGUTwQotH4vDU6NBjXpDNo1TEHAMuKgE279zdN4zzXU/STqmm7Cs63N5mt0GZFV
         Phlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560100; x=1775164900;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGYiW8Rqw4kRzbw632ADCfNRFJHG+c2ihwrVrUq2DSI=;
        b=AE4m7HfQYXFCQVSIqsEcU68yHCJ8LouNxFF75mJXMgSW3OjQKe+CGIBwK+TBFcKhNw
         xmzbuYXcZF5UPtULgaF3RmwHQZnD0MeHyDnSJ+gW78Xskw+g7OxgrFSC8LYbt5LxgXIz
         8WgGPiRjmkD4Tff9MJO+nvkmLOz4+e+30fCyTjVOfO0Z+60J9IYK9DtlNE4DR6qGAJcU
         IzVD0heHhqfxswKz9e91UmoMpqYzRhq4beL+d3nzsjjMmhcqGkJJI4n3flM61uvd6B48
         Z0dE46evnEvMjWEp4vu1SML8C0hSuISC5Ucf/Ybwgm5f5w64IM3Yq/Nyn32z4TjE6yDb
         Eomw==
X-Forwarded-Encrypted: i=1; AJvYcCVQyvZlZKpXGjUgrvjcwoGMTmvN61g+xVWcjDgW2nVCESMa3xGcJKzlfFgGI6XhXWDetnvl18/vWUTeuxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2jgE8OUQHEkC8KZ1QezYRL1les93zhLzWu4mSn3TYXS7/2hW
	5md09eUe7Jl73ss30Ls+4AqSPpU3586O/DdH6P+JuLq9g5LGD84chNQrSYwRmF3Ls7AQCZylixh
	ZGxE46CxH4OYt3FmP4A==
X-Received: from ejdao21.prod.google.com ([2002:a17:907:f495:b0:b94:2007:4d01])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1c1e:b0:b9b:38d4:2cea with SMTP id a640c23a62f3a-b9b5036d57dmr1187466b.23.1774560099877;
 Thu, 26 Mar 2026 14:21:39 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:21:34 +0000
In-Reply-To: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-6-455cd723dddf@google.com>
Subject: [PATCH v5 6/7] module: remove *_gpl sections from vmlinux and modules
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, gprocida@google.com
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
	TAGGED_FROM(0.00)[bounces-12298-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: 2A2A033BDC2
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


