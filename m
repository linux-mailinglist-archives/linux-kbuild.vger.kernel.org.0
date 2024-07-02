Return-Path: <linux-kbuild+bounces-2328-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40A924C3A
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 01:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8251B1F22FA4
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 23:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A4D191F77;
	Tue,  2 Jul 2024 23:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uv0GA63a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CE617DA07;
	Tue,  2 Jul 2024 23:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719963652; cv=none; b=qMIxeecdSZjPF52tF7byHLL2wHHg01uVv664MLOvpyesSAXAcSk7vWnMLsLgMSmTtItBPkfeaZlC5tFrCyoYv1YGrjCiOl13LV6fLJrLXqAtiIHjYSKaYYWEyAYGZ++ClW5QWVnTpohCwC8oFV/aaOgjFB39ZCLw/GbNkOcAVkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719963652; c=relaxed/simple;
	bh=7kZY2KUAG8fJVOu0GscVDQewTt7BAp7yeB7aJnElh24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Cn7ouLEpeO9/LeChf+ohjaMm7rsKjz/n9nAlp2kG2SNUvBWm7lkKJ+rZSQEA58PpHtLD/2vPaGGdu/6GO/PnTtps2g2X/uu3VxaAJa0wUzD5+lKQRsOPdkDQfe0JuOzRLLgq5AMySUEi/mX5YkWFeQxmLjWHfmPjp8PHz57C2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uv0GA63a; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7523f0870cso356540166b.3;
        Tue, 02 Jul 2024 16:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719963649; x=1720568449; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jHXFaDKKpM4wPj0SsPzoA5iT48dNhq95fIw694vj4eI=;
        b=Uv0GA63a+x1VGdmhr7aESl4+qRUiHWtH+g/Z2d+DGFjvmWXJ5HUb68X4xLEbyNa5MI
         ng/zEIaGQFZ3Cgx0ovDxm+s2CT0l32nQmYMM9WzTjSIeVJ51bmr1KghVqPa5ZPUO5KkN
         kOFn7h1Ef3jTpwtELiOQ3H3UJRpZcan8cfEK9IiSCJGywf/Vs/UBD6+BK/O0bgHfCEs/
         Fl7FNHeurfRTTWpfGAG3wzb9//yXredtKqwiFpxo9g3WX24EmjAXsDalLT7wn0wCXfoD
         R7nNsUnEKZqswtmjN4w1EByFwjH/48dq2+uuchZm3guJYlOhI2ohdIwRfKto+B+s3bsM
         039w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719963649; x=1720568449;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHXFaDKKpM4wPj0SsPzoA5iT48dNhq95fIw694vj4eI=;
        b=LLqfa6xv3RjejImwKlJ+mX8jssox4FyoinQtCIfVfah3hqUGjlKCfq2YA3/KaFY+T3
         +ZxnkeM5n3/ktFVICP3N8L2gTXm+fDfX+OYrvQ8sNm5wns+bMaJpePSUManFB57dXbW3
         6SZx7zuZWE+4PSmOp3Ztel0pt1p10pkx8Th+BFdiOintOzct08MBf39Jw632Qcyddjsl
         Oz4QUxZmN4C0ht0XSsTg6czHnCqmCkaVU256O+XMHvOVT/mQ7f5QjHbdzGnNNzZw9aZh
         cygXsfQMAd31+a0ZqPAia1WIi4qaN3vKmiK5Zb3BlOhAE5EotsibCVIVHrNSr7f8Oxfe
         700w==
X-Forwarded-Encrypted: i=1; AJvYcCUeVVp3vHUeO9yrncDMRAwO6f5viduE9NBOdV+DY6HZU65QVsoEA48YJaOQ6/tdwEPGLvKG74kQ4PRa6x13rJ3LKgz8Qiw9Q/b+jVBfxNsFK84ypvMF6DQDnww0iluDqWbVoca+fueqDyDX
X-Gm-Message-State: AOJu0YxXr848qPxguBdajIdxcqptnJo9JzlkEvXU+U5JVIZTtBX3MKcQ
	585bWhMAw1kuVwtP0iyUE33ev1lZ9BTy9sBrRKnuz9ZvG0e6fdRGyzV1TMXa
X-Google-Smtp-Source: AGHT+IHRcFART3FMaK+lcYezZZDGikjxHPokwTlNpfHogv3kaOgAi/zLeAumptvDqvHEJD8cdJPrYQ==
X-Received: by 2002:a17:906:a28e:b0:a6f:55e8:b361 with SMTP id a640c23a62f3a-a7514423236mr519869166b.41.1719963648601;
        Tue, 02 Jul 2024 16:40:48 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08cfccsm459701666b.148.2024.07.02.16.40.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 16:40:47 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: akpm@linux-foundation.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH 3/3] mm/page_alloc: put __free_pages_core() in __meminit section
Date: Tue,  2 Jul 2024 23:40:08 +0000
Message-Id: <20240702234008.19101-3-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20240702234008.19101-1-richard.weiyang@gmail.com>
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Function __free_pages_core() is only used in bootmem init and hot-add
memory init path. Let's put it in __meminit section.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
CC: Mike Rapoport (IBM) <rppt@kernel.org>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 480e4416131f..c46aedfc9a12 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1219,7 +1219,7 @@ static void __free_pages_ok(struct page *page, unsigned int order,
 	__count_vm_events(PGFREE, 1 << order);
 }
 
-void __free_pages_core(struct page *page, unsigned int order,
+void __meminit __free_pages_core(struct page *page, unsigned int order,
 		enum meminit_context context)
 {
 	unsigned int nr_pages = 1 << order;
-- 
2.34.1


