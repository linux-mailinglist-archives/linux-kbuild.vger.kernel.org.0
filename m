Return-Path: <linux-kbuild+bounces-3961-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1459956DA
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB17CB270B2
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0B92178F4;
	Tue,  8 Oct 2024 18:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m5i3hcCt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A2221644C
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412732; cv=none; b=PapXP1s6BRphzs8oqbb0iG33NhD5xrgzN8cE/E9C84BGXLU3Y4E06Cb7JvvLIt7pqj4OMIsVsR9/E1mLpIO14Yg1G5iv87tA+vfzGkN2QgncBbCAEqjqvFk1gXXUX34aEzoXRTLJaZfo0NeD2U+Cw5ZbtJKKCqOPfOpQ3LBEFgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412732; c=relaxed/simple;
	bh=9gV7/0tGIQjLqh9Fx/jz8DaRmGCazj09za4CP/pU8js=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=alGWvrShSxJoTaAMb8BDV+gSgxOzz79H9A5Z59aLJubROD32D8RtNQByvNoCIJW4D7vNwy5zlWdjeZj6vngPMPe8I6l71kaMvcHRKadXgtGtVs8MN6DvXhDIcmrfHlP/568tiq98LRQpeQSBsXUbsG+erP7tlRtBErV4xD6+TGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m5i3hcCt; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e178da22aaso5803995a91.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412730; x=1729017530; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/7cUK46GwJQ6x4qnVErUSuR+LuA3HBRtEZoz9lIYWY=;
        b=m5i3hcCtMYAryMpppz64EFswcL1RMnQNzcLorVup98gJzMhYkLoZJ/qXomjA8yb4No
         hJMaOOHup7FA8WMcSCCOAUzfj7IuxcNDSZ42x4DRDPo2dA2BAHh6IUWYjGJJMDt9SCXz
         YOjzU4q/BzfBJKvEk5GJnpBgVoxNltFwm+2vgTHoN/X5ylGR/yOIjfIUAz5ymlux47kY
         hEm1dZrsfjLYahAeLpo2jc0DoJbBqoBrfKo0kx1HZfVF6lJEMTZ5831D9E2Nyleo3zy2
         VwrzX72//pyz/BTgLjhu1/reL+IL3EcqVD5vxj8zc7AYQiupG4W9Th6lpLT7w9aqt8LQ
         eESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412730; x=1729017530;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/7cUK46GwJQ6x4qnVErUSuR+LuA3HBRtEZoz9lIYWY=;
        b=hkhS1lVw/+P0JPBNoUFndDJEDKyX54kIBQ9r2sRAgwXeZEvXT5FHL+eNcNZFyLBejg
         qq9Q/RYykwt8eUqfz/woArzLHm9/O+zBVVhL8mUlb0uEvTD5LHw5xI6odSSEzckoeWcc
         h46eciF76feA+3RKvpVY4/zzkR6BRXn+V3/MN+GQpzf8JWG73+okD7m7uLyeUqxGUsNu
         61m9CziNrCPbr01a97gdyjsvSvL9WIufJ0YzpCgLCZrX+ITr8VFdhBOPyo8OAOgV3sUc
         VrIOpWcaPVCtfAoKXpCRjCxKJmi+mJaoTtXs5dbBsK0X9FwadTajciZ2TlNkBRJLMJtL
         VkJg==
X-Forwarded-Encrypted: i=1; AJvYcCWOyQGqpwyf02Hq9wEwOLxf5Cww1SvoFibg4ZBjcFnPg96EC4/mDMWswj+FSCdE1OtKQI4CTaDHEFyi3vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXylhOuDjpzPuWa5uCm83Vb8hWKFXSNdtHIh9hBrMrCQbUiTH
	Z1p6TfMZSv+HNuo+Fnvo/CMVaxfLJUmSwTp1fl+PIlo/IkP67Vv2gAlP00k2FJXHX7H1802zCQL
	WUSTZosnFmVGQj/KOVr7etHIZ4w==
X-Google-Smtp-Source: AGHT+IE6LhNdR5oIpsAclCxTYj23wKJXRH88zQ4Is6y5tWPfBQ0Qtjn64WftOc8Vg35khcoJoJyWDcEjmUP+BUTj5jE=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:750:b0:2e0:b26c:9068 with
 SMTP id 98e67ed59e1d1-2e1e631af4cmr25866a91.4.1728412728856; Tue, 08 Oct 2024
 11:38:48 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:31 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5802; i=samitolvanen@google.com;
 h=from:subject; bh=9gV7/0tGIQjLqh9Fx/jz8DaRmGCazj09za4CP/pU8js=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNcoSvMe/39Vcwps63dC+evPSRc3T7yikJq3csGuh1
 82fj9/N7ihlYRDjYJAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQATOfCXkeEqRx+v4WTbFPO4
 jS2GttOndRzO71j/7MP/C0zzj2Rte2PGyHCpeEuY67LXUTuVtF5vLp60pnhz6cMFzVICaw58TJ3 nlMYHAA==
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-28-samitolvanen@google.com>
Subject: [PATCH v4 07/19] gendwarfksyms: Expand subroutine_type
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

Add support for expanding DW_TAG_subroutine_type and the parameters
in DW_TAG_formal_parameter. Use this to also expand subprograms.

Example output with --dump-dies:

  subprogram (
    formal_parameter pointer_type {
      const_type {
        base_type char byte_size(1) encoding(6)
      }
    }
  )
  -> base_type unsigned long byte_size(8) encoding(7)

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 84 ++++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  4 ++
 2 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 1d67ee18a388..7e6b477d7c12 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -211,6 +211,15 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 
+/* Match functions -- die_match_callback_t */
+#define DEFINE_MATCH(type)                                     \
+	static bool match_##type##_type(Dwarf_Die *die)        \
+	{                                                      \
+		return dwarf_tag(die) == DW_TAG_##type##_type; \
+	}
+
+DEFINE_MATCH(formal_parameter)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -223,19 +232,28 @@ int process_die_container(struct state *state, struct die *cache,
 	Dwarf_Die current;
 	int res;
 
+	/* Track the first item in lists. */
+	if (state)
+		state->first_list_item = true;
+
 	res = checkp(dwarf_child(die, &current));
 	while (!res) {
 		if (match(&current)) {
 			/* <0 = error, 0 = continue, >0 = stop */
 			res = checkp(func(state, cache, &current));
 			if (res)
-				return res;
+				goto out;
 		}
 
 		res = checkp(dwarf_siblingof(&current, &current));
 	}
 
-	return 0;
+	res = 0;
+out:
+	if (state)
+		state->first_list_item = false;
+
+	return res;
 }
 
 static int process_type(struct state *state, struct die *parent,
@@ -255,6 +273,40 @@ static void process_type_attr(struct state *state, struct die *cache,
 	process(cache, "base_type void");
 }
 
+static void process_list_comma(struct state *state, struct die *cache)
+{
+	if (state->first_list_item) {
+		state->first_list_item = false;
+	} else {
+		process(cache, " ,");
+		process_linebreak(cache, 0);
+	}
+}
+
+/* Comma-separated with DW_AT_type */
+static void __process_list_type(struct state *state, struct die *cache,
+				Dwarf_Die *die, const char *type)
+{
+	const char *name = get_name_attr(die);
+
+	process_list_comma(state, cache);
+	process(cache, type);
+	process_type_attr(state, cache, die);
+	if (name) {
+		process(cache, " ");
+		process(cache, name);
+	}
+}
+
+#define DEFINE_PROCESS_LIST_TYPE(type)                                       \
+	static void process_##type##_type(struct state *state,               \
+					  struct die *cache, Dwarf_Die *die) \
+	{                                                                    \
+		__process_list_type(state, cache, die, #type " ");           \
+	}
+
+DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+
 /* Container types with DW_AT_type */
 static void __process_type(struct state *state, struct die *cache,
 			   Dwarf_Die *die, const char *type)
@@ -289,6 +341,29 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static void __process_subroutine_type(struct state *state, struct die *cache,
+				      Dwarf_Die *die, const char *type)
+{
+	process(cache, type);
+	process(cache, " (");
+	process_linebreak(cache, 1);
+	/* Parameters */
+	check(process_die_container(state, cache, die, process_type,
+				    match_formal_parameter_type));
+	process_linebreak(cache, -1);
+	process(cache, ")");
+	process_linebreak(cache, 0);
+	/* Return type */
+	process(cache, "-> ");
+	process_type_attr(state, cache, die);
+}
+
+static void process_subroutine_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
+{
+	__process_subroutine_type(state, cache, die, "subroutine_type");
+}
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -359,8 +434,11 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(rvalue_reference)
 	PROCESS_TYPE(shared)
 	PROCESS_TYPE(volatile)
+	/* Subtypes */
+	PROCESS_TYPE(formal_parameter)
 	/* Other types */
 	PROCESS_TYPE(base)
+	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
@@ -390,7 +468,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 static int __process_subprogram(struct state *state, struct die *cache,
 				Dwarf_Die *die)
 {
-	process(cache, "subprogram");
+	__process_subroutine_type(state, cache, die, "subprogram");
 	return 0;
 }
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index f2be353c3b0b..f31bfcb0dfe7 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -63,6 +63,7 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
@@ -156,6 +157,9 @@ void die_map_free(void);
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* List expansion */
+	bool first_list_item;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.rc0.187.ge670bccf7e-goog


