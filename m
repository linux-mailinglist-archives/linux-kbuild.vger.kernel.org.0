Return-Path: <linux-kbuild+bounces-13656-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GRVQBW3zJmpGogIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13656-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 18:53:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E75658F1D
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 18:53:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=PZaIuFlm;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13656-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13656-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 061B130FA582
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 16:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811443C98BE;
	Mon,  8 Jun 2026 16:25:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050CD3BFE34;
	Mon,  8 Jun 2026 16:25:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935915; cv=none; b=htXcez8yMdIQIn9oo+vmvifcvP+TwGse75d3Njye36SH2wzPR/wOzHu9vk4Czh8CsIoAXRuYxUiIKv8oQLgjjtZJ1CK/+jo0RyKbr5JyoIx4f/k9u4zYy++wIScccdDmfyKZ1Gf1j6p4L+kXhh9hEGiuHaWmL7vOJ5cxB7NxmF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935915; c=relaxed/simple;
	bh=HphAVP8d1EmlWPiq3Xm6Fy1H9xBvQSlS+8N330xZBQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dVqgrY6Pcp8+w7B39Knxkm51TEFXJUPJInKEQ8neUQtv+9Lq3N6lLQl6c371DjVCRZK7xHLXCt8/yYqYq1ELZeohy7KxzhJ1LoTwYY3VIH4+FaAAi1+qMRUOcVpkbsJTdtOS0mLYuxr78iMoVOQn31ljNLAyFdoeEhEKprVTNbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=PZaIuFlm; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=76ZX8FMuSby1II008hNX9DM5CqfyvtNrG2xvmlC+9pU=; b=PZaIuFlmEx5nP8nAsMih1m0Pgu
	la7rhBT+qq24M8xVqpnnbbKJ1Ln5cppo5IjcfMUwquGS6R+hPxZdu50ZtMU6JXqQx5i7TQmLeBcrC
	abT1sEfIEhYKAOrkcfv7US8yU79Kg8P/SOxEF7jKZfujiaerPv0vtKzNsWnT/Oh1pOEibRdzqeDzm
	AnQ/mVX99oa9bVasSmMr6Czht7gcCBWvT1twFashOxEi6yTao/M5+T88lg3WntlZijsIu8AAiNw+X
	5e+b81Y/lg+r3yrbIHZz8imTd2YfyGUeLNRaVA9Sj4vg/f2wlTvBstkQ8d8Cjj243T0QDBfo0uz8w
	cTtx/FJw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWcml-007kk9-2h;
	Mon, 08 Jun 2026 16:25:12 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 08 Jun 2026 09:24:02 -0700
Subject: [PATCH v3 5/6] bootconfig: add xbc_prepend_embedded_cmdline()
 helper
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-bootconfig_using_tools-v3-5-4ddd079a0696@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5585; i=leitao@debian.org;
 h=from:subject:message-id; bh=HphAVP8d1EmlWPiq3Xm6Fy1H9xBvQSlS+8N330xZBQs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqJuzK10c7DZ0XI10AnC5xdb7i/1xWBj2zVz6Tu
 KsnNgku/sOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaibsygAKCRA1o5Of/Hh3
 bbbfEACSFcbI/bagdsqbASrDjrn969hjA6NLURUPqFAWRPz1agcqIHFUhpP28n+xfu5PNgGpOsH
 0N7ioYfdNHfoZcemJqMPB+jOxP+2cNQlE740neq6/wjm28wyfTBY4uyFbIIwO7iX5hoEq+iO8sj
 RwZsKu2JWf0Y2Mye7huOCbW72+FFs1NiHV/vXauFEv+6MdNY58zK2fJl28inWyQ7BhaI/R2c7qy
 T5N8pspuOXEJwJqP+yOwMei0KQ02g6slh+n4GgyeQpc9XVxyLC9jn50qZFvBvY1leKjoRggDlbE
 PpxGhMaVX7F3GTaRWcPJBlEojb2ul/JIlWmCPT5rfMNG0F+9MWgK721JQWOivPZz6vLwmNAN7P3
 +aeL/EF6k9Hr7BeiLGPk2ZwnM0x9zFeKqpU77PQmGk1cCkOYaXNfsLrZ5xopdX6w91xNBa1fs+6
 xHNrph/m7U7mUXnsUJTympfk+EgNAUJUGyTZF6rTRH3laOa+mk/nlBKZvjREniP+YW7FjdzxVJt
 eFKbUO4o/E2CU6RQfYMNNiwoNQ8YWzGZc1EZANSlMj5cm/RcHLujUcy4t4yUHXITJGKELbTlI82
 1hI4emZ4K5EyQaxMEnlBeW9Skjp7rF4nqPsh8qMBTWP7/rAxJtWk3UbdxuwmV/ruH6/PJUgWBvM
 VY1EALIy0qGfwGg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
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
	TAGGED_FROM(0.00)[bounces-13656-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22E75658F1D

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


