Return-Path: <linux-kbuild+bounces-13651-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PMxWBvD9JmpJpQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13651-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 19:37:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3CB659513
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 19:37:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=d0knTwgK;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13651-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13651-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B105314CBA8
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 16:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91557372EE4;
	Mon,  8 Jun 2026 16:24:59 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70E533E35C;
	Mon,  8 Jun 2026 16:24:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935899; cv=none; b=NLN47rySaZU/cJ5DTrHdi7KH9lxrNaHxscA8+uTe9Ocxo+08vUY7t8K4vGhAn2cNSnP5B74nQmy0sahU7NbAsNxK+kCFf1HPfieE1qN7fL2PPil8DaLPA9/BcHmPnDP4A40C7Uk42toSSmkMq4RPQVvj0FzVNhdzUzGz14IA8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935899; c=relaxed/simple;
	bh=EAWSBZHUbvF+BebKTrcH7f4eYwq+NcrjSdvoq/taW5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNcCxhmuVEjnPEqgX1athgJDrX6SeTMgXD9q13EghrPGE6F4hfETe/U0VuRrcmbGM/RrOMVqUVlENcp4hn7WhwNBIWq+lm7Np/Gh4ANkhwRK3585YyvZfzZWVaeLoFdwnigvad0KJqhpQOa69QZoHs48PthIEjDjpW2P7OfWyWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=d0knTwgK; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=pBa18RzXk1ANKaCmnnGIArgni6qzEnHSHRPoGBtodfY=; b=d0knTwgKFs1Irwis1QYmbIPQQn
	p/1ChDd36Jk6g/tEJoXXt454yKKKLBlUgBmTR9i41jFgsigJIUTr972W70Ga0Vyy0MHH9cN6sWtei
	4alK//msRye7FMEqV6VVF2gpmGJvxFYrdqF0i8XRjCorjmNFBKjhQPnni9T1Fmu7E/wC3T+O/3Kq6
	N9GqqcS5TYQdhVUyn3gTkT0srXdU9suV8EJtUFqbyNC33EG0Y0fucBB/sk5jT0YpvpPt9qC2KPIaJ
	+y8x8B1Z979qRbZLZ0B7JZhfd1RqnuYSi6a5cgf7hc/ydN4uf65AjwmWgWSgaMLl9T62XeCe25oJp
	yh/9w8rQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWcmS-007kgA-2p;
	Mon, 08 Jun 2026 16:24:53 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 08 Jun 2026 09:23:58 -0700
Subject: [PATCH v3 1/6] bootconfig: fix NULL-pointer arithmetic in
 xbc_snprint_cmdline()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-bootconfig_using_tools-v3-1-4ddd079a0696@debian.org>
References: <20260608-bootconfig_using_tools-v3-0-4ddd079a0696@debian.org>
In-Reply-To: <20260608-bootconfig_using_tools-v3-0-4ddd079a0696@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3059; i=leitao@debian.org;
 h=from:subject:message-id; bh=EAWSBZHUbvF+BebKTrcH7f4eYwq+NcrjSdvoq/taW5o=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqJuzK5LPT66nv+qLpXluaKpNYu2BCwNRJv6Mam
 QcnhQFA1SOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaibsygAKCRA1o5Of/Hh3
 bd6CD/wK/q58rEK8FWKyE7pAyNDnoOTF0e02qaAQAWYIEtoBQUtwxsRg82rcem8X1610p0t7lYS
 wP1zMB0H0hD5oPBqWpsjdPHiUTGQZ4ncxu+KRBIA9ZwKeOf/krE1f79xkceshMhEwViAb8WcY+k
 QBc/IgRGWWAHwxvGgvH9nOpvST4m0aoZuN1s6AzzUbZB6DR+cOIwk36XVKwrdejtbdDdVnWVdTS
 j3rox/vQ2IXEDIzEcS4fht9kW8jL6Ihk8u6Z8ZnQW0p0JHRa070pknTNIwe4qivQtwx9X6bYSAc
 1Zg56ArgRLyXNc0circUzxoj7DhKbHjVCOEctYeq626cEpIWgC+5QEC+BJWsV6Jy7TXFn+5CI2X
 jULQSwxMP6ln0MTYx0dEbRulqcVGndm/G5u1++Xq3lJO8yjIUrKkvhWQX8Z43AttiI191KnFrcY
 KwLOw0dfVKgAZA1cWsEtz316TWEO0da0h0JXiEmJPLVdmbs/MGd17hlSsQw0fcjyPt+oVaW1HPC
 ydfnDgzuJOt+lVwCo2HHIY+YOSdJj+/7aJOI/dCpMgEOfPRhHbevw0gk7A8xNIQwf4shMeKbonG
 uTSrf6q2Q+gejvzyP685r4I59bL+GpDuVnFQjgB52kRfpDl4uWiWkTU0lJHmMsGrK/sMKGVw9MH
 reVCFgdMuB65i1A==
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
	TAGGED_FROM(0.00)[bounces-13651-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 6C3CB659513

xbc_snprint_cmdline() is meant to be called twice: first with
buf=NULL, size=0 to probe the rendered length, then with a real
buffer to fill it (the standard snprintf() two-pass pattern). The
probe call makes the function compute "buf + size" (NULL + 0) and,
on every iteration, advance "buf += ret" from that NULL base and
pass the result back into snprintf().

Pointer arithmetic on a NULL pointer is undefined behavior. It is
harmless in the in-kernel callers today, but the follow-up patches
run this same code in the userspace tools/bootconfig parser at kernel
build time, where host UBSan / FORTIFY_SOURCE abort the build.

Track a running written length (size_t) instead of mutating @buf, and
only form "buf + len" when @buf is non-NULL. snprintf(NULL, 0, ...)
is itself well defined and returns the would-be length, so the
two-pass "probe then fill" usage returns identical byte counts.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 lib/bootconfig.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index f445b7703fdd..2ed9ee3dc81c 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -427,10 +427,18 @@ static char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
 int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *root)
 {
 	struct xbc_node *knode, *vnode;
-	char *end = buf + size;
 	const char *val, *q;
+	size_t len = 0;
 	int ret;
 
+	/*
+	 * Track the running written length rather than advancing @buf, so we
+	 * never form "buf + size" or "buf += ret" while @buf is NULL (the
+	 * size-probe call passes buf=NULL, size=0). NULL pointer arithmetic
+	 * is undefined behavior and trips host UBSan / FORTIFY_SOURCE when
+	 * this renderer runs at kernel build time. snprintf(NULL, 0, ...)
+	 * itself is well defined and returns the would-be length.
+	 */
 	xbc_node_for_each_key_value(root, knode, val) {
 		ret = xbc_node_compose_key_after(root, knode,
 					xbc_namebuf, XBC_KEYLEN_MAX);
@@ -439,10 +447,11 @@ int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *root)
 
 		vnode = xbc_node_get_child(knode);
 		if (!vnode) {
-			ret = snprintf(buf, rest(buf, end), "%s ", xbc_namebuf);
+			ret = snprintf(buf ? buf + len : NULL, rest(len, size),
+				       "%s ", xbc_namebuf);
 			if (ret < 0)
 				return ret;
-			buf += ret;
+			len += ret;
 			continue;
 		}
 		xbc_array_for_each_value(vnode, val) {
@@ -452,15 +461,15 @@ int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *root)
 			 * whitespace.
 			 */
 			q = strpbrk(val, " \t\r\n") ? "\"" : "";
-			ret = snprintf(buf, rest(buf, end), "%s=%s%s%s ",
-				       xbc_namebuf, q, val, q);
+			ret = snprintf(buf ? buf + len : NULL, rest(len, size),
+				       "%s=%s%s%s ", xbc_namebuf, q, val, q);
 			if (ret < 0)
 				return ret;
-			buf += ret;
+			len += ret;
 		}
 	}
 
-	return buf - (end - size);
+	return len;
 }
 #undef rest
 

-- 
2.53.0-Meta


