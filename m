Return-Path: <linux-kbuild+bounces-7091-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA2AB4A58
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 06:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3054865E58
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 04:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC4446426;
	Tue, 13 May 2025 04:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=underview.tech header.i=@underview.tech header.b="c7Y+CC/r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF54130A73
	for <linux-kbuild@vger.kernel.org>; Tue, 13 May 2025 04:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109064; cv=none; b=O40eB6RECJFruu3js1xthivNziA/ir22GZvqQA4WDY7lXxb4AKSs0gkXsTozi1nj2PzVnfphynU3cU+tnHHaGUqnK8KjthSt6el2SNAmCX6VitjwMbPxZN0l5uzwbBU4Pw2JC6VwqJkkjAmQGGkroJFZEovZ5r4WJNs438mbDtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109064; c=relaxed/simple;
	bh=YV4Y2ZQq2/d3trvZ6DYcaTPggeQp/vqO6oRMHtooXbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AQKUksVUZ3sCXbHiKM+/ru7vLo2OENV9bwqNVcZ1XTuU5Qgftup3CpsCprN+Y6Q3NgTDbrkpjxd0eJuqsOQUl4UaixIulQTaWrznmI6Qo6bj4UiK+aQ8vCJ/A4nLIeh0uOt0j6SPpEY32flJbJ8iqpdQnzCgjnV04m64wSndoks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=underview.tech; spf=pass smtp.mailfrom=underview.tech; dkim=pass (2048-bit key) header.d=underview.tech header.i=@underview.tech header.b=c7Y+CC/r; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=underview.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=underview.tech
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0ad744811so38599866d6.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 21:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1747109061; x=1747713861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24gL5iaJGhCEuJ68Dli5h9LKJlUtfMtGc9wN51YZqZg=;
        b=c7Y+CC/reoqIuy8SYBDkhplIhGEDIUuTti3bM3TPoeI0f5reCbJSRm0d4DckXYYpTc
         vj3vYYH/jzIOfExs9oksmNld++fag2teShNoDYOQNHQwI2FPrOdjXnGRmNGAj3MPRBCJ
         axa2mdP5ykmRJvuYXYBaL6IflrT7RjwQxEdccao4DpM09zW91RcipwxVVodUWwWTNU5R
         GNvT1EC8wROBp0hx6S0SmysxiP1ITHlcPqPxoLWjdKAhyTcJgAZOCirvUyyV+rfJAFEx
         cfCCW+jP0rS9cmqjbh3exq40Zhv6u1ycABVj0oz5AYmrY9zU04s2HjdVgRyx777RU2Vq
         H30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109061; x=1747713861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24gL5iaJGhCEuJ68Dli5h9LKJlUtfMtGc9wN51YZqZg=;
        b=ku+wMwxPZghie5A9Jb4J81diQxPJGNrusIgrdCnsQ+eCM5sMVRqbiM9MSSz/vwJQ3I
         B5Td5Vp6Ob7GQyMN1qz4SU1Sp6LPSUy1/xOAgJB1ahPvKxdNPajm7Amm9InSnw+lemGC
         rmUzwW3fqS1uk/nVZvOT/e2NV+5ABoNGToRT1qVCLlacNLJsGlmIn08akrflZ+dgYUI8
         AfCAe/pgNWigPZmhP3hS074L0osa1nQGyNtg192XWXKYyjkix4XfG4Lq79dpioKlgLCN
         HnJpgX8fbogbD2iweb9elDwMvf9m5Apu0WTTyF4xbDgA4uwKJlxO9mQEk9o97u8+XmH4
         Cjjg==
X-Gm-Message-State: AOJu0Yx8wRF4hcUem5YAz/QHcsmlnKoUz2Qq4hmRHCxLnRS59xDUqZuj
	KYyG0QWr+X+rw2yfHfC/iDL1wDsFA8zsl7ow1Dij3nB1jk5l+lf9k07kX3P4MLsvTfgrNvaciME
	1BzQ=
X-Gm-Gg: ASbGnctZtug48GHOr8FuTt1KST3nYsor8Irod+mzV8eTDBCU7Qnsv7Uq+Cz5KcgqszU
	d68fnRSBUxttM1xiXEitbobI5qkY2UcerM3pqEdv5Laip8L0BdWAJkn7L1Cq8Oai1jAOXYqxGN3
	2FABm+RPUvS/NwYXwvKOrqPvqTX69PohFrvOpe7tdj/PM63V6pfWajAYD5kcdR7BMh6Zg8jXvJL
	Cigs4fTy0SjDTTGyg/Z905rAyGlc6nmgWHp+Y6MLUcXOaEHJeG0s+l13xXkUEW7wHNJ/EYF6UWd
	BPgd0A/DBzsJT1DXx/PVmCHBFl4JOkly66xDe3yw
X-Google-Smtp-Source: AGHT+IF8p3Se6U+3M3exCSayZYkLs58ysCKqjX72b6dsfLP2ZbkpMDL7DfrMYosLg5b3lKgZUS6emA==
X-Received: by 2002:ad4:5742:0:b0:6f5:4711:297c with SMTP id 6a1803df08f44-6f6e47a758emr239492056d6.5.1747109060669;
        Mon, 12 May 2025 21:04:20 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::abf4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39e0b96sm61890336d6.7.2025.05.12.21.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:04:20 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org
Cc: nathan@kernel.org,
	nicolas@fjasle.eu,
	Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] Makefile: add KCFLAGS to build with Yocto SDK
Date: Tue, 13 May 2025 00:04:09 -0400
Message-ID: <20250513040409.147881-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running

make -C \
"${SDKTARGETSYSROOT}/lib/modules/<kernel version>/build" \
modules_prepare

Issue that are encountered include

make -f ./Makefile syncconfig
make -f ./scripts/Makefile.build obj=scripts/basic
   92 | #include <sys/types.h>
      |          ^~~~~~~~~~~~~
compilation terminated.

ld: cannot find Scrt1.o: No such file or directory
ld: cannot find crti.o: No such file or directory
ld: cannot find crtbeginS.o: No such file or directory
ld: cannot find -lgcc: No such file or directory
ld: cannot find -lgcc_s: No such file or directory
ld: cannot find -lc: No such file or directory
ld: cannot find -lgcc: No such file or directory
ld: cannot find -lgcc_s: No such file or directory
ld: cannot find crtendS.o: No such file or directory
ld: cannot find crtn.o: No such file or directory

Solved by setting KCFLAGS as the yocto project SDK
KCFLAGS is set to --sysroot="${SDKTARGETSYSROOT}".

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 64c514f4bc19..bbe7b0503841 100644
--- a/Makefile
+++ b/Makefile
@@ -459,7 +459,7 @@ HOSTRUSTC = rustc
 HOSTPKG_CONFIG	= pkg-config
 
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
-			 -O2 -fomit-frame-pointer -std=gnu11
+			 -O2 -fomit-frame-pointer -std=gnu11 $(KCFLAGS)
 KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
 KBUILD_USERLDFLAGS := $(USERLDFLAGS)
 
@@ -491,7 +491,7 @@ KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS) \
 		       -I $(srctree)/scripts/include
 KBUILD_HOSTRUSTFLAGS := $(rust_common_flags) -O -Cstrip=debuginfo \
 			-Zallow-features= $(HOSTRUSTFLAGS)
-KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
+KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS) $(KCFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 KBUILD_PROCMACROLDFLAGS := $(or $(PROCMACROLDFLAGS),$(KBUILD_HOSTLDFLAGS))
 
-- 
2.43.0


