Return-Path: <linux-kbuild+bounces-5359-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A8A00EFF
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 21:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56A05163DA3
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 20:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901631C5798;
	Fri,  3 Jan 2025 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hNcDhSsR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50531C462D
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jan 2025 20:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937161; cv=none; b=jPHldhDT8xV+HzYt23tf/iEge9MgPA5cC7YKxYv3VwMBc9q7sM9YzkVOLwkUcsWo+FOiKMiWugk2RLW9JxVu6/wDCK248+6mEwAp/yYvh9FIf59rwG8oEkTJV+WndMBjlszYIDHrz0IwWwG97cMTbAbKYo3NMD699z3IiK7tnZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937161; c=relaxed/simple;
	bh=BQ8K+ilf1TX/sqvOL+VLkQqaFaqVxS1MzWJi52mD2+E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m4k0CFlC8NMwJx/OVQZet8abqqJcBMWrAb9fZ69AuI0FcMOgqM3LEwYkfKzRoSSpbf0enb24rv74ZpNyiq1RKUVZx/y2I43fQxfAWSpylEXBgwOnglhdedZlyIWFn8Dw0330xhrSCm/huLlMf1nZEFYI1Z7pR76d5ZjqeCfLbrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hNcDhSsR; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21631cbf87dso154220545ad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jan 2025 12:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937151; x=1736541951; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxrTT/4RVepZ7sTCXJnHTCMi4hKyRmUZoEWs9NqLt6E=;
        b=hNcDhSsRzeuJ7l5Xi0OQSDEKTJ9KlSZ8ch3BapsifuSD0IIKnyep3NoQAmgg2nkznD
         O1PjSWVZogqVup9o2aDBH1vLLyEF4MXgR2Sb5XesAqn66fyJ1j1P5+t4brJ+GzKH1W+x
         oS+2haWuYo1pX4YT2Yhabdq1Pt9eyOPG0QDI9mvHLi8Rgtw5r9UUDQjgKkHpbH+cCZEe
         dWvEMydAbU45VKutj2U6kgRt7GWamsI31nv5psK00HsKA1nLMeZxTPBSv4zFN3mGZmpX
         4lSN08YP+cDHrL5xLuYnCeKsgrMGivU9WpYlzrSBf/iiZb2KChskRdWhNJogOJ4AoE+d
         UZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937151; x=1736541951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxrTT/4RVepZ7sTCXJnHTCMi4hKyRmUZoEWs9NqLt6E=;
        b=AT20el1kNp25xxFMSzzHm85qRg9iieWJrkKEnFBCA8F1iv2Mk0JK/DzmOOYde5Yqwp
         5L23u3FpivqsUYYAcOvdEVL9WLGRoBHYoXHup+53JVjri3U0SWa4MKWBbyMY70rhcOjC
         IFdHnBaRIj0/UFwImxwLZFX1pIwWrO7wD3N6+0jHJtiuS26N9+sAJwUWhM7kCF57V2Jy
         MrHCDgRUmKbo3CeZ+pSkXxyOf1xjnv8gV9uMB45KIkwpv1Ee+tTXACL1Mz54lWIZZcta
         AKFPtuzf4KEMtDdLaXldsIrJsUesBLJbkeMZySGL0DEQbZC1P4+wnleyrTO8hA22fJZ4
         VEpw==
X-Forwarded-Encrypted: i=1; AJvYcCVcZKDGQF9B0CQcoJ6whkHEpu9dra3vVORLuwQvolrWFATMmAXJToQlgxEcFkFYwEZUkwYyFTGulsvpA94=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxihv3mo1rbV3DELIm5H1cHVKOhLhqNVvDMt0f1eriFb1C5MPZW
	jITLLYLkn3ERrUcSugyB01H/5PXOg+lK0sBrheqv/YWgngvQmjAKxkEC+ztn2PtEapc5bMn0yBU
	HmdlkqyBH0SHpdHI4VPU97PRRTQ==
X-Google-Smtp-Source: AGHT+IF+OvrYyiHFJyo0qN9VjjZd4k/VcrWYZtPGk5U3lyD3AWtrlK3iIaxQnQmREIqxtvGYNq8C4W3531Jua8YtQU0=
X-Received: from pfd7.prod.google.com ([2002:a05:6a00:a807:b0:727:2d74:d385])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6f87:b0:1e0:c8c5:9b1c with SMTP id adf61e73a8af0-1e5e0450114mr81668370637.9.1735937150807;
 Fri, 03 Jan 2025 12:45:50 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:32 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5090; i=samitolvanen@google.com;
 h=from:subject; bh=BQ8K+ilf1TX/sqvOL+VLkQqaFaqVxS1MzWJi52mD2+E=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPmnZN+Ys2PlJQp2fQ+iE1R7V/Y/kFBTZ2Z7LbBFmv
 3JI68OCjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRqSEM/93/2znrhe+Wk3z7
 /9Phz3Ocbpw/8e7y8ge+Ut+8Xr6s8xBlZJjFfjjictTyxwusOFo7DqwKuOlU25M97X3ksldBMit LVrMDAA==
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-30-samitolvanen@google.com>
Subject: [PATCH v8 10/18] gendwarfksyms: Add die_map debugging
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
index 3809db840c06..bf282e33e00c 100644
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
@@ -75,6 +78,7 @@ int main(int argc, char **argv)
 	static const struct option opts[] = {
 		{ "debug", 0, NULL, 'd' },
 		{ "dump-dies", 0, &dump_dies, 1 },
+		{ "dump-die-map", 0, &dump_die_map, 1 },
 		{ "help", 0, NULL, 'h' },
 		{ 0, 0, NULL, 0 }
 	};
@@ -95,6 +99,9 @@ int main(int argc, char **argv)
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


