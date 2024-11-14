Return-Path: <linux-kbuild+bounces-4682-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2DC9C8D6D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 15:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90916282BAE
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 14:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C05B82488;
	Thu, 14 Nov 2024 14:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FN9FJE56"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734DD74BE1;
	Thu, 14 Nov 2024 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731596242; cv=none; b=nh9qdf6pSlodoAxvrL0wxuq8GNWhqVsfKTyiqpphJRXUcjQ5d1oxcwCBx81QJkOqLNDsq+Mdjhnt8vvnjEH67hkimzaQ5xjyhVn/QKmmQmrmc1UM/11Kdz/DtEpKAmhv27s/QHKwQKET3NCw0Bm62D8hiw+TSCsI4YTDelolxY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731596242; c=relaxed/simple;
	bh=pkJNJxoeCzInceBm8X9JQggNQG0mKV37IxeaHZdeuOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GDK3xuLE+hcqpzfNIEG1VuQh/1TYLshU7ygHZ9+41YGj8f9V6lsKkpdd37Yw4vhq8S8aupJ644ordlXV43Mz0O3s0cl50/BlOCtyCd5StfOYFgNeN3YjYBlftaHOPfBzMDh8JImwzVFiNvGo4aLA6SApse+E7Nm3YfNJ40KEz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FN9FJE56; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9ed49edd41so124113766b.0;
        Thu, 14 Nov 2024 06:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731596239; x=1732201039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oC1V2uPMKuCVb42okFlodDMg7VTiVJx1PFqsTRJLKbs=;
        b=FN9FJE56Ge1iG6TNTCewC+iC6ZWABMdeHg/GHnh4qbuLh/Tm5ahfYcLvPw/EXTB5SL
         SWXk8cRwSuG6Sfh6AAX5JXZ2miYOEyVdCKBV6qXVUVGrUvcxq+ALW5e/GAayD+0mzA82
         5lkNpaerI46yPJ1IpDPYft0xr4LhKEAYtyeWNi+/EHNdDqt+KgGmYUmxoWN4ruDxNU+D
         fX7Mor/y7aoZNl+XnsqQ2lrc+kgwwE39XuLYOf3dPQh3ErRh0o7ClmU6Wk1HMpK/yIyo
         0GxPD7nMLBMWF64/NxOageMgc0VHgktonCJb7izz0TQaiOYpM1OFCicQ7fyJ1Yop26o6
         odng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596239; x=1732201039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC1V2uPMKuCVb42okFlodDMg7VTiVJx1PFqsTRJLKbs=;
        b=SLanzxul4T524wCFXLMwhpcoRXqhyEc+0SWkQ14xMhnkboe+tEjjpHBvq3Y1O/7XOt
         PQPQ4F7Sg9gcNGEH8RyArBFK9sd2x5BsqnAYAxOGmVuOdLeiM33zQNTL281zQg9YQ3IV
         vBnptCeMIie/K9SwR9YcbUjclRRnQtk0IbVQJK9BCKqEfP/ctclyHs4yydzSjpPKQNOv
         PMODqLt7VHnfHarT/3VKaSS3fatqxIeps49LKPO2O8fgRbXosTp3sW35iMXZq6nH3qKv
         XMxvs0nVkkyemKHTyj6h+MLsOiJtCMFmWJAesIsyfJOdPIr5qttIqPFY+uHHzm+VObwn
         rpWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdIvkG3GKWt3fNePMuNteEfoMdF8w3DVC7l3Knd544YLnpCJ/vsyyo+B9nBXwhy20FzQ4ALgE67fItpZ5Z@vger.kernel.org, AJvYcCUv3t3ACTJMec4Dxm0jDWqreVPB0RgXSe3y9T2FVEucjNQK7vEzOum3e4TSS0D/m3qclduXnOGx@vger.kernel.org, AJvYcCVbYRxvjifNbknf/H/1mbg33NtADEjR5D7CYi8IaJC1Lg4iPjah/G5e5j3lDszUDS11i44YUMTUTfIORl8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9bqNAvByM78AmVfy9a6du7c43529cPvlVo4dyE45DK+KVyrQf
	CqcbWwMFdCUFP1nXaI0STe7C/kTxBbVfP9g5yHZac3mYnozTwswb
X-Google-Smtp-Source: AGHT+IHYA9lOrq2gvr+JzqUCQCoRdL6fFk7XxyfZZGn7kqPkL98O6LVB5dRztX432sAiFj9y50dNYg==
X-Received: by 2002:a17:907:60c8:b0:a9a:46:83ee with SMTP id a640c23a62f3a-a9eefff1531mr2259415866b.48.1731596238497;
        Thu, 14 Nov 2024 06:57:18 -0800 (PST)
Received: from partp-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd742sm72459566b.109.2024.11.14.06.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 06:57:18 -0800 (PST)
From: Parth Pancholi <parth105105@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2] kbuild: switch from lz4c to lz4 for compression
Date: Thu, 14 Nov 2024 15:56:44 +0100
Message-Id: <20241114145645.563356-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Parth Pancholi <parth.pancholi@toradex.com>

Replace lz4c with lz4 for kernel image compression.
Although lz4 and lz4c are functionally similar, lz4c has been deprecated
upstream since 2018. Since as early as Ubuntu 16.04 and Fedora 25, lz4
and lz4c have been packaged together, making it safe to update the
requirement from lz4c to lz4.

Consequently, some distributions and build systems, such as OpenEmbedded,
have fully transitioned to using lz4. OpenEmbedded core adopted this
change in commit fe167e082cbd ("bitbake.conf: require lz4 instead of
lz4c"), causing compatibility issues when building the mainline kernel
in the latest OpenEmbedded environment, as seen in the errors below.

This change also updates the LZ4 compression commands to make it backward
compatible by replacing stdin and stdout with the '-' option, due to some
unclear reason, the stdout keyword does not work for lz4 and '-' works for
both. In addition, this modifies the legacy '-c1' with '-9' which is also
compatible with both. This fixes the mainline kernel build failures with
the latest master OpenEmbedded builds associated with the mentioned
compatibility issues.

LZ4     arch/arm/boot/compressed/piggy_data
/bin/sh: 1: lz4c: not found
...
...
ERROR: oe_runmake failed

Cc: stable@vger.kernel.org
Link: https://github.com/lz4/lz4/pull/553
Suggested-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
---
v2: correct the compression command line to make it compatible with lz4
v1: https://lore.kernel.org/all/20241112150006.265900-1-parth105105@gmail.com/
---
 Makefile             | 2 +-
 scripts/Makefile.lib | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 79192a3024bf..7630f763f5b2 100644
--- a/Makefile
+++ b/Makefile
@@ -508,7 +508,7 @@ KGZIP		= gzip
 KBZIP2		= bzip2
 KLZOP		= lzop
 LZMA		= lzma
-LZ4		= lz4c
+LZ4		= lz4
 XZ		= xz
 ZSTD		= zstd
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 01a9f567d5af..fe5e132fcea8 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -371,10 +371,10 @@ quiet_cmd_lzo_with_size = LZO     $@
       cmd_lzo_with_size = { cat $(real-prereqs) | $(KLZOP) -9; $(size_append); } > $@
 
 quiet_cmd_lz4 = LZ4     $@
-      cmd_lz4 = cat $(real-prereqs) | $(LZ4) -l -c1 stdin stdout > $@
+      cmd_lz4 = cat $(real-prereqs) | $(LZ4) -l -9 - - > $@
 
 quiet_cmd_lz4_with_size = LZ4     $@
-      cmd_lz4_with_size = { cat $(real-prereqs) | $(LZ4) -l -c1 stdin stdout; \
+      cmd_lz4_with_size = { cat $(real-prereqs) | $(LZ4) -l -9 - -; \
                   $(size_append); } > $@
 
 # U-Boot mkimage
-- 
2.34.1


