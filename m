Return-Path: <linux-kbuild+bounces-13894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VupVHWJ2PmokGgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13894-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 14:53:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A1D6CD31D
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 14:53:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=c+ka3L9m;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13894-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13894-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F9A830C31AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 12:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BCC3F4DEF;
	Fri, 26 Jun 2026 12:51:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E9F3EB118;
	Fri, 26 Jun 2026 12:50:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478260; cv=none; b=TO+3MyfELMsgNRYS9NGBYnt+xOp76zGdDgSHwI+2gSsE79vzzytCaRe9qVbUoF8uMxJArpMoAIId9SlDAv6EJwiFI05hFWfunzFL+CJTHJCGjtr2VQazIlTyHdVkwrgz6vsioQW6labunV1ieAOwxJAyg0309dmz66Pfr+HSFT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478260; c=relaxed/simple;
	bh=AVjKBKnR1q1Gs5Gir8ReuhE+T7tMdZ5Cu8bVw5IwNds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebZMXN/v8qWVuacwIk9PDdmnn+dhtQ5jEjlljRuS/5vffvJWdJyAVscvT1bKCWLIX6ldtwf9xOSnsgZyyy12xFLroVn+pZOg/ymP1izL2SZH/sgDkh4+TUw8OITdBeqLzo3YRzLAk6MiB19ArMRyBskGyovSNbHynCyUrOmcxIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=c+ka3L9m; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=VEaXyu2vgwkyy50aqqHKVgBYgIO2SiD9mND+9hWGMQE=; b=c+ka3L9mCpBN+mnDt3jHY7Lb8q
	YUmtdQ6KPz7pblz9k7kp3D7Gu4Yf5s4XuM/8FusMyHqE6Nz3Ev2h6MzBvp6fWzUCwOmeWmj7wMs0Z
	T+WG3SywvsbeEkqEhwWEQMSF4KN4iy+8YqlecqgByR9jFCt7QkM3AEKPBeUHqjbDjRvZBS+/9jUdR
	cEljaKRs2K6Ju1c3iIJUZRedHfi6mAVVRkwDYsu1QHNhgu/PrZN0D8yaeBjAyKbg8j35WSYxmh12Q
	ftWMZ/+A/Mpz0Tjg7OcuJUbX2Q2ImBV2k1yko5ARn+BVpQOcYpoVbZGroLONWnz/QOUWrKWNCDLBO
	YqqMHdHg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wd61I-003ylx-0Q;
	Fri, 26 Jun 2026 12:50:56 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 26 Jun 2026 05:50:14 -0700
Subject: [PATCH v7 5/9] bootconfig: add xbc_prepend_embedded_cmdline()
 helper
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-bootconfig_using_tools-v7-5-24ab72139c29@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8274; i=leitao@debian.org;
 h=from:subject:message-id; bh=AVjKBKnR1q1Gs5Gir8ReuhE+T7tMdZ5Cu8bVw5IwNds=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqPnWL/NcBM/t6e+xHH+LdCdmxlm4lYJ0p47z6c
 HKbhAFrUBuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaj51iwAKCRA1o5Of/Hh3
 bU97D/9eN69dOkQza+Bjxsep2zeulbhfH5riucjp5vQ7lW05XKsDPbtPhDEIChHNmyQ07ip0I1t
 7aCCCvVRjTH2gZDAK7bYAp/kQbjjPErpIvv7MpyYcZ6cbI7ejcRSE0RPRM+wKoxWIdfO8OFKlGg
 oXAgCoH9Jdrc26IbSyDelVrJYW39pF7T6cNgzF7zp3ylkH8kXicIFy6lAYGVHW5jwxP0T/YBwKk
 RyNFJ7ck2LU3FA4p6OOslnVTcc5gUCUrNeeEWSHe81Emf1lLrWCUAh8Ct4eJfLDpgxZhdfB/rhV
 MXbGIcleir86oDLxe1Ss883wsZMRO8ubGgnrpqcyoFLAMADlo/DQ6aLAqxk8F6WKyBL6WdWpI5d
 sLz00ucHQPtbNKXRaTsC/QJvjO14B+y7/mNTaYPYfAUcvMpWe5Pqs950jcyVBgx/5Cv3+AHYtby
 15+eA+egLcH1/uy6sh9wYZW0Ak+Y1HAbOv9IpGfMI+smZPVlE9T/Xm+KZdObjJVNa6yPhx2apql
 QnLdakx58CjZoNsvtv6wcneK+6f766MMOy+95fjKva6eFQD6+NASywoz/p5xVhqQImx0+FCnWha
 KaFBSSuX28Pl3paUY3/S7B03Ycdxk5btr5YMVbMuIUzE87toThEASc4W2i/HQd4HzSwvWZgwW8Y
 sLFIztAMqQqrKKA==
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
	TAGGED_FROM(0.00)[bounces-13894-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8A1D6CD31D

Add a helper that prepends the build-time-rendered embedded bootconfig
"kernel" subtree (embedded_kernel_cmdline[] from embedded-cmdline.S) to
a cmdline buffer with a separating space. Architectures call this from
setup_arch() before parse_early_param() so early_param() handlers
(mem=, earlycon=, loglevel=, ...) see values supplied via the embedded
bootconfig.

The in-place prepend (shift the existing string right, then drop the
embedded string in front) is factored into a small str_prepend() helper.

On overflow the helper logs an error and leaves the cmdline untouched
rather than panicking. Booting without the embedded values is better
than refusing to boot, and the error tells the user why their embedded
keys are missing.

The helper records whether it actually prepended, exposed via
xbc_embedded_cmdline_applied(). setup_boot_config() uses this to decide
whether the runtime "kernel" render would duplicate keys already folded
into boot_command_line.

Also add bootconfig_cmdline_requested(), a small parse_args() wrapper
that reports whether "bootconfig" was passed on the command line and,
via an optional out-parameter, where the "--" init arguments begin.
setup_arch() and setup_boot_config() share it so the early and late
paths agree on the opt-in. It sits under CONFIG_BOOT_CONFIG rather than
CONFIG_CMDLINE_FROM_BOOTCONFIG because the runtime parser needs it on
every bootconfig build.

When CONFIG_CMDLINE_FROM_BOOTCONFIG=n, the public declaration in
<linux/bootconfig.h> resolves to a no-op stub so callers compile
unchanged.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 include/linux/bootconfig.h |  14 +++++
 lib/bootconfig.c           | 128 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 141 insertions(+), 1 deletion(-)

diff --git a/include/linux/bootconfig.h b/include/linux/bootconfig.h
index 1c7f3b74ffcf3..deda507500da2 100644
--- a/include/linux/bootconfig.h
+++ b/include/linux/bootconfig.h
@@ -308,4 +308,18 @@ static inline const char *xbc_get_embedded_bootconfig(size_t *size)
 }
 #endif
 
+/* Bootconfig opt-in detection, shared by setup_arch() and setup_boot_config() */
+#ifdef CONFIG_BOOT_CONFIG
+bool __init bootconfig_cmdline_requested(const char *boot_cmdline, int *end_offset);
+#endif
+
+/* Build-time-rendered bootconfig cmdline prepended in setup_arch() */
+#ifdef CONFIG_CMDLINE_FROM_BOOTCONFIG
+void __init xbc_prepend_embedded_cmdline(char *dst, size_t size);
+bool __init xbc_embedded_cmdline_applied(void);
+#else
+static inline void xbc_prepend_embedded_cmdline(char *dst, size_t size) { }
+static inline bool xbc_embedded_cmdline_applied(void) { return false; }
+#endif
+
 #endif
diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index 926094d97397e..89c88e359179f 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -19,9 +19,13 @@
 #include <linux/errno.h>
 #include <linux/cache.h>
 #include <linux/compiler.h>
+#include <linux/init.h>
+#include <linux/moduleparam.h>
+#include <linux/printk.h>
 #include <linux/sprintf.h>
 #include <linux/memblock.h>
 #include <linux/string.h>
+#include <asm/setup.h>		/* COMMAND_LINE_SIZE */
 
 #ifdef CONFIG_BOOT_CONFIG_EMBED
 /* embedded_bootconfig_data is defined in bootconfig-data.S */
@@ -34,7 +38,129 @@ const char * __init xbc_get_embedded_bootconfig(size_t *size)
 	return (*size) ? embedded_bootconfig_data : NULL;
 }
 #endif
-#endif
+
+#ifdef CONFIG_CMDLINE_FROM_BOOTCONFIG
+/* embedded_kernel_cmdline is defined in embedded-cmdline.S */
+extern __visible const char embedded_kernel_cmdline[];
+extern __visible const char embedded_kernel_cmdline_end[];
+
+/* Set once the embedded cmdline has actually been prepended. */
+static bool xbc_cmdline_applied __initdata;
+
+/*
+ * str_prepend() - Prepend @src in front of the string in @dst, in place
+ * @dst: NUL-terminated destination buffer, currently @dst_len bytes long
+ * @dst_len: length of the current @dst string (excluding its NUL)
+ * @src: bytes to prepend (not NUL-terminated)
+ * @src_len: number of bytes from @src to prepend
+ *
+ * The caller must guarantee @dst has room for src_len + dst_len + 1 bytes.
+ * Moving dst_len + 1 bytes carries @dst's NUL terminator too, so an empty
+ * @dst needs no special case.
+ */
+static void __init str_prepend(char *dst, size_t dst_len,
+			       const char *src, size_t src_len)
+{
+	memmove(dst + src_len, dst, dst_len + 1);
+	memcpy(dst, src, src_len);
+}
+
+/**
+ * xbc_prepend_embedded_cmdline() - Prepend embedded bootconfig cmdline
+ * @dst: cmdline buffer to prepend into (must already contain a NUL byte)
+ * @size: total capacity of @dst in bytes
+ *
+ * Prepend the build-time-rendered "kernel" subtree of the embedded
+ * bootconfig to @dst. The rendered string already ends with a single
+ * space (the xbc_snprint_cmdline() invariant), which serves as the
+ * separator between the embedded keys and any existing content of @dst.
+ * On overflow, log an error and leave @dst untouched rather than
+ * silently truncating: booting without the embedded values is better
+ * than refusing to boot, and the error message tells the user why
+ * their embedded keys are missing.
+ *
+ * Intended to be called from setup_arch() before parse_early_param() so
+ * that early_param() handlers see the embedded values.
+ */
+void __init xbc_prepend_embedded_cmdline(char *dst, size_t size)
+{
+	size_t embed_len = embedded_kernel_cmdline_end - embedded_kernel_cmdline;
+	size_t dst_len;
+
+	if (!size || embed_len <= 1)	/* trailing NUL only */
+		return;
+	embed_len--;			/* exclude trailing NUL byte */
+
+	dst_len = strnlen(dst, size);
+	if (embed_len + dst_len + 1 > size) {
+		pr_err("embedded bootconfig cmdline (%zu bytes) does not fit in COMMAND_LINE_SIZE with %zu bytes already used; ignoring embedded values\n",
+		       embed_len, dst_len);
+		return;
+	}
+
+	str_prepend(dst, dst_len, embedded_kernel_cmdline, embed_len);
+	xbc_cmdline_applied = true;
+}
+
+/**
+ * xbc_embedded_cmdline_applied() - Did the embedded cmdline get prepended?
+ *
+ * Return true if xbc_prepend_embedded_cmdline() actually prepended the
+ * embedded "kernel" subtree. setup_boot_config() uses this to avoid
+ * rendering the same keys a second time.
+ */
+bool __init xbc_embedded_cmdline_applied(void)
+{
+	return xbc_cmdline_applied;
+}
+#endif	/* CONFIG_CMDLINE_FROM_BOOTCONFIG */
+
+/* parse_args() callback: flag when the "bootconfig" parameter is present. */
+static int __init bootconfig_optin(char *param, char *val,
+				   const char *unused, void *arg)
+{
+	if (!strcmp(param, "bootconfig"))
+		*(bool *)arg = true;
+	return 0;
+}
+
+/**
+ * bootconfig_cmdline_requested() - Was "bootconfig" passed on the cmdline?
+ * @boot_cmdline: kernel command line to inspect (not modified)
+ * @end_offset: if non-NULL, set to the offset of the init arguments that
+ *		follow a "--" separator, or 0 when there is none
+ *
+ * Parse a private copy of @boot_cmdline (parse_args() is destructive) and
+ * report whether "bootconfig" is present before the "--" separator.
+ * setup_arch() uses this to gate prepending the build-time embedded cmdline;
+ * setup_boot_config() uses it for the runtime opt-in and to locate the init
+ * arguments via @end_offset. Sharing one parser keeps the early and late
+ * paths agreeing on what counts as opt-in. CONFIG_BOOT_CONFIG_FORCE is not
+ * folded in here; callers apply it where they need it.
+ */
+bool __init bootconfig_cmdline_requested(const char *boot_cmdline, int *end_offset)
+{
+	static char tmp_cmdline[COMMAND_LINE_SIZE] __initdata;
+	bool found = false;
+	char *err;
+
+	if (end_offset)
+		*end_offset = 0;
+
+	strscpy(tmp_cmdline, boot_cmdline, COMMAND_LINE_SIZE);
+	err = parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0,
+			 &found, bootconfig_optin);
+	if (IS_ERR(err))
+		return false;
+
+	/* parse_args() stops at "--" and returns the address of the rest. */
+	if (end_offset && err)
+		*end_offset = err - tmp_cmdline;
+
+	return found;
+}
+
+#endif	/* __KERNEL__ */
 
 /*
  * Extra Boot Config (XBC) is given as tree-structured ascii text of

-- 
2.53.0-Meta


