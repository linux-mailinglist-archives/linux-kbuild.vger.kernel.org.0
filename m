Return-Path: <linux-kbuild+bounces-7698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15259AE7E2C
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jun 2025 11:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04AC41896A06
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jun 2025 09:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE234315A;
	Wed, 25 Jun 2025 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WyKyMbmw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A3A1F4612
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Jun 2025 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845159; cv=none; b=J2Aeh0J7VvG/CqqNcBVPw/hwj5tEt0dv5+m8kJoQbu053d8w2j4/zQUTBBj664bje8isUFV3uFN7/hcMzMs2ahSs/kYO0HKlxr/Mkcc/ytvCgPY4VbFk/5uZI0byYjWjvKa4NsHZ2EiZjYO03oh6jo73ujcNSTDzTNGm3cVAcE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845159; c=relaxed/simple;
	bh=1Y8QJ+oRfOtSdRhQbvBmTw9lQq+2E+h8tGLHlYsZDv4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KBOiuBJxed2XNXq+edDj+imDiN/rTpu9l6R25EzKJD7hFol/Fz0O/SeZ/ka5wJ2chckAduZ4QgTXygd3FA2jKSZRMRsrKmJ5uVPSF87fnJIyQlcUnnD2iitZcCCLXoXzKSLZKOUd2rfhda5Ublw4W1UcXtPwGPMpS9vRO8Tw6HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WyKyMbmw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451dda846a0so48564065e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Jun 2025 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750845156; x=1751449956; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPaFg8skY6SjMOJvVYfiFB9uK0FraGFCMhdVa+qk2JA=;
        b=WyKyMbmwIXF3ash5OeLSACPYQ/WJ89qeH0r52vZ3uL+xxHhEXTkN4y6nwa0o3EX5k+
         G/2/bV0pUNQOxnc459Qr10gtGzFTNO8i68e3OEABtUkt3i8mcX1wEUEu6TOWrPpkXynm
         1jBAvcuIjdvWPK2AoCEtSy9oK3FMdiVY6SnW1FtsaY9EsHidjJHhMit4qcDsGhURHLgG
         w+myr3NeThC45QWvXJa4jX4k3NMbDezXN0a1NO/6SQPZHIRCr6wXaNKCIW61+l+FfCqc
         QQ6fH8gIrC7TDhnuuDZeOC1DNE+5uMbKY/N21ePMnOQJ1AIN3Vya2akPm15TEKXQRn37
         MT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845156; x=1751449956;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPaFg8skY6SjMOJvVYfiFB9uK0FraGFCMhdVa+qk2JA=;
        b=JTqLw6L9b1uGph3/bvUrTXhTMoHR+ZGHBrXuVl0T+XEvngcR9/6Wi+EsujfCkrkUZA
         IWspNj/axRAXHWUaxx4eweZgQwM/VUP5OT3AO9Sl5Rb9g447NZi4t88uOmJkgEJlDBOJ
         INytr96oAi86mi0KbdLu1UJuqhfoO7SOSdNG0t2OzBOIESf0EN0cWjBK27aPG8MHoy+4
         Rud5N7oo+I8Vh7Bxi2t4aQc7bAmelK1JpbIcbeNqAvNL/h5uF8VGKWgVXloingdYfXEb
         iKvDUxokm3BErPFhiMgs2lZtNyWF8WsZRiouTiCexTfghfk+XgiiaTJ6fEbsBLwpT0PR
         8Rog==
X-Forwarded-Encrypted: i=1; AJvYcCWItZH6RZrTLanqxMu8po4KXDsmhINI/DJUKZcTPnaEM2qTda7G4N66zOiB4/NwnUzjB/V0Za8XwtemmU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9TZ91yG71MNZzj7GnBRGmFaGtLKUo1hK4eA4Z/XMQbt9sRHcd
	r6on6RpeC43dKlP7GA79yhDLMXs2c3Sg/M5jsfVPNJME4KJIny0wl8FatsOdsO8w229QN2K66jQ
	GfzeKl/t6kQTUZw==
X-Google-Smtp-Source: AGHT+IH9NSYt2O7TMUJiMIjZArM9uvyETHRaUeq8opq8u7NG97Qu9jaiO6QvaVXjIAI5VY4zW+Mj5w0AJLfVFw==
X-Received: from wmbfa15.prod.google.com ([2002:a05:600c:518f:b0:43d:5828:13ee])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e11:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-45381aa54ecmr21075505e9.4.1750845156283;
 Wed, 25 Jun 2025 02:52:36 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:52:08 +0100
In-Reply-To: <20250623092350.3261118-2-gprocida@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250625095215.4027938-1-gprocida@google.com>
Subject: [PATCH] gendwarfksyms: order -T symtypes output by name
From: Giuliano Procida <gprocida@google.com>
To: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
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

[Adjusted the first line of the description. Added reviewer tags.
 Added missing CC to linux-modules.]

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
2.50.0.714.g196bf9f422-goog


