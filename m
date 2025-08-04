Return-Path: <linux-kbuild+bounces-8289-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA59B1A97E
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 21:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28B1B623649
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 19:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A381828B7D4;
	Mon,  4 Aug 2025 19:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="myj+hEMt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C4A28B408
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Aug 2025 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754335110; cv=none; b=pqRWXieLyrcPbr/4nJEzR21CF1sJ1weD+nptJCN7q0fweKXtJvl636/8lZVeg0q0bOCD7noZxNmV7mZZAvbI3I0JiaqzrhyltDuywe5mZW2JQhhCFNKJr7R4XmDuRhOw5OrCoz3zgxlaO/+nEtQSsT8yaTMa5k8z+kiWuP1UQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754335110; c=relaxed/simple;
	bh=PWEz9+NA3TL9Bqy+uoJY56JiWsNlBHfsy/4lEOXISf8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eQv0DnOt5tkjMQ5XUwohWOQZ1oq4TCedAA4VPu7TlXWgeInaIqA2tO/vMm5vDkvzLZwy2LvmJAx1Y40um0635hJJVKcmlJ2iaHKmavxUiK+a8jh5wcV/Ypj+jEF6hOxCU9JhxtFaG6rj5Wbq9/+C6X2BF9jN0I13vDq77WHFl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=myj+hEMt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459b3904fdeso115e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Aug 2025 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754335105; x=1754939905; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6vpa7s/m259CJfR4wWBW3OSc7Z5L+y7nCDofPdwxAY=;
        b=myj+hEMt590LYSxCk3tAcuRW2e4oppaUioVzPJnRcwM3xmMy3hLKMWQfyb7IIxo7+m
         ScFv3+yUzCROAVZuJVCDdGl5vdg9ifECnGKV3/NlnaBImHTZDiqSrDiGYwihf/+EEnw0
         gUfMEAojaFsEWKFS6ZKQhk6WM+gLQQj1F5V2tCItiLhC4U4Ufwgrl3nyrA7IkfnAUVn9
         KNeJCKi3HEJ+87p7Q5uWpjZfexDVPO0DkThaHDWIbb9KMAu9vqS+I2/VaOx2L6+j6P1S
         wnwkBI742qZaN5Qgw9uU0DPMG96PbmnifjKaRbjgT0s/ldZOFoZr4BunrQJC0APfQ0CM
         nmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754335105; x=1754939905;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6vpa7s/m259CJfR4wWBW3OSc7Z5L+y7nCDofPdwxAY=;
        b=C+7v9iHYB73W5KKMAeyVZeMDwtZTtEmG8i9nUvFWY1VgLqqhbkI/E9IJisHwlFbMSa
         2W2k6Ji+saqHkZ9L7z+4QzfoSHRJr1NiMMOrTEU1zXUPMPymR3KV31TRpqjOqf5RESjQ
         +WhttteXQYAnHJ4WCjBeuGYUd3BpuC0pM7Ste4UuUBsi6gZYBVcWXS39afjlpmh52xG4
         ro0wOEV8ok9GHyvZP5UkUZmzhMSHBynCq60M4KxyBAJ7h44SPsnBj3+8hmdbWKqm59SX
         IA+ws7IBhZJZKwJX7WrTEgglw7UGCuWcvstFudbbHDKeXzRzK0j75GUVCX5h8YrSHa+w
         xxeA==
X-Gm-Message-State: AOJu0YwdyTdYAcurlc0qFgBsNDNS6wS8Th4pur4C5GNs/NgGB7QOfqcQ
	c3Ke7hHVxJULRDvydprshgHthtDTx/TkBbzmDnn0ozpZPQi/F/1NmCwzGYxS5GLEoQ==
X-Gm-Gg: ASbGncuyDZQGtuNNcR7mju97/+B8Cj5Tkk19hJY2eDNDFdUiZ/Gx5fwUisavEkpWLAW
	xbDIFE3xayG+iQFzXL5U+w0Uw1o99abibSHFl+q7HenA/p5inGnoz1Llypq8HJnXR7lCZD4x4yn
	3ZhTEd4RqN92uZQMrraLRZsWzgkN7hKGwktXtKYeCsSleXDtXghgGy6qAinfwzEA1XdCxzGokR/
	5qbD16NJpteGkjQEyLyMx24WxTmlz1oSrWEsNnQ7NC3XLJLONj88AZUrxTeH6SxOHM2WkSKQZhR
	P+1mV6FPZkYmwjSJdHGgyRIWXnEu3x4HphGhKpplZRb+UzBs4mPnBjbWBaPdTZf7YbXEw36XY1a
	ewLrrOEnbJn8wLL/XZtqH
X-Google-Smtp-Source: AGHT+IG9kpreVaJ7962+Z3V1su1UugHjsZ0L5Ol1JEUBzQW8+RVOF8+eegVPMtxYkffRMj+hDWF34A==
X-Received: by 2002:a05:600c:8710:b0:453:5ffb:e007 with SMTP id 5b1f17b1804b1-459e13d17b5mr185195e9.4.1754335105309;
        Mon, 04 Aug 2025 12:18:25 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:2069:2f99:1a0c:3fdd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3abed3sm16384379f8f.10.2025.08.04.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:18:24 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Subject: [PATCH early RFC 0/4] running KASAN off of KCSAN's TSAN hooks
Date: Mon, 04 Aug 2025 21:17:04 +0200
Message-Id: <20250804-kasan-via-kcsan-v1-0-823a6d5b5f84@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEHkWgC/x2MQQqAIBAAvyJ7TjBBiq5BD+gaHbbcaiksFKSI/
 p51mznM3BDIMwWoxA2eIgfeXZI8EzAu6GaSbJODVtqoQpdyxYBORka5jh+RQauM0WSHAVJ1eJr
 4/I8dEPrtEm1TQ/88L4RYtiRsAAAA
X-Change-ID: 20250728-kasan-via-kcsan-e5ad0552edbb
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Harry Yoo <harry.yoo@oracle.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754335100; l=2607;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=PWEz9+NA3TL9Bqy+uoJY56JiWsNlBHfsy/4lEOXISf8=;
 b=nXtIxc/y9azUYFN45trrZkS2dtWwbDHscpVL5UvAgY+drSEtVoEfY3ljQ8HRkVq9Vawlwh1zo
 kPjnIzFnO5ADoel+f8BEEVlhBhu4mzDuxjpd3cFHJlcMHb3iIXrNMZ/
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

This is an experimental series for running KASAN off of KCSAN's TSAN
hooks, to allow the two modes to coexist.

The first two patches are cleanups that I think are worth landing
independently of the rest of the series.

Patch 3 implements running KASAN off of KCSAN hooks; patch 4 is a little
tweak to KCSAN's integration with SLUB.

To be transparent: This is part of a larger project I'm tinkering on; I
figured I'd send this part early since it could reasonably be useful as
a standalone feature, but my real usecase involves plumbing the data
from KCSAN further into other stuff like KCOV, and my code for that
is still very much work in progress.
If you think this feature isn't worth merging by itself, I think that'd
also be reasonable; in that case I would appreciate a very short reply
on whether this is something you'd consider merging as part of a larger
feature, or if you strongly dislike what I'm doing here.

The reason why I decided to go with running KASAN off KCSAN
instrumentation, not the other way around, is that TSAN hooks provide
more information about memory ordering properties than ASAN hooks do.

An alternate approach might be to merge ASAN and TSAN in the compiler
into one combined memory access instrumentation feature; but I don't
think my weird usecase warrants significant compiler changes at this
point.

I have checked that the KASAN unit tests (other than the ones I
explicitly disabled in my patch, and also excluding the two that are
currently failing in mainline) pass with CONFIG_KASAN_KCSAN.

The current version of this series applies on top of Linux 6.16.

Signed-off-by: Jann Horn <jannh@google.com>
---
Jann Horn (4):
      kbuild: kasan,kcsan: refactor out enablement check
      kbuild: kasan: refactor open coded cflags for kasan test
      kasan: add support for running via KCSAN hooks
      mm/slub: Defer KCSAN hook on free to KASAN if available

 include/linux/kasan.h   | 14 ++++++++++++++
 kernel/kcsan/core.c     | 13 +++++++++++++
 lib/Kconfig.kasan       | 17 +++++++++++++++++
 lib/Kconfig.kcsan       |  2 +-
 mm/kasan/Makefile       | 12 ++----------
 mm/kasan/common.c       |  5 +++++
 mm/kasan/kasan.h        | 11 -----------
 mm/kasan/kasan_test_c.c |  4 ++++
 mm/kasan/shadow.c       |  3 ++-
 mm/slub.c               |  9 +++++++--
 scripts/Makefile.lib    | 20 +++++++++++---------
 11 files changed, 76 insertions(+), 34 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250728-kasan-via-kcsan-e5ad0552edbb

-- 
Jann Horn <jannh@google.com>


