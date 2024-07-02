Return-Path: <linux-kbuild+bounces-2323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8858924B26
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 00:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C060D1F28420
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 22:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C431B6A52;
	Tue,  2 Jul 2024 21:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P61IpjSp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD251B11EB
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jul 2024 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719957544; cv=none; b=ROkrbjYuoTyeIALIduFPX/V+wO4Ae65nqsMoTXfQ5mEj6XJowwpLfY9Th0PtTHRoR1dplMnER9rFhcZXQxbuwyhgxRRXtQwtrd70M91G9HQh8xKeaRhZCU0V6Vgnnmop9ydPyeaka9uP0zBkaEqwm5D8I0jcnZL6nTUINmN9oek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719957544; c=relaxed/simple;
	bh=hRx/V3N1tOC03q/ejC+f/u6Teuj3+AZz0SNmbH3aP+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aaSpNSzIvlMwSMMh564wsxOTVw5hbNnciw83SOE/Vn+/oRbEf7DpAqntyMssRAOhdlwmuhFMkR5VfTMTFwmAHigmiUxvLWbwH6+/coJ03nFLNTPbnkOU1+qe7+MS9ZRhTz3C8Q85A2aREYDOqc//KHr8dM0J3Rt4U/rUpi8mmIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P61IpjSp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f480624d10so35394195ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2024 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719957542; x=1720562342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS62etFpIYNGMrGCK000i0PIRfNlj81mNm/Gs9qD5BY=;
        b=P61IpjSpNrFO4Mhe/vSPn+HYxWf9wzZff49NXuEIUmGW8tYmt6z7T1ohloU+Dpcz2J
         P0trfgxN/r38uwvtDsJiLTdvgssqJahaJV3tCi9neHYRY3gyTPhve2SsCXivLBnJJRSu
         HnVKMUrzsSdDkh5ORdc/9HLXWyaOOXjY2wa1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719957542; x=1720562342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MS62etFpIYNGMrGCK000i0PIRfNlj81mNm/Gs9qD5BY=;
        b=bAEIwBWwkD9Bs4DGD0TjskyOfYy3qvNDWNue16XyqDKwnri3jbOvebgUWeZvEXxk8c
         DeSyXq4u8ZSiQdApW+8hrhEemjlnXktjuZFBAVJdgD2jC2DaLKS6JY6o1wyxE6tTgsKc
         UwgMF7KwwDpYLiDCFH0HOnxtLFwCjIpR64nvbY2fEx+m3sG7h36BXx76U7MvsVBh9Hjc
         hbo5WlZeIXfSl70LEsDyQvJVdE2MSQBTvWR7aeffiTi3s6lBUE+yLErouyy0BPyhHCt1
         y3rI8jUmhvIypv33aiAw2xGaI/QUGf3o3Fs7kdV6GEiZPrM2XtkdCiSfS66LZ6X9/Jcx
         1f2w==
X-Forwarded-Encrypted: i=1; AJvYcCXx8t7O/hvV6g2Cfsoo+C1P2cgp6XXFwVmrvaw52idgdptvA40Bqyf9wdWyvtlY0cYcIoFxMOPoTsupxk65NaclfuNl/49+05Jhhgom
X-Gm-Message-State: AOJu0Yzt5rGgJT/4Rq8gkuknVKJQG886cyQMs5Gxn/0au5DAZiPPeqsy
	Yucdhh3VfLwNVL3v91CYDfPhkYSyr/P009fFGZ6hHImgI1atKx1BvHa3zheheg==
X-Google-Smtp-Source: AGHT+IGhBHTd3UcyBZmHUjgYyT7fXHIhXEIAs1XDCCOIAV7kEK6DLojlLX7aVDeHN+pn1Pb84Pk4hA==
X-Received: by 2002:a17:903:11c4:b0:1fa:ff88:8914 with SMTP id d9443c01a7336-1faff8890ccmr18873025ad.35.1719957542207;
        Tue, 02 Jul 2024 14:59:02 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:5fa9:4b10:46fe:4740])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fac10d1498sm89565205ad.8.2024.07.02.14.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 14:59:01 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/3] tools build: Correct libsubcmd fixdep dependencies
Date: Tue,  2 Jul 2024 14:58:37 -0700
Message-ID: <20240702215854.408532-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240702215854.408532-1-briannorris@chromium.org>
References: <20240702215854.408532-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All built targets need fixdep to be built first, before handling object
dependencies [1]. We're missing one such dependency before the libsubcmd
target.

This resolves .cmd file generation issues such that the following
sequence produces many fewer results:

  $ git clean -xfd tools/
  $ make tools/objtool
  $ grep "cannot find fixdep" $(find tools/objtool -name '*.cmd')

In particular, only a buggy tools/objtool/libsubcmd/.fixdep.o.cmd
remains, due to circular dependencies of fixdep on itself.

Such incomplete .cmd files don't usually cause a direct problem, since
they're designed to fail "open", but they can cause some subtle problems
that would otherwise be handled by proper fixdep'd dependency files.

[1] This problem is better described in commit abb26210a395 ("perf
tools: Force fixdep compilation at the start of the build"). I don't
apply its solution here, because additional recursive make can be a bit
of overkill.

Link: https://lore.kernel.org/all/ZGVi9HbI43R5trN8@bhelgaas/
Link: https://lore.kernel.org/all/Zk-C5Eg84yt6_nml@google.com/
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 tools/lib/subcmd/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
index b87213263a5e..59b09f280e49 100644
--- a/tools/lib/subcmd/Makefile
+++ b/tools/lib/subcmd/Makefile
@@ -76,7 +76,7 @@ include $(srctree)/tools/build/Makefile.include
 
 all: fixdep $(LIBFILE)
 
-$(SUBCMD_IN): FORCE
+$(SUBCMD_IN): fixdep FORCE
 	@$(MAKE) $(build)=libsubcmd
 
 $(LIBFILE): $(SUBCMD_IN)
-- 
2.45.2.803.g4e1b14247a-goog


