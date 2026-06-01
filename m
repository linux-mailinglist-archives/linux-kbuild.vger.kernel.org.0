Return-Path: <linux-kbuild+bounces-13459-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFsgFckFHmpRggkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13459-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:20:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE029625E43
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92AFC302769B
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 22:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE137372ED6;
	Mon,  1 Jun 2026 22:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zh9lYQim"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66553403E8
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 22:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352355; cv=none; b=UkT6kxmiKV3G9g/RIOk1x4lmh3c2Bsq+O8jNmxEmXu+wAiNxbDbXFoMjsuuBEhcHjS0ume56vsGYcyGok9amwMIqj8Yl+h7p5eW2One2GpRyB68eyT1hNc7GMru/ZMs5pDDY4YDI4UluRHQ5dlrkOYgmA0ydpN3C7wCHWseLeIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352355; c=relaxed/simple;
	bh=oG+5+MvKCfttHvIr7RJHu4qPlhBnYbFWLMYaTQcpB9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/Dt4YTO8YioWDsjYRTzmMKZJjxLshb3+mqNF5qFCvmYgJAT7L1vetsxJNN3WMsTpFsp1LV8ELtvMYq4Xy2uRqv4p9gjNBEHZNurB6ihfUTSKnuV8Sv4PsqUg+T45jEuYeRdvpGvs69H16msrYl5gU4W0maAE2s12rzrf+nLsOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zh9lYQim; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780352352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Jk+Ji88NKRy3bBjCiIFO7NHOyrkla3JOaTTOhexnXE=;
	b=Zh9lYQimv4wLuYe9tKNmjHMLspzdaZtTE8rr+sC+1vzWuVvCmeEWAUGaY6QgO3nqLYQyfN
	lcwM/Hjhi0XIKl7SqTF7q1eJujXf1sF/Q1xBHfs13kyA7ZqR0uzpRDN6OLuhSm3Dz6yIWw
	O0zVuuCSXCDC0CzQT003sib/jrTJDjo=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v1 09/14] resolve_btfids: Emit a decl tag for kfuncs with KF_FASTCALL
Date: Mon,  1 Jun 2026 15:18:00 -0700
Message-ID: <20260601221805.821394-10-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-1-ihor.solodrai@linux.dev>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13459-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: DE029625E43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Following bpf_kfunc, also emit the bpf_fastcall decl tag for kfuncs
marked with KF_FASTCALL, so resolve_btfids becomes the source of truth
for this annotation too.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 tools/bpf/resolve_btfids/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index 30a07ec4ebb6..f276200b1a68 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -161,6 +161,7 @@ struct object {
 	int max_addr_syms;
 };
 
+#define KF_FASTCALL (1 << 12)
 #define KF_IMPLICIT_ARGS (1 << 16)
 #define KF_IMPL_SUFFIX "_impl"
 
@@ -1309,6 +1310,12 @@ static int btf2btf(struct object *obj)
 		if (err)
 			goto out;
 
+		if (kfunc->flags & KF_FASTCALL) {
+			err = ensure_decl_tag(&ctx, "bpf_fastcall", kfunc->btf_id, -1);
+			if (err)
+				goto out;
+		}
+
 		if (kfunc->flags & KF_IMPLICIT_ARGS) {
 			err = process_kfunc_with_implicit_args(&ctx, kfunc);
 			if (err)
-- 
2.54.0


