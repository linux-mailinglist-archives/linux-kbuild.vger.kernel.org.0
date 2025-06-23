Return-Path: <linux-kbuild+bounces-7612-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19559AE39FC
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 11:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35FCC3A51A4
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 09:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ECD232785;
	Mon, 23 Jun 2025 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JgUAmWUQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EF8235044
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Jun 2025 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670772; cv=none; b=C+alZ8+T0UWO3JbTBJ/YfX+oF9/O/kiNmyoE0tRDaVS24ZELaXC0JfG4EhRFvP8jqIwSsExLzfHaPnxZnLhQwIuEZgJ+cRAVnS4RCccXBn/73o5WsO/TUYW/8RoExr6Ny06RibgS2g7p3kOKDh5RU6+uEBepXc5TLVQ/ipQk+U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670772; c=relaxed/simple;
	bh=/mSzpNRlNFtyqvYxA/DRD7Gt3GU9kv5v21Eo6mNvjvM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=t7g9c6mvk3+vt+pcH4fQN/nLOgLTuQnElQ2cl2CXcUcPmZLvI0h3PBgkSj/QwO4e0k0Bxwz+D/NSrI+B/U2iVnRZTu/qyHUqigWtW2ULJzDOIFWzp4mTOvt/1JzIls3p1ECamvCcVOtuy9PxaC3NV4zN1oZQdxl1qnRPqKYTwYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JgUAmWUQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451d5600a54so30835095e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Jun 2025 02:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750670769; x=1751275569; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pa2ZDWEMmyq3FnjO/079PycJx+3r729iLJomR78p2yI=;
        b=JgUAmWUQ3bB+QSfOHzpK/WALnO5ddPJFMD/HdvfG4oJ7LnhzKBhsSi4peZ7YR9Ocae
         exlyObgpkUMTlA+wuI4BMviGrU0keUz6rwAnkUNy6z44PlU6dRq17+SGTLZFfe4bQnbI
         aObTyO0giApqVnXvZVWJwtxyCQaoQFVYsM0Xm2oIzVA/XLJsdUq/QkpklYdKy98MILdR
         1XzCRVuzYV54RIEgl1N8zBe+5gSqINZnucOTBxKZ97JzI923achMKrQsAguzsPERTzU7
         gts3u04WBWuhQX+jyNyYcy/H1z938QypidnEPXx8FMTVLQ1M6brwXj54EwemZhJrI00+
         tChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670769; x=1751275569;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pa2ZDWEMmyq3FnjO/079PycJx+3r729iLJomR78p2yI=;
        b=iFdjydAmwtFCugZJskAIcby+u73jou4uzOW7XqAeMFOLBqMo3r4YjMcmad3QBIiYS2
         yw+8iX0W7dfTt9E7SNqZHfH9/q6j/cPv5NTBA5fWEJc9e/qA8fiMRlY4I1pSOT+ffE6u
         KA+Re84LsXmZ+UdO2RybXE5e9yDRFP9Q6J5CH10LXNQ9ocCI7NBUwaegoUZMlFXNXJq4
         kFl/Hndt0BH6+HXAbNsSbZpFyPTkoX8a1nSL2VTebgSFE9gfhDNEp3137ZFoOXsLmWX0
         m5uwasKLz54r08CvvGbicexwNh4xXsdPvYEcD+h2NuD1Ohmdwzdk5Zhrdp7QxprR5kOK
         9Kjw==
X-Forwarded-Encrypted: i=1; AJvYcCVJi5NRtm9BsGdmOZTw40jCI3XoXeVt1TIiVWo+js4GkrWmUQNGRyliZLxp3Rc1lOzF/y2Csueim5LIF+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2K0WFQ0eygtyLjN5UFNstDoTMKhtkOJajmvxd+qz/EOV+4LV
	WRMPud/ztsiz6cCcqVw114Q4THC8/oGQKKYF7dSydFvSLrlDMTw1L1JOG+3FoTjWHje6KKTThc4
	nMwL2GR6xWglrFw==
X-Google-Smtp-Source: AGHT+IHE7/ErI0nHyXwFIqSpDJmkjX2TMJFOBhBRQLErcWtRRel7p7wYqamomiKZmCXLM6/DNtN3nQ3WZ3R3MA==
X-Received: from wmtk6.prod.google.com ([2002:a05:600c:c4a6:b0:452:f960:4dfc])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5490:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-453655c30e4mr127947675e9.15.1750670769334;
 Mon, 23 Jun 2025 02:26:09 -0700 (PDT)
Date: Mon, 23 Jun 2025 10:21:47 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250623092350.3261118-2-gprocida@google.com>
Subject: [PATCH] gendwarfksyms: make -T symtypes output be in name order
From: Giuliano Procida <gprocida@google.com>
To: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Giuliano Procida <gprocida@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When writing symtypes information, we iterate through the entire hash
table containing type expansions. The key order varies unpredictably
as new entries are added, making it harder to compare symtypes between
builds.

Resolve this by sorting the type expansions by name before output.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 7bd459ea6c59..51c1471e8684 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -6,6 +6,8 @@
 #define _GNU_SOURCE
 #include <inttypes.h>
 #include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #include <zlib.h>
 
 #include "gendwarfksyms.h"
@@ -179,20 +181,41 @@ static int type_map_get(const char *name, struct type_expansion **res)
 	return -1;
 }
 
+static int cmp_expansion_name(const void *p1, const void *p2)
+{
+	struct type_expansion *const *e1 = p1;
+	struct type_expansion *const *e2 = p2;
+
+	return strcmp((*e1)->name, (*e2)->name);
+}
+
 static void type_map_write(FILE *file)
 {
 	struct type_expansion *e;
 	struct hlist_node *tmp;
+	struct type_expansion **es;
+	size_t count = 0;
+	size_t i = 0;
 
 	if (!file)
 		return;
 
-	hash_for_each_safe(type_map, e, tmp, hash) {
-		checkp(fputs(e->name, file));
+	hash_for_each_safe(type_map, e, tmp, hash)
+		++count;
+	es = xmalloc(count * sizeof(struct type_expansion *));
+	hash_for_each_safe(type_map, e, tmp, hash)
+		es[i++] = e;
+
+	qsort(es, count, sizeof(struct type_expansion *), cmp_expansion_name);
+
+	for (i = 0; i < count; ++i) {
+		checkp(fputs(es[i]->name, file));
 		checkp(fputs(" ", file));
-		type_list_write(&e->expanded, file);
+		type_list_write(&es[i]->expanded, file);
 		checkp(fputs("\n", file));
 	}
+
+	free(es);
 }
 
 static void type_map_free(void)
-- 
2.50.0.rc2.761.g2dc52ea45b-goog


