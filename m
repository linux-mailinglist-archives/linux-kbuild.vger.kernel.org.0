Return-Path: <linux-kbuild+bounces-13793-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VaZfEAWKMmq/1gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13793-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:50:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A53EC69946D
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:50:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=meEtyZI2;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13793-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13793-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BF2532F825D
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 11:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075A23FF1AD;
	Wed, 17 Jun 2026 11:24:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC72A3F9A0D;
	Wed, 17 Jun 2026 11:24:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695463; cv=none; b=b44UHp71KLK0GVtNvA6NxBkL4USBBema8YzHj25e4mRBeJk3t2Z8JRJOsuVt759HiFbcKmDWJP6sQ1uP1x/hmXtMPA6u45SXWktkunifby86LydkCMOWmUw/R838PHJDB7Ll7Odbd9Oxu2iU6yO7kLHV0Kk7AeYC6mKS+P2xuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695463; c=relaxed/simple;
	bh=SL24hV7dS1abHTdI0Wlu/pbg6mrIXfF+8P8HjNfkVZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYwGFmp+3Iq4a37EiGjSFHq4Ib7QgXDk1NeugEAfhI6uMWVS5ZrEfOrbY7yqLQ+fncbgC07sbjqTSZWovBtWsW/BYgTh7jZMA4UoW2VKz34bRPX1FLedL714rk4E2hRUSTO4ANkVR4W503i1PboW76nLaUlRvNT2M2z6aHl/RIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=meEtyZI2; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=J20qhpFQ9ej5a+p2uT3xdAYqYeGNZcJmYYHS3J3L/Rw=; b=meEtyZI2x520qwi7Ua27MGCceL
	6pVLBSjE+m3vs/z9IxOKh9r9ro3L7pyXNbbUDtZWrJVXS83zIMY4HRKTDUPf42oUQlmgkD0XmSjR5
	bPpDXFBGcSTFLtu0Ydl4ka2sncUBD+6lRKb46SX7Wdhp2Mj2X2CyHIwY/Qd5tUnXYPQ+v9s7Cql4H
	7wwzM7HtZHDY1oqA/BUM/kUMGkExN9lp8H1a22iO85YRzZz5xsdQ8NdEAN7hWWlZACsqEdydhIDyM
	bxHvlxGbfj15yiwKAg+AHTVxN/dO2pKl+7m7KyXI11yToG+VOZG1mmPabU/vHSngzJP3IMfWN5Kim
	A2CZhZoQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wZoNX-00EaGo-0T;
	Wed, 17 Jun 2026 11:24:19 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 17 Jun 2026 04:23:39 -0700
Subject: [PATCH v5 7/7] x86/setup: prepend embedded bootconfig cmdline
 before parse_early_param
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-bootconfig_using_tools-v5-7-fd589a9cc5e3@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6199; i=leitao@debian.org;
 h=from:subject:message-id; bh=SL24hV7dS1abHTdI0Wlu/pbg6mrIXfF+8P8HjNfkVZU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqMoO7NPRgzOHmfEG7KNZxpwGco4T94YclyeCOS
 wVYqVxjAyWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCajKDuwAKCRA1o5Of/Hh3
 batsD/92tFKKAnlsLH+Kz4qOQFLsPrA0ms2k/ORrAXrxDlm6rZkk01ikroLBPivK2wSBjSu7ykE
 i+HWJ3scYzICLdcgJxvWADgcXPYGHNi2HloHlz/782v1v/i4csjfKWUDyW8BxgkaqGwxNjimRuM
 FRnttKh+MB9RwiwTHBvgJaQx47MqXFvzBLP8450xRI0lAmQqF7lk/AKpONQvJLoHvlGjxAWwLtF
 WhgsDAORIPAkRd2nyRRABTS3Dpnrh078BRKMBo7mrJvDh3TD0CNBpaKgtYhYH8mhgQ1V+0RbUtZ
 uDwjWPskVLbwEBNDuhAqq1B+2oKa5NpW6n+/hpGGZusXj/8GlaAoAD6aySsj0PC/K+sxOuUX4MP
 DJWZpBODpcwVD4PGTukP0mucWwf3TIUBYXLW5Z3vRc2VZkgFj0lEobI7VxZa+mgzcRbhzA9Lnu9
 57CFsEgqIlBIN0CHb14M5dUc6KTNguL/3XU7KVd9bp6LGh3b/79+JCmvpCoJ2iGpb+etCtddbBv
 xURaMwBeZxD24HSc9Nym0md4EAavUrlnTEy46xIM+qDZRWZulJme7eXECLBLeU3CaFMQkLRTiA1
 k/IqpQh3YZkc8cHYLI2NbnPUFCC6eXAU+N3ODQJiP1PLIWI9mjhArDbKYTqJ7WmBBc8VhBWSBCy
 uP4pYZjvUZuyfbg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-13793-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: A53EC69946D

Call xbc_prepend_embedded_cmdline() in setup_arch() right after the
CONFIG_CMDLINE merge and before strscpy(command_line, ...) so the
build-time-rendered embedded bootconfig "kernel" subtree is part of
boot_command_line by the time parse_early_param() runs. early_param()
handlers (mem=, earlycon=, loglevel=, ...) now see values supplied via
CONFIG_BOOT_CONFIG_EMBED_FILE without parsing bootconfig at runtime.

Gate the prepend on the same opt-in the runtime parser uses: prepend
when "bootconfig" is present on the command line, or when
CONFIG_BOOT_CONFIG_FORCE is set. setup_boot_config()'s parse_args()
loop treats any presence of the "bootconfig" key as opt-in regardless
of value, so check both cmdline_find_option_bool() (matches the bare
key) and cmdline_find_option() (matches "bootconfig=<anything>").
Without the latter check, "bootconfig=0" would skip the early prepend
yet still trigger the late runtime apply, leaving the embedded keys
invisible to early_param() but applied to saved_command_line.

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
 arch/x86/kernel/setup.c | 27 +++++++++++++++++++++++++++
 init/main.c             | 25 ++++++++++++++++++++++---
 3 files changed, 50 insertions(+), 3 deletions(-)

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
index 46882ce79c3a4..d69ba84c203f1 100644
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
@@ -924,6 +926,31 @@ void __init setup_arch(char **cmdline_p)
 	builtin_cmdline_added = true;
 #endif
 
+	/*
+	 * Match the runtime bootconfig parser's opt-in: only fold the
+	 * embedded kernel.* keys into the cmdline when "bootconfig" is
+	 * present on the command line, or CONFIG_BOOT_CONFIG_FORCE is set.
+	 * setup_boot_config()'s parse_args() loop treats any presence of
+	 * the "bootconfig" key as opt-in (bare, =0, =1, ...), so check both
+	 * forms here: cmdline_find_option_bool() matches the bare key,
+	 * cmdline_find_option() matches "bootconfig=<anything>". Without
+	 * the second check, "bootconfig=0" would skip the early prepend
+	 * but still trigger the late runtime apply -- a split-brain state.
+	 * CONFIG_BOOT_CONFIG_FORCE defaults to y when BOOT_CONFIG_EMBED is
+	 * set, so on the default config the embedded keys are applied
+	 * unconditionally.
+	 */
+	{
+		char buf[8];
+
+		if (IS_ENABLED(CONFIG_BOOT_CONFIG_FORCE) ||
+		    cmdline_find_option_bool(boot_command_line, "bootconfig") ||
+		    cmdline_find_option(boot_command_line, "bootconfig",
+					buf, sizeof(buf)) >= 0)
+			xbc_prepend_embedded_cmdline(boot_command_line,
+						     COMMAND_LINE_SIZE);
+	}
+
 	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
diff --git a/init/main.c b/init/main.c
index e363232b428b4..2ecb6aa536dd1 100644
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


