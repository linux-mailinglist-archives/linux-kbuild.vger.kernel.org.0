Return-Path: <linux-kbuild+bounces-2540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB775931BE8
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 22:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5AE428189B
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 20:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E641E13CA99;
	Mon, 15 Jul 2024 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ECa9htMZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607213C80A
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2024 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721075631; cv=none; b=NDjcNmwt+ghjkYdtx4blBNLrCFHc1UhfcUywRUU2PIrNvV5qAxOIa2sv9Bc7VaZMr17tdMwgp9xTRLY9lYovM0AyUjvc2WQkAlj4H2wXyf1bYTBUBdL6r0eo9FHrpqXksBxfhLQjsw0LsUFCkSSSk+5WVpbfy4tt8EGcQCEFR0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721075631; c=relaxed/simple;
	bh=zJomEKpkKYNnqzHoHfBCm5/jn6FvVrqd1kCQ8VySfoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R2K2Mv/7KYOgbxojjE3CtekPWaRQ3mQlROeq8Ao5WFnpRNvUIMnvd4He2OpA446N8MChj4JjhRFvY/90GDF8QTwjRmgWtsDvQfRPkmd5pj686Hm1bUqFDDJdGO5qLHlQfsFghZWkFnGaFxCM/ekD8Y3+zNi6RkvhZ6+6v16Dy9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ECa9htMZ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-793a3a79a83so759171a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2024 13:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721075629; x=1721680429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmXJ/q72ZyRMCe7zWQfBgo3XyY9yIuyVP7WwwEY/t1k=;
        b=ECa9htMZTvPPFj4L7apDKo76OcnP6ZM6CeYeRnvvTZ7GuaGvb5/QWEddzyAPtITw3N
         K7QQpFX42SW3d+jphKeTdh2j24mTzsvokGrFK2/y6DblFOUOC2BCdXhODN9C1262OB70
         zHGIBHciaJT0a9NJHWlXRkDFT/uq2UTllvN/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721075629; x=1721680429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmXJ/q72ZyRMCe7zWQfBgo3XyY9yIuyVP7WwwEY/t1k=;
        b=thedCrhCiJZViM7Xyd+nl7nbm7xf1Q4EviN14IYmNJHfRVYm63vceWtNAob5z6O2YE
         38Kscq84dOt99Do+q3iTjyQ8xc29N3Z/i86cH7tq9yuMJS8ICo2MV87xI16FMDWv1wjY
         4Orc7Mt+52aADdbFpL/EX9x8ldwPYyxU1nnCrtq1fCc+fCWT47S1rGSCB3wOv13VjgAw
         yxfIFh8Jy+HiPc3Ihflx1PsLEe+jlxzkqu1qKvb1R+QAvvLR4gR/ky7Y9sHPXmxTlx6z
         eSX+MTEPd1fwgNdz8OHOBJT3fcqur1raR65GLF+KHBhAUT7UM/hRaNxISgu/vGJA3qDo
         NOXg==
X-Forwarded-Encrypted: i=1; AJvYcCX44p1zIApVnYJzbT72Hg8coK8H94biHEnZwCLlOPTqJkcKS1UOCHgjyNQmQkDlTa7RG9GBIzj+7ZyQxfg143kEEeHjtDeW+8QqfTXP
X-Gm-Message-State: AOJu0YwAYzuPQu1bzdCyD4koKFsftUdMFgUDRDI2s6UkzBTwl1DSLY6n
	rE/H2sYlJyje1M1iIgKOERSeIMAspMQjTetEkDjUQTHI8wYCV+QdJ+LSoutH6w==
X-Google-Smtp-Source: AGHT+IFnk6iBYgvYmylTEhHv/VyQX05gg9m3qIAc6Mgy9YKCKSrAY/jDDld7K1BC1I2BGqTw6voHaQ==
X-Received: by 2002:a05:6a21:9985:b0:1c0:dd3d:ef3a with SMTP id adf61e73a8af0-1c3f123ea4amr109721637.29.1721075629670;
        Mon, 15 Jul 2024 13:33:49 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9b77:1ea5:9de2:19a3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fc0bc4ff41sm44921725ad.272.2024.07.15.13.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 13:33:49 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v4 2/3] tools build: Avoid circular .fixdep-in.o.cmd issues
Date: Mon, 15 Jul 2024 13:32:43 -0700
Message-ID: <20240715203325.3832977-3-briannorris@chromium.org>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240715203325.3832977-1-briannorris@chromium.org>
References: <20240715203325.3832977-1-briannorris@chromium.org>
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

(no changes since v3)

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
2.45.2.993.g49e7a77208-goog


