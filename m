Return-Path: <linux-kbuild+bounces-13789-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TfuwGuaIMmqQ1gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13789-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:45:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7876993F2
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:45:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=f23W7XUl;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13789-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13789-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD58B3046997
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 11:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB863F58C9;
	Wed, 17 Jun 2026 11:24:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75933DC87A;
	Wed, 17 Jun 2026 11:23:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695447; cv=none; b=G9QyraLn5RaHckYNYuYQZ6MlniwlGdNe7NCGcowTEhX2EFKs4MK5j274eBvXmmam2YeBRMuVildFLsKk7XBphe+YB8HpRRDkwhh6pdPKLbOQjMahiJcGIPHoBnDAkzyU0qif/E/pRfpMW3D2RSELxOpUrzTMtWg+3ibOwc0jX7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695447; c=relaxed/simple;
	bh=Xdn8aTKfLHRCFT8EStga2lUPDXTNGyNHtqyDe2SiHbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bF1Cb5su/07bqI76PeS7pPFGQDBj+7FR7bIeQ+WaVZHkC+3VG7kHC62Qffrqitrk29PmHkjbDKMhR0ri5cg3ee8eqbv2Pd2StOJJE/KqJHVQ0vhrXEN2Qn/swi5hN5CtCdOMaoN5+tLOM8S4AxiVQeDDQKLhNneDBkFBzJ5ocAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=f23W7XUl; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=YS/E3SNm0maYx/CMNAdmU5c9HXJXz1ONrwxfiTO89Ec=; b=f23W7XUlO31wDg61KEZlZae78m
	+KgIW/0PETOTEKFPZQu1NIiz5Cz1y2ny8UK1ZmI41Ff7w46xvbEnD2K5hhXorf9jgVPsjOGWXu2KN
	1mM9BdYRH3g+Jk4rhsWTo44iXdBGCtjQk+/1c7n5HP73LUm3eKpu7Rddq/VLF2FXEXNgupEA7oED+
	FMQ/56vbedTGErca+k2SUx8O1yQ7lzj4GZ0Ne3SW3JeXqlEfP7Mja3yvzZGY5qi3AlC/6cpZvZg+Z
	yV+ip4yB2i240dnMwawbiMtQx3nqAZMZ4uKS91tMroP1z7lFfgngW7XRbnklgXFlaP8aHct35q8OX
	ds/YktRQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wZoN9-00EaFZ-1w;
	Wed, 17 Jun 2026 11:23:55 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 17 Jun 2026 04:23:34 -0700
Subject: [PATCH v5 2/7] bootconfig: render descendant keys when
 xbc_snprint_cmdline() root has a value
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-bootconfig_using_tools-v5-2-fd589a9cc5e3@debian.org>
References: <20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org>
In-Reply-To: <20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, 
 Nicolas Schier <nsc@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218; i=leitao@debian.org;
 h=from:subject:message-id; bh=Xdn8aTKfLHRCFT8EStga2lUPDXTNGyNHtqyDe2SiHbg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqMoO7wuNlIwd5S2Y0SAi2ZlXZJe3pRaAdwenXj
 Tx/BdsvXxWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCajKDuwAKCRA1o5Of/Hh3
 bVUqD/9QOJycgv5dHOcJqPSs7q+0tAt/dXE8yNFBl76LZRrHfUB5OKBpw5nh2uQWNJ23BIjUbS5
 BfTTqmrXstrML/U1N2PZYLOW4N15T1IlCcOQ+G1U5mJ7xO3rqANRdZ6933MjR8CYmrmLZ4cQLF1
 G+mX+LcV5Q/A9TfA08VT6mxWAuP+iLu3rqiVTVnlohXBgchhyIXYiYreb4RMSzn9Oi8RBw8A53R
 xFpI7Efe7BIPlwml8JtuT5Ykg0Hb3acaR2F0S2ML0G8LoCW6wI6TWDxvPXL9exuWgyzQ+SKiIns
 /t9NCIiirXFvn/F/l/qRJWAI6dbV83jEIhXos+wLUG3R1vNB6Gj3AlUe8xmpYfgfAQIjVrstgJb
 KPni8tVkG4ngn3ygJkzi3u12I9f6W6qMDZ0aI6dHKSPxk8IH3H7co99sN79esnvcfuhB2wJHNvF
 1u/3o3F9n0LL5iQoym+nNMjRL3Obp/VaDBTCtJAggUdtoii0gonAHCBxna2o0diWC1+Nu6YTNqe
 VqC+iQOIv/EV0k3du0Njn8B/FVLYlfCHnfmAXaSPYZULRj/W2T4aHlVAO6J2sginvjhDdhVwCvF
 C2q8cNH9YVGxT5O7gXGCwRVkT6JZFTfHlvOIQeO1robynLVLEGKp64RIgJs3KZKt6m9EjVINfBE
 qA0bFJRErB2AnKw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-13789-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC7876993F2

xbc_node_for_each_key_value() walks to the first leaf under @root, and
when @root is itself a leaf it yields @root. That happens not only for
an empty "kernel {}" subtree, but also when @root carries both a value
and subkeys, e.g.

	kernel = x
	kernel.foo = bar

Here @root ("kernel") is a leaf because its first child is the value
node "x", so the iterator returns @root first. Feeding @root back into
xbc_node_compose_key_after(root, root) returns -EINVAL, which the only
in-kernel caller papers over with a "len <= 0" check -- but the
follow-up tools/bootconfig -C user propagates the error and turns such
a bootconfig into a build failure. Worse, short-circuiting the whole
call on a leaf @root would silently drop the valid "kernel.foo = bar"
descendant that this patch should render.

Skip @root inside the loop instead of bailing out: the value-only entry
is dropped (it is rendered through the "kernel" cmdline path, not here),
while real descendant keys are still emitted. An entirely empty subtree
now renders nothing and returns 0 rather than -EINVAL, matching the
"nothing to render is not an error" semantics expected by the new
build-time caller.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 lib/bootconfig.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index 2ed9ee3dc81c7..926094d97397e 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -440,6 +440,17 @@ int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *root)
 	 * itself is well defined and returns the would-be length.
 	 */
 	xbc_node_for_each_key_value(root, knode, val) {
+		/*
+		 * An empty or value-only @root (e.g. "kernel {}" or
+		 * "kernel = x", possibly alongside "kernel.foo = bar")
+		 * yields @root itself here. Skip it: composing a key for it
+		 * would fail with -EINVAL, yet any real descendant keys must
+		 * still be rendered. An entirely empty subtree then renders
+		 * nothing and returns 0 rather than an error.
+		 */
+		if (knode == root)
+			continue;
+
 		ret = xbc_node_compose_key_after(root, knode,
 					xbc_namebuf, XBC_KEYLEN_MAX);
 		if (ret < 0)

-- 
2.53.0-Meta


