Return-Path: <linux-kbuild+bounces-13794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ab0+JzSJMmqg1gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13794-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:47:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDBB699410
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:46:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b="iPYq//KP";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13794-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13794-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D460231F907E
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 11:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFE13F7ABD;
	Wed, 17 Jun 2026 11:24:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57D3F6C5A;
	Wed, 17 Jun 2026 11:24:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695464; cv=none; b=nhxMdidckYBX0HzXdIleZP6kOuQu0scmOPDEFsYQvqSoEQJgoDIee4ijKc4miy61B/I4kSiu3rKTfxk24M4/EOe5N/V0nZT6hF9LHWpfDkERKgni/loOjg6cplh6sWMPM1N/k4r9O0ElcYdwl/7ynFU4D8RlXC3xxtJWiDy2eNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695464; c=relaxed/simple;
	bh=hua3ZeIPy4L9trv9rHd/6OimwhvYneLlsVxLDaeyJ78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8Cq9SVuvZ+zdPK4P8E2mGdkBsVL0nsxhBiw+C5H1HvwvWkE9uOhOQp2VNw+MZiamGcKaHFBc6WTA/Y0VTOpShpnbXZeJYEW/AwqubXa+3WV/gQRYmPhbShCuj+3F5CDvNwotnEVmsWkVPj4Luwi/9OlA/RNhrkbjYvthAAJPI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=iPYq//KP; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=VrYyj7dEW6SfSkMNGtxlv5UGKRcqy91rOOv1XAtZf+E=; b=iPYq//KPt3IkQlFW13oYAUddZK
	BIuFSc2a/cneAd3wxN4QxxQI+/Ls/5hLq7+lSrMuh6BQHd/2AUbbbDYMzQyb9YfOUNOipuZAZ2xRy
	VP/8RY5gGUDi4RY3qQlDiLrLRdKPK6ZCqorGbvVrRqRKxhn/8ZusZgyKUwjI18gqjb5A4GhQXCwqM
	hRq92vuq68AxZJcs/eYArwMhUpFxVlfrO7vDYHbxx3xyQEs2JC3xPmN/4y/1w6TWEvfvO46nxefwM
	E9Vypv5c2iv6BdSBdkrUQxIOoNQElnlOZ9TjghtFtcepy/UnXlG109oGSJyCyw7dlc/G3b1dmd3YW
	qlaerAQQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wZoNS-00EaGU-1A;
	Wed, 17 Jun 2026 11:24:14 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 17 Jun 2026 04:23:38 -0700
Subject: [PATCH v5 6/7] Documentation: bootconfig: document build-time
 cmdline rendering
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-bootconfig_using_tools-v5-6-fd589a9cc5e3@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5343; i=leitao@debian.org;
 h=from:subject:message-id; bh=hua3ZeIPy4L9trv9rHd/6OimwhvYneLlsVxLDaeyJ78=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqMoO7OKlhoNiqI2XiHPLNpA1Bgk6DZ6U+bRw7p
 08ronp/wOyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCajKDuwAKCRA1o5Of/Hh3
 bYLhD/95dz1D9P0knjTaJgipsGkzKduzSOBLcbxXQhlB+SLhFxhM/Fliv2YgFUUYmF0EE75+E6m
 TylXc24MKAx8y89198u4twJf+UM8rroKMtgYB0sk7UW6MJXIRVMjnNSUEgkfP+a4if9Dq/ixxW9
 r7pwKj4Acv3j7VpgrVYUESiqDBERO+bq/SoFzebI+15ABvNxf2l3GjbBrQcEp9IHqvurXdPQ7GN
 Ck3ZE06QDY8Mz0diABNDMGkwWUfKTGMZBiOnm6rbZgAgoD1P3+AzBdvHj7pvrG5CrYkZVEjkjsU
 n+vhCOUbVaUSqCUgcu9GgfoMvAmf7sLsXt+/wFotcdvrSsnrdNVlkxT4BUcCGAj+AlFMREnwZ/h
 RewYkTmIba6LD0hn8cglEYkD0+S2LztVqUqTNwXgw+t/FEw93ynOyWZQv8ercZGDwAcHUEwt+iP
 Zn4BjOBUtyXNmE3MUZh5dnPt+Ez4lU6CqcRsoPr13NPDiUzVdNiqaYJqrGQ9zEov3EGqZ9wR0pc
 uQv8BV0HxOamDMLhteOh9907R1fN8ldeqVHz7OToHnhJwyrLFZ8sM3o5NYCi7AIQObUIU4ruujQ
 7cEYJv+Osl3Zi38IvHw3yQBnpNIgJxYQlS8VXNEdwNETGwsw39yHzdCa/s3VYYVCQl+hSMujFyL
 mksfJtK0NCKJO/w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
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
	TAGGED_FROM(0.00)[bounces-13794-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1EDBB699410

Add a section describing CONFIG_BOOT_CONFIG_EMBED_CMDLINE: what it
does (renders the embedded "kernel" subtree to a flat cmdline at
build time so early_param() handlers see the values), what it
requires (BOOT_CONFIG_EMBED, a non-empty BOOT_CONFIG_EMBED_FILE,
and ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG -- currently x86 only),
the bootconfig opt-in semantics, the initrd-vs-embedded precedence,
and the soft-error overflow behavior.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/admin-guide/bootconfig.rst | 81 ++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
index f712758472d5c..4a7e90c21f968 100644
--- a/Documentation/admin-guide/bootconfig.rst
+++ b/Documentation/admin-guide/bootconfig.rst
@@ -234,6 +234,87 @@ Kconfig option selected.
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
+If the rendered string would not fit in ``COMMAND_LINE_SIZE`` together
+with the existing command line, the prepend is skipped and an error is
+logged, so an oversized embedded bootconfig cannot brick a boot.
+
+Interaction with other command line and bootconfig sources
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+With ``CONFIG_BOOT_CONFIG_EMBED_CMDLINE=y`` the rendered ``kernel``
+subtree behaves like a build-time command line (similar to
+``CONFIG_CMDLINE``), not like a bootconfig source. It is prepended to
+``boot_command_line`` in ``setup_arch()``, before ``parse_early_param()``
+and long before the runtime parser looks at an initrd. Options can reach
+the kernel from up to four places:
+
+- Bootloader command line: the arguments the boot loader passes. The
+  embedded cmdline is prepended in front of them, so for last-one-wins
+  parameters a bootloader option still overrides the embedded value.
+  Visible in /proc/cmdline.
+- Embedded cmdline (this option): the rendered ``kernel`` subtree,
+  prepended early so it is seen by ``parse_early_param()``. Visible in
+  /proc/cmdline.
+- Initrd bootconfig: parsed late in ``setup_boot_config()``; its
+  ``kernel`` keys are placed ahead of ``boot_command_line``, i.e. before
+  the embedded cmdline, so last-wins favors the embedded values. As a
+  bootconfig source, an initrd bootconfig still replaces the embedded
+  bootconfig. Visible in /proc/cmdline and /proc/bootconfig.
+- Embedded bootconfig (runtime): parsed late, only when no initrd
+  bootconfig is present. Visible in /proc/cmdline and /proc/bootconfig.
+
+So with this option the embedded ``kernel.*`` values take precedence
+over an initrd bootconfig's ``kernel.*`` values: for early parameters
+the initrd is not parsed yet, and for ordinary parameters the embedded
+keys land later in the command line. If you need an initrd bootconfig to
+override the embedded ``kernel.*`` keys, leave this option off and rely
+on the runtime parser.
+
+The rendered string is part of the command line, so it appears in
+/proc/cmdline. It is deliberately not shown in /proc/bootconfig: that
+file keeps reporting the parsed bootconfig tree -- the initrd bootconfig
+if present, otherwise the embedded bootconfig -- independent of whether
+build-time cmdline rendering is enabled.
+
 Kernel parameters via Boot Config
 =================================
 

-- 
2.53.0-Meta


