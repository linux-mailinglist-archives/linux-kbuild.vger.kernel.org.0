Return-Path: <linux-kbuild+bounces-13895-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mLFyJH12PmorGgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13895-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 14:54:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DE36CD33D
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 14:54:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=j8B30BQu;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13895-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13895-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6D8130CE8C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 12:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24B03F58F7;
	Fri, 26 Jun 2026 12:51:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F75B3EB118;
	Fri, 26 Jun 2026 12:51:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478265; cv=none; b=m1Jxt1kRQhXuomFEva/jewFQbszMWze4NXaY6KjgyegmKmQ1YGk8BkEDWF6Ain4z/fwONpLAUHOEXnZparGiT8f/ncI+LeqwGdtlD01l17ilmHK7a8jlIy9lrycnU5YASlH4EhNCZ4tMbaAXYc+ZOVnqTr0EApCie9skQ9U8sT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478265; c=relaxed/simple;
	bh=3kGncpfd3ugBe5hQmzxStrFbjaV8gP5ecUkyyT9pFJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYfbGRbnJkq1eVxm1YSaDcL86jG3rL2qMS4GruYYIbOgMM7WpJf2TcR2CdqBC1UhlOz0ienn9euyESxq9hOCPss6ywpLPXQXYWkW8rqu8YY+/tHwhuHT/CH7MVisBHvWYc8f1RErY5XTpLysp3lyJ38FYylq5mZCoSSqvK0sdRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=j8B30BQu; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=6eipaqXYWBdBGbcvhU85RFhw71qnlJ4InxYD2JHvda0=; b=j8B30BQuzRXVINEpvxhe1SoNqM
	TtVm0xJRarfoliV4QNRgMU8X5pgaB8piwGcdQdH2ETfgYS26YUySqPB6wqSQ2Q259D7srRsf1inIO
	MZr/smK52gkYrIUcOGrnn7+wo05SKQa+iK8d0hYuUSiSrDnYCLzKPkiiwfc2o+Z/fF6+6O9lkAfaR
	vspOLLvtZgWTkP7wp8Nw4qxWWPTxOCk44O2SfsSyEFjmysDADNWvYIz3VGMA+E6Bsy8MYe+cfMpGo
	OOjlvmAcaS2vqBPer3K0YxK/FDkbqLxRn5JhWywp+qikYyjDIf6ckiV13ZC119zXSr3n++ClZZ+Aw
	4Iy5rtlA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wd61N-003ymN-2s;
	Fri, 26 Jun 2026 12:51:02 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 26 Jun 2026 05:50:15 -0700
Subject: [PATCH v7 6/9] Documentation: bootconfig: document build-time
 cmdline rendering
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-bootconfig_using_tools-v7-6-24ab72139c29@debian.org>
References: <20260626-bootconfig_using_tools-v7-0-24ab72139c29@debian.org>
In-Reply-To: <20260626-bootconfig_using_tools-v7-0-24ab72139c29@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, 
 Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5751; i=leitao@debian.org;
 h=from:subject:message-id; bh=3kGncpfd3ugBe5hQmzxStrFbjaV8gP5ecUkyyT9pFJc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqPnWLSebtmZ0nQ/Fa9tXObiWTtfpSvgI+jvJCk
 aKdcLameNaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaj51iwAKCRA1o5Of/Hh3
 bZGOD/9L9v6gUc+9zkEn+R7rvBYJcMN5LQkcgpwMsvfoL8jaA3RjE7iK+05192u9iYGshx/g6gp
 xMh34h0m11tw3Z22xwnljzPmKrqldhMXf33l+lbseafWWnTGQk2kUaYgz3gzwpQlP3Eq63Zf6Jl
 BdZG9wP1913YZOPuh3Sab+fnK6VnruxbtBTtNbsXGPuPjKoyw/b2tpVgSMEflBHn7YrNAku8peQ
 otWi/GxHng7Kbe3DhPQFXtZWIC2p5ia6TkHF5CiZZpYw8h3wNjqKKcaC8j28b3Pm3eUTvqoN285
 qSDEFjhDRrij+/eisWXji2vSBYD0iZ6dZo/nkuuZTe+KNH62+jvptQ9x9Njw/8OEUFuXcgDnQMH
 cCx6fBdXXx2O9nHCptpuph8ZrLH2jRzlUJVuvFIAYTvHFiQtDF0x2fNj3ISyAafs+ptw844HB3u
 BUU6yGPYEHd1LwmVYsYPKTN2sfpU2vOvfGtSUDXm2Nm12JMLzGgGOgPOXFMUCi8m2YjJ8V+indk
 vLSm5mZkZbW804igQHCzqYhVcORoFlCjt7YjOSUu38glzRzSGFD7ufrFrctVDKD2yo+6S+xGRBE
 rmY5EDVMOHrLfnw3LnfeUH8jmC3xTxPIyy/NCKQkXDTAR6HNQPVYJkHm5prPJS8ObOZvCk09a2M
 PjMtd5NprJBN4EQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13895-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:llvm@lists.linux.dev,m:linux-doc@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,gmail.com,google.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06DE36CD33D

Add a section describing CONFIG_CMDLINE_FROM_BOOTCONFIG: what it
does (renders the embedded "kernel" subtree to a flat cmdline at
build time so early_param() handlers see the values), what it
requires (BOOT_CONFIG_EMBED, a non-empty BOOT_CONFIG_EMBED_FILE,
CONFIG_CMDLINE to be empty, and ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG --
currently x86 only), the bootconfig opt-in semantics, the initrd-vs-embedded
precedence, and the soft-error overflow behavior.

This addresses feedback from the Sashiko AI review and Masami Hiramatsu to
document the CONFIG_CMDLINE requirement, which is enforced at the Kconfig
level but was not mentioned in the documentation, potentially confusing users
who might satisfy all other requirements but still find the option hidden in
menuconfig if CONFIG_CMDLINE is non-empty.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/admin-guide/bootconfig.rst | 81 ++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
index f712758472d5c..3d6412458c8b6 100644
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
+``CONFIG_CMDLINE_FROM_BOOTCONFIG`` resolves this by rendering the
+``kernel`` subtree of ``CONFIG_BOOT_CONFIG_EMBED_FILE`` into a flat cmdline
+string at kernel build time (via ``tools/bootconfig -C``) and prepending
+it to ``boot_command_line`` during early architecture setup, so the keys
+are visible to ``parse_early_param()``.
+
+The option requires ``CONFIG_BOOT_CONFIG_EMBED=y``, a non-empty
+``CONFIG_BOOT_CONFIG_EMBED_FILE``, ``CONFIG_CMDLINE`` to be empty, and
+an architecture that selects ``CONFIG_ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG``.
+Currently only x86 selects it; on other architectures the embedded
+bootconfig still works, but only through the late runtime parser.
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
+With ``CONFIG_CMDLINE_FROM_BOOTCONFIG=y`` the rendered ``kernel``
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


