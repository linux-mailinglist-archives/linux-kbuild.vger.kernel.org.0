Return-Path: <linux-kbuild+bounces-2444-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE492C4D9
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 22:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABDB11C219DE
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 20:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C63718787C;
	Tue,  9 Jul 2024 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EL8ihX/j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B72146D74
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jul 2024 20:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720557773; cv=none; b=qHY5eJtcksAqob0ERvTcvngEUj6Adhwu7ys9nldU+c8xkWPavCKGTKQ/jo3xVmdMVvQBv4oL6s0BCUBcPKDfEBvcg5L46+3iJbp8rGfjL026SLQfNJwiixnYrMpywNKEkXQ50LPI0snrCJg2c1yWNogzg+D5ys7gI5vqu4adijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720557773; c=relaxed/simple;
	bh=m43Go+o+Pj5R7eJEh0tWSFmc/0HGU7llEtpxq/+VOrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlDy4Y4ZwzzcJqcMDaPAiEk7ee/4xecQLLeCtUxVb0PH4u/liaVmDyBrsi+7yQt9amHZHaMY3Wz9Of9NeKexQuVZmuvKb570LGLwvUCUtkAAcjWh8jPppij760bT2GBlMkNNYBUhVePv6ks8YUkkxxNf8wk1rezoP1BWwde1j/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EL8ihX/j; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fbc0a1494dso6068635ad.3
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jul 2024 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720557771; x=1721162571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75e49adwmjRLWz6oRihBwJMsEfi0gMyYpXT0nKz58WE=;
        b=EL8ihX/jl4OIlf1HxUi9iBPD48LC0Kv9qEkhwTIF6ZxSaWpjaIa86pV8VePJ0n/Nr7
         pk+RwUi1GQ3l6mI+PO9hAdbMSg8AjWpx7K4z846YCpX7GfBhYcjzSejYgTUNwo2DCRUR
         qAXYxApCwPZaH+oj5yw2uHsK2B7rv2RDtEKWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720557771; x=1721162571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75e49adwmjRLWz6oRihBwJMsEfi0gMyYpXT0nKz58WE=;
        b=hZ6OeJ5ppSy8nE97slxlE3JzJrh0VRQAoZqGzUUYerzUs0Fcj5dxoMpb1eT/J9fz5v
         7FT7ablGBfJIHuu1s3//u5yb1KpgMPI0ZxYVVGxTis0irB3mUrrgDRcIZmRiLmNLHYz9
         xHtVbcGQj6wWg9Bs4M2yztOSwUjqaY+QmxWbhyaKXzpXvN5qjQII4BalBE97cIk5H3aJ
         kkSyzhCbz1Srm18Uv6tIASmeQe96S0rAqfNcNczKglHtLNCjxBQdUtvlcPP3IzIxkwNk
         xP41HAioONH94vQIQntD43SB7e6x9Vov/AU6jwJHjAal7BrMitCwrTBPYEQ1hvy1FPkG
         5RlA==
X-Gm-Message-State: AOJu0YwA5GietLcGhu0yelvb2QGi/Azs19DBV4Q+VBT+8S1RLSZXv6St
	GPfDldfn3E5ii872m7iefbSqCoCAh7CNZ63oHHt5rWHyv6tv7Snop/l4fA70Ow==
X-Google-Smtp-Source: AGHT+IHq8Lmie4abV8IlHVeSZdomvTKvmBTUZFcQoOFOag8g4wqstmW7lVGP15ODIy8EDSDtff8HYA==
X-Received: by 2002:a17:902:e74b:b0:1fb:4a8e:7673 with SMTP id d9443c01a7336-1fbb6ec4f06mr30123935ad.68.1720557771337;
        Tue, 09 Jul 2024 13:42:51 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:4d59:98c6:8095:9b12])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fbb6ad52d1sm20204195ad.305.2024.07.09.13.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 13:42:51 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH v3 1/3] tools build: Correct libsubcmd fixdep dependencies
Date: Tue,  9 Jul 2024 13:41:51 -0700
Message-ID: <20240709204203.1481851-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240709204203.1481851-1-briannorris@chromium.org>
References: <20240709204203.1481851-1-briannorris@chromium.org>
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
that would otherwise be handled by proper fixdep'd dependency files. [2]

[1] This problem is better described in commit abb26210a395 ("perf
tools: Force fixdep compilation at the start of the build"). I don't
apply its solution here, because additional recursive make can be a bit
of overkill.

[2] Example failure case:

  cp -arl linux-src linux-src2
  cd linux-src2
  make O=/path/to/out
  cd ../linux-src
  rm -rf ../linux-src2
  make O=/path/to/out

Previously, we'd see errors like:

  make[6]: *** No rule to make target
  '/path/to/linux-src2/tools/include/linux/compiler.h', needed by
  '/path/to/out/tools/bpf/resolve_btfids/libsubcmd/exec-cmd.o'.  Stop.

Now, the properly-fixdep'd .cmd files will ignore a missing
/path/to/linux-src2/...

Link: https://lore.kernel.org/all/ZGVi9HbI43R5trN8@bhelgaas/
Link: https://lore.kernel.org/all/Zk-C5Eg84yt6_nml@google.com/
Signed-off-by: Brian Norris <briannorris@chromium.org>
Acked-by: Jiri Olsa <jolsa@kernel.org>
---

Changes in v3:
 - update notes about failure cases
 - add Jiri's Acked-by

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


