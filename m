Return-Path: <linux-kbuild+bounces-7814-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D898AEFDEF
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 17:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F6C9178C90
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 15:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F4427A115;
	Tue,  1 Jul 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aPwe4tPY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0332798F0
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 15:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383231; cv=none; b=PvtwBPfSNpo6vlpmbRgTZQ9tFSf1ZQ/hC/cH7EhXi4JZsldWU3XiKVLlhEZZ2zYY2u5mrlj8vPbzt1nLCwp2ORyPWQFrbBkGd4FRwn7c44s+GcKdr+trzoMhWxh3xge29/GFKA/INwaIJ7Evt7EtZndbtqcAdAbqXyPYbAEw6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383231; c=relaxed/simple;
	bh=0LZPlTOzhDgN4M2JFCpvyuUvtX08QaSuKLicDKE1N5E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F9LyN7L5fTwvaoABYqGW5vKVscurDGidrOeoqX19JO7eEToUDPCQ4oUIN1mABMzrXDQZ20zSa9Jx5t6vJQ8qImg8YCNNeydAxFYlSk8KPCeOc1U+vjxpfbq4J8dfwXgSkaGzbzfFlLI0zSWlXLDzc/h5bS+pTSyLNyCr/c2XuJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aPwe4tPY; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so26232175e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jul 2025 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751383228; x=1751988028; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQj2YyKGGYHlLV8Kxk75PVsyeBZE5VokyKievIbbY3k=;
        b=aPwe4tPYb+sNoUnlRggdhJTYu+HaWZ+bC4Pfe9ufJbdjneviNvrQ/gJYWRJsGoiYUN
         velH5B2s2JcmE/5aiP/e3m3DhoCNnuEgqqM6P0Ctywz65b3QRuEWSf+GeWf0zDF3vRCv
         khvJez74+gRM4E/cD3rPwyxuyWYD7epxT+ZStHaZDENMMsFvX3Tz2wdUmTwGq34wloCp
         PxMvaN5MhMrXe+nFwEkF38jHx96jKUAJoyBqdQxhvxDlwvQjq54jBHXUDoqgodHSx+QN
         8ZAYnfz3XfCTthXvLxVEJFfFFdE+FFv/vfgp4rj1Cx7e77g2bDHgdk/0hiDyMJX/aWDO
         Csyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383228; x=1751988028;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQj2YyKGGYHlLV8Kxk75PVsyeBZE5VokyKievIbbY3k=;
        b=wNw3fnzbeqmWIHa2VxxM/dijxMuHonHTq0no3D16+RaOBUzpXyIu3psgdsuXQz18sh
         lW0VWJIxYMrca3B2WziRW0aAkH3Orl/m4IwLD+Rm4fa3t7E6Iz2DmDTFHeDRITtDDfou
         hz5r+8ty16ry4qJoAraYWK+NO3c9XmeaW7oO7rKFmZBdOm9iPnlgNoaYXmh/SfY0YKgd
         1qwKZL3pMP0C9EEUWa4p/3DL7mXwrwRVXf2BV5HTzsp9K5BM4w1SkJKONLO8fBX/+xQ6
         zJw3BkHht2ZtwaoD38Py+cE+10BN2gbEEm1dD7uCOB4+VGx2i5CaYkWpm5OKDLQNq0Pv
         xD9A==
X-Forwarded-Encrypted: i=1; AJvYcCUpwXBkoTfiswcfkbw/HODCdY4uUYHVovFTdI0JRVxjSvsVCxPLthr1RMVntscMnckrfpkSAgho2QGnx40=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuidW6F+jWO1OUOJjLFuCT1lMvnMT6Ql9EiTnKUOuI6DVzXr8z
	kJbI/blYuWXJQs3rfcfqNY1InJ/qHFDLXZo7rTQqgHlklbHKTNPIdgKC7AYM8X+X+OGjfPF294V
	1HDqpyEx2fp8WEw==
X-Google-Smtp-Source: AGHT+IElh3PYpbuoTAc35/xRfrNx9S2QQcNvE6QJPF2din6i4y4W48x8gXxZ/sqDfxdlN+vEmIzdSckX/yxw2w==
X-Received: from wmte15.prod.google.com ([2002:a05:600c:8b2f:b0:44f:f406:f4f2])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba6:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-4538eeac21fmr192770235e9.31.1751383227988;
 Tue, 01 Jul 2025 08:20:27 -0700 (PDT)
Date: Tue,  1 Jul 2025 16:19:11 +0100
In-Reply-To: <20250701152000.2477659-1-gprocida@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAK7LNASzE1CtRo9T4byPXJtB-HtuWsGe=OLba+8JU9fB28Chow@mail.gmail.com>
 <20250701152000.2477659-1-gprocida@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250701152000.2477659-3-gprocida@google.com>
Subject: [PATCH v2 2/2] gendwarfksyms: order -T symtypes output by name
From: Giuliano Procida <gprocida@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Giuliano Procida <gprocida@google.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When writing symtypes information, we iterate through the entire hash
table containing type expansions. The key order varies unpredictably
as new entries are added, making it harder to compare symtypes between
builds.

Resolve this by sorting the type expansions by name before output.

Signed-off-by: Giuliano Procida <gprocida@google.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 5344c7b9a9ce..9c3b053bf061 100644
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
+	es = xmalloc(count * sizeof(*es));
+	hash_for_each_safe(type_map, e, tmp, hash)
+		es[i++] = e;
+
+	qsort(es, count, sizeof(*es), cmp_expansion_name);
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
2.50.0.727.gbf7dc18ff4-goog


