Return-Path: <linux-kbuild+bounces-5354-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F8A00EF5
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 21:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DB6D3A4746
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 20:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170401C232D;
	Fri,  3 Jan 2025 20:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nyZEWh8m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38EA1C07F3
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jan 2025 20:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937149; cv=none; b=TjXFGAcGbigJDwUU3ro4ffedEHxRtwmqp2BtMN58M3Aspv+Yj46bz49IlTmCiO2MEUwzevQYfunnrLm+78SN0v4eIEnZGiDhmnhoqqclwoxoHt1CVYHuukYxUTZWEYYnIPZ5demAoB8ruxH7fSWeiQFfmipp8SwJv+k+r7DM8PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937149; c=relaxed/simple;
	bh=buSElSaAFhyQbPke8FFMFfz7pZ/egR8VAABZIjgNK0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gSZCtPihqNj1tdysJjI400cy6bztEdmz0pnXUSnx+Lj9OVqKyTGCeVYLF41Rcd6vSRAWQHgsp7Pa0s1+MHGDT05XHLRaH+p7T9SoF2UDi6mzSVPYBdwhbjOz/4cP9OVDkw1XOvDeKpC+vmRTMUoITjeSjSwGisozE0Q3Pn04bC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nyZEWh8m; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso17884898a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jan 2025 12:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937143; x=1736541943; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KlBM+UoVMiu/aVYEb5JmNGVezBYswW2Sh9t+S0cH6qM=;
        b=nyZEWh8maDTNUAM9sKDk8JWI9EgXPkgU6B88jN2g3lRKQRejvlqsNxCeVbT4pBrC8q
         hB/ICNiF02GjUQSomEsos2+QQPDNntviuLqxhhPJ/LWPJ/zrGgJ/kjA/HaZdhYh/sbro
         9Lnv+OXSopz9EwG+EKigixmPo7W9K/OKhf5KtOYiTNEiMxW0qlL1h4yyVhmRzKcPQEeo
         1FHlnZPsdm8cAc/PNO4uASZVb6mP8fhIlEYyJVuAbkNHPUkwoD94IlGmnX9WV9ipr4Mh
         FqYxm4IqRvRqHUoazRaw/sQ9qVhZgkzlv+uvfZU+cCXFB82puGqkHCHwnuQBcxwW9SV7
         Lssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937143; x=1736541943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlBM+UoVMiu/aVYEb5JmNGVezBYswW2Sh9t+S0cH6qM=;
        b=Tg7mfEJPU388d7Zc7jlADlRvi3NKnikSR/8z7dYPsROj8bPlt983jzKYE639C5pXZh
         T99E2zXPZhPlO9ln3xykYmumBrBkAh0HdNw3fkqoEGM/bHDqptHzwP87DYPF2oRMtnfp
         dnQeOQt1Lkewq0zpGSuvmds/JNfRVNLF1VaJcwsTIM2G9X1fBvHcZrWCkv61R0TGgyMb
         3LKu2faPUWQzSThda/SorI/jSrcH/YE/dNh9UCd7B7KDRhYXkZqCOgYAfpQoi3w0/XKY
         wd6N+Ick3dY9FKU75ZIrYu72Pd+1eJoPyGE7wOUq7EkMplkTdAqyP8SU/wrFImEJI+5K
         De0g==
X-Forwarded-Encrypted: i=1; AJvYcCXACOEOgujJ5N8lOaxL39xfLh00yHXGrGKM0k//we38xdsvllw92jVXsIHeuGH0sVGMVofymzbZxAzOifI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzILgXVeYD5Ls5v3zmOCjsDjvQSjkFTU5Z6f5kZaXTBjKI6VhQn
	D93hZ4UkGSgLrGaTLbE0ONh9mC4dhImE3fx4XKQjbY430SC2m4KBO5rSFTJjzHAtOSWz14nbha4
	CD1S2QadxhJnOKHU38fhLYCCNrQ==
X-Google-Smtp-Source: AGHT+IGv8FcDBoYRvaCaignMW+n1RAuTU7G/pRnVHQkH6oQKzGk10afRv20SmeF7u1xXaWeCJxjoZFupivpzDGYbDgg=
X-Received: from pfbby8.prod.google.com ([2002:a05:6a00:4008:b0:725:e39e:1058])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6da4:b0:1e0:d4f4:5b2f with SMTP id adf61e73a8af0-1e5e07ffb0dmr86243630637.32.1735937142988;
 Fri, 03 Jan 2025 12:45:42 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:27 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5425; i=samitolvanen@google.com;
 h=from:subject; bh=buSElSaAFhyQbPke8FFMFfz7pZ/egR8VAABZIjgNK0o=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPil8nn9PBZ0rjTx1O9HBga1z5zED9WbDKO7DEimzN
 XdKxyzrKGVhEONgkBVTZGn5unrr7u9Oqa8+F0nAzGFlAhnCwMUpABMp3sDI0C7D4NUjYcPA+vnl
 eh/vnOzGbc7eMiyHWX/X5F7Ye8xuCiPD0YBP98LVnTqFdn3kfqb08VN+XIfOclZtDukJj+eKCjg xAwA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-25-samitolvanen@google.com>
Subject: [PATCH v8 05/18] gendwarfksyms: Expand type modifiers and typedefs
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


