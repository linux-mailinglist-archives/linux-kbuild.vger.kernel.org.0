Return-Path: <linux-kbuild+bounces-13396-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C3uESipGGrclwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13396-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 22:44:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA95F96DD
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 22:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFC1D3059FFC
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 20:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F306B350D7D;
	Thu, 28 May 2026 20:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oBDGIjHY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD133B6FC
	for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000751; cv=none; b=rGSRk2AGyIqqDD8qBV+LYjeGXePtHKSIoXgaKtw2s+4S3w5O+ytlbK290sJbAiIjzQmAnWOz/EqrBknXkHskGNzhhgwtUjARmhPGy+HIqqqmYKBK2ExOQ6EZn4JvBmefVTytNnWndvx66AED429mLhuNQAUK9MUp2sqfaTaQiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000751; c=relaxed/simple;
	bh=s7bt/YWGN9UF4BwynJHskbfVkLN9m3OOGrUY7+PeC50=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RSQQcPhqeqEOpeFuIz3xTTrDDic6NnTcB+TWVuSbGuIxRiaIL3a2kKTQcEjRaomDWrqOcSTxTsHkC4mhzsoSEhwtIU0t1E/P4BL49oi0RSwgGPCidyM/Ly/hT+ngzM50QGxB/XO2o1qHJdK66DBkxrZSFmeq5GBHfku7tB5+lHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oBDGIjHY; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-304b8d0ee63so3460599eec.0
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780000749; x=1780605549; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JV5t//kdKJl6/uVoDLYHDKpOZGmoUYcNXdk8MLbmZA=;
        b=oBDGIjHYq5jBn2+5cx6ALfdfxQBD2IipnYCH1rKFMrsJqex8opSd4u8EtCOgnoVTxT
         UM/saAFklWjculOoJMFXD4I+ELnw4bzjfXmufXwtrYkkubMtSa2lApPK4nkRWqwBmG79
         LSQ/QXjPxZiOVpdmbFhgWabwDRXu8nAhDyTkmB3tFwmxosVP+IoJBuIMsmKp0dYvjkud
         fdxJSwvm4RR+2+pIZPvaa7G8wmORclzZNBHWzJnlqBWueoKAieUsRMoK3ohGNHYrOwUJ
         Gpw/k80zd8OnQFGctZXvW61tD6SYhum/0uNSwlL/Ws8Ba3Nv3dqifBPBnlxklOHazReY
         e89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000749; x=1780605549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JV5t//kdKJl6/uVoDLYHDKpOZGmoUYcNXdk8MLbmZA=;
        b=ONj2K7M+fpGs5zNeLr3zigia5knMkW/mrLZiJcMLJiYCdbOr266PfAQmn5RSbDVr5j
         dOfRC8bser4X54NrFmYL0OMVYhLilhvdEQH78Gh/y9LR6mmY6mdfFn71vmpZKpwclDGf
         Va0+bqUO5t11gIacRUhD/7vrmUBGZDdqhCIVTlEVxgueU1K6NN0VPN7tQ9JEdme/e3t8
         1Xoq7V2ctKTqcT/WThH8nHtuFr/cNkPOP7MsIaMavGRNB4GI0T9YEPdC07pvvajYM6+s
         CFM7LfwWGsy5tQGryrhFr2y3MPJq+UVLWMY2lUh99OpfAGOd4/6P2K7qKSGL2ubzWzOO
         6ozA==
X-Forwarded-Encrypted: i=1; AFNElJ/suhKFBwZV4jW0haKJeKc3ZsjnNiSZph9fA0EDhGMIcyJnmANhkNJV0/kZKRyVtuLmw293QfdicFpD04U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0E3onmaAyLMoN10s9+vAY0G09uqf7eJDLox2rA0HKML/+aXJG
	Shf7MGJGrMNCVA+jzX1emzD/9DRtpUs7EK9JUyK17g/sXergrB1UrZDzKshDXRWj57ZkQQ==
X-Received: from dyrp25.prod.google.com ([2002:a05:693c:69d9:b0:304:ba41:e879])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7316:b0:2ce:25be:c8e8
 with SMTP id 5a478bee46e88-304eb17ed9emr25179eec.17.1780000749000; Thu, 28
 May 2026 13:39:09 -0700 (PDT)
Date: Thu, 28 May 2026 13:39:04 -0700
In-Reply-To: <20260528203905.687687-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260528203905.687687-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528203905.687687-3-xur@google.com>
Subject: [PATCH v11 2/3] kbuild: change --thin back to 'T' in $(AR)
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13396-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E1CA95F96DD
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
2.54.0.823.g6e5bcc1fc9-goog


