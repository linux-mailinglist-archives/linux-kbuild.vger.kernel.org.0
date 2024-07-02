Return-Path: <linux-kbuild+bounces-2324-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E88924B29
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 00:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14B85B23ED7
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 22:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5BC1B121C;
	Tue,  2 Jul 2024 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O21kfWY4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C320FA95
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jul 2024 21:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719957546; cv=none; b=Ks06RJ1J9b0P//TSfoM2O396cry8iu/Dtf6WSn7Mvr5yzKnGwCsw+Byphw/c2MJzOadFIKRlsojyyhjD3vNAuR+CQwXp3Qm0pJTD5LfCdNzy5XKqmoQ/51W+DBm4OC+ep0CpCOU+sSpd38BiU1j9VPeMO0fwSxZZdYBVPfxcgD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719957546; c=relaxed/simple;
	bh=Yzpg2+WaoEbAF5iByFWp49UVOXwrxjOWqhpGJSHXybE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0pgGtl3FyF7aOVDVsS3ncmsrM++qpmATGYCmNZO7wflm/otpNgbuBtu9scCptHi891M9WC0Mr2RI4vHmEw5xlxCfJUR2xxHp8Wf9YF3400XjUGjE+p+o6YR6qJCXoH4KUsp2Nsz2vMokKjPTfIyKcHF5op7r6txlIGqeNv+6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O21kfWY4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f65a3abd01so34294005ad.3
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2024 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719957544; x=1720562344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gsj73O3sDeXJFSaK3K7S5NYYn9jtEt42KkD9vbFcQHE=;
        b=O21kfWY4z6hOwUJq1WjZjgGCw2SBMJ8S3uXQf4t8bptDEYBOLqpcstscPA0o5g9C04
         hl35t6CKwAwfiX2yOF2rVgdN48hDrQSn9cmOHKunlwQt07aQVeFbhGgrdBEDBkBIP/4m
         mpvEKXuBJStmGaigIel0nPgjtLgyrHUE60JXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719957544; x=1720562344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gsj73O3sDeXJFSaK3K7S5NYYn9jtEt42KkD9vbFcQHE=;
        b=Wt11f0ulFMc2Wc7A2a5YO3fPU3ivCzX4lOt/b1qrZKLK1Ex8gZ/OjUE6x5yz9LB6hw
         dFPgs8EkeIyeHeFnNw2ak9Aa+5fFHB3BsiuHR0TJjjPk+DQGzpwRvbznQ1as6/ls6EtC
         K2oHLl/rE+5hrc8+2YzAxKTndYbs7fsK24NS3dVKZ9Zf5P6ZMoaRg/ZTrXq0emmpsIgl
         rGPiCbr2gSpTL8fPo/pIgtsORKGU+/HwXRHJD4YqTVpyVgIo926Mi6ugyaNtzN6UqKnu
         Fs4vcaokWP/HTHgp1bj99NOtvJn6+ldWQDl7YW+JmaZWGmCewX5PRIwwgKH+5HxZtxgJ
         G8ww==
X-Forwarded-Encrypted: i=1; AJvYcCUYI1CUlNNxELhhpgLAhneOg+3TQPO/MLyoJhwZlRRhjt+XCAfBTytfsZnm/AHicMC6lTLiaAyzi9Eq6D8mnG+1CzKALU2PJUX2JRYL
X-Gm-Message-State: AOJu0Yzrj2O7oeg22TiPOTqjO1ItKGvHeMU6WJT0qNQ9uMYJZyxnSmk8
	yRxvGCjyDKSq4GnzDxih8n19cs+8t+Zs1FIMubXvjxSURJ/TmIU08rF4lGDYJA==
X-Google-Smtp-Source: AGHT+IFcvyCQMP70a54FiUECjL3zy54tvMT4fzePzLGfeDFAcPS+TNQEst+rANMcYK6YnMwgQVENjA==
X-Received: by 2002:a17:902:c942:b0:1fa:d319:e0ae with SMTP id d9443c01a7336-1fadbce6a64mr115401435ad.51.1719957543897;
        Tue, 02 Jul 2024 14:59:03 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:5fa9:4b10:46fe:4740])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fb14faa1ddsm946665ad.17.2024.07.02.14.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 14:59:03 -0700 (PDT)
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
Subject: [PATCH v2 2/3] tools build: Avoid circular .fixdep-in.o.cmd issues
Date: Tue,  2 Jul 2024 14:58:38 -0700
Message-ID: <20240702215854.408532-3-briannorris@chromium.org>
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

(no changes since v1)

 tools/build/Makefile | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

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


