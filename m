Return-Path: <linux-kbuild+bounces-13367-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJLyCC4fF2rw5AcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13367-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:43:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BCC5E7F02
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 494D5305DB54
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719F643DA21;
	Wed, 27 May 2026 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Y74hv0Pi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878D142B75A;
	Wed, 27 May 2026 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779900145; cv=none; b=KKzRAFHOqf0DKLGHr/k9uAR43RilVaitPvVKJXEjF21ZqzR3vZyvNdhhkaWwG4Qyw2WTc8gPaMUDiEgH1N4P+slGL5v8WOAKY53lidPFp5Dbe0GhGojwJi1SDHpn9YSUWBA82Ng1XrIxr0ZlDJhWDtm7u9Fqak1LPp7h/Odc4Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779900145; c=relaxed/simple;
	bh=ENLneK8xBeKmCQGwJZLA8r/UEpwj6k2/RtjAZzWN0d4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsERPi/vZNfHz/qnjjmaZ1L5R6UFSAZGlcDuUOUkRAZEyCsYqMnolcfMRrrI2dx1yCbx0sIgaQOZlWOTzdLQS/jFbtcDyhEbAMbimfI1YK0r8lQgSTCZEmdzDfEzoay/UXbaPzGhIWJwHOkuwYP0l5Kzi7oKh53f6XyMjiGYDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Y74hv0Pi; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=LjJ5UiE639iXrNLvVtVEZ0IF+WZQaMaRUMl009rvAFc=; b=Y74hv0PiZQy1VlV0JQQq/JjRal
	ycgUGvOAg8YupO6DI4Hj5cm9IjS+jI324sBWcYfQ2NNDv6NnhSb5ADywTV3oUO7qUsWwvFjzys1Zr
	I/MKjT0FbskgYGIsxw+TPkL8MhzH+vxTVemSFPUCr6W7dd1VXaetgUhrNAyAAjbW+NCfmyld1Orkd
	pFB2B+7/NnCt02yuld8sMQmgOxkJ06/ETtfdF54a9nQwO16EZs8LVALEpR+L0HOyTnygNQbx77rt+
	3eScO+umZ92I0Tct8pQEwU18RUovfMo+xAMAZSodUiTYszHJ9e4yuNQT616NxgExv3WsLftbquS7J
	iQyDLRTg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wSHKg-003JPx-0W;
	Wed, 27 May 2026 16:42:14 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 27 May 2026 09:41:37 -0700
Subject: [PATCH 4/4] x86/setup: prepend embedded bootconfig cmdline before
 parse_early_param
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bootconfig_using_tools-v1-4-b6906a86e7d5@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4155; i=leitao@debian.org;
 h=from:subject:message-id; bh=ENLneK8xBeKmCQGwJZLA8r/UEpwj6k2/RtjAZzWN0d4=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqFx7NjBMxBJyOY//uFemPR8XbTitBOk9KJJxQU
 WvsTxkimN6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCahcezQAKCRA1o5Of/Hh3
 bcvjEACM9g+xCW/ta9XvmQ7RQkYXcju2/5IOCzGjzCw0tAwLgqtgAv4K+kSxPXs4XP2/KSLqbaF
 NfKQmLiNnWdFbMi19qJcvno9SEOHprSWUE/gaUjr5Jj5hBSel9dqlu/hqb4mZdhNRd6ONq71Jcc
 26zVF1OeO6NHk9/xTQKNObNM2hYMbLvZMQW/emnu6DmxA/U0aEeykD+MB/SrRLRqyu834t5R7FJ
 6drZ6CT/wthjvftdxijBmA0QMPxQJ0vvLIS21fAD2diVCGCSIlfIkrVINsSZs28FGTh5t92kMD4
 /Xp2dm3QXwUs2dS8V9bNLWPcpJVkeZrEInJVnJMtfxcAvnjSmumbbNVCU/1YWS9flQHsFjkDDq0
 jyjrwX54rkiKjXz0JawqZcQeWlEzpwY7Tx3mNiiZ1DfIuykQl64+rHUGMQn01bFZSyWFpVEjgLp
 M3svCKE+nPx7D90QlrbjDQRXU8sqQXPp6aCGAJDveKFj7O5EhrVILlm6yBY2HXgPQibmncJgEBA
 xXvFZDnK0Tr9PK3EXgP06Z1ibCWok64hZsbRPwloRrJnBLWXBTKIqbaDx3s8jyH+ftNPP+8PR8v
 LBgSarSPl6srRmgWWHVqMBZbtpbU5HCDvBjjBKZx277rF1DwQ6iyPNPYoufOHkF67is4PGjDwjZ
 yhio7qw5w+alcng==
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
	TAGGED_FROM(0.00)[bounces-13367-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: B0BCC5E7F02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call xbc_prepend_embedded_cmdline() in setup_arch() right after the
CONFIG_CMDLINE merge and before strscpy(command_line, ...) so the
build-time-rendered embedded bootconfig "kernel" subtree is part of
boot_command_line by the time parse_early_param() runs. early_param()
handlers (mem=, earlycon=, loglevel=, ...) now see values supplied via
CONFIG_BOOT_CONFIG_EMBED_FILE without parsing bootconfig at runtime.

Select ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG so the user-visible
CONFIG_BOOT_CONFIG_EMBED_CMDLINE option becomes selectable on x86.

With this select in place, setup_boot_config() in init/main.c would
otherwise render the embedded "kernel" subtree a second time via
xbc_make_cmdline("kernel") and prepend it to saved_command_line /
static_command_line through extra_command_line, duplicating every
embedded kernel.* key in /proc/cmdline and causing accumulating
handlers (console=, earlycon=, ...) to register the same value twice.
Track whether the bootconfig data came from the embedded source and
skip the duplicate render in that case.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/x86/Kconfig        |  1 +
 arch/x86/kernel/setup.c |  3 +++
 init/main.c             | 19 ++++++++++++++++---
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f24810015234..f839795692b4 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -126,6 +126,7 @@ config X86
 	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
 	select ARCH_SUPPORTS_CFI		if X86_64
+	select ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG
 	select ARCH_USES_CFI_TRAPS		if X86_64 && CFI
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 46882ce79c3a..592c4c79c974 100644
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
@@ -924,6 +925,8 @@ void __init setup_arch(char **cmdline_p)
 	builtin_cmdline_added = true;
 #endif
 
+	xbc_prepend_embedded_cmdline(boot_command_line, COMMAND_LINE_SIZE);
+
 	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
diff --git a/init/main.c b/init/main.c
index e363232b428b..8264bfa97aa2 100644
--- a/init/main.c
+++ b/init/main.c
@@ -378,12 +378,15 @@ static void __init setup_boot_config(void)
 	int pos, ret;
 	size_t size;
 	char *err;
+	bool from_embedded = false;
 
 	/* Cut out the bootconfig data even if we have no bootconfig option */
 	data = get_boot_config_from_initrd(&size);
 	/* If there is no bootconfig in initrd, try embedded one. */
-	if (!data)
+	if (!data) {
 		data = xbc_get_embedded_bootconfig(&size);
+		from_embedded = true;
+	}
 
 	strscpy(tmp_cmdline, boot_command_line, COMMAND_LINE_SIZE);
 	err = parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0, NULL,
@@ -421,8 +424,18 @@ static void __init setup_boot_config(void)
 	} else {
 		xbc_get_info(&ret, NULL);
 		pr_info("Load bootconfig: %ld bytes %d nodes\n", (long)size, ret);
-		/* keys starting with "kernel." are passed via cmdline */
-		extra_command_line = xbc_make_cmdline("kernel");
+		/*
+		 * keys starting with "kernel." are passed via cmdline. When
+		 * BOOT_CONFIG_EMBED_CMDLINE is enabled and this bootconfig
+		 * came from the embedded source, setup_arch() already
+		 * prepended the rendered "kernel" subtree to
+		 * boot_command_line; rendering again here would duplicate
+		 * the keys in saved_command_line / static_command_line and
+		 * cause accumulating handlers (console=, earlycon=, ...) to
+		 * re-register the same value.
+		 */
+		if (!IS_ENABLED(CONFIG_BOOT_CONFIG_EMBED_CMDLINE) || !from_embedded)
+			extra_command_line = xbc_make_cmdline("kernel");
 		/* Also, "init." keys are init arguments */
 		extra_init_args = xbc_make_cmdline("init");
 	}

-- 
2.54.0


