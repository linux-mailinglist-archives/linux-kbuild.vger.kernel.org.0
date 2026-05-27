Return-Path: <linux-kbuild+bounces-13368-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ2GN2ofF2rw5AcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13368-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:44:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098A5E7F39
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47F8E3030074
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E0043E488;
	Wed, 27 May 2026 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Nz7giBmb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839C43D51A;
	Wed, 27 May 2026 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779900147; cv=none; b=EXYdfpVoWHN0ZEH6C5OboFiBuM9WAFooc2CS1kVJqobWcFuVS8QiIMlfPL+Es5PRBXuLnhDdYtl7boOCwsA1VUSops0KX2DDJ65RgPxCWTWe6KyuqftdvzMOtJIdDlfmbB9vf3Xc0UtKOcApvP0MDUGce9wLTWZmSMv9BCQVLvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779900147; c=relaxed/simple;
	bh=u8TivqtfuxjXhVadzsvzmKZSENicQ9GEXwCok1K8r5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7VDUkdaU5ZDHchKm2rKnP2Ezm2EgKrFaT+lTqIS4pmWOGJ6ElnTXzpcBwK1lOXPaBvrMgj5jy/7uIRyaVDRZULhSrJHfDiLXx6m8OKtWueai1G2woxDoZobOxrBULpJDqoaa1usDUIk5e6S0U5mcit10TF9LVSr94Tyt8k5ibI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Nz7giBmb; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=k0G/1hIbcwmtxPWuX+E3Ksr2kN5fJ2sgTjtC/gyLWxY=; b=Nz7giBmbwNisqgY+a5gG6Eb+qy
	bV+eKAg/SRf0ePKhglzJnle8RmWYE9B3VeTPS3f1Iaxq2KMyznOcx65UW5/aXyunnAbYhOEDJsWjM
	1Ot5atLUweQ0C4rWBzDyneEWZQtKicgctTtIEQWBVlBgXikpuYuusa7CV1UKN+UIBdFNjX10LUENz
	7R0ozz36ct2TXdLeDNo1v35HUBNqkgGmpxp8FIhsIeC9uSvbW3GspvJtvkFh0K7Fjkiee7NpiC0dT
	Kv7/8SvBl4DsKaksR+KHFYNPChL2vANCPBh6C8dtdw44UdZxJ2k+yRGHIOYz66/tkhv5DhBKPfk/T
	ct35a6Tg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wSHKb-003JPp-1p;
	Wed, 27 May 2026 16:42:09 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 27 May 2026 09:41:36 -0700
Subject: [PATCH 3/4] bootconfig: add xbc_prepend_embedded_cmdline() helper
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bootconfig_using_tools-v1-3-b6906a86e7d5@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3922; i=leitao@debian.org;
 h=from:subject:message-id; bh=u8TivqtfuxjXhVadzsvzmKZSENicQ9GEXwCok1K8r5c=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqFx7NGCQMUYnbaKnSbk7h4OGGd3VLD4EJ2cz4T
 CMvgvv8qbqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCahcezQAKCRA1o5Of/Hh3
 bVrNEACu7MeK46jFKUKXtk8wKh3StVbD3VleWAz6o4Sq83L2tXb+o3dbCT4GpUvJZ82s6UzU1H2
 zTCC/b/0UVJeayLxUhXa48mjX93F9DfvBZ2u0R+kn511/HngFc9hzjSl4LY3saA+9T+VNc3KANw
 7fk4t4c27F9X4oW4nZsDEjoVAiWStZxUs5zJzOS8vwEDAIi0lFAYcd2rhqa+XM/9vv3BRe7a7uy
 mHFOp2/xBkmtv0v7om8/3CwMLs7xP0B64QkE237meSOsVcom4P29YsPfPKF5wFD5jBHXJQJzYiI
 ov5BMLYJ8VPZ3FZYsMWj2W3HPOV7HuKr+iffNmugYZSwdlE96986bBDT7GfHHe6Se0iS2CMuZv3
 DgZSAvjqkIHI08Kj5GfKbBch7esA5AbyjtVtPD6bdPXObsgqwi3RF+9AOsIAYso5fEzQPbB4olv
 NpjFQvp4O0EWQ4BT6THBQtmRSpyGD4uwytXGET0Sv93cmF0av2ak30nlmsyBUupugEG67rc9ul5
 5z6F5jkj3RhDi5dF+WF/V/i646A3LVvzOQV8aGIrOmsnVNQHLT7UMAv9vWEa4yE2jy1G2yT+LG5
 ApOjZ/FfSqxeOM67Ynt8QIb+6RwifJ/i3v7EuJ8Sac2iD1pcxF2Khj2mrcpbQBRs8xVlRtJVPRG
 UvdK2SxEycyOCqQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13368-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1098A5E7F39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a helper that prepends the build-time-rendered embedded bootconfig
"kernel" subtree (embedded_kernel_cmdline[] from embedded-cmdline.S) to
a cmdline buffer with a separating space. Architectures call this from
setup_arch() before parse_early_param() so early_param() handlers
(mem=, earlycon=, loglevel=, ...) see values supplied via the embedded
bootconfig.

On overflow the helper logs an error and leaves the cmdline untouched
rather than panicking. Booting without the embedded values is better
than refusing to boot, and the error tells the user why their embedded
keys are missing.

When CONFIG_BOOT_CONFIG_EMBED_CMDLINE=n, the public declaration in
<linux/bootconfig.h> resolves to a no-op stub so callers compile
unchanged.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 include/linux/bootconfig.h |  7 +++++++
 lib/bootconfig.c           | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/include/linux/bootconfig.h b/include/linux/bootconfig.h
index 1c7f3b74ffcf..dcb0c86cbc54 100644
--- a/include/linux/bootconfig.h
+++ b/include/linux/bootconfig.h
@@ -308,4 +308,11 @@ static inline const char *xbc_get_embedded_bootconfig(size_t *size)
 }
 #endif
 
+/* Build-time-rendered bootconfig cmdline prepended in setup_arch() */
+#ifdef CONFIG_BOOT_CONFIG_EMBED_CMDLINE
+void __init xbc_prepend_embedded_cmdline(char *dst, size_t size);
+#else
+static inline void xbc_prepend_embedded_cmdline(char *dst, size_t size) { }
+#endif
+
 #endif
diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index 3a102c9122f7..10c62c8600c8 100644
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
@@ -34,6 +35,53 @@ const char * __init xbc_get_embedded_bootconfig(size_t *size)
 	return (*size) ? embedded_bootconfig_data : NULL;
 }
 #endif
+
+#ifdef CONFIG_BOOT_CONFIG_EMBED_CMDLINE
+/* embedded_kernel_cmdline is defined in embedded-cmdline.S */
+extern __visible const char embedded_kernel_cmdline[];
+extern __visible const char embedded_kernel_cmdline_end[];
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
+	if (dst_len)
+		memmove(dst + embed_len, dst, dst_len + 1);
+	else
+		dst[embed_len] = '\0';
+	memcpy(dst, embedded_kernel_cmdline, embed_len);
+}
+#endif
+
 #endif
 
 /*

-- 
2.54.0


