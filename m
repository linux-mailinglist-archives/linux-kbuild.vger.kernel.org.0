Return-Path: <linux-kbuild+bounces-2539-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B7931BE5
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 22:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71E41C2146C
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 20:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDE713C693;
	Mon, 15 Jul 2024 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RuqCN2nK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF62713A416
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2024 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721075630; cv=none; b=HASG0NiY9hIYGR6fgVo40HFZpcXM9BgUAQEd9vamhDmkXrKYdsypi9CMv0VZCH0bPCkienwJ+pSdXn94RY6SGrDyMk69UB29PeaZifT8N/uKufMWoHL+z3SVDE0NDZqQhE4x63Xi7eDh62D2T756Jjg7m41Ir1oXXYxHT84lDeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721075630; c=relaxed/simple;
	bh=OtjVNwo381SC/keZfjeduCwHTRDWCVPReYZb0X3r5SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXFywl6jm5oHaruV3uqbE+Ym78o78vtsMyxVHuIgJ1mSBo7MWEMF+QdzP+0jYZCzFXgVLMRH2BFiDIzUoVfexJOBp2+b/5fLR5maFvs1GukGCHg5fEnBclf8JQTYTiBKNoFahPwjkHctA9/HpLkIwqUGDBDp4iNUg0dWpXYmanI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RuqCN2nK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb4a807708so42282875ad.2
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2024 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721075628; x=1721680428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV8GQ3sNmW9UM2g7XLCappSiUKhDHjx9Q2PF1jfbifQ=;
        b=RuqCN2nKYmAeFZeV5ORARlvFXdYTO58s/TEUh+/PWf+++qzABqrk+aSp4p7Q5VeUXk
         VMB5cJ5euX2BFh0p70PjMxR6ajgFR5pjupEA2vj5+CL/HXoMC2arkEhjgEIM0GI/vPTv
         Q+1RldTDreJ+TNOdFBN+oVPV6cJxuKOoVvAKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721075628; x=1721680428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV8GQ3sNmW9UM2g7XLCappSiUKhDHjx9Q2PF1jfbifQ=;
        b=wR0Yf0sXUbjSdbio/yulkKJgV2B/ZSbAKaDmrACDTdxhSebIfiaLoLLfiG0yMEnSEl
         ws3BHW01mnP45aZ8AjM7JN5piSvPyR6VlTvfUr7nL2Pd4lq5Wb2e2V3ixlIyvrb9D5VL
         uDKZfUeN/YYq47pMusERaHDq7DWvQOmjjtc07hqCH0XZ4bEUSbjcvL22J4jz6fgzW2L/
         6vnLQ0Ydzg8mHT8rbZoDsc1JkfeEcMsIv9FE70/J2RgFYq4kBOPqBxohhI0V2RzC0Ffc
         X6DljwAm5mK4bK6oTOJjWbGpsbzmlXAjX4VPiEDP+1P8SuuuJfn6y4O2qv73PX9cSn6c
         UYBg==
X-Forwarded-Encrypted: i=1; AJvYcCWFEKZILD6pbIwMV1T7eGjPiHdmhCXM8tl+Qa1ccyu8ZVcquKtlZeWkNXU+XtXCV1iqwAYAZKbCCOR2cPJoEfmuygdluuSH26V4FZr2
X-Gm-Message-State: AOJu0YxYmnx1mDvY/uCeUJSV3yAIPTXh1wH95on80gpLXYNnifiekB4W
	RCJhGT26pc6uhTRRlpwQ5rBK4roxZmqwUVPlsMnPGntqZ7cYo+zlTVNvT8hCYD1fCsRt/wgbtyI
	=
X-Google-Smtp-Source: AGHT+IFRhxgNHjtN3riipF2pMHlSVgaaC2CKlJ6yHHSh/TXqNehk7BJcZJvHPomUNrJFu/h5juOz3w==
X-Received: by 2002:a17:902:ea07:b0:1fb:75b6:a43d with SMTP id d9443c01a7336-1fbb6d4c958mr208021045ad.32.1721075628124;
        Mon, 15 Jul 2024 13:33:48 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9b77:1ea5:9de2:19a3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fc0bb9bf42sm45317405ad.79.2024.07.15.13.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 13:33:47 -0700 (PDT)
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
	Brian Norris <briannorris@chromium.org>,
	Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH v4 1/3] tools build: Correct libsubcmd fixdep dependencies
Date: Mon, 15 Jul 2024 13:32:42 -0700
Message-ID: <20240715203325.3832977-2-briannorris@chromium.org>
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

(no changes since v3)

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
2.45.2.993.g49e7a77208-goog


