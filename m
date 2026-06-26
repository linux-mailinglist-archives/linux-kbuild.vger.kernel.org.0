Return-Path: <linux-kbuild+bounces-13896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r9y0OoF2PmouGgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13896-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 14:54:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E119C6CD342
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 14:54:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=o4NSI0ho;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13896-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13896-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82ED630508EC
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 12:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386F93E4C87;
	Fri, 26 Jun 2026 12:51:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CBB3F65E5;
	Fri, 26 Jun 2026 12:51:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478271; cv=none; b=Wz20EQRKhoPOuOhpHPUFymA3X6museAhYrwuuBU/OESxxXuR7IByDqFClgYjuQP0fEKDJyyr9HUl7zJQ+yPcYlqtWb9c/OVj5wbkC4HIHKqedbAcU3ppVKreF8k3oU1v/a+mExYbrmSG4pvVAJKnqJspHBuwlaXhE3LheEomy94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478271; c=relaxed/simple;
	bh=6A6Ayzz+1XfwBa+EcEeak7eTnHhzF7963wnr9mGjqXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+F8IBOoy+NpBSWwbFLzjRbH0tT5OZJo5OyH/Xnju7VieiGglspGhiOqQ0EOq2HQ53TtwedICOwKJtoouk38lBh0b2mXX6M8CRRSs1vvSrvjU6wHdBkEXkDAsqUeHwibMDm+TOA1qUoWFqDGAnFwfGhhppp8/aGaBsCOIgqvlww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=o4NSI0ho; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=x+mVW/DRilKGmX9gaiRrs22RqkkyjKCnEnepqrPNVVE=; b=o4NSI0hofVfKt+3pBtLdvkCm5u
	+iHJh6cgfSXHE9B68yxt5ZEKFu6XkqNqlLQ2Ppe8ffj11Wuey7ktLdunisFih/c/PW5O0Z1tIK34u
	bqehUtPtM472UTJCAzEyb/nd86yOO0T7P90xJcjXBteawAsqJ1zvbqKoIT8z6Pn/rwdwkoUkojiTL
	Y8FddGyfKX+cxyXKETM7n9dCy2AWb/6yQlTcCzjyCtP5hRpvP10BZSB/gK4df1h76mglAcz++LsND
	hqLagnXW7kFrM6pnFoAbM/AAUuxuWFdjy9qEZDdHj4ipMTp8Kkkm5GV/ptz3AyjBMGCF73PU4Nu4F
	1Oofxy4A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wd61T-003ymd-1U;
	Fri, 26 Jun 2026 12:51:07 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 26 Jun 2026 05:50:16 -0700
Subject: [PATCH v7 7/9] x86/setup: prepend embedded bootconfig cmdline
 before parse_early_param
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-bootconfig_using_tools-v7-7-24ab72139c29@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3461; i=leitao@debian.org;
 h=from:subject:message-id; bh=6A6Ayzz+1XfwBa+EcEeak7eTnHhzF7963wnr9mGjqXg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqPnWLraVde1sCL9+bKT6GA8yEty3bgKCC8NUyO
 5UkHByh9BKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaj51iwAKCRA1o5Of/Hh3
 bWuPEACWttx+5NGU6xPba+l2zTux0JBtz7ooJHu5g2eyZEI7B4UVaBljxKSLS0zt3ZLBsW6VVV9
 OwgDlVgIAK77+wwx1Yrf9KPqZxnl/AxbxXWGY8IyuB/wnze8ZzQf2GtzykGCg1v1WrraAGak+/i
 xFdLIkjwji/D0zoUPaP9LFOE/ZVRFxwW+4WdAm5qd2BA56WzElJooc0hBZIlNo1A1ZXHu2NNWO1
 tlum7xFHCP9jnB1gsKqT5UUEEnQ8M+k2mKdstvok8Kbjyefk3BPeeB1E7Z/KDadojjI+6VleQtM
 Jcc4N7za0J1vdhLlby9fHVePrHilxZQUKjCeyx4aNdXujXWX4aVgZjGW9Au5rEQUqI5WQqdNn9y
 6NtASP2tC8v2WKPmhV1U3GjE+D2ha/hqgOmsvnbk1Tprh02lOTGP4VkyTzgidSvaOjHHOFzd8DR
 4UCOBAVIQ5+Qj2RKMw2SdtOzzUeifPF0aURV1I9NehlZQBkkMceHakFSPLsqnEnlXHMhpbUTHxe
 MVp+FL7qNqeiOBc/QwT+heaaBdUeBXanb/EY/MqBzIkdlL7wq2+pfkLCAJLWLXsJx5qOYC+vzTw
 mO6YOyjZ1EBpCxF+zlB4YH6Wl4h24msHmGu9sRT+CF/WplNEq1RdsfSgtLxfsjGZPd3uxesQV1W
 +Pe6pJGHdoIeoYQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13896-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E119C6CD342

Call xbc_prepend_embedded_cmdline() in setup_arch() right after the
CONFIG_CMDLINE merge and before strscpy(command_line, ...) so the
build-time-rendered embedded bootconfig "kernel" subtree is part of
boot_command_line by the time parse_early_param() runs. early_param()
handlers (mem=, earlycon=, loglevel=, ...) now see values supplied via
CONFIG_BOOT_CONFIG_EMBED_FILE without parsing bootconfig at runtime.

Gate the prepend on the same opt-in the runtime parser uses: prepend
when "bootconfig" is present on the command line, or when
CONFIG_BOOT_CONFIG_FORCE is set. Detect it with parse_args(), exactly
as setup_boot_config() does, so both agree on what counts as opt-in:
any "bootconfig" key regardless of value (bare, =0, =1, ...), and only
before the "--" that separates init arguments. Sharing the parser keeps
the early and late paths from diverging -- e.g. "bootconfig=0" or a
"-- bootconfig" meant for init must not apply the embedded keys early
while the runtime parser skips them.

The prepend necessarily runs before setup_boot_config() detects an
initrd bootconfig, so an initrd cannot override the embedded "kernel"
keys for early_param(). This is intentional: the embedded cmdline acts
like a build-time CONFIG_CMDLINE. An initrd bootconfig's "kernel" keys
never reached early_param() anyway (they apply late via
extra_command_line), so nothing is lost -- the initrd keys still apply
late, with last-wins keeping the embedded values in effect.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/x86/Kconfig        |  1 +
 arch/x86/kernel/setup.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 0de23e6471973..8ab11199c16d5 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -127,6 +127,7 @@ config X86
 	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
 	select ARCH_SUPPORTS_CFI		if X86_64
+	select ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG
 	select ARCH_USES_CFI_TRAPS		if X86_64 && CFI
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 46882ce79c3a4..88b055a46591e 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -6,6 +6,7 @@
  * parts of early kernel initialization.
  */
 #include <linux/acpi.h>
+#include <linux/bootconfig.h>
 #include <linux/console.h>
 #include <linux/cpu.h>
 #include <linux/crash_dump.h>
@@ -880,7 +881,6 @@ static void __init x86_report_nx(void)
  *
  * Note: On x86_64, fixmaps are ready for use even before this is called.
  */
-
 void __init setup_arch(char **cmdline_p)
 {
 #ifdef CONFIG_X86_32
@@ -924,6 +924,18 @@ void __init setup_arch(char **cmdline_p)
 	builtin_cmdline_added = true;
 #endif
 
+#ifdef CONFIG_CMDLINE_FROM_BOOTCONFIG
+	/*
+	 * Prepend the build-time-rendered embedded "kernel" keys here so
+	 * parse_early_param() below sees them, using the same opt-in as the
+	 * runtime parser, plus the build-time CONFIG_BOOT_CONFIG_FORCE.
+	 */
+	if (bootconfig_cmdline_requested(boot_command_line, NULL) ||
+	    IS_ENABLED(CONFIG_BOOT_CONFIG_FORCE))
+		xbc_prepend_embedded_cmdline(boot_command_line,
+					     COMMAND_LINE_SIZE);
+#endif
+
 	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 

-- 
2.53.0-Meta


