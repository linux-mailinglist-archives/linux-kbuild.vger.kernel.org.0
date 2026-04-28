Return-Path: <linux-kbuild+bounces-12896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLLUERBU8Gk7RwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12896-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 08:30:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD0747E10F
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 08:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD3423019382
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 06:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AAD309EFF;
	Tue, 28 Apr 2026 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okOop3dS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C03A2F5A29
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357837; cv=none; b=nzPmWtelhxrJGFBxNRVp+FNWz9kKsNhxkaGE4+IY4ZL1a9ZDTKkFcGN9Gi7T3zBXT9UqEw+bJIOk/KYD2DWFJKqihmj8RaKVIwj2PPheA8i1+GOR27ziXjfTnknbFCdJx8/h1d4NpYvqHsOENs1d9DJ05x4zQoRASW+p+DbtFKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357837; c=relaxed/simple;
	bh=j3IqJQdcM0Zy3RwWqszyUBFdLJynfCIWbav1CqrYB4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfBiIb4yeZ24KvThaLo5kRT9YUpeYWt6mBw1iIoZQIf0IIE16NTSh6DrzsPcPS9J2+bP2pfp/4zri1unnf9VroQNiIhKAusuOW7wmrnoDFDQ/RTpKFA9ebdOMiWHCyyPXGbsgsmNvLjps0H0dex2JynSHgg9m1TSRBXXKjd/fZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okOop3dS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891f625344so99121975e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 23:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777357833; x=1777962633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtTT07RdBQhF1roXYRx7dPOXPIQAte4fLwk9+oQim7k=;
        b=okOop3dSm86hYYv96zCKjFVoorbbRab4TG+Yul3ielYlF1P8164FYfCanCrdGcdHfQ
         Y9krgU4EWXoZN077rKS77izilL7gjulVXrX8TlCcdOy5/T2r8mGk1kFKzS3ITGP6fFnf
         +2/5eAXpW284MuM+A+OnfTBA3xtIXrOVJhkNrCgH6TBwL5QBPukbLrPKOn6+bQ260CbT
         G+KWzlGUCzEZNp2QeMmJzMkvvCB8N9M+WEtZliZNUTKQGjWaRvIUmi8Y8X5DpW4g0ZQX
         mdiMku+xNz6aFeXo2may+j41g09ku0dZqcvRg9s1+jf1Uyrj2oYXmG8oWc/TFy+3YO3H
         v25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777357833; x=1777962633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OtTT07RdBQhF1roXYRx7dPOXPIQAte4fLwk9+oQim7k=;
        b=OZzlkdweQ/z46zmHfFoJqZMMFDUeD462JbQr4iokKUtI9sA7hPZK4R/o3P36qQqPLE
         XuGxX4p8dnZ0aUiI3vTgCX4tjyWdvAsk4I3PLee98MCR4KyH9eOpoxnoLCGtILrSMP0v
         BboKRt9nCjpZpN6Q+7HTf8DhpZJFGvc1c9pLLSQHsb363vXRZoUE3ug9acDjuDr8lGoC
         Cq0xiS7H411Tslew5HwIlqV0mEFXHi8tzJa+GRvPiWW1rZJQ3dBl23VZTL1OAgmV4OrP
         1tcwgQstSaGh6AY6wsMS2gLrtxpmVugBO8z/bPozNDxQJ2bfeX6/pR16vEbDQ3xeUCzi
         PiQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MZAE75Ed65FG4sX0ScyMN0UxToSKa8LnBy28GujwMpe7sallGewRC8bBmYSYv5p0z0gtDuOHe40jINlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyHTFSiokzc8beakhZhDXeAXrPbYDxe3QOYrRDK6UC2si4u26i
	LqB/1Pu6bednmtyITsMq38H0aneGVwruLe/8bLZQ6OHWrn2RD0OOKVj5
X-Gm-Gg: AeBDievLNlC4je2axaJgPuYtTAE3nUw6+PKgt99jiUcIhff1uV+Tg+DoQv6/3Lh+z5Y
	f5dR1KpXHSj+AbHb5NnB5S2OgBuvBpNCmqRqX2wX877i1bILU6+WLhiI4j+FvuDD4Ka2BJghbSI
	iwKbDX0tmh6uTIe3/YU6tLkkkqG90tKJ+vMlCsoHDiMb53Ig3teZ9bmZmnkJuTLIrCHzyp3Nxyt
	QrHgD4Myjxc/vkPx0usMrpRjUsdsTdvMrHHaI9HtEMH4jrYBbQh+j25RCISv5SphuVsXjV5R9YQ
	xQe+c1mz19vO7C2T5rOQCDVkzklIgY3/bDFgb6d49OYI2wXzka9RS1S9OGGL+WbCZMIpsAKfsdz
	kZbFIfIsViIrJTr7QzMc00NuI904mh5gBloevDQfopBny0ccQU/9eU1FtWnYDOAc4taKOky3u4O
	LIFgbt96UY8txuCIvHpZGKZuZOuW+HwqxnAgsdY1oc9OhMvrA3cYmPw9oRlL9u9JUngBG9FJaTI
	+xqOJCjeVxrzyBNIynQtOTEVJrGDoCM
X-Received: by 2002:a05:600c:a08b:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a78a536acmr16406325e9.14.1777357832290;
        Mon, 27 Apr 2026 23:30:32 -0700 (PDT)
Received: from localhost.localdomain (200.178.141.77.rev.sfr.net. [77.141.178.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77afa168sm32522545e9.7.2026.04.27.23.30.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 23:30:31 -0700 (PDT)
From: Hasan Basbunar <basbunarhasan@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hasan Basbunar <basbunarhasan@gmail.com>
Subject: [PATCH v2] modpost: prevent stack buffer overflow in do_input_entry() and do_dmi_entry()
Date: Tue, 28 Apr 2026 08:29:12 +0200
Message-ID: <20260428062912.32918-1-basbunarhasan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427204255.22117-1-basbunarhasan@gmail.com>
References: <20260427204255.22117-1-basbunarhasan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ABD0747E10F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-12896-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[basbunarhasan@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Several functions in scripts/mod/file2alias.c build the module alias
string by repeatedly appending into a fixed-size on-stack buffer:

	char alias[256] = {};
	...
	sprintf(alias + strlen(alias), "%X,*", i);

This pattern is unbounded and silently corrupts the stack when the
formatted output exceeds the destination size. Two functions in this
file are realistically reachable with input that overflows their
buffer:

1. do_input_entry() appends across nine bitmap classes
   (evbit/keybit/relbit/absbit/mscbit/ledbit/sndbit/ffbit/swbit). The
   keybit case alone scans bits from INPUT_DEVICE_ID_KEY_MIN_INTERESTING
   (0x71) to INPUT_DEVICE_ID_KEY_MAX (0x2ff), 655 iterations; if a
   MODULE_DEVICE_TABLE(input, ...) populates keybit[] densely, the
   emission reaches ~3132 bytes — overflowing the 256-byte buffer by
   about 12x. include/linux/mod_devicetable.h declares storage for the
   full bit range ("keybit[INPUT_DEVICE_ID_KEY_MAX / BITS_PER_LONG + 1]"),
   so the worst case is reachable per the ABI.

2. do_dmi_entry() emits one ":<prefix>*<filtered_substr>*" segment per
   matched DMI field, up to 4 matches per dmi_system_id. Each substr
   is sized as char[79] in struct dmi_strmatch (mod_devicetable.h:584),
   and dmi_ascii_filter() copies it verbatim into the alias buffer
   without bounds. Worst case: 4 × (1 + 3 + 1 + 79 + 1) = 336 bytes
   into alias[256], an 80-byte overflow.

No driver in the current tree triggers either case — every in-tree
INPUT_DEVICE_ID_MATCH_KEYBIT user populates keybit[] very sparsely
(1-3 bits), and no in-tree dmi_system_id has four maximally-long
matches. The concern is defense-in-depth: both unbounded sprintf
chains are silent stack-corruption primitives in a host build tool,
and the buffer sizes have not been revisited since the corresponding
code was first introduced.

The other do_*_entry() handlers in this file (do_usb_entry,
do_cpu_entry, do_typec_entry, ...) were audited and are bounded by
their input field sizes (uint16 IDs, fixed-length keys); their alias
buffers do not need this treatment.

Reproduced under AddressSanitizer with a stand-alone harness mirroring
do_input on a fully-populated keybit:

  ==18319==ERROR: AddressSanitizer: stack-buffer-overflow
  WRITE of size 2 at offset 288 in frame [32, 288) 'alias'
    #6 do_input poc.c:44

  Stack-canary build:
  Abort trap: 6  (strlen(alias)=3134, cap was 256-1)

Add a small alias_append() helper around vsnprintf with a remaining-
space check and call fatal() on overflow, matching the modpost style
for unrecoverable build conditions. do_input() takes the buffer size
as a new parameter; do_input_entry() and do_dmi_entry() pass
sizeof(alias) at every call site. dmi_ascii_filter() takes the
remaining buffer size as well and aborts on truncation. This bounds
every write into the on-stack buffers and turns the latent overflow
into a clean build error if it is ever reached.

Fixes: 1d8f430c15b3 ("[PATCH] Input: add modalias support")
Signed-off-by: Hasan Basbunar <basbunarhasan@gmail.com>
---
v1: https://lore.kernel.org/lkml/20260427204255.22117-1-basbunarhasan@gmail.com/

Changes since v1 (per Randy Dunlap's review):
- Audited the other do_*_entry() handlers; do_dmi_entry() has the same
  unbounded-sprintf shape with a realistic 80-byte worst-case overflow,
  and is fixed in v2 alongside do_input_entry(). The remaining
  do_*_entry() handlers were verified bounded by their input field
  types and do not need this treatment.
- Added a Fixes: tag pointing to the original do_input introduction
  (commit 1d8f430c15b3, 2005).
- Reworded the alias_append() comment: replaced "cumulative
  bookkeeping" with "remaining-space check", which is what the helper
  actually does.

Randy: I have not carried forward your Reviewed-by/Tested-by from v1
because v2 expands scope to do_dmi_entry() (new code you have not seen
yet); please re-affirm if v2 looks good to you.

---
 scripts/mod/file2alias.c | 91 ++++++++++++++++++++++++++++------------
 1 file changed, 65 insertions(+), 26 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 4e99393a35f1..9ec5c4e1f3ed 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -651,7 +651,38 @@ static void do_vio_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, true, "%s", alias);
 }
 
-static void do_input(char *alias,
+/*
+ * alias_append() — bounded printf-append into a fixed-size alias buffer.
+ *
+ * Replaces the historical pattern  sprintf(alias + strlen(alias), ...)
+ * used across this file. That pattern silently corrupts the stack when
+ * the formatted output exceeds the destination size; the worst-case
+ * emission in do_input_entry() with a maximally-populated keybit[] is
+ * about 12x the on-stack 256-byte buffer, and do_dmi_entry() can also
+ * exceed its 256 bytes for four maximal-length DMI matches. Use
+ * snprintf with a remaining-space check and abort the build on
+ * overflow.
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
@@ -659,13 +690,14 @@ static void do_input(char *alias,
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
@@ -687,35 +719,35 @@ static void do_input_entry(struct module *mod, void *symval)
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
@@ -895,12 +927,16 @@ static const struct dmifield {
 	{ NULL,  DMI_NONE }
 };
 
-static void dmi_ascii_filter(char *d, const char *s)
+static void dmi_ascii_filter(char *d, size_t avail, const char *s)
 {
 	/* Filter out characters we don't want to see in the modalias string */
 	for (; *s; s++)
-		if (*s > ' ' && *s < 127 && *s != ':')
+		if (*s > ' ' && *s < 127 && *s != ':') {
+			if (avail <= 1)
+				fatal("%s: alias buffer overflow\n", __func__);
 			*(d++) = *s;
+			avail--;
+		}
 
 	*d = 0;
 }
@@ -909,6 +945,8 @@ static void dmi_ascii_filter(char *d, const char *s)
 static void do_dmi_entry(struct module *mod, void *symval)
 {
 	char alias[256] = {};
+	const size_t sizeof_alias = sizeof(alias);
+	size_t len;
 	int i, j;
 	DEF_FIELD_ADDR(symval, dmi_system_id, matches);
 
@@ -916,11 +954,12 @@ static void do_dmi_entry(struct module *mod, void *symval)
 		for (j = 0; j < 4; j++) {
 			if ((*matches)[j].slot &&
 			    (*matches)[j].slot == dmi_fields[i].field) {
-				sprintf(alias + strlen(alias), ":%s*",
-					dmi_fields[i].prefix);
-				dmi_ascii_filter(alias + strlen(alias),
+				alias_append(alias, sizeof_alias, ":%s*",
+					     dmi_fields[i].prefix);
+				len = strlen(alias);
+				dmi_ascii_filter(alias + len, sizeof_alias - len,
 						 (*matches)[j].substr);
-				strcat(alias, "*");
+				alias_append(alias, sizeof_alias, "*");
 			}
 		}
 	}
-- 
2.53.0


