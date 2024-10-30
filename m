Return-Path: <linux-kbuild+bounces-4418-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F39B6A68
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5437C28028F
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA34E2296F1;
	Wed, 30 Oct 2024 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F0LMa1wh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C522910A
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307707; cv=none; b=QYq3JnVvCt1uvlg2QQ4pewNqPbx6M3euVhfB7sIbYk/T+1palZRAhHJXFUbULqdG8P5PY1JWLvCr/rmwsKLKT3Wo5XY1kiVIOK7cfpYE83HK5kvQwLBzsno7LgjzRT0HfSxMh2PJC0KxBv9lSZpx/PaXjxzIZAYUuYz8aDWiZrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307707; c=relaxed/simple;
	bh=Fa2DDp//fgzxVZObACZomfQEZKjE3iiFEcYvVFgoCGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dAR0EoHvT5PzgwyOMNv2fCK8pwbLZ/37bH360eK4iML4wWs+ZN0RwaB83TCNTmSMcBlo7koEJY1oLgJZwefyplGmtKd/lQV6P6FV/lOtdLo+gl2EeCtdGg4Cu4H4G52/LxXRIX+Qk/hdq+v7cpl+0lUJngiwkugHNxMFYjgYnec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F0LMa1wh; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e291ac8dcf3so1106276.3
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307702; x=1730912502; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkeNqNlpBvlwRMNr77cOA0ECCkCTywfcRJ4vlEAOu7I=;
        b=F0LMa1whJyWax9PuDikgVcurPqcaqyWYS7HMOrJRBwRu2d0K3Wo850BjVFJiM8kfX1
         C54mLZ36/RaP+t02uMM0xtXUfChkm15ZzuVDVWHlO7uCXERNYSTqvmBqrD5AMqatsJWc
         pf/33YW53nproQcW8u7ZbHTZInRTZzZKrtYlqb8+KL1dO0evrltdcG72YkYFRcJWWhUu
         9GTgTRg+bGnrVqSbwWzRXwQaSAB436qskxWHjtXKTj53UCILweacRL715kAHYkRmqokD
         0yXw/wuoVRDQa2DiDda0UDz8Y7AtAcvkWhNH6+2CrTYH6BwdXFUyRaLUI37I1IblpJpU
         6k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307702; x=1730912502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkeNqNlpBvlwRMNr77cOA0ECCkCTywfcRJ4vlEAOu7I=;
        b=kgRAreEoybqO/zftIacORAKuspaqZDnJ50nghA18jnyXFfFIWfONVaXUFm7AONomWA
         X91/qrgNv06Px4yUOq+b07YoCVbbVg4JLHb67/fRSRgx3ivBs2ZrAqgBvDpYzCYJi3YJ
         eH37IPBShoGMjKDlX/zk282Ti3GaJlSbI5tbC1odEuIse5JA8mq+4jbUMaBFAOA0lJUj
         vOnFyJ6hJYVrFlwpReYgYyvtnGMXMoeLbSJMduXRFrxgeUZAIbNFRFJy6g0mA6wXL33f
         dVp8UMJROtiP14NCYFK9y5NloqRx3hnOf2JSS9xeG9fUFIm0t9lVmXOm0MstVjZu7qVm
         Fevw==
X-Forwarded-Encrypted: i=1; AJvYcCXHguYa07aiClCQBH03iJGvZektcA5KYZDYzQredO4Iw9/Di6Lca2cb7r/ZNvD7SjoDKYPT2QSRbr5xtZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxjI6MLi6n2VR0Af8dPOtj/NfNYWEYjTqGR9j2P0fqjL9fM6C
	aUFQeHaEIYDuenK2kOr2NEJ4nJsKEWxwM8lh/YDMQpYs7o79cdrTmkDHmn9lpqqexnb6wPg0P4H
	bokWPcXSppTSXNSpWuslsNU7bfg==
X-Google-Smtp-Source: AGHT+IHoxDwrsnO/Hwo/UVn4gIntnZI8QDGdUdOOE4QleoDdYzerUkh8az+AVVu6IrIsvSXjHTUytmXR05TYglOweBI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:7bc2:0:b0:e29:76b7:ed37 with SMTP
 id 3f1490d57ef6-e3087c111e1mr58279276.9.1730307701817; Wed, 30 Oct 2024
 10:01:41 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:18 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5123; i=samitolvanen@google.com;
 h=from:subject; bh=Fa2DDp//fgzxVZObACZomfQEZKjE3iiFEcYvVFgoCGs=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaRE6Fl76Mzi+pwicVXg/fW9xe+b0gxdXx5Rnytw52
 Gvv3W3cUcrCIMbBICumyNLydfXW3d+dUl99LpKAmcPKBDKEgYtTACZyzZfhf87vX5+TJtZMlk8v
 9Nl/d1fDC12VDVd0z13yPOL9uuORCycjw3/nyLdPOGSSQq4fzolluSuvvi/yTcOJbeWRnXoy6i7 uXAA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-32-samitolvanen@google.com>
Subject: [PATCH v5 11/19] gendwarfksyms: Add die_map debugging
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

Debugging the DWARF processing can be somewhat challenging, so add
more detailed debugging output for die_map operations. Add the
--dump-die-map flag, which adds color coded tags to the output for
die_map changes.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 15 +++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.c |  7 +++++++
 scripts/gendwarfksyms/gendwarfksyms.h | 13 +++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index cf929d6808be..513f37d1798a 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -103,6 +103,8 @@ static void process(struct die *cache, const char *s)
 	if (dump_dies)
 		fputs(s, stderr);
 
+	if (cache)
+		die_debug_r("cache %p string '%s'", cache, s);
 	die_map_add_string(cache, s);
 }
 
@@ -551,6 +553,8 @@ static void process_cached(struct state *state, struct die *cache,
 	list_for_each_entry(df, &cache->fragments, list) {
 		switch (df->type) {
 		case FRAGMENT_STRING:
+			die_debug_b("cache %p STRING '%s'", cache,
+				    df->data.str);
 			process(NULL, df->data.str);
 			break;
 		case FRAGMENT_LINEBREAK:
@@ -560,6 +564,8 @@ static void process_cached(struct state *state, struct die *cache,
 			if (!dwarf_die_addr_die(dwarf_cu_getdwarf(die->cu),
 						(void *)df->data.addr, &child))
 				error("dwarf_die_addr_die failed");
+			die_debug_b("cache %p DIE addr %" PRIxPTR " tag %x",
+				    cache, df->data.addr, dwarf_tag(&child));
 			check(process_type(state, NULL, &child));
 			break;
 		default:
@@ -656,6 +662,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	cache = die_map_get(die, want_state);
 
 	if (cache->state == want_state) {
+		die_debug_g("cached addr %p tag %x -- %s", die->addr, tag,
+			die_state_name(cache->state));
+
 		process_cached(state, cache, die);
 		die_map_add_die(parent, cache);
 
@@ -663,6 +672,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 		return 0;
 	}
 
+	die_debug_g("addr %p tag %x -- %s -> %s", die->addr, tag,
+		    die_state_name(cache->state), die_state_name(want_state));
+
 	switch (tag) {
 	/* Type modifiers */
 	PROCESS_TYPE(atomic)
@@ -698,6 +710,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 		error("unexpected type: %x", tag);
 	}
 
+	die_debug_r("parent %p cache %p die addr %p tag %x", parent, cache,
+		    die->addr, tag);
+
 	/* Update cache state and append to the parent (if any) */
 	cache->tag = tag;
 	cache->state = want_state;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 7552fde495ef..ed6d8c585268 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -19,6 +19,8 @@
 int debug;
 /* Dump DIE contents */
 int dump_dies;
+/* Print debugging information about die_map changes */
+int dump_die_map;
 
 static void usage(void)
 {
@@ -26,6 +28,7 @@ static void usage(void)
 	      "Options:\n"
 	      "  -d, --debug          Print debugging information\n"
 	      "      --dump-dies      Dump DWARF DIE contents\n"
+	      "      --dump-die-map   Print debugging information about die_map changes\n"
 	      "  -h, --help           Print this message\n"
 	      "\n",
 	      stderr);
@@ -74,6 +77,7 @@ int main(int argc, char **argv)
 
 	struct option opts[] = { { "debug", 0, NULL, 'd' },
 				 { "dump-dies", 0, &dump_dies, 1 },
+				 { "dump-die-map", 0, &dump_die_map, 1 },
 				 { "help", 0, NULL, 'h' },
 				 { 0, 0, NULL, 0 } };
 
@@ -93,6 +97,9 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (dump_die_map)
+		dump_dies = 1;
+
 	if (optind >= argc) {
 		usage();
 		error("no input files?");
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index da28a35d19b2..72912c6b6e64 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -24,6 +24,7 @@
  */
 extern int debug;
 extern int dump_dies;
+extern int dump_die_map;
 
 /*
  * Output helpers
@@ -46,6 +47,18 @@ extern int dump_dies;
 		exit(1);                                     \
 	} while (0)
 
+#define __die_debug(color, format, ...)                                 \
+	do {                                                            \
+		if (dump_dies && dump_die_map)                          \
+			fprintf(stderr,                                 \
+				"\033[" #color "m<" format ">\033[39m", \
+				__VA_ARGS__);                           \
+	} while (0)
+
+#define die_debug_r(format, ...) __die_debug(91, format, __VA_ARGS__)
+#define die_debug_g(format, ...) __die_debug(92, format, __VA_ARGS__)
+#define die_debug_b(format, ...) __die_debug(94, format, __VA_ARGS__)
+
 /*
  * Error handling helpers
  */
-- 
2.47.0.163.g1226f6d8fa-goog


