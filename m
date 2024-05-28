Return-Path: <linux-kbuild+bounces-1937-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8928D16AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 10:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E19371F23D7F
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 08:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C1438DE9;
	Tue, 28 May 2024 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WzcO1dwb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90FD17E8FC
	for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716886359; cv=none; b=tMlQ7mknG9jq5sAVGb13LlAyy4VmAjoUGmmpRM2ZumpNdQJiuba1xGrULON1jw874HD/HtK73mELM0yvRaafESNZWxV5kNR50KbrliZ9r/LbdjRvwRyTHx63ThGBv0OYoC+LWxRKmo6M9D0AxkCLpVbNbVSuGi3KBxrts477b5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716886359; c=relaxed/simple;
	bh=p5+92J4Yr91UbUFnVC7glb/EfmWV5LuV1TZqeUfRQoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1jRgsdkR77+h/6rsxtocWzRvvq+oTUdilWndsGjm6TXnFg6bEzOrzRNIMuPeo06GbnGaDaAA2IlIbTkkoSMvyckBrr21bE3lEOt5G6gZO3rYp21faGb8xnufXGB91QTO8jvIxJJ57VZHt7JrvHWPmC6hUh53v0UJ8SZp3w7kxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WzcO1dwb; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ff6fe215c6so410725b3a.3
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 01:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716886357; x=1717491157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QzdCxzv8yGENpSozKsGJewDpr108WZzlNxA7fdNR/8=;
        b=WzcO1dwbj49kL/QSDXakWJQgp8dup6QSTfnISsCkqtfIt34EXD2hQosmsnf08pGmva
         A0lJL3TLkaZLWiyqbN25HpB/JqzYACqNg3SjjsEBLEZa93b+A9l00sLPodghN2AIDDFd
         4cp1K0Reuju9TvZRwMeS3ulp1f+ELiy89OGhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716886357; x=1717491157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QzdCxzv8yGENpSozKsGJewDpr108WZzlNxA7fdNR/8=;
        b=L1Np5phRqI6EuyXsIUvodCQBL8xmYzXONLIOa2FLmw5iUY4A5/7y3bpnVUVhTRYqTd
         +kQIAVSsOW6/V8qNMSPbBEHDdEmAenjBvfBuF+x4RUvkZy+Ue+KVZWKVNomvsAg2+8Sk
         EggEa2DZCZWd4Mt0FWmV5Okkq8HHdbOKTF6pQ4vYj/5yrhV+9xtRAfOiydt2b29csk/D
         gnW8Cnt8dUEP6lCAfeGkeoZ1S8kjq0YCoIidGiVkk4hbmJtklaOYU8YvviBeQOTmIimY
         m+L2A2p09SE4giyTYMnysJv3jSBYA7/IKEaST6MTgzCkbz73LbP8FjYNdu+Xp6kTLyYQ
         6Ilw==
X-Forwarded-Encrypted: i=1; AJvYcCUWeWBFbR8X5WIH+cfzS5l11FyOXgWVlWTazNvIBcX9aIyUmWQ82yxcK0d/PH/2dnvpip60MUFTJPzxzOngWPr7tvXCPDKPoWRmkCqy
X-Gm-Message-State: AOJu0YwSySwMfIphBtqTNdPb4NNI4A9I5Rs0jIJx7IW+Ad9Vo0bCSMBP
	AO+aw8/SMqR0r9HMwmvBcsPvEfWhT5HMz8mlUPFsBUh91kT8VxCPIY8oQ0YaM62fdkJV3b0tMtw
	=
X-Google-Smtp-Source: AGHT+IFTTpm0RsjGdPoiR+AoKzXW7E+hd/m8F4dDEyyB9zbyv+NxB20eslkRX45ggDC8YXqbzFdtUA==
X-Received: by 2002:a05:6a20:d42a:b0:1af:fa18:76f0 with SMTP id adf61e73a8af0-1b212e3c9fbmr10721136637.55.1716886357113;
        Tue, 28 May 2024 01:52:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7a31:aea8:d44b:edb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c997d0dsm75119025ad.199.2024.05.28.01.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 01:52:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Simon Glass <sjg@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2] scripts/make_fit: Drop fdt image entry compatible string
Date: Tue, 28 May 2024 16:52:18 +0800
Message-ID: <20240528085221.2989315-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the FIT image source file format document found in U-boot [1]
and the split-out FIT image specification [2], under "'/images' node" ->
"Conditionally mandatory property", the "compatible" property is described
as "compatible method for loading image", i.e., not the compatible string
embedded in the FDT or used for matching.

Drop the compatible string from the fdt image entry node.

While at it also fix up a typo in the document section of output_dtb.

[1] U-boot source "doc/usage/fit/source_file_format.rst", or on the website:
    https://docs.u-boot.org/en/latest/usage/fit/source_file_format.html
[2] https://github.com/open-source-firmware/flat-image-tree/blob/main/source/chapter2-source-file-format.rst

Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Add clear reference to U-boot docs along with excerpt
- Send separately from "disable compression for DTBs" patch

 scripts/make_fit.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 3de90c5a094b..263147df80a4 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -190,7 +190,7 @@ def output_dtb(fsw, seq, fname, arch, compress):
     Args:
         fsw (libfdt.FdtSw): Object to use for writing
         seq (int): Sequence number (1 for first)
-        fmame (str): Filename containing the DTB
+        fname (str): Filename containing the DTB
         arch: FIT architecture, e.g. 'arm64'
         compress (str): Compressed algorithm, e.g. 'gzip'
 
@@ -211,7 +211,6 @@ def output_dtb(fsw, seq, fname, arch, compress):
         fsw.property_string('type', 'flat_dt')
         fsw.property_string('arch', arch)
         fsw.property_string('compression', compress)
-        fsw.property('compatible', bytes(compat))
 
         with open(fname, 'rb') as inf:
             compressed = compress_data(inf, compress)
-- 
2.45.1.288.g0e0cd299f1-goog


