Return-Path: <linux-kbuild+bounces-12891-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPccLVHL72knGAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12891-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 22:47:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 149A947A3AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 22:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44A613020D72
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 20:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7176F36DA1A;
	Mon, 27 Apr 2026 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4nIRveM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68EB36EAAE
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 20:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777322670; cv=none; b=kLXJdhXfIQ2lrLdRsjyo+cuy0nmYRkbinX0wUp8byzEGHXtgudgyfjf3ecyklQmNBXqPFH5mfO25/clFvNahK6nWF+RynRFoxrpbT9JKnV2ASIIi3/Mbw1oDpCX669t9xeRXWrMaDn1edgFQujXXMLCjq6TIxiHCh69tDhFHFPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777322670; c=relaxed/simple;
	bh=y4Qc65a6Zk5drP3D1lfp0jcqgfVIZzRU+7WknUe+epk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FH2avyVJbqZstae/miMyKQb20TPs2yPaHS2VW8d1zdBuvxUrQd/YSoJMG5PgW1CeS68HtXV4bozvgDZwgQYL7bpPwE4xF4/7zzAOXvolZnz/tQ++VlaDSebwyP3kSqCX2tvWkiPF+di3GNwPO3SnZDoJXUurwKBxMTh9apjDqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4nIRveM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891cd41959so89839175e9.3
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 13:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777322667; x=1777927467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DlsMN5jtny510f6C8mgKbzJw/n5FmMG7ZjEs2DJD+98=;
        b=J4nIRveMYjp09QDdl6e++4oOn38SqkOjEbasKVfjb5oe+IyypmkkR+ALk4N5Fd2iff
         OA/nSdVFBAfPLJ3K+g4aecIojQFG+TS9XkBYfPc8RW9z1mhPmaatq9mMWuNICNe2gLVM
         /U4ue8t51qQO1ub3uJxK6m/0AzU+Zz+09znboz1/cc9zE9WeTeiXDlIB4WHJP7ZslqVc
         jG9vokp5fUaBau85BKPO/UhtArfquNYe8vxmqsX/WQ5ZZSbHkNXNmdh0ZPbUSkl6PZNd
         ChAlhkIlikMdxTcwnhFfy6vRCI/FT/87GNgQho84FnOdAyeQDZIo3ddTvKCFlM8aKFws
         gSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777322667; x=1777927467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlsMN5jtny510f6C8mgKbzJw/n5FmMG7ZjEs2DJD+98=;
        b=iNDdcGW4G75Osf9QLhM0T3arOi2zcL1bC9nMKqK46iVAoi7LTaFEQQY8NdCfFODMog
         kWnKszxuaX++BdUrWoy4vhULUCPUe7pQD/mxksJMhN3d2VfzChzYHaP1YlHic/GcGfvz
         ZXXmgt7QsQJpZjXcYheyEskoK3yqHomZLArzeDJrd3/irHgxnQMR/EzfKz8iq8XEi/rC
         /2nvwcsepOlPG4R/mOLU5jpELlue8qPwWyaeWj0dqdfxafcyU2foOn6NQvVwVtOyB5F9
         X5Xa2wzPlmj7pGpzWlntZTF3CXmekmEA3n99NlMwtxUOzS9O0nHmh6LAGs53r8rfFMv9
         +0TQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GDXJf0LiQrLUi82DEdY+EyVutKaT3hV7SSZba8RayWMQ57MyXm727BYE4TZZ05YH1tVxH9sFXtRWIM3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUspXXOxwmbi04yPUrepkrloFihE+0Us//waFIdi5yUO6bMlq3
	bCakHpCdjp/2thfE+AkWR7LF2StH/ZEKEk4zgRTSXT0qTyez6yM61gs7
X-Gm-Gg: AeBDiev1wQKOPWQL8G5hDHgM6khJvnoqDyZVWxzGKCUwYTXR9j/cEPbVS05OWzMUJ7d
	7LFSKX9vTik5Pkceafr4zTk084C4N7uC5AI/IWgua93N1EXI24MJcOT4XPsTdhEDP91QVVq8Ewt
	4G6/Mh585N0tIK7t/yZ8cxwh4isdL6Bn0FDTQp52xe81dtdS89uD95Ja82tnVyz9vovH0HlzMSN
	CIr3Ws1vpUzGS9Xi7yXMFzoCcRqxVgrmk7SXSRGRCWjufTlFXKMYJVrneR7nOf79Q6ILrw8oQuO
	MxpPdtyZEmWiAEUv7rLOC8wDQaEX1r4F+6o9zvIB6RKDnRwnLJs3mQ3S9+BgJdtDhe2ONYV3xUh
	ak092U1b0IEgW7LZcGasGkkFwcvntIHWG/fKF/8QXDFaENXeTLcpvOpRafB6JYzL3UMCFn8esxK
	WpCRtSxHbQDoF2L7rPRjMqms8rUxIa9CQxEie/FMWxG+soduAQtDRuUKgGTOYUCYQlYEtUaDrfE
	Ye4jBFq3sUiqwzwLB3J6w==
X-Received: by 2002:a05:600c:a414:b0:48a:53ea:13df with SMTP id 5b1f17b1804b1-48a77ad59bfmr3200145e9.2.1777322666885;
        Mon, 27 Apr 2026 13:44:26 -0700 (PDT)
Received: from localhost.localdomain (200.178.141.77.rev.sfr.net. [77.141.178.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59e5asm1097624f8f.5.2026.04.27.13.44.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 13:44:26 -0700 (PDT)
From: Hasan Basbunar <basbunarhasan@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hasan Basbunar <basbunarhasan@gmail.com>
Subject: [PATCH] modpost: prevent stack buffer overflow in do_input_entry()
Date: Mon, 27 Apr 2026 22:42:55 +0200
Message-ID: <20260427204255.22117-1-basbunarhasan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 149A947A3AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-12891-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[basbunarhasan@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Several functions in scripts/mod/file2alias.c build the module alias
string by repeatedly appending into a fixed-size on-stack buffer:

	char alias[256] = {};
	...
	sprintf(alias + strlen(alias), "%X,*", i);

In do_input_entry() this pattern is unbounded across nine bitmap
classes (evbit/keybit/relbit/absbit/mscbit/ledbit/sndbit/ffbit/swbit).
The keybit case alone scans bits from INPUT_DEVICE_ID_KEY_MIN_INTERESTING
(0x71) to INPUT_DEVICE_ID_KEY_MAX (0x2ff), which is 655 iterations; if
a MODULE_DEVICE_TABLE(input, ...) populates keybit[] densely, the
emission reaches ~3132 bytes — overflowing the 256-byte buffer by
about 12x. include/linux/mod_devicetable.h declares storage for the
full bit range ("keybit[INPUT_DEVICE_ID_KEY_MAX / BITS_PER_LONG + 1]"),
so the worst case is reachable per the ABI.

No driver in the current tree triggers this — every in-tree user of
INPUT_DEVICE_ID_MATCH_KEYBIT populates keybit[] very sparsely (1-3
bits). The concern is defense-in-depth: the unbounded sprintf is a
silent stack-corruption primitive in a host build tool, and the buffer
size has not been revisited since this code was added in commit
1d8f430c15b3 ("[PATCH] Input: add modalias support", 2005).

Reproduced under AddressSanitizer with a stand-alone harness mirroring
the do_input loop on a fully-populated keybit:

  ==18319==ERROR: AddressSanitizer: stack-buffer-overflow
  WRITE of size 2 at offset 288 in frame [32, 288) 'alias'
    #6 do_input poc.c:44

  Stack-canary build:
  Abort trap: 6  (strlen(alias)=3134, cap was 256-1)

Add a small alias_append() helper around vsnprintf with cumulative
bookkeeping. It calls fatal() on overflow, matching the modpost style
for unrecoverable build conditions. do_input() takes the buffer size
as a new parameter; do_input_entry() passes sizeof(alias) at every
call site. This bounds every write into the on-stack buffer and turns
the latent overflow into a clean build error if it is ever reached.

Reported-by: Hasan Basbunar <basbunarhasan@gmail.com>
Signed-off-by: Hasan Basbunar <basbunarhasan@gmail.com>
---
 scripts/mod/file2alias.c | 70 ++++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 20 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 4e99393a35f1..c377e9a3761c 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -651,7 +651,36 @@ static void do_vio_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, true, "%s", alias);
 }
 
-static void do_input(char *alias,
+/*
+ * alias_append() — bounded printf into a fixed-size alias buffer.
+ *
+ * Replaces the historical pattern  sprintf(alias + strlen(alias), ...)  used
+ * across this file. That pattern silently corrupts the stack when the
+ * cumulative formatted output exceeds the destination size; with a
+ * maliciously-crafted MODULE_DEVICE_TABLE() input the worst-case emission in
+ * do_input_entry() is about 12x the on-stack 256-byte buffer. Use snprintf
+ * with cumulative bookkeeping and abort the build on overflow.
+ */
+static void __attribute__((format(printf, 3, 4)))
+alias_append(char *alias, size_t size, const char *fmt, ...)
+{
+	size_t len = strlen(alias);
+	va_list args;
+	int n;
+
+	if (len >= size)
+		fatal("alias buffer (%zu) overflow before append\n", size);
+
+	va_start(args, fmt);
+	n = vsnprintf(alias + len, size - len, fmt, args);
+	va_end(args);
+
+	if (n < 0 || (size_t)n >= size - len)
+		fatal("alias buffer (%zu) overflow on append (need %d, have %zu)\n",
+		      size, n, size - len);
+}
+
+static void do_input(char *alias, size_t size,
 		     kernel_ulong_t *arr, unsigned int min, unsigned int max)
 {
 	unsigned int i;
@@ -659,13 +688,14 @@ static void do_input(char *alias,
 	for (i = min; i <= max; i++)
 		if (get_unaligned_native(arr + i / BITS_PER_LONG) &
 		    (1ULL << (i % BITS_PER_LONG)))
-			sprintf(alias + strlen(alias), "%X,*", i);
+			alias_append(alias, size, "%X,*", i);
 }
 
 /* input:b0v0p0e0-eXkXrXaXmXlXsXfXwX where X is comma-separated %02X. */
 static void do_input_entry(struct module *mod, void *symval)
 {
 	char alias[256] = {};
+	const size_t sizeof_alias = sizeof(alias);
 
 	DEF_FIELD(symval, input_device_id, flags);
 	DEF_FIELD(symval, input_device_id, bustype);
@@ -687,35 +717,35 @@ static void do_input_entry(struct module *mod, void *symval)
 	ADD(alias, "p", flags & INPUT_DEVICE_ID_MATCH_PRODUCT, product);
 	ADD(alias, "e", flags & INPUT_DEVICE_ID_MATCH_VERSION, version);
 
-	sprintf(alias + strlen(alias), "-e*");
+	alias_append(alias, sizeof_alias, "-e*");
 	if (flags & INPUT_DEVICE_ID_MATCH_EVBIT)
-		do_input(alias, *evbit, 0, INPUT_DEVICE_ID_EV_MAX);
-	sprintf(alias + strlen(alias), "k*");
+		do_input(alias, sizeof_alias, *evbit, 0, INPUT_DEVICE_ID_EV_MAX);
+	alias_append(alias, sizeof_alias, "k*");
 	if (flags & INPUT_DEVICE_ID_MATCH_KEYBIT)
-		do_input(alias, *keybit,
+		do_input(alias, sizeof_alias, *keybit,
 			 INPUT_DEVICE_ID_KEY_MIN_INTERESTING,
 			 INPUT_DEVICE_ID_KEY_MAX);
-	sprintf(alias + strlen(alias), "r*");
+	alias_append(alias, sizeof_alias, "r*");
 	if (flags & INPUT_DEVICE_ID_MATCH_RELBIT)
-		do_input(alias, *relbit, 0, INPUT_DEVICE_ID_REL_MAX);
-	sprintf(alias + strlen(alias), "a*");
+		do_input(alias, sizeof_alias, *relbit, 0, INPUT_DEVICE_ID_REL_MAX);
+	alias_append(alias, sizeof_alias, "a*");
 	if (flags & INPUT_DEVICE_ID_MATCH_ABSBIT)
-		do_input(alias, *absbit, 0, INPUT_DEVICE_ID_ABS_MAX);
-	sprintf(alias + strlen(alias), "m*");
+		do_input(alias, sizeof_alias, *absbit, 0, INPUT_DEVICE_ID_ABS_MAX);
+	alias_append(alias, sizeof_alias, "m*");
 	if (flags & INPUT_DEVICE_ID_MATCH_MSCIT)
-		do_input(alias, *mscbit, 0, INPUT_DEVICE_ID_MSC_MAX);
-	sprintf(alias + strlen(alias), "l*");
+		do_input(alias, sizeof_alias, *mscbit, 0, INPUT_DEVICE_ID_MSC_MAX);
+	alias_append(alias, sizeof_alias, "l*");
 	if (flags & INPUT_DEVICE_ID_MATCH_LEDBIT)
-		do_input(alias, *ledbit, 0, INPUT_DEVICE_ID_LED_MAX);
-	sprintf(alias + strlen(alias), "s*");
+		do_input(alias, sizeof_alias, *ledbit, 0, INPUT_DEVICE_ID_LED_MAX);
+	alias_append(alias, sizeof_alias, "s*");
 	if (flags & INPUT_DEVICE_ID_MATCH_SNDBIT)
-		do_input(alias, *sndbit, 0, INPUT_DEVICE_ID_SND_MAX);
-	sprintf(alias + strlen(alias), "f*");
+		do_input(alias, sizeof_alias, *sndbit, 0, INPUT_DEVICE_ID_SND_MAX);
+	alias_append(alias, sizeof_alias, "f*");
 	if (flags & INPUT_DEVICE_ID_MATCH_FFBIT)
-		do_input(alias, *ffbit, 0, INPUT_DEVICE_ID_FF_MAX);
-	sprintf(alias + strlen(alias), "w*");
+		do_input(alias, sizeof_alias, *ffbit, 0, INPUT_DEVICE_ID_FF_MAX);
+	alias_append(alias, sizeof_alias, "w*");
 	if (flags & INPUT_DEVICE_ID_MATCH_SWBIT)
-		do_input(alias, *swbit, 0, INPUT_DEVICE_ID_SW_MAX);
+		do_input(alias, sizeof_alias, *swbit, 0, INPUT_DEVICE_ID_SW_MAX);
 
 	module_alias_printf(mod, false, "input:%s", alias);
 }
-- 
2.53.0


