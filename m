Return-Path: <linux-kbuild+bounces-5204-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7409A9F8698
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFDAB16BE21
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875B41FDE07;
	Thu, 19 Dec 2024 21:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mzJgLb3O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7D1FCFF4
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642489; cv=none; b=uwQbJOyRn26HtCQ710dJpgH2g6sxYQjBALXfdyTwdKQ5fx7gtngF7r+Whuqcw0AywUKMmWlcfbnEiGfTQLvW0rQUSKF8rY1VUnjOSVU/bFGgRWREjqJy2Rmm6dYWjlvGCLy0WFyuNjpdvPT3PM4hRy8sl4zGsNjeK3GvgNa1/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642489; c=relaxed/simple;
	bh=z4LlX2NA/VOO+u0MsQLoG0hK+o21j55ziLDvSdXsUpY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pi2dTj2VbSr2vxuoPa+CWqpHq90OJAoVE90yip6QAu6EC5cFnrCUK9zTZqhiPorxaWJzfPGwrOynLjeEBGuYUORJgx8wDeJptNkF2fPCggtKNRWI4G75HxZyQGgUZz8jtCbH/54kHVfnsTNrjzyG1x/U0ZcTmfNeJPNB29RnJZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mzJgLb3O; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef80d30df1so1096078a91.1
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642487; x=1735247287; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pO282fqtB5vJYiuotdsRJO4FLzqnxpwBoCSMUagkCSs=;
        b=mzJgLb3OHfLNrtz6I40H4KjRz5X0VoOYhOL+daWePEvEg27sPGOyytYu1Z49flzqHF
         9KiFetE6fHOtiip2jxKQ47Jbkt5mbfyLyc7GyDv72tDbE+5dgYxQg4nkZ+s1p3RYv2Dq
         js+tdED3RRPc1kEDpCJhXiXgFXO0YJjjuWja8NTMFTVZi9BtyAODDde/qR1PpMcLtlZz
         Am9WwYCUUcXWzuteewvwtadkQkxcoHNQj7QHLOKOjMMtMrSeEkvM6bgq76PhYT1VWCYu
         TMVeQIuUR6fVl9uS3QjV1AC6SCG5CznTBt7I5ADyFta9v4fXxJBWBINPRrq2vHH1l2vQ
         EEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642487; x=1735247287;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pO282fqtB5vJYiuotdsRJO4FLzqnxpwBoCSMUagkCSs=;
        b=ea1Sdids2TFEZRDrTtaD28aEUJM1RxKj7OD53YFzDCwPTxTJQTa1PmtRxvYs8UYF81
         2BaZjD2Bz8o278AF7kBVnU6Xpd7zShroTSmyXnZbMe3J/xA48J3of5qvE3VTU5zEIBza
         2kNzcq0bS4LSPKJEWQc/CIdU2n19km13RCBewwYdHZyM1kmzhysWYOwJkvl4XMfo1Ber
         v4LShDtA+P7HEdbSrgRvOiIPVAvOiCK/DZEZMLNvAa9kdODtds2fL5pHrECBkhQybkZV
         7obtsJcx0Tgc6iPQzBr+lA/1db4ZpSL984K9RnRXnaPCc+6ySXv9O2dezWNxEda7N6Sd
         2AIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9A+h+mwz20rO3XbzKTWfmWw41zgURYEOCnXzr90LqFxsrn0SzGW5mtnz/SNanR4IeQPcgLs4XJ/QVwIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd23Na+uPY6eD8AGBeAdaB8j49ctiRzI8X/fq40mePofc88/OZ
	GItC1p92n4131mBqCuZ0Da0eAWRKidpsAJu/pasZ0A5uoDjnWfrPLIOhZSjgah9y2sTe47roJQz
	dErkDM9ZkT81KEM0/I7qcMve/JQ==
X-Google-Smtp-Source: AGHT+IEs5HlzO29/nEh+AUCTYj+CNxhpdYNxqXdg+eTPXZ86bI4o4X9oHHTHHKt1fNyuU7gXXI7nk7bL5Bf/Ric0P/Q=
X-Received: from pjbsx14.prod.google.com ([2002:a17:90b:2cce:b0:2ea:6b84:3849])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4ec6:b0:2ee:cdea:ad91 with SMTP id 98e67ed59e1d1-2f452e2e460mr797298a91.15.1734642486838;
 Thu, 19 Dec 2024 13:08:06 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:47 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5088; i=samitolvanen@google.com;
 h=from:subject; bh=z4LlX2NA/VOO+u0MsQLoG0hK+o21j55ziLDvSdXsUpY=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3bKNy/YFt59fuuLV7fbJmjo6pr9VP1ntuHRL5sr3+
 PrLFZendZSyMIhxMMiKKbK0fF29dfd3p9RXn4skYOawMoEMYeDiFICJmHQw/OHcEPzi4doZk3eF
 Xk5SPbvI58+k7uwsg4pnu6f4rj/sH3+bkeFjc8zhhzdVvcSnZa3nPhpzmOtXNtu/ksrv1mcM61X 33WAFAA==
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-30-samitolvanen@google.com>
Subject: [PATCH v7 10/18] gendwarfksyms: Add die_map debugging
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
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 15 +++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.c |  7 +++++++
 scripts/gendwarfksyms/gendwarfksyms.h | 13 +++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 6b30e45a4e82..364ff4892d5c 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -146,6 +146,8 @@ static void process(struct die *cache, const char *s)
 	if (dump_dies)
 		fputs(s, stderr);
 
+	if (cache)
+		die_debug_r("cache %p string '%s'", cache, s);
 	die_map_add_string(cache, s);
 }
 
@@ -594,6 +596,8 @@ static void process_cached(struct state *state, struct die *cache,
 	list_for_each_entry(df, &cache->fragments, list) {
 		switch (df->type) {
 		case FRAGMENT_STRING:
+			die_debug_b("cache %p STRING '%s'", cache,
+				    df->data.str);
 			process(NULL, df->data.str);
 			break;
 		case FRAGMENT_LINEBREAK:
@@ -603,6 +607,8 @@ static void process_cached(struct state *state, struct die *cache,
 			if (!dwarf_die_addr_die(dwarf_cu_getdwarf(die->cu),
 						(void *)df->data.addr, &child))
 				error("dwarf_die_addr_die failed");
+			die_debug_b("cache %p DIE addr %" PRIxPTR " tag %x",
+				    cache, df->data.addr, dwarf_tag(&child));
 			check(process_type(state, NULL, &child));
 			break;
 		default:
@@ -671,6 +677,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	cache = die_map_get(die, want_state);
 
 	if (cache->state == want_state) {
+		die_debug_g("cached addr %p tag %x -- %s", die->addr, tag,
+			    die_state_name(cache->state));
+
 		process_cached(state, cache, die);
 		die_map_add_die(parent, cache);
 
@@ -678,6 +687,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 		return 0;
 	}
 
+	die_debug_g("addr %p tag %x -- %s -> %s", die->addr, tag,
+		    die_state_name(cache->state), die_state_name(want_state));
+
 	switch (tag) {
 	/* Type modifiers */
 	PROCESS_TYPE(atomic)
@@ -713,6 +725,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
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
index 941c4134da8e..251832dac599 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -21,6 +21,7 @@
  */
 extern int debug;
 extern int dump_dies;
+extern int dump_die_map;
 
 /*
  * Output helpers
@@ -43,6 +44,18 @@ extern int dump_dies;
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
2.47.1.613.gc27f4b7a9f-goog


