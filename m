Return-Path: <linux-kbuild+bounces-13037-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ap16ACAY+mlrJQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13037-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:17:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29D4D1180
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2452B311D277
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 16:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A9748BD31;
	Tue,  5 May 2026 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWYm9maJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015648B389
	for <linux-kbuild@vger.kernel.org>; Tue,  5 May 2026 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997473; cv=none; b=tPsVo2IRoP54r6EdpbdpqMTV/m3GlM1cA4sOxCgNqhlx1icORyr9LiAZ/W384UsLzQ3MO9h+0z5ZYpo+tNxz62m4RhcQqQGpZK37RHazQOphOURh1jpNSPo2biprPOWSvwgdHyj/O2Qbrs+oguOdB4VdZ4ma8/9KxjXXtvyEcGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997473; c=relaxed/simple;
	bh=oCP/SCOiIdhI2bNZSDZWu67s2+9ghnYxzkj5Z96mAgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PKf8GxRR6QrWdA0jpM2SHRhU31xLq/9yIaS0uc9YjghND/+QH8bSZirv0tZM63ACPXunKLPLwz/+qjnE3EmuP4eVok6+/JRWr5d1RkVEmHHaOsbJkho3ThvTH0krKM8zKqY25Fs5rp6TuOK5i5dkNxs8VTlxMHl9deG4ZPZfbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWYm9maJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so4383729f8f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 05 May 2026 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997468; x=1778602268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmMzgk606OAFfnX5PAOIOfKqsxkVEzPj83I3nFxsVzA=;
        b=XWYm9maJCKlDbYp5mFawFu+rUe6nJdxNQ6XI/bAvzkWJmtHlSezocy8wkIUJhc8P8V
         STIasPEei/IdhSy/K3ZoUWamTmjhXCoF5pOaEfHeV29lLwVgM4W2ECG7Ssx/cqMTnPml
         bsdvvaQ2FSLY9rfWhY4lk73Lbf9w69Qv1uVmHlegy3ToZijJI8iFlci9Ax5YeXCFPjz+
         mTidonG2oKgNgjRmD2hiTfrNEwI/cP4DRdMcP0kplz/m6uaPyrpsWVFK/C7/xUoHAWJN
         0/s0jL1MTQ6cFqkvhD0tiTDR2TpAOUi+SB0wUfWu+vIpZ7PY4LVYhKJE8K/xCSpaBmvA
         upwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997468; x=1778602268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GmMzgk606OAFfnX5PAOIOfKqsxkVEzPj83I3nFxsVzA=;
        b=fvxP10lSel/DqPnvr5VIdH+mropC9h3WoeNXr/05rU0+TPKrJZ3vBETsETmwIkwd9d
         oxkxCmKYVoZs7sa536PjbXDaLAWGxjUElY6oB/wz6gWEnsVFk1AtnXuES4NeUexGLfoO
         cpu6uqOlq+CcOa4gFR4McRW5kRIzstmUCRbKeBn4k/ualsCbLtE/ZpW5L5L/pa/SPIYB
         ZaSF5yjdJeTfWjI2pOZERtyEhC5R/24mAxxCc0YgGxAZdKwTmFJWG9L8px4PQveErfhf
         oVOkamhzZtqJJTGV7WfTP0CxrWfLDHJP5LDjgdeA/u9id015nnq1nMUPXexxub2vL4S4
         LxrA==
X-Forwarded-Encrypted: i=1; AFNElJ8ny0nwasrn2Gh88XY73NPxX7KHrEKc6Q6HI51qk64azqkjBPHKlcRpQLe9VdR7+uO19Ph8IWLpOSPMXgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPwQshrNpVLLtKw+uQeGGnO51/V1f43lmTXRGAwGiMHeVUhgeG
	15Es24C5iadg8Rmz6qrvRdCxJU2+eKKc1FfPezIWMMrYef301gNbbWFw
X-Gm-Gg: AeBDietO3vkAaGiIm5SNt0XnM/g3APhLjiyo6QFNvMnrLABOd++89/d8rRenOa4ALiq
	5kU5apaYi+RVUFZIIAeOAlzLFxeOhz4UcAlL+0SXLdDeEl4QQi2qTS7tSZXJ3tRAHeuCaSqxOuf
	c254Z+Q+//rHavZlXqTm6kNVcGWuBevK95YhLSAdwQ/C1kMVp1PEEQVzFxlQO3mXtj4tM0YPMd2
	3MdwECZqPKbSdqj2k66OAti3eQ45euYAoMPSq2lQ8tCGimrGIfzqrA+P41ZcseqkiKHXjp1bNnZ
	ngW9rYw3JYO+AApiWnCDvp0T2GsujjQ9DSqFUTqgiD2OqrVhuwCz+KyJziYG0izAGAmlVv2GBoF
	SxY0xUGiqIY9qe+WGf3YG3iE/hp2AfJq5H1uno1QPrVUN/Fe4+AEce7YFFh4HweTdm2myJlRNJ4
	jyY1KUUWAgksnulQQ1kjsFiXILf7oaiE2NEYy5uhPMtyaWhDHXSNVkToBqhZoLeMXxQr+TzhG5Q
	wuyxBNLcloZ6D6+qpcdQC5S3BCVQGyq9Dn+
X-Received: by 2002:a05:6000:4029:b0:451:2d07:64f8 with SMTP id ffacd0b85a97d-4512d076553mr781125f8f.13.1777997468134;
        Tue, 05 May 2026 09:11:08 -0700 (PDT)
Received: from device-137.home.net (lfbn-ncy-1-554-100.w81-51.abo.wanadoo.fr. [81.51.169.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02f76sm5308810f8f.23.2026.05.05.09.11.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 05 May 2026 09:11:07 -0700 (PDT)
From: Hasan Basbunar <basbunarhasan@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hasan Basbunar <basbunarhasan@gmail.com>
Subject: [PATCH v3] modpost: prevent stack buffer overflow in do_input_entry() and do_dmi_entry()
Date: Tue,  5 May 2026 18:11:02 +0200
Message-ID: <20260505161102.44087-1-basbunarhasan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428062912.32918-1-basbunarhasan@gmail.com>
References: <20260428062912.32918-1-basbunarhasan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7A29D4D1180
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-13037-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[basbunarhasan@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email]

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
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Hasan Basbunar <basbunarhasan@gmail.com>
---
v1: https://lore.kernel.org/lkml/20260427204255.22117-1-basbunarhasan@gmail.com/
v2: https://lore.kernel.org/lkml/20260428062912.32918-1-basbunarhasan@gmail.com/

Changes since v2 (per Nicolas Schier's review):
- Dropped the alias_append() comment block. The rationale (buffer
  sizes, worst-case figures) lives in the commit message, where it
  cannot drift from the source if alias[] sizes are revisited later.
  The function name, signature, and fatal() messages already make
  the intent explicit at the failure site.

The change vs v2 is comment-only; the helper body, all call sites,
and the dmi_ascii_filter() bounds are unchanged from v2. Randy
Dunlap's Reviewed-by/Tested-by from v2 are carried forward
accordingly.

---
 scripts/mod/file2alias.c | 79 +++++++++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 26 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 4e99393a35f1..a7c2b4f8d6e9 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -651,7 +651,26 @@ static void do_vio_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, true, "%s", alias);
 }
 
-static void do_input(char *alias,
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
@@ -659,13 +678,14 @@ static void do_input(char *alias,
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
@@ -687,35 +707,35 @@ static void do_input_entry(struct module *mod, void *symval)
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
@@ -895,12 +915,16 @@ static const struct dmifield {
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
@@ -909,6 +933,8 @@ static void dmi_ascii_filter(char *d, const char *s)
 static void do_dmi_entry(struct module *mod, void *symval)
 {
 	char alias[256] = {};
+	const size_t sizeof_alias = sizeof(alias);
+	size_t len;
 	int i, j;
 	DEF_FIELD_ADDR(symval, dmi_system_id, matches);
 
@@ -916,11 +942,12 @@ static void do_dmi_entry(struct module *mod, void *symval)
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


