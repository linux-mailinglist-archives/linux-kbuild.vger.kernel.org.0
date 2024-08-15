Return-Path: <linux-kbuild+bounces-3012-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 465CA953928
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 19:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6942E1C254C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504044AEF5;
	Thu, 15 Aug 2024 17:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uLcAAeNm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EEF1B1427
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743568; cv=none; b=OAMCY9elwAYQDpxerpRKkv/tvAH2P8Gt7gJEGePjKzRFwe1uINBhKfoz2e/mhC0G58MrjZR1WbU7uPYtqj+vLdnUWmRHuHy2SZy3rpVF8bAHYK/V3ByKpmVEk2K01be1C3mvnZ1/A/TpplSQXDVy/Wc+a6+t0yt6Xne3txq31Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743568; c=relaxed/simple;
	bh=pw/HqpAceG9KZJncGvbm0Tc+Y0NR2BksFQva9OpCIyo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HhWm+T/bBB4vJGRXAmKwR9UNXo5vEh+0dRraRSNEBXDWfLaREQbKKjDZubAfbAwy+z3jJBEtEip7eT92lhZ/nKKEAEhtGVv3L8l05CG8j0mcwbMiT5pNZH9/DegRcjP0kKj0P8r/vSltso7yyLnuaeXmfexkUkQSiAHPHO1ZYaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uLcAAeNm; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7a134fd9261so1020392a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 10:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743566; x=1724348366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sqbrGwhfvS/o9WkR63NSSG+3ggv2pfYWpb4R8IiMfJY=;
        b=uLcAAeNmDnXP+Avd+Ze7cEyt12ynuITxuwM0FXswoVP5uwzuTrwGtHoY2Z84Sz76ZS
         dr4hVLP02+6Onz5jGJ/afGHxJ5Cnw0cab6ZHrf6BIMuwBnRqILhHS6wX0KwMF97aKG3p
         szstwiAcd8XRgD4IwjtV+Y8Q263RBXus17myvpzSm12n5bX5YqdAFRkXlaSjJ1+tdtAY
         XWmZs6TH/jJ115095/CzQuFWm60ORY12h2o82sJWChJlpCPCC52sKWE6XqCspOoWLl3T
         amGXgNx7GOARUrW/6CKl48yHla0iNGPxUI1Gg/l4dPQP2RESmcJSILN9MK/N3awshMwH
         gbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743566; x=1724348366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqbrGwhfvS/o9WkR63NSSG+3ggv2pfYWpb4R8IiMfJY=;
        b=JSfeAUPv8VNzSpHNjk59O4W35UPY2bJp5dVplw1CeRE/t/JQXkf/RkIQfTFhIyw8qT
         n/EKs9T5SwCv/xe907VqyhlRpHxSFdErwFLDkfMl90dr7YNojObhmRkPCHCNhwTIslgI
         mExsS4/hIY9GmfirVP/xInDsIT1Uc9AE+nEoi8KRYRx+sZcExjhsEZ88LNe0oQPO8xol
         LeYN3NMMF8JwO7bfvu8MMCZjZVB1DozEYs5XLMQeXSbAqo+kQWdIcgs1BPdczj7baWCK
         gZGTmxMcTEmgmQSYohT73/H/W+wVQiVzKIQJrauHLgi3GM9v992RkMx5dBGMueXpRrD+
         0Ijg==
X-Forwarded-Encrypted: i=1; AJvYcCVjFgG59J2c6XnPCdo+FXMrGLPDbHdrhURDLEqTJnOKIJw19+0tAaKRTn3CngDs/Y6GRD9/KqUjuQozkyzWPPzZ+BZ+P8TafRFlaXfi
X-Gm-Message-State: AOJu0YwpLu1QCJEaKipGPHiV/fmlGvueyAVqjyacwy5rL9+JQuN3VVll
	LhuDPizg+GwFzSv5RoSg/AWVnLVe1ZBSkLAThPIlPZ1+j11TykX7e5sFCoYdZtzbKqNZu57xqPE
	jrEP7GH+r1u5OG3N4LBcnvpBZXw==
X-Google-Smtp-Source: AGHT+IEikh37+tKCQQfnwWQEfyYceqW0cvrSUqkS+CWOQoJktHenIYVMdrw9MA5y4VPH80UGrDlrydgt0ZOnnyEEye4=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a65:6712:0:b0:6ea:d240:23b0 with SMTP
 id 41be03b00d2f7-7c9796d9119mr52a12.4.1723743565745; Thu, 15 Aug 2024
 10:39:25 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:11 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=6513; i=samitolvanen@google.com;
 h=from:subject; bh=pw/HqpAceG9KZJncGvbm0Tc+Y0NR2BksFQva9OpCIyo=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj04y5MroNixYi6Q4mKYktiBZJ/foUVldN1bP
 rlslcstbPCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OAAKCRBMtfaEi7xW
 7twtC/9nSIzTqkeqA1dIqXL/6ZYfzQuM/gdLn/xttXn3ForrLsYhstOkf7ftk40qu3YyKnd54MH
 9/xa4HXN7B3VDiKzg6G/SbamfK1l0vFPVOvb7iSaayKYd/bP2ox0uZlRdehPiMHxdJ1Ui0VgztQ
 9+pAcpM6eUTRLkLtUf1UfJ6sHk975nEE4LH4+g1hDuQnegOvEUyYSW/JxuulltZWBsU3k2cmSOa
 GBh/DY4vlIRAhQHOK9w/HiunYEyxCgEFQWk0D2JIzQCoh5nY+jSotlHu3MUF5VJ41erIx3C3vtu
 xIfAAKUEKuF6Oxe/P9DZVP7Gskdh2r+1opz0YUk/Uv94uV3PPgwm2YH5BRf2EG8F3OqG8nKUkrg
 sY9G4A9XMnPZ71P8o5cJ+ilJOd6QcN4/GSI2X9CZBVDLqVC0n2QtD6yrOMPqFYmhCs3YuJuuDTc YRMGE4mR7Ceo4L+6BILOU74Db8LpWR2EcRaFGNUCy6YD4n7Rte4bWXGs8RBQ9IBD4nsQw=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-28-samitolvanen@google.com>
Subject: [PATCH v2 07/19] gendwarfksyms: Expand type modifiers and typedefs
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
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
---
 scripts/gendwarfksyms/die.c           | 13 +++++
 scripts/gendwarfksyms/dwarf.c         | 76 +++++++++++++++++++++++++--
 scripts/gendwarfksyms/gendwarfksyms.h |  7 ++-
 3 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index ad6ba435d9dd..fdd52df88fdd 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -156,6 +156,19 @@ int die_map_add_string(struct die *cd, const char *str)
 	return 0;
 }
 
+int die_map_add_linebreak(struct die *cd, int linebreak)
+{
+	struct die_fragment *df;
+
+	if (!cd)
+		return 0;
+
+	check(append_item(cd, &df));
+	df->data.linebreak = linebreak;
+	df->type = LINEBREAK;
+	return 0;
+}
+
 int die_map_add_die(struct die *cd, struct die *child)
 {
 	struct die_fragment *df;
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 82b966269acd..82185737fa2a 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -5,6 +5,17 @@
 
 #include "gendwarfksyms.h"
 
+static bool do_linebreak;
+static int indentation_level;
+
+/* Line breaks and indentation for pretty-printing */
+static int process_linebreak(struct die *cache, int n)
+{
+	indentation_level += n;
+	do_linebreak = true;
+	return check(die_map_add_linebreak(cache, n));
+}
+
 #define DEFINE_GET_ATTR(attr, type)                                    \
 	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
 				      type *value)                     \
@@ -65,6 +76,12 @@ static int process(struct state *state, struct die *cache, const char *s)
 {
 	s = s ?: "<null>";
 
+	if (debug && do_linebreak) {
+		fputs("\n", stderr);
+		for (int i = 0; i < indentation_level; i++)
+			fputs("  ", stderr);
+		do_linebreak = false;
+	}
 	if (debug)
 		fputs(s, stderr);
 
@@ -230,6 +247,40 @@ static int process_type_attr(struct state *state, struct die *cache,
 	return check(process(state, cache, "base_type void"));
 }
 
+/* Container types with DW_AT_type */
+static int __process_type(struct state *state, struct die *cache,
+			  Dwarf_Die *die, const char *type)
+{
+	check(process(state, cache, type));
+	check(process_fqn(state, cache, die));
+	check(process(state, cache, " {"));
+	check(process_linebreak(cache, 1));
+	check(process_type_attr(state, cache, die));
+	check(process_linebreak(cache, -1));
+	check(process(state, cache, "}"));
+	check(process_byte_size_attr(state, cache, die));
+	return check(process_alignment_attr(state, cache, die));
+}
+
+#define DEFINE_PROCESS_TYPE(type)                                           \
+	static int process_##type##_type(struct state *state,               \
+					 struct die *cache, Dwarf_Die *die) \
+	{                                                                   \
+		return __process_type(state, cache, die, #type "_type ");   \
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
 static int process_base_type(struct state *state, struct die *cache,
 			     Dwarf_Die *die)
 {
@@ -251,6 +302,9 @@ static int process_cached(struct state *state, struct die *cache,
 		case STRING:
 			check(process(state, NULL, df->data.str));
 			break;
+		case LINEBREAK:
+			check(process_linebreak(NULL, df->data.linebreak));
+			break;
 		case DIE:
 			if (!dwarf_die_addr_die(state->dbg,
 						(void *)df->data.addr,
@@ -270,6 +324,11 @@ static int process_cached(struct state *state, struct die *cache,
 	return 0;
 }
 
+#define PROCESS_TYPE(type)                                       \
+	case DW_TAG_##type##_type:                               \
+		check(process_##type##_type(state, cache, die)); \
+		break;
+
 static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 {
 	struct die *cache = NULL;
@@ -288,9 +347,20 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	}
 
 	switch (tag) {
-	case DW_TAG_base_type:
-		check(process_base_type(state, cache, die));
-		break;
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
+	PROCESS_TYPE(base)
+	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
 		break;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index b280acceb114..e8b4da0fc9a8 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -58,6 +58,9 @@ extern bool debug;
 /* Error == negative values */
 #define checkp(expr) __check(expr, __res < 0, __res)
 
+/* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_typedef_type DW_TAG_typedef
+
 /*
  * symbols.c
  */
@@ -98,12 +101,13 @@ extern struct symbol *symbol_get(const char *name);
  */
 
 enum die_state { INCOMPLETE, COMPLETE, LAST = COMPLETE };
-enum die_fragment_type { EMPTY, STRING, DIE };
+enum die_fragment_type { EMPTY, STRING, LINEBREAK, DIE };
 
 struct die_fragment {
 	enum die_fragment_type type;
 	union {
 		char *str;
+		int linebreak;
 		uintptr_t addr;
 	} data;
 	struct die_fragment *next;
@@ -136,6 +140,7 @@ extern int __die_map_get(uintptr_t addr, enum die_state state,
 			 struct die **res);
 extern int die_map_get(Dwarf_Die *die, enum die_state state, struct die **res);
 extern int die_map_add_string(struct die *pd, const char *str);
+extern int die_map_add_linebreak(struct die *pd, int linebreak);
 extern int die_map_add_die(struct die *pd, struct die *child);
 extern void die_map_free(void);
 
-- 
2.46.0.184.g6999bdac58-goog


