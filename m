Return-Path: <linux-kbuild+bounces-5199-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E09F868D
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128BC188495C
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8F51EE7B9;
	Thu, 19 Dec 2024 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EEkcF17I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964491DC986
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642481; cv=none; b=n54TXaZWKyxtpuZMu7mtrwPkY/HP7xz1GR7Y/vlP/VKsZtjJBg3hgD2xk/8yaXkhbY2NTsjqdknaHsQlHa+yS9WaWxh75Dy+0iyd13j4b+pttqcS+q5zMfj4X0e0zss7XLS0yOijpArp4f8B3cuOf/ylzMs9FPOI+nlUiCl4JJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642481; c=relaxed/simple;
	bh=buSElSaAFhyQbPke8FFMFfz7pZ/egR8VAABZIjgNK0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qQfXqRZWi6vCRb0+CzTdAtjiGSlZoBcIInbi2As8iJkY/WDDZ52VyrpvvozQ54gTYRVn6cDvKqTP8dR69GbXkD55/DGTvAP3cKbo8FpP6b2/+8XcOnsCOhO1aPmtgEo1NRJIbaoXM2iX/KktuSNavEoz0swghwp6W/wm+TMRWDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EEkcF17I; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7fd481e3c0bso754283a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642479; x=1735247279; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KlBM+UoVMiu/aVYEb5JmNGVezBYswW2Sh9t+S0cH6qM=;
        b=EEkcF17IC1aOeabAs4L3QThYNjHT8dxXfzDU16fcAD5l7XHtE+twva2K0VKnRK1I8J
         sy/gdYn4LogWIDrqueVbprDktv9XROA+RaALEaj1iZCUdzKmhIAUOueE35dtHixjSDnt
         +SI8xSMveoqWG/eMWkzDrw7YL5Q+9rGekftKymo3nlRqnNLUAgdckPWqDtBxyOsDf2qo
         KXReUnNTbN34Bz93NuG9HGPP3ToVedKgqSO5RYxXlp2I7SmsEsnv0L5/kqPOuXdJg7Xu
         NLAamjCSYnacn7QpLs7DGdlkxbLzEHCHJ/4UVCSpL0QOveZ0PIpac+m5g0AGpEKxPiJJ
         ekTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642479; x=1735247279;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlBM+UoVMiu/aVYEb5JmNGVezBYswW2Sh9t+S0cH6qM=;
        b=CiWkouEdHVKOYCzPiNE4Oh1D/oqyzNcylFswaITdL2xVaMkJhLjgk3OOEeSqcbnIBg
         YgRAM/+BToIlROYBiX32U5mBjVj7fwhGAdUbrbPOeB6A8/VCzGq8hwhueT/exseA4f7b
         SjgFob5EnxX4xbqWC1ZcFa/KZLeIunPRXf8JDxxCT7EBRomxxpqkk1kV2UMqRswV3CwN
         YlrddSIctfSKD9qkYbyEodiz2mc+MKq+76qlYZbiTApaGe2aI5ZZEODNSK5SCtXLC+Dy
         cFdRXN2rbFwSa0q0P1by+xqJREL8gNQWMemiITCtvwJOKTK5Xa3RKe1oVsCSV1A6ZVjF
         /a1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXy+Js0U+Ny9nkutzUFZplFZV/BHRaDv+BUuZseHT7JTXkfp8z2CLK4O03ljheHL2w9pS+QvXyL0ptXoIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPvChmaCtoY8aC9Em7+HhQnuOtWZeNDn05H+TDh7sVe0sdY9e
	HBCt3nt4J3Ue9xIsRdzAJu0huBPqLYDRJNy73ZqVAJwiBd4tjMnxdJg7fqqPid6PKixCFozulfZ
	dcE34rV0iT/XjlkVPBLkYNDHsGA==
X-Google-Smtp-Source: AGHT+IFSfZWkVsUgeZM2+bv/bDQNUAw6E73pPO8hwFTzmQfKGqBteuj8Emcx7y5sX8zEMa48boCkXnaWJG2J+Q06KzE=
X-Received: from pjbqd7.prod.google.com ([2002:a17:90b:3cc7:b0:2e5:5ffc:1c36])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c2c7:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-2f452e1c111mr791881a91.16.1734642479012;
 Thu, 19 Dec 2024 13:07:59 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:42 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5425; i=samitolvanen@google.com;
 h=from:subject; bh=buSElSaAFhyQbPke8FFMFfz7pZ/egR8VAABZIjgNK0o=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3dJ8nn9PBZ0rjTx1O9HBga1z5zED9WbDKO7DEimzN
 XdKxyzrKGVhEONgkBVTZGn5unrr7u9Oqa8+F0nAzGFlAhnCwMUpABNZrcfIcNh6W1ew/JGnZqsy
 0tNPP2Qq5Nz5JvLeYhtXpoRzJ6c+XcTwT9f8F7PCtkrlV092JF9/E5N091jD5TRtDY5d65v6ikS aeQA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-25-samitolvanen@google.com>
Subject: [PATCH v7 05/18] gendwarfksyms: Expand type modifiers and typedefs
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for expanding DWARF type modifiers, such as pointers,
const values etc., and typedefs. These types all have DW_AT_type
attribute pointing to the underlying type, and thus produce similar
output.

Also add linebreaks and indentation to debugging output to make it
more readable.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/die.c           | 12 +++++
 scripts/gendwarfksyms/dwarf.c         | 67 +++++++++++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h |  5 ++
 3 files changed, 84 insertions(+)

diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index b7d900c6a9c8..0d70e02d02b5 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -130,6 +130,18 @@ void die_map_add_string(struct die *cd, const char *str)
 	df->type = FRAGMENT_STRING;
 }
 
+void die_map_add_linebreak(struct die *cd, int linebreak)
+{
+	struct die_fragment *df;
+
+	if (!cd)
+		return;
+
+	df = append_item(cd);
+	df->data.linebreak = linebreak;
+	df->type = FRAGMENT_LINEBREAK;
+}
+
 void die_map_add_die(struct die *cd, struct die *child)
 {
 	struct die_fragment *df;
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index f40e23a547da..3e08a32b7b16 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -7,6 +7,17 @@
 #include <stdarg.h>
 #include "gendwarfksyms.h"
 
+static bool do_linebreak;
+static int indentation_level;
+
+/* Line breaks and indentation for pretty-printing */
+static void process_linebreak(struct die *cache, int n)
+{
+	indentation_level += n;
+	do_linebreak = true;
+	die_map_add_linebreak(cache, n);
+}
+
 #define DEFINE_GET_ATTR(attr, type)                                    \
 	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
 				      type *value)                     \
@@ -76,6 +87,12 @@ static void process(struct die *cache, const char *s)
 {
 	s = s ?: "<null>";
 
+	if (dump_dies && do_linebreak) {
+		fputs("\n", stderr);
+		for (int i = 0; i < indentation_level; i++)
+			fputs("  ", stderr);
+		do_linebreak = false;
+	}
 	if (dump_dies)
 		fputs(s, stderr);
 
@@ -239,6 +256,40 @@ static void process_type_attr(struct state *state, struct die *cache,
 	process(cache, "base_type void");
 }
 
+/* Container types with DW_AT_type */
+static void __process_type(struct state *state, struct die *cache,
+			   Dwarf_Die *die, const char *type)
+{
+	process(cache, type);
+	process_fqn(cache, die);
+	process(cache, " {");
+	process_linebreak(cache, 1);
+	process_type_attr(state, cache, die);
+	process_linebreak(cache, -1);
+	process(cache, "}");
+	process_byte_size_attr(cache, die);
+	process_alignment_attr(cache, die);
+}
+
+#define DEFINE_PROCESS_TYPE(type)                                            \
+	static void process_##type##_type(struct state *state,               \
+					  struct die *cache, Dwarf_Die *die) \
+	{                                                                    \
+		__process_type(state, cache, die, #type "_type");            \
+	}
+
+DEFINE_PROCESS_TYPE(atomic)
+DEFINE_PROCESS_TYPE(const)
+DEFINE_PROCESS_TYPE(immutable)
+DEFINE_PROCESS_TYPE(packed)
+DEFINE_PROCESS_TYPE(pointer)
+DEFINE_PROCESS_TYPE(reference)
+DEFINE_PROCESS_TYPE(restrict)
+DEFINE_PROCESS_TYPE(rvalue_reference)
+DEFINE_PROCESS_TYPE(shared)
+DEFINE_PROCESS_TYPE(volatile)
+DEFINE_PROCESS_TYPE(typedef)
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -260,6 +311,9 @@ static void process_cached(struct state *state, struct die *cache,
 		case FRAGMENT_STRING:
 			process(NULL, df->data.str);
 			break;
+		case FRAGMENT_LINEBREAK:
+			process_linebreak(NULL, df->data.linebreak);
+			break;
 		case FRAGMENT_DIE:
 			if (!dwarf_die_addr_die(dwarf_cu_getdwarf(die->cu),
 						(void *)df->data.addr, &child))
@@ -295,7 +349,20 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	}
 
 	switch (tag) {
+	/* Type modifiers */
+	PROCESS_TYPE(atomic)
+	PROCESS_TYPE(const)
+	PROCESS_TYPE(immutable)
+	PROCESS_TYPE(packed)
+	PROCESS_TYPE(pointer)
+	PROCESS_TYPE(reference)
+	PROCESS_TYPE(restrict)
+	PROCESS_TYPE(rvalue_reference)
+	PROCESS_TYPE(shared)
+	PROCESS_TYPE(volatile)
+	/* Other types */
 	PROCESS_TYPE(base)
+	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
 		break;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 601f877bc8ca..832d05b4fc1c 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -59,6 +59,9 @@ extern int dump_dies;
 /* Error == negative values */
 #define checkp(expr) __check(expr, __res < 0)
 
+/* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_typedef_type DW_TAG_typedef
+
 /*
  * symbols.c
  */
@@ -100,6 +103,7 @@ enum die_state {
 enum die_fragment_type {
 	FRAGMENT_EMPTY,
 	FRAGMENT_STRING,
+	FRAGMENT_LINEBREAK,
 	FRAGMENT_DIE
 };
 
@@ -107,6 +111,7 @@ struct die_fragment {
 	enum die_fragment_type type;
 	union {
 		char *str;
+		int linebreak;
 		uintptr_t addr;
 	} data;
 	struct list_head list;
-- 
2.47.1.613.gc27f4b7a9f-goog


