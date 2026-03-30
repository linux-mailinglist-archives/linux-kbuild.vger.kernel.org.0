Return-Path: <linux-kbuild+bounces-12361-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEJzFM+wymkX/QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12361-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 19:20:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B63F835F3EF
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 19:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D6BA303C4D7
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 17:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB8F3DC4BA;
	Mon, 30 Mar 2026 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I253OkD9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F213DC4C4
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891169; cv=none; b=i/FAIBwhmpCvGsSoqgwOyM1U7E/8PWIhy1AI8eaCOoHgiVzSw+K11CO9Pxro3sxOIq9CnPnEpgAM6hMryESEC0S0ueChSzO4EPViZDRslSMrG+4oA3snoylyu7TCS9SXQpToazgw7+RQ8OD4FAgEdBZUbJy8N26CWMAS/LFfO24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891169; c=relaxed/simple;
	bh=1dn6wx0kE3uz2URoABPgvTVUTzuMBnxMjei6SlfoEfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GdrB7Ung7xtla8DNxN+Pn2EG+mauMgEpCQvPNsIWB8BeswHZt9MMc3vArP0XgFPk4JiMzVvEwPCJtqdGQJEaEQQ0gcYi4a+dESOPpVR0ylXhntF96o07nT51lJVk6DcR4Z05RedbQN4inipPW2bUzV16SKBHCqMVcVs1MwOGsNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I253OkD9; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c17e14e499so34836957eec.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774891168; x=1775495968; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=I253OkD9h4bAvXnJpjMXX9LkRD1mqNRbPa1bXI8qrcysmCVX/sXLb925Ac3vAQN4T5
         NHkqj7U3+4756zf8Ksn1Mh6vYeJDPkmwryKe3pEp69lTOhngkO2Lf2H60hUoZtohZpVO
         yAP77Ldi3XZjHBiY0+4A8DO8mrA4XGG+uEH4E3VSlVbodRSf2SnBabSmLoUj78n8t6/H
         6cAMHSeZNj6tCtsmYUDDUZw+aOFGrpPq5T+TSLtK9nXlolz7yvd8J5RvGai00GY7l08r
         j5c6CBb0kvJ9Cs8gZOlxlXMxR8osFABwjfIwWqKoMtQul0Ed7Q87wB140T68isuPvHvs
         4OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774891168; x=1775495968;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=gBoethOBcPNIDKneYL3B3+w3LSMnr77wGu/EPhdK5aQrkx61J2JhCdxukiENfYukwK
         mL9xIjBNpdyMdNfivWmkoo6pO3zU/Houo2DCtQrKJRJCCQ/VKPt1IQE6a4d3kqB8GwSK
         bwZfTVIeeKk2/XHzlWewOCCkifp70tym3xLi5VqHhGHQpfYHtqZDCKXua5EfRWIH37lb
         3qCHpM/l75SPP4mkawbufFfZdKmHG5fsroeWwivLUmX2vzVDZgmm5W5l/v411EmL+WoF
         468kXeWD0hOprzugT+OVamDhSIdv3VsDXpEp/PzViF9SV2Lb/JOGYBx/SubvmHwvuAR0
         /jKA==
X-Forwarded-Encrypted: i=1; AJvYcCUYSTTUaUDfjy1PRhHgJj1EFGuqAyJ84ArNd4r3Q8SCW+DQ5tTD9mRZgF39SocL6/RE7DdJaORLZ4uwugE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCsIo7GPKEaAxSoxN1VDZDKH2Wa2RCStKO2V8D+KrFUpsTWaya
	yph/nAxyQPhgaKRRYzmcAcBOtyJ5HP1uPg1rMQu0vYFU+xvab9QitkAgvmMcYUKCcMCKaw==
X-Received: from dycna11.prod.google.com ([2002:a05:7300:ea8b:b0:2c5:bc3b:f9c2])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:bc0c:b0:2c6:31f0:a018
 with SMTP id 5a478bee46e88-2c631f0b30dmr2722363eec.22.1774891167324; Mon, 30
 Mar 2026 10:19:27 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:19:18 +0000
In-Reply-To: <20260330171920.2026779-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260330171920.2026779-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260330171920.2026779-3-xur@google.com>
Subject: [PATCH v8 2/3] kbuild: change --thin back to 'T' in $(AR)
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12361-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B63F835F3EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

The '-T' flag in $(AR) is no longer problematic since the minimum
requirement for LLVM has been updated to version 15. As of LLVM 14
and onward, the '-T' flag functions identically to the '--thin' flag.

Fixed the issue seen on IBM Power11 System:
  ar: unrecognized option '--thin'

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c1ecae82d@linux.ibm.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.vmlinux_a | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
index 9774f02b43b2..650d44330d1f 100644
--- a/scripts/Makefile.vmlinux_a
+++ b/scripts/Makefile.vmlinux_a
@@ -10,12 +10,12 @@ include $(srctree)/scripts/Makefile.lib
 # Link of built-in-fixup.a
 # ---------------------------------------------------------------------------
 
-# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
+# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_builtin_fixup = AR      $@
       cmd_ar_builtin_fixup = \
 	rm -f $@; \
-	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += built-in-fixup.a
 built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-- 
2.53.0.1018.g2bb0e51243-goog


