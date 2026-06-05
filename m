Return-Path: <linux-kbuild+bounces-13593-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n/6oGU69ImrhcwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13593-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:13:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DE9647FA3
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:13:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=AZoEa8We;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13593-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13593-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6729F30BAEAA
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 12:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341DC4DBD61;
	Fri,  5 Jun 2026 12:04:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620EE4DA551;
	Fri,  5 Jun 2026 12:04:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661061; cv=none; b=FwMv3uqqGlb5xtozd4mImGBqJdWBUQ41wfMVUBZYBAEnew+RspVggeE14G7GgA+OI72xGXP4A/3evWs6+thBl7X2NcGl6OFHJQ5xF/qbeLjiPVeH5SMiPofDAkGKKeYBt4LdFBuPXMWwyoCy85V4bqdGUI5QDyl0icujAJyn18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661061; c=relaxed/simple;
	bh=HphAVP8d1EmlWPiq3Xm6Fy1H9xBvQSlS+8N330xZBQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BfM26NL85LBB3f7Nc0xYj9379oti3TrtLRGPS/YTxEwBS0QkzbsrXgvi4cPEy025yNDmEWz/94K9knz7sQHtZ0zJfx4tWaKplAuK+RyWjXYcReXa0v2rsnZSal90t6P2xQ81jG86EqQS2kSW13KvB9h4Cfr7nnmYHSbdKLENK6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=AZoEa8We; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=76ZX8FMuSby1II008hNX9DM5CqfyvtNrG2xvmlC+9pU=; b=AZoEa8Weoz14vD4VAaQdiFQYCn
	ztnmyPsU7BjmKNRBdINixUtG7low2FjLCQ2f/ZyiMj3EDiRnHt3c1oTp6F1ydSXE/31JEfcWGq/+u
	N66soHE9J08gbAZ10pK7dCGNiwJKeVrNd3w354yKOJXurfJ1zXPa8W6Th3bxKjC2YT+4oncaop9CG
	8Hoci4YMlSFBQ04lMurU2SZ5GS4TICGDoD0yMUkkZkCeB0KdRwuBX72GO4g+HBtxYLjqINNUMFsif
	B9H5fLkrIr0q6xLQVTI8rbTWV2GsMh9IsJG+ZO9AJDM3omR/g9eE/UAixTxV+yFrkSgpRC/j00lV6
	f7nUqmBQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wVTHZ-005HI2-2O;
	Fri, 05 Jun 2026 12:04:14 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 05 Jun 2026 05:03:36 -0700
Subject: [PATCH v2 5/6] bootconfig: add xbc_prepend_embedded_cmdline()
 helper
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-bootconfig_using_tools-v2-5-d309f544b5f7@debian.org>
References: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
In-Reply-To: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5585; i=leitao@debian.org;
 h=from:subject:message-id; bh=HphAVP8d1EmlWPiq3Xm6Fy1H9xBvQSlS+8N330xZBQs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqIrsfXOwGNzV0u+KYBTP6M7Fn32x9v2PFRu2Ol
 cp3dDYnaHyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaiK7HwAKCRA1o5Of/Hh3
 bSiMD/4tASADVfGP3XbFFOX7ZP8sYoUF8gF3eApu/TPj4gIJvlfYsGS5mF+wfK/kKoq6zpmQBBt
 DUL4lv6AH2EYV8Pseo+GQ7weaBqR/yO7k02Yit4kiAcMqotT+5O60lWt1V1HhBLPeTWCzfLwiPH
 JPhqaMG4Y1yevAoyNID2ay1YStBv2MF2hstG4czZwN7W3OQB5zZoZ/bzhdJhvzddQMQ05kpXxHY
 DOw6yNdEwnfnCVZ0N9kG49hVPZYc1qZ+XBPNRFujUSKQAjrK9aSVH9HcP1WLOR/mKly+nwKtGQ/
 2oNPdcadrLFRs4nynR1SLO5IwavtJ6Ak62Sx8+rdcS0O6/y5aqE4eSzyoHjzWonAUybO1zenoqA
 sVZ5v06y+dDBpjFOd3Ev6uiq6VFoNMUvOHDRJuM0GcwhDP8d7g16qjKa2M4XuzpmkXa0G3NJeZg
 lHiKWVp/tIeJo+7mSdoZeqiEziBE02K2jVX9l/roGaW5iZYe5hy5j6l1a3H4ym4njVDbzJtIGC9
 aP6cLeLOejQTNRIVWcgeA/h/pM7Pg8LYl7+RWq1FKa75usSk9itAHnyjcJRDF2vo5/QqMmuCA6m
 lsfMHOhbktS0icdeKr0Mr/QM5CYh+xQToAXD3YFGnerAs/irv0NFGU4eCa7LL0U2VEiVZQikaQS
 dExEUCS6yK2bccA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13593-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6DE9647FA3

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

When CONFIG_BOOT_CONFIG_EMBED_CMDLINE=n, the public declaration in
<linux/bootconfig.h> resolves to a no-op stub so callers compile
unchanged.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 include/linux/bootconfig.h |  9 ++++++
 lib/bootconfig.c           | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/include/linux/bootconfig.h b/include/linux/bootconfig.h
index 1c7f3b74ffcf..c186137f87ac 100644
--- a/include/linux/bootconfig.h
+++ b/include/linux/bootconfig.h
@@ -308,4 +308,13 @@ static inline const char *xbc_get_embedded_bootconfig(size_t *size)
 }
 #endif
 
+/* Build-time-rendered bootconfig cmdline prepended in setup_arch() */
+#ifdef CONFIG_BOOT_CONFIG_EMBED_CMDLINE
+void __init xbc_prepend_embedded_cmdline(char *dst, size_t size);
+bool __init xbc_embedded_cmdline_applied(void);
+#else
+static inline void xbc_prepend_embedded_cmdline(char *dst, size_t size) { }
+static inline bool xbc_embedded_cmdline_applied(void) { return false; }
+#endif
+
 #endif
diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index 926094d97397..f66be0b2dc24 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -19,6 +19,7 @@
 #include <linux/errno.h>
 #include <linux/cache.h>
 #include <linux/compiler.h>
+#include <linux/printk.h>
 #include <linux/sprintf.h>
 #include <linux/memblock.h>
 #include <linux/string.h>
@@ -34,6 +35,83 @@ const char * __init xbc_get_embedded_bootconfig(size_t *size)
 	return (*size) ? embedded_bootconfig_data : NULL;
 }
 #endif
+
+#ifdef CONFIG_BOOT_CONFIG_EMBED_CMDLINE
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
+#endif
+
 #endif
 
 /*

-- 
2.53.0-Meta


