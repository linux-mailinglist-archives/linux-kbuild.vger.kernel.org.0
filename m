Return-Path: <linux-kbuild+bounces-13657-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VZuLC2/7JmqmpAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13657-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 19:27:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E15565939C
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 19:27:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=Y57GJxVy;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13657-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13657-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47804326D4C6
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 16:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3EF3D3D15;
	Mon,  8 Jun 2026 16:25:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080253CAE74;
	Mon,  8 Jun 2026 16:25:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935920; cv=none; b=Ucz2vL9ZYWk0vJcU9TlC6CtL+unOWWWoLwqxuyHVlvSvahz0PVTA5AXRKmjBfxERhplH2L0j+E0Xv5xq/Dcni5PHFs6DNYuTKh236x8zsv4OusGg99iLwPsK21AUkQ5zVQYmFObla/aMmqIvhj0enRTxyEUk+npr9a0YLIHApLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935920; c=relaxed/simple;
	bh=QPhqsebsO3HMrGMEDz9OVg+K2hivuE3EfkbyqQu5hD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KfzjfgIG4UxAOA5NKdySohaV5cLMfRSd67Oe+kSn138N3ia4axKAYW49yqBtm1gaNIcXOA/vvmtTWW8Ja9nHAHT83YHmP1guKftMCjX+D2f/a7P55krc8w3TPsBdUp8UC2AkkDHu1GgfcwhPK0ztv01OHox+lD4/Er7TnkPoQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Y57GJxVy; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=k3Cl903UI3FDV6LUKk48+poCJ8NTaQVxa7IZmgH5xJo=; b=Y57GJxVy0Z/3PZerkPoYPQ/glg
	3m+yPuxaSBUbeyEdegfqNviDIUfRupRmv8T9OsnFh3gK6AZeuHPcbmOhp5IboKcZS6bl5AwpngRaj
	SvmHzwxkq43HVzxulK3PuAArB9/Qyx7Go8jhGcwbSTY1sMA5iUjvj4Fo5Ybo9ytYLrIfriuv0MuoT
	AVI3OJlF0st2BuTcgbwXAvOQI/ZSIqWj207vwC6ov6uxMimRm+SMGwSf89AYBZzc/TPN9OZZMap61
	V3efzaWoTbY2Uv8FlbW0Xlczic8i5FG9xK5Ou1lmkk1E0/7udx4txJbppllhNH5vm2+gBN4WSa75r
	r13yHgsg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWcmq-007kkS-1k;
	Mon, 08 Jun 2026 16:25:16 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 08 Jun 2026 09:24:03 -0700
Subject: [PATCH v3 6/6] x86/setup: prepend embedded bootconfig cmdline
 before parse_early_param
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-bootconfig_using_tools-v3-6-4ddd079a0696@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4701; i=leitao@debian.org;
 h=from:subject:message-id; bh=QPhqsebsO3HMrGMEDz9OVg+K2hivuE3EfkbyqQu5hD8=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqJuzKQzotX3VnuQ3pkChLcKjYqne9Rkk/Fise6
 5L2G8PWUCCJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaibsygAKCRA1o5Of/Hh3
 baulD/4ntC/2wFrwFoTpj+Ekd46/woo3jQHZ2cN4TKhCNemATLVEhbN5SJyc0kVJrGnp2cQ0aYD
 A07hhnikjrrdJGToNvsxR1O5AzbJG7gWPf23sREIpzPIkOmO98Xr1cMQdhRvJf4rXmetHBtQ0zP
 W6NeMkBAV3/82ZRRu/HxubNvmE8mQdCInbc3a/3gVYhzbUO2pSIeB53mT8plF5N2q4gO9lvSNd5
 7qGQXgLZkMUyzxZeSCn3xZNEFia4mCRseBMdQ7FX5qpJ2+uQcY/sS8thvFk6PCQK5qsJXMKOoHq
 03w3fyPdgSOhq9jSCOKklGbv9l8uuuKqyp1zKYqSy3mZv6IuuYXJsPstwGv/4X/wI5NEJ0UHdUr
 J+gTdMv+lWRZ3BeFLi+RpD68c14bh2xNrVu6BUlcztBTCLv8IYJycewKhs2CDsUSeMrsVRmXJCz
 5lIr6LqfQ8JPa6PQs9bMiyLsJEN4EGn1FO5438Gykb0eqV5lY7FRt+A7Vr/OGZ9rzX/no2dCs3n
 Oaho0VwF3GhTx2B5GFmynW3T0iCEYPgfleYV29orNpJqlz4CZZtU3WwWtAg48LMMmKILhlN94fK
 faZA4exkX66neesJe9o3g6rm528KCiKHTJcdHq8nicVl1YM/SrOZISddtuDeL7zUhz8GfHUOwQl
 FK4oqOCzEFaKtNg==
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
	TAGGED_FROM(0.00)[bounces-13657-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 7E15565939C

Call xbc_prepend_embedded_cmdline() in setup_arch() right after the
CONFIG_CMDLINE merge and before strscpy(command_line, ...) so the
build-time-rendered embedded bootconfig "kernel" subtree is part of
boot_command_line by the time parse_early_param() runs. early_param()
handlers (mem=, earlycon=, loglevel=, ...) now see values supplied via
CONFIG_BOOT_CONFIG_EMBED_FILE without parsing bootconfig at runtime.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/x86/Kconfig        |  1 +
 arch/x86/kernel/setup.c | 16 ++++++++++++++++
 init/main.c             | 25 ++++++++++++++++++++++---
 3 files changed, 39 insertions(+), 3 deletions(-)

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
index 46882ce79c3a..003f8651db6c 100644
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
@@ -36,6 +37,7 @@
 #include <asm/bios_ebda.h>
 #include <asm/bugs.h>
 #include <asm/cacheinfo.h>
+#include <asm/cmdline.h>
 #include <asm/coco.h>
 #include <asm/cpu.h>
 #include <asm/efi.h>
@@ -924,6 +926,20 @@ void __init setup_arch(char **cmdline_p)
 	builtin_cmdline_added = true;
 #endif
 
+	/*
+	 * Match the runtime bootconfig parser's opt-in: only fold the
+	 * embedded kernel.* keys into the cmdline when "bootconfig" is
+	 * present on the command line, or CONFIG_BOOT_CONFIG_FORCE is set.
+	 * setup_boot_config() bails out under the same condition, so the
+	 * early prepend stays in lockstep with what the late runtime parser
+	 * would have applied. CONFIG_BOOT_CONFIG_FORCE defaults to y when
+	 * BOOT_CONFIG_EMBED is set, so on the default config the embedded
+	 * keys are applied unconditionally.
+	 */
+	if (IS_ENABLED(CONFIG_BOOT_CONFIG_FORCE) ||
+	    cmdline_find_option_bool(boot_command_line, "bootconfig"))
+		xbc_prepend_embedded_cmdline(boot_command_line, COMMAND_LINE_SIZE);
+
 	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
diff --git a/init/main.c b/init/main.c
index e363232b428b..2ecb6aa536dd 100644
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
@@ -421,8 +424,24 @@ static void __init setup_boot_config(void)
 	} else {
 		xbc_get_info(&ret, NULL);
 		pr_info("Load bootconfig: %ld bytes %d nodes\n", (long)size, ret);
-		/* keys starting with "kernel." are passed via cmdline */
-		extra_command_line = xbc_make_cmdline("kernel");
+		/*
+		 * keys starting with "kernel." are passed via cmdline. When
+		 * this bootconfig came from the embedded source and
+		 * setup_arch() already prepended the rendered "kernel" subtree
+		 * to boot_command_line, rendering again here would duplicate
+		 * the keys in saved_command_line and make accumulating handlers
+		 * (console=, earlycon=, ...) re-register the same value. Skip
+		 * only when the prepend really happened.
+		 *
+		 * On arches that do not select ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG,
+		 * CONFIG_BOOT_CONFIG_EMBED_CMDLINE is unselectable and
+		 * xbc_embedded_cmdline_applied() collapses to a stub returning
+		 * false, so this path still runs and the embedded "kernel"
+		 * keys reach the cmdline via the runtime parser exactly as
+		 * before this series.
+		 */
+		if (!from_embedded || !xbc_embedded_cmdline_applied())
+			extra_command_line = xbc_make_cmdline("kernel");
 		/* Also, "init." keys are init arguments */
 		extra_init_args = xbc_make_cmdline("init");
 	}

-- 
2.53.0-Meta


