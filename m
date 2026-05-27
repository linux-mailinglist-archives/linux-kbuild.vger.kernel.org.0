Return-Path: <linux-kbuild+bounces-13366-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GHZGhwfF2rw5AcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13366-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:43:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 210DE5E7EE5
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FD453054FE8
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F2643D500;
	Wed, 27 May 2026 16:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="OztPd8iv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE5C43C05B;
	Wed, 27 May 2026 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779900144; cv=none; b=bQ81r4gSxOI2EJnamtSlphJvpj6muvujuItrjhgzGsNjKuvPUjxbrkqpU2ls2X3IAeycOALhu4zLHxZ/jHPDayRr3glLJdlbJnpFZOFIPasPBZh2OsL+W9+BFkqX1f+UrZArWi+IyjI8GzJT7BPLsNFR9nIqq6AL2DF+2sUSTeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779900144; c=relaxed/simple;
	bh=X4mGDA4esgRIQEJF9sxare2igjopQXrRYxDQwzDdu+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djzGKOYWW4ngfnrIZOs1/cNgAN+pnsBQYj1xl2l6A8OLtXzEN1/qKzZyW/ZreihZ+LwBSyvORB/iPEfO1AyGG++ePSnaDLrL2ADH1DV24g9JuAxcFj6UlkX84zbIaT12Bc56c9kb9bVdBEtZ5YC/fnUNslm8QyV3bwztlJMm11s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=OztPd8iv; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=7moABFLCmmNZhtc/dXiLfbR8Q2gsMvAbGjyVpQo9sZ8=; b=OztPd8iv01fqORXxh7GXcephJp
	iO9o+j3nE6Kj6fJ7pkZBueSO2uEskHI3TqkorbppPzfJvzuwZ6Eqdii5d+jImoZ5QCW+1ahiyFUpq
	BaRHYkIp1VLNnCCs0gqvY3SBblIOAjW9YiqKbz/g7alvSpCZSaF0n55GLo8gNHYuhJ+wdjjcg4Xxc
	eBVctELQrrVS1Zx1krEERmc4SYHd87e0p6QQQa8E3N3XpMl9pWwYMRSujoATJaOrw/cIpUSa+onq3
	CyJIThohn/RMVWz7qX8ToxXf3HlYgwLXKrwAlNH8iQdOj8Gl09Hm9pG8ywx/O2xBe0TA/j33tPT7r
	LtM4OjGA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wSHKR-003JPd-2h;
	Wed, 27 May 2026 16:42:00 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 27 May 2026 09:41:34 -0700
Subject: [PATCH 1/4] bootconfig: return 0 from xbc_snprint_cmdline() for a
 leaf root
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bootconfig_using_tools-v1-1-b6906a86e7d5@debian.org>
References: <20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org>
In-Reply-To: <20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org>
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
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432; i=leitao@debian.org;
 h=from:subject:message-id; bh=X4mGDA4esgRIQEJF9sxare2igjopQXrRYxDQwzDdu+Q=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqFx7NaP8LXXap85VkwAMoYdAKK9Hv6uUYzHt9o
 +OUyd6BqjaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCahcezQAKCRA1o5Of/Hh3
 bR+XD/4pL22NX+nNoRVaxZF+jQWcUVTth6DWOz58O8RxeC+Fp4X8JIKXnGky0M/IQ/Nf5bWi7i7
 6dWAmqN7IMzqE9bQEDijwiBQBOsG3s6Vdg0ht547uoJwGrMU6xJEvZignWIxKrccxrd9J7merMq
 8V8DibN9wQe2qNz3JRh9R8R+EQPqXsJUPu5zisJXAPuBqKYquAmjiQ9o0DPV5KpN2QwyHDGjYxx
 fYSlJc1ovQ0PQddk4fGXYl67+dApkvxqGgur2WMK9GYo+TnhgU61QWfWGJ6WBVwhNTb9oXv33hY
 1hqtrrHdBaYnG8gHj73uOZfoOcPangBnxCClgXwRUpy5cgiEGrddsi5STCBqVnR03YfJnZs9pHe
 p9dhLIN9Eszsx+jwNOK1yibfmaKmdD6rzWxhjewGP5qivI5alJZrlWtUz/09shK/53luTxMs60M
 B2yxYABpmzv5jxaSTyUsohfYs5IdOIoSy9NGJ/HZL+BR6UcLPpOOVq2UOaTC1SwaBdMSUtkawFB
 oTPKMBARVUjq1DAa63nfT8qGuMKXuHhAHHTjnvADPqOLlJWzGAhoAnMstW4/8pp3eHQWxVowYp/
 6cf+X9a2OX2J3jvAlRr9AAB2Ao65lEokB8c3yBDp+Qb5VTpW+vrwJwIvRHrzkzSLpt6tKs5GNxR
 FtQD9GmmUKkMfAQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13366-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 210DE5E7EE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Returning -EINVAL when @root has no descendant key nodes is a quirky
result for a renderer: "nothing to render" is not an error. The only
existing caller, xbc_make_cmdline(), papers over it with a `len <= 0`
check, so the misbehavior is harmless today. The new -C user in
tools/bootconfig added by the follow-up patches propagates the error
and turns an empty "kernel {}" subtree into a build failure.

Short-circuit the leaf-root case and return 0 so the rendered length
matches the rendered content.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 lib/bootconfig.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index f445b7703fdd..3a102c9122f7 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -431,6 +431,16 @@ int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *root)
 	const char *val, *q;
 	int ret;
 
+	/*
+	 * A leaf @root (e.g. an empty "kernel {}" subtree, or a key whose
+	 * only child is a value node) has no descendant key/value pairs to
+	 * render. The leaf-finding iterator below would otherwise return
+	 * @root itself, which xbc_node_compose_key_after() rejects with
+	 * -EINVAL.
+	 */
+	if (root && xbc_node_is_leaf(root))
+		return 0;
+
 	xbc_node_for_each_key_value(root, knode, val) {
 		ret = xbc_node_compose_key_after(root, knode,
 					xbc_namebuf, XBC_KEYLEN_MAX);

-- 
2.54.0


