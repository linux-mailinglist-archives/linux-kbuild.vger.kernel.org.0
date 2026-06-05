Return-Path: <linux-kbuild+bounces-13590-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /5ENJOS8ImrRcwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13590-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:11:16 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E98DE647F8E
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:11:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=nygw1lug;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13590-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13590-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5704C302ED72
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 12:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471F24DB551;
	Fri,  5 Jun 2026 12:04:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D101B3B71D0;
	Fri,  5 Jun 2026 12:04:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661047; cv=none; b=rv+KoZByOy0I+itOJvjuzJ45wzLvNaUJ0xqInzxAhDbyKcZU5dgcM+VDJYvPB6qbzAI8Z8ZVEoRWtrhuyYlUsBtZ9LUtCIMV8LZy/jTQaPmPXkLNJS3Wz549v4xvaFuBm53FJiDKS4wQumIytTL93pLfjiq7P8eb5JkIABEcLhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661047; c=relaxed/simple;
	bh=BXM/BFTpXoNCSM4CwFdmj+8+KMuxV3hQSRoT1Izhr7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bHV5E8FmVcK/guaNu0etbWojcw1DZUTQlEHNY6hG9iDzOnQsVqN0NnUMfb04M4SLF/9YMrAQewZSG+DD8FCPaIEcf8OGUnAyquvPhqrxvCMbkZwqYNSgfZoLaS8xrd2xM3yLseC2fIYxpvRr8zbuJ7stHdcP0UDLRfYok8jempE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=nygw1lug; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=YgzIlvI5ADPZKpxArpAL5pQC0m+dtwWvGtJdhHuopts=; b=nygw1lugL1LkfbD3y977OiGZQQ
	5Vtj9DLyXl70In7mDoEgs/znfVA4arJnbuSg9dnsY/yy/VzWVaqG7xm2khPwsGqJ/sf20LwRFxpno
	TNoUwaRX7rKPsYbvaLiC+odi5ti444Ocq6wsJfRuOwDmS4PsR+rBfk7ZkCT3aH9jRtw3ooP8aFPgZ
	Qr5JMLRDSqCifCqsU1nzlJeX+et34Q7A0n9cGJODSYRrKYaR2rb6vMPToJn2RtuE07MTwU7oJYzTp
	IZ2pATY8pfb4EYoEyRl4FNZ9hIJbi2T4g4w4oaQZCcBSZkc+e0iLRYKwCpRnd7Rw6K9UbfInqapCl
	T/RUlJ3g==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wVTHL-005HHU-1I;
	Fri, 05 Jun 2026 12:03:59 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 05 Jun 2026 05:03:33 -0700
Subject: [PATCH v2 2/6] bootconfig: render descendant keys when
 xbc_snprint_cmdline() root has a value
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-bootconfig_using_tools-v2-2-d309f544b5f7@debian.org>
References: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
In-Reply-To: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=leitao@debian.org;
 h=from:subject:message-id; bh=BXM/BFTpXoNCSM4CwFdmj+8+KMuxV3hQSRoT1Izhr7c=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqIrsfRax59+wfTKP/O7+/5PyZwhSzfjN4RSWfM
 Ik0wn+jiTKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaiK7HwAKCRA1o5Of/Hh3
 bUv/D/9Tt0I9Rwc1PXTI+uDSz9VNHFCyjd8vhaaA+AfUGmFjRMT9J2r8k0r3ilhjXvt1/Wf/vNb
 zd6Sd98nqYxRtA8HjD6CVHrw0ehp+pgQL/hn6kMdrgL2OJEQAr+b7aIZVmhLHned0t8LXAmuZa2
 2Ey7tezfvrqXuIgptRU3z/O5JExY38mckaQzlMcf7XPJoTI0BQDIeBlMUzf72OyDJqku4CMf2Oz
 vPnnZE45wif0s7zCTPXVK7FsBnT21fCExJPkoyTiPniq5YJOu97GH1C6CuDLWrRq2JvNGpqtho+
 jF5S4DU/zzKlaFzeQJQevG1sYsAKUG1aG2tDkZ+DnDzdQrL2SMs2hO2DH4D2AUwf43WXWrW1CVN
 tQYyLxH4xABMZzZOQwQNTVy0Iu0NKt5ExZGMQoGm5eCL+NRHWqULs4fHTvVUZvfZBY1nTkIXhWr
 9K+5DOJ4RsDzr3oTH4x/CX2dCBpS2llh5ZW+alU58HE7KWRUIi3Rv+wigwmLeOAb8LuoHBCwM3z
 gBphTZ33/zBiX4+7ITfBIfH1EvGbDJ2OB6FalIuupxwphHqiwdTLKG81daFBJmaBGol0fjQlhcX
 uivO5DMHFF8HTYtaHALaSvG1BTMIcYl9yjCSjWe13grgIXycc6sBYsOgEVbtxvqDwEtTUYtsuf0
 dKgmgfg4Hs97d7w==
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
	TAGGED_FROM(0.00)[bounces-13590-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E98DE647F8E

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
descendant that the pre-existing code rendered.

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
index 2ed9ee3dc81c..926094d97397 100644
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


