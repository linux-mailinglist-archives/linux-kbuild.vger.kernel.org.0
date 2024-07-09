Return-Path: <linux-kbuild+bounces-2445-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421DE92C4DC
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 22:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72B0E1C21713
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 20:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC0D152515;
	Tue,  9 Jul 2024 20:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SsYLTYTl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6333189F20
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jul 2024 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720557775; cv=none; b=dq5eJk6zZQoLtWRKM2q+h7IgYYq7rVy85pzyP6YZEgp1PmnbXUW6JtapvOtc0nPl+8Sh1ksi/UchggtpNSrxjPQAkD2pMB66liB7RyiHuA/7SrNFIgo6/kIZE2hiOcNA/DTLLG8i6tkHCQz5fwRGQn1k2YtFM547N14i3tsvwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720557775; c=relaxed/simple;
	bh=b4hwpR7FcvZtkKTELzGynXekzYR0PusjIfDe9l3TwMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzhhKc/0/Ntd8Yzco91kV7VQdYskIImYbcBVeSxarrBZTtFcx2JGxQsxySlRDhfEG4IWA5O9u816s/p51vVOWU/DZsUSdIyJTfUvIGMK71UcDnJ1ccPkRI/kuji+O07EsI2t82KOq60DMoIaqslP2yDczTxI0L/mMRMrHsK18M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SsYLTYTl; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70b2a0542c2so2236516b3a.3
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jul 2024 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720557773; x=1721162573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiALKlxZPNYSJmF/lhWQ3NpiYNOoFr+vLFcM3ThUmi4=;
        b=SsYLTYTltLo7sJqvf+mGn6scBSv7f/iHv0jysYQvIsYm+u9Rvhy+4I9birjmvY7mzH
         lNzOZCAknKmPnhQdwaWmJDsOkt41/G2vp+Uyluy43CvcvTF28v4T+xDUfo5au5hnBRmz
         Mhkzp+OKA1tuexMSnT6395/rAJMHod35VL+44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720557773; x=1721162573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiALKlxZPNYSJmF/lhWQ3NpiYNOoFr+vLFcM3ThUmi4=;
        b=o99x8ZPoDV0CdwzFFcci8mwXF8dqUq5mrjd7wFVfVkVBX/gAZMwRaExyaj+9aMTLZV
         /+uuzsRZcWAprMqUpc+YhMjoAdfD91dwVc+wCaHwQz0CzEULJ89eXDkFu0TgT36cTDhL
         OWYeunXCCnUwNABG7q5HLjkoJf7Vv5kDsaFRA5IUUUjhMdaG3rmgFhQ2s041Te0ACtlB
         0vAOWItFyr6S0BSxOWFX2ZZRm0o37Lwjn8ZI6sDbBrMIlGLI8pKcs9P5hYD0C2b1agTt
         TthcviS+sdbkxN3Uu1LigXXTb9m9rM+gfY8+OVYIqQsE0NubbtFTL4mQVylHvCoftB6n
         8R8w==
X-Gm-Message-State: AOJu0Yx04fatjd2gS7moMp5hyyUo2ed8S7+jvD6WDz1feYra994PKCZf
	jiTyQv06j8M9PYitHTHWI6WXIkfrtWNFCNn9YzB8yAHHnzEVIgm10XgXHLC/QA==
X-Google-Smtp-Source: AGHT+IFk1ZoJ/7py9bvsFpMRs4pPRa9BdumrqhYcFo1TH7FtyYfUYmo7l+dHmIHLVhnPJz5rO/9wdA==
X-Received: by 2002:a05:6a20:6a0f:b0:1be:c4bb:6f31 with SMTP id adf61e73a8af0-1c2982233cdmr4577298637.18.1720557772993;
        Tue, 09 Jul 2024 13:42:52 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:4d59:98c6:8095:9b12])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-70b4389c175sm2345131b3a.12.2024.07.09.13.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 13:42:52 -0700 (PDT)
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
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 2/3] tools build: Avoid circular .fixdep-in.o.cmd issues
Date: Tue,  9 Jul 2024 13:41:52 -0700
Message-ID: <20240709204203.1481851-3-briannorris@chromium.org>
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

The 'fixdep' tool is used to post-process dependency files for various
reasons, and it runs after every object file generation command. This
even includes 'fixdep' itself.

In Kbuild, this isn't actually a problem, because it uses a single
command to generate fixdep (a compile-and-link command on fixdep.c), and
afterward runs the fixdep command on the accompanying .fixdep.cmd file.

In tools/ builds (which notably is maintained separately from Kbuild),
fixdep is generated in several phases:

 1. fixdep.c -> fixdep-in.o
 2. fixdep-in.o -> fixdep

Thus, fixdep is not available in the post-processing for step 1, and
instead, we generate .cmd files that look like:

  ## from tools/objtool/libsubcmd/.fixdep.o.cmd
  # cannot find fixdep (/path/to/linux/tools/objtool/libsubcmd//fixdep)
  [...]

These invalid .cmd files are benign in some respects, but cause problems
in others (such as the linked reports).

Because the tools/ build system is rather complicated in its own right
(and pointedly different than Kbuild), I choose to simply open-code the
rule for building fixdep, and avoid the recursive-make indirection that
produces the problem in the first place.

Link: https://lore.kernel.org/all/Zk-C5Eg84yt6_nml@google.com/
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v3:
 - Drop unnecessary tools/build/Build

 tools/build/Build    |  3 ---
 tools/build/Makefile | 11 ++---------
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 tools/build/Build

diff --git a/tools/build/Build b/tools/build/Build
deleted file mode 100644
index 76d1a4960973..000000000000
--- a/tools/build/Build
+++ /dev/null
@@ -1,3 +0,0 @@
-hostprogs := fixdep
-
-fixdep-y := fixdep.o
diff --git a/tools/build/Makefile b/tools/build/Makefile
index 17cdf01e29a0..fea3cf647f5b 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -43,12 +43,5 @@ ifneq ($(wildcard $(TMP_O)),)
 	$(Q)$(MAKE) -C feature OUTPUT=$(TMP_O) clean >/dev/null
 endif
 
-$(OUTPUT)fixdep-in.o: FORCE
-	$(Q)$(MAKE) $(build)=fixdep
-
-$(OUTPUT)fixdep: $(OUTPUT)fixdep-in.o
-	$(QUIET_LINK)$(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ $<
-
-FORCE:
-
-.PHONY: FORCE
+$(OUTPUT)fixdep: $(srctree)/tools/build/fixdep.c
+	$(QUIET_CC)$(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ $<
-- 
2.45.2.803.g4e1b14247a-goog


