Return-Path: <linux-kbuild+bounces-13668-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FqFzL+fsJ2p85QIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13668-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 12:37:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141C65F061
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 12:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=mw28tyb+;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13668-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13668-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A132E30D7EA0
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 10:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02BC3F4DEF;
	Tue,  9 Jun 2026 10:28:56 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598CD3F8250;
	Tue,  9 Jun 2026 10:28:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000936; cv=none; b=At8f8RD46SUPmSntWs1ae974o/xccVSpE2znU73TE/CEILNccup6vvg5y/ns7LtPYO1va3IKjakHA3x4SDUgjNpa41yo4HQo5+2pPLmUqFtsiDafH3XMkV5RbF/NOllVY7nca/a2JW75UnXSWnyU6zSVHv+D867E7HADPwgITao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000936; c=relaxed/simple;
	bh=/ONDYrTrUG6BW2KW4rUZmO0rZPMpoPt29O25tG7/D0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fn3Ye91texLmHK6EP3rNkQJr47K1Nn17jeQFg1rAGyAf4J6RSiWAbb4Yl0UsJ3ACevMz3tr6sFj17b1JGmLwl9ycWwYvMVEkarEkf9QCoHuYcpxxnZJd17lkeionsUqw+cuzAzpqXcWo5xanPj7WzjlFWVKixpS5Srq3HBF2+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=mw28tyb+; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=ZqZiWYMRBhJgn+5l05iz1vN2Tz9npja6ASB3x8p8KbY=; b=mw28tyb+o0hmOTqwDHH0km/pkD
	32iR9AfzL4Q+7FD6UedEVkb29pfIJ0jxNzNwfPOLlWCN2Cmvlm+AP9sMFTHsTMeJ36Yx5X9p5OudS
	/QxC8lo0UVZW89lksZ+a8J2DL+fkyIAJpYhWC9gQ5yjnFskJZVqdaM/IpcmeLfxVJ0srHYqRptDYt
	AI+8Nik5MdChyF0VTA7ZkPCHDJnR8fKJ5SPySE2YEWeauywFfVduk073DU42U6YYIsTHY/kZpcgEH
	kMwsUz/VACIPuxH397kWTxhIJkXFdhodv2WEm4OAQOEWRwajnvEyl4iqX0IGIcXmIw3uqOpo00OBv
	eyU02/oA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWthQ-008Kno-2e;
	Tue, 09 Jun 2026 10:28:49 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 09 Jun 2026 03:28:29 -0700
Subject: [PATCH v4 2/7] bootconfig: render descendant keys when
 xbc_snprint_cmdline() root has a value
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-bootconfig_using_tools-v4-2-73c463f03a97@debian.org>
References: <20260609-bootconfig_using_tools-v4-0-73c463f03a97@debian.org>
In-Reply-To: <20260609-bootconfig_using_tools-v4-0-73c463f03a97@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216; i=leitao@debian.org;
 h=from:subject:message-id; bh=/ONDYrTrUG6BW2KW4rUZmO0rZPMpoPt29O25tG7/D0Q=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqJ+rQUb+E4gbZjxqfsNqM5MCxAmqlodvA3Aqra
 fw0XrKZ1R2JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaifq0AAKCRA1o5Of/Hh3
 bTI8EACutrY5N9gzeWgSEqrLZ17b49lhxEzErRT2D7iAWeI7XEGzTr22NHI9iEGpNYOWo2xxGLS
 cYfa3KGzmMRo8TWuGZZYAL4RAlPMfj7TtCm26N+WD7siDm7+zihdGjWCLxmwVXNfiRBWrbVTXLZ
 PhXj5/wN9af69qFQH7V6SFuRAN/kPUWAxbLJr+rqAFBVH+bFT2Kc3LWYliido/Rf+dsmZKVJvRl
 JOGvLazyMO9bRDMxLfvjCSa9mSQqFlS33JGGysvyl04XqQg+Pf6htFAfFjwtvk0554/xKPOUW8W
 CmHwsDWJCBonFKn6xpeIJarXu4uLi9IxEt5I6XM9pFCVjf0yJb62DB9lfQMMU4K26ILtM7q9PP8
 jMFa7sUrb26kwKzmIXimsn597WL8KQalfnrQvbEPNTRqfpHOqu0Vgp4TX+oyePiIr/jP/1uL2hF
 r/ZfqFcnJadazz95zMq7DBRhwhNlOhAc4qNE03XB9W4lI3qyIWZkpBs1EDbieibxx9hS24Z/Mqo
 +y5l+zypntkKLm+5uwYm406ZMGZ+yOcrpBp2XUQvBltkEfojW8AhpexvwDoHtkFFO9nuPtUy32E
 OVi1mdHRBoyZ1ORzwYeVeECikr1eiolx93DXXbKL92HFQqrzlHKke+O//UFEsAJnO7jOoQYFGKa
 03NUjwpqlAGVdhw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-13668-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3141C65F061

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


