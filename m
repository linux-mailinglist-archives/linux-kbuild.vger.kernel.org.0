Return-Path: <linux-kbuild+bounces-13672-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LgCuJG3vJ2pF5wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13672-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 12:48:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B30165F1C3
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 12:48:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=mIzDSQGe;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13672-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13672-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 989E0315473A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 10:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C77F3FBB66;
	Tue,  9 Jun 2026 10:29:16 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58B63FB7C1;
	Tue,  9 Jun 2026 10:29:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000956; cv=none; b=r4xDznSZbZsXmIN6yghi/80NI7TO9n2cHQ+xWpHrsZy17wNghX7nT4MSm6cPWaW/7l7U5ew5eH3nt6c5pHclMRz4MwHfLBTd/mef8LGvWyCCdQJGsTIRiN0fpwjUAwTemmZX44/zQIZ4PW2yvOsibGdcYVzcUxoEUgLeRyyTFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000956; c=relaxed/simple;
	bh=h/vGAsLSFlFLbB9EivE3jumQghH26zu5MVDcuDh9naE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPJRStm7/fJYq683bbOipDZWcvZO1KqfeQuPqitY9eqTrIHJEqEmI9jqOb9X1FOIwHkqy0YTjqlEuYXdTgOnTTyULLtHhQf1xX5Z8b/ytJHyXSqlfqt1B1Yda9bKJ1JDDvkmXs4qE8u48HjNNR71AE3UD1vUYUV1HbfsGJyZwmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=mIzDSQGe; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=apmH4aF4GLvmL17L8inCkFVJlFeLn4g5Fstmn+K7+VI=; b=mIzDSQGeY7DPHhJ5ZiefAlKUNa
	oq7GcFBjJqA4PUE8FSqPBR1/SS3yruLF42P6VyaEgyWZU0m8W5cr/segh2zx2sHQSoLuQvU/mjVUN
	g6Nuju5LKJhIarasjiRx/zr7NZkGfqCZQB8VPPFacINAPnGdshx8KOkr9po+ZBsrwECh0KYMCP/iZ
	ohVVS4KKzm2Z3spE0TtZlI24/BT3/FzxCV4If9AVj976kNzC4lSCXuodXsCvtii/xVKRUvQJTMK+W
	vZDrxa/M/RKeSrGxLs8ll9SyRvBpkL3mtq2QngwPv6p82/JfKKmXWiRGGoUAUn1k/dhnpadbOTxfo
	gUSJS8fQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWthk-008Kuw-0Y;
	Tue, 09 Jun 2026 10:29:08 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 09 Jun 2026 03:28:33 -0700
Subject: [PATCH v4 6/7] Documentation: bootconfig: document build-time
 cmdline rendering
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-bootconfig_using_tools-v4-6-73c463f03a97@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3375; i=leitao@debian.org;
 h=from:subject:message-id; bh=h/vGAsLSFlFLbB9EivE3jumQghH26zu5MVDcuDh9naE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqJ+rR1mR07yyolgCj7IQB+B4K6Fy7czbt3kuPX
 ujZaG89xMuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaifq0QAKCRA1o5Of/Hh3
 bSRpD/98cjSU5e61HE2UjuowvOAZrpZesWb/STYjnpGzE+ihaJG/xCel5akre/tush6jhx005/6
 mnvFGNPG3ICEMIuZxBciZeAGX2NrIaG5tqgm7IDlV2WmQDcSmeNCWW1nafEpKKE47xVjeGlU3I2
 +tCJi9YM9pDa9lnVVtW7zCiKUej/oca7LHhFyK7HUKI1FCS7h1s4SjI9+iJrz2n/rG0j04dDWNF
 mbszTBi3GZnwGofUk6LfXbIZ8kVEHvQkEIhedseRyZm0TiatBmBnIoUK2bqlYfpdNHze169VV71
 YWwE2D1nd1uffSlBcKWr4cc3V1hGn4dzc4ZqdJcQjC/yYf9JcWypbC3V61mjzfGmiAK6PXJzAJh
 uZxNmJg9ZCILxj/LKyPbOic7Ex8KguAnxJM6sLhrfw8U9cCml97UxFNsTXbEYmiWsiskFHOCrXU
 MO4qQklGHXwE7ooyX1Bx9OFjDJbMMa01gDmBHj0MHsGDq9+N+7IYkZat6BEOzpp+oznnqITCP5K
 BZRh0RLYW5oU2AOP5qyVtyD2hNG9Xh6y7x+2TxcJFCuo+9Y5/IPznBea5w6Usl7dMTv2YEIz6DQ
 0UAIthRrQmiq/Z91c3eIkdRQB3g9a+OmqVazyukClFeqT6pvXCwajbl3TPfcj/8/cC5gucAoHDN
 cz2F5DEl8OKMTjw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-13672-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B30165F1C3

Add a section describing CONFIG_BOOT_CONFIG_EMBED_CMDLINE: what it
does (renders the embedded "kernel" subtree to a flat cmdline at
build time so early_param() handlers see the values), what it
requires (BOOT_CONFIG_EMBED, a non-empty BOOT_CONFIG_EMBED_FILE,
and ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG -- currently x86 only),
the bootconfig opt-in semantics, the initrd-vs-embedded precedence,
and the soft-error overflow behavior.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/admin-guide/bootconfig.rst | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
index f712758472d5..f371e5cdc974 100644
--- a/Documentation/admin-guide/bootconfig.rst
+++ b/Documentation/admin-guide/bootconfig.rst
@@ -234,6 +234,52 @@ Kconfig option selected.
 Note that even if you set this option, you can override the embedded
 bootconfig by another bootconfig which attached to the initrd.
 
+Rendering Embedded kernel.* Keys at Build Time
+----------------------------------------------
+
+By default, the embedded bootconfig (``CONFIG_BOOT_CONFIG_EMBED=y``) is
+parsed at runtime, after ``parse_early_param()`` has already run. Early
+parameter handlers (``mem=``, ``earlycon=``, ``loglevel=``, ...) therefore
+cannot see values supplied via the embedded ``kernel`` subtree.
+
+``CONFIG_BOOT_CONFIG_EMBED_CMDLINE`` resolves this by rendering the
+``kernel`` subtree of ``CONFIG_BOOT_CONFIG_EMBED_FILE`` into a flat cmdline
+string at kernel build time (via ``tools/bootconfig -C``) and prepending
+it to ``boot_command_line`` during early architecture setup, so the keys
+are visible to ``parse_early_param()``.
+
+The option requires ``CONFIG_BOOT_CONFIG_EMBED=y``, a non-empty
+``CONFIG_BOOT_CONFIG_EMBED_FILE``, and an architecture that selects
+``CONFIG_ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG``. Currently only x86
+selects it; on other architectures the embedded bootconfig still works,
+but only through the late runtime parser.
+
+The same ``bootconfig`` opt-in applies as elsewhere: the rendered keys
+are prepended only when ``bootconfig`` (in any form) appears on the
+kernel command line, or when ``CONFIG_BOOT_CONFIG_FORCE`` is set, which
+defaults to ``y`` when ``CONFIG_BOOT_CONFIG_EMBED`` is set.
+
+For example, given::
+
+ kernel {
+   loglevel = 7
+   mem = 4G
+ }
+
+the kernel boots as if ``loglevel=7 mem=4G`` had been prepended to the
+bootloader command line, with the values visible to early-parsed
+handlers. Comma-separated values are still expanded into multiple
+cmdline entries per the bootconfig array convention -- the embedded
+``kernel.earlycon = "uart8250,io,0x3f8"`` must be quoted to land as a
+single ``earlycon=`` entry, exactly as for the runtime parser.
+
+If an initrd carries its own bootconfig, the runtime parser still
+processes it; ``parse_args()`` last-wins means the initrd's ``kernel``
+keys override the build-time-rendered ones. If the rendered string
+would not fit in ``COMMAND_LINE_SIZE`` together with the existing
+command line, the prepend is skipped and an error is logged, so an
+oversized embedded bootconfig cannot brick a boot.
+
 Kernel parameters via Boot Config
 =================================
 

-- 
2.53.0-Meta


