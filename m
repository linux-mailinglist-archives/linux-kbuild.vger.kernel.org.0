Return-Path: <linux-kbuild+bounces-13869-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gTF2FxyyOmqQEAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13869-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 18:19:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C499C6B8AAB
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 18:19:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=gvearr8D;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13869-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13869-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 530A530CE49B
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 16:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E054D3176E0;
	Tue, 23 Jun 2026 16:17:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0F931715C;
	Tue, 23 Jun 2026 16:17:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231442; cv=none; b=H3h0iV7V994RN/2YAYy3jD+bRSL4Oak3GUNdhLOHF4HkuWvEaOsdDIZ+zH84/6zNF4QxVXahMeRo0kYJtIXD4LebyrwRH1Hf8wsGV3aFsWh9ikpcMbdAeSdFF18NUPLaMYt4Q8l/jRRIuDugtCYv0fQ3LFamq8pzpFoU+ZkDfeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231442; c=relaxed/simple;
	bh=Xg1FP3Avyy8jw+LXcQ0ZqkmlmVB9xeFODPtgCPAtQOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckDt9G//zZPpivoQXHb3Y7SmM07ZbIcT/omG94Kdb0G983HkRHB0UOb6INbhAx84ugepF9tqNnE4ZjNH1CLlRGu3g4t9s+jVQU5zLLbGpZ7Fq+eKVmBRV8zw35BUw5/IpF6OpJvoGEGchsftwl2eyZYiqfNOCq2x8tY2pDDD/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=gvearr8D; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=/Aw0gOvBGCncwiX8RcjuV6QmMolEXYI4opaO65pEDkQ=; b=gvearr8DBY4yICb6NkZj4w3Pt1
	UPa3PK2rDAWrqxEB0z7xgAruXDltS+pZUB8tphv8RlOlgQB/bDVTzpLrXAHAIaZd05diEEXSmOHX9
	Iy3CDleH2mRnF4x0DhVI1cSN39wJRLJZ7zDQTiw0EX+IVrZbWBnvuPmB5dmeoiHfD+JKgbvoIJo+P
	gnBe1lfb2gCLJ2xwRqo19PLK99p9ECV3rOXm0ez+wU39wjPXh698UQo3v0shDMtwvJottUi/5o62v
	5SDDhEMstsvlN365miLaV/mLzWvjcxoh5l72lPIU0VSzwL2CpbBTJR1eZsFQktO54GuSY5aSQSF3Q
	QitxZExA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wc3oK-001m48-08;
	Tue, 23 Jun 2026 16:17:16 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 23 Jun 2026 09:15:35 -0700
Subject: [PATCH v6 8/8] x86/setup: prepend embedded bootconfig cmdline
 before parse_early_param
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-bootconfig_using_tools-v6-8-640c2f587a3c@debian.org>
References: <20260623-bootconfig_using_tools-v6-0-640c2f587a3c@debian.org>
In-Reply-To: <20260623-bootconfig_using_tools-v6-0-640c2f587a3c@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4267; i=leitao@debian.org;
 h=from:subject:message-id; bh=Xg1FP3Avyy8jw+LXcQ0ZqkmlmVB9xeFODPtgCPAtQOY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqOrFX3ZJjk5IxI+UmiElQ5CGdg2SP6SdI0lXWy
 pxu5xEktFiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCajqxVwAKCRA1o5Of/Hh3
 bWcKD/9ShXqLCdrlsmg9Q/odcY2aIb3K0oCPSZ4EZBvADvhpawB/cg+qMOyD+pYvhk82FtZnJZe
 WUtU3lSXiI4A/Y4vCOZtrRkdS1+UvInRip1cbGUOV9Xgd/MR7OtgysorrO7V70SWxLvQBiHUzGg
 aX6JYrMzH9z6ga1Eg0WRcPyrFncjRddt7CVX3PCEKGrYs96Lu9HNKWo9DPBwdJR88Q6/GlgfyIf
 +o7dBOC7m8ZNKBr1lCGTVGW0OzyLkNafw/X7o+nUhs1XBkygHdDupMdJvwddlYx/4he9PE93SA3
 SWn2ON+iRFczWrnkJqG/42SuqFnh4XwCVWlPWpdNHOvMqGIaHVmjKnFqkoXnjuiZOZ+itN3QtCE
 GiXS0Ir40bUMVDiR4NYJYOapXSCP6Dihm1bQNMdEUZisDHEwzaHmNF6w/rQpvhfghWn9FZRJoqF
 7/NhH6E8kGwmSKuCoMiwLi7URtykXgTr8J7eDO1U6PDckF27ve0LVtGW7/DQ2I65RQq3iEzlOUm
 yo8LKsew8M2HI5EhqnBtwlEsU1i+iMjfYCSv8qNAwfSBxDqCpT7A6UgyzXeWo3xFIpZQPTksdvb
 oTV+PGc8XHjmzlE7Z+MbxGs+yDCFfp5df5HsNdR5HLfgF9QGTcs+uAgsA+XmvGhg9eBHoHUbRJo
 XOVouMVNQ9N+Fxw==
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
	TAGGED_FROM(0.00)[bounces-13869-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,gmail.com,google.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:llvm@lists.linux.dev,m:linux-doc@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: C499C6B8AAB

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
 arch/x86/kernel/setup.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

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
index 46882ce79c3a4..c973a2cebcd04 100644
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
@@ -881,6 +882,37 @@ static void __init x86_report_nx(void)
  * Note: On x86_64, fixmaps are ready for use even before this is called.
  */
 
+#ifdef CONFIG_CMDLINE_FROM_BOOTCONFIG
+static int __init bootconfig_optin(char *param, char *val,
+				   const char *unused, void *arg)
+{
+	if (!strcmp(param, "bootconfig"))
+		*(bool *)arg = true;
+	return 0;
+}
+
+/*
+ * Did the user opt in to bootconfig on the kernel command line? Use
+ * parse_args() so this matches setup_boot_config() exactly, including
+ * stopping at the "--" that separates init arguments.
+ */
+static bool __init bootconfig_cmdline_requested(void)
+{
+	static char tmp_cmdline[COMMAND_LINE_SIZE] __initdata;
+	bool found = false;
+
+	if (IS_ENABLED(CONFIG_BOOT_CONFIG_FORCE))
+		return true;
+
+	strscpy(tmp_cmdline, boot_command_line, COMMAND_LINE_SIZE);
+	if (IS_ERR(parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0,
+			      &found, bootconfig_optin)))
+		return false;
+
+	return found;
+}
+#endif
+
 void __init setup_arch(char **cmdline_p)
 {
 #ifdef CONFIG_X86_32
@@ -924,6 +956,17 @@ void __init setup_arch(char **cmdline_p)
 	builtin_cmdline_added = true;
 #endif
 
+#ifdef CONFIG_CMDLINE_FROM_BOOTCONFIG
+	/*
+	 * Prepend the build-time-rendered embedded "kernel" keys here so
+	 * parse_early_param() below sees them, gating on the same opt-in
+	 * as the runtime parser (see bootconfig_cmdline_requested()).
+	 */
+	if (bootconfig_cmdline_requested())
+		xbc_prepend_embedded_cmdline(boot_command_line,
+					     COMMAND_LINE_SIZE);
+#endif
+
 	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 

-- 
2.53.0-Meta


