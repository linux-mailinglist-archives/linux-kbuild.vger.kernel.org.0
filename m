Return-Path: <linux-kbuild+bounces-1907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3E18CA82E
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 08:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB91FB224C8
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 06:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101A6524A6;
	Tue, 21 May 2024 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mPHjtAxr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A09C51C43
	for <linux-kbuild@vger.kernel.org>; Tue, 21 May 2024 06:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716274281; cv=none; b=m2Ve7OjKuHwIqbEwoP92M1mWKyxkR7j1+mPEeuE8THSOU75BxSxCx4MWfD/Y879FYi3E8W14lD/TsHR59oie53UlO01DnEsWG8Z5g3o14CWrngD+pXTAcaZyBG7vnfyiFZ6Wrt8BZzRr/0SLMRlaIrq2vKiwXEfTTVNqq4xc95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716274281; c=relaxed/simple;
	bh=OH4cLngpr688D6c6flc0xYeuNkIFvmRIGHw0APLbxfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqfsgtBKsSGpKVciE6yKl7Pjj4h6WZk8mWXa3QViwAhRs06sLdNLDBWLFO56j25En0bwIyGxCQLD6MYLGXDduJ9/t0c8LPRtmwBtJNbPlRVfaPsISSwddJU2oT7FmdNsYA9ryRAFkSDL0/NkSZ7Z6RdJytM4jGswOVopD1fp/+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mPHjtAxr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ee7963db64so31561915ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2024 23:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716274279; x=1716879079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOkWGMmTQVEt7UvShsfEX9Q7OP2nXlbFbaBQoutTKvo=;
        b=mPHjtAxrxDL2UF6NtlHhTc8chXwN6GdzHjoecsCaQg41uxN5ztOYmcZLbjzNRWuNIS
         DOQvYYjUa6mFMNcdklStrv0BYe9yg85cQ3+Nu9yCnvk7G2VJsvJ9QIa9T6UcuTYYClBA
         WumyskxqVLCSfWzfrbwvZdaBn/pngV+DBCwIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716274279; x=1716879079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOkWGMmTQVEt7UvShsfEX9Q7OP2nXlbFbaBQoutTKvo=;
        b=vMpS2MQ/XNOauTdNh/HjHgw0eLZWF5MU9wSnbyuUfE3SPES239bU8mfBvQ9WTeIRCU
         9ei8d8YK5+Ip58zqGEldiG57N/yGnHxwUDxXgLEVnz3sYfFSUfu2k7x1scxkPJwPclr9
         UofTOYGfWEeeoQ0KBmFWRmEzr6vMbMVagRaJd9ZQCb601mhI9lKdmtYZaqEsZnrXvD7f
         e/0GBQNqaJrhWvxT/dxFP/AmysJ5ALaiGHKHw3hv0uMfJxCUIIVISJIbugjS5UvB7/75
         2TK7JTAVm6ka0m5ZquUnMm5eV6HuLAhFAP33LRjq/KHsJbClUZaYTP4osu5Hu++dOFO4
         9kag==
X-Forwarded-Encrypted: i=1; AJvYcCXTdjIULOL1Rome1p49QGwh+V7WqF9+AZyb7Go+rDE9mYfWTSLvJfVIxrYGPvS7aSw+K7DUjm5EVGHxbBnuHLhsvbrFQ1C4LUK94Bcy
X-Gm-Message-State: AOJu0Yy8wMMjkmXiIBn57LeCQdqZRcxhHWpK9kO7WpjTrON+Avcuk1gy
	G8CScduCqopgJQ1s3oFE+pt8k+RuJDZY7DjFhYtBep/LhlUhEbx/Pc/cWUnkbg==
X-Google-Smtp-Source: AGHT+IEe1eZFm8OQhme98CfuDT2vPG0NOgmo3lGuwwSKsHDgjQxj8mKdLiIdPioZKeAtoWh2bQX69g==
X-Received: by 2002:a05:6a21:998d:b0:1b1:d823:3ea2 with SMTP id adf61e73a8af0-1b1d8233f35mr6544797637.12.1716274278853;
        Mon, 20 May 2024 23:51:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f8a5:77aa:5a0d:e30c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f30644ad48sm23100985ad.169.2024.05.20.23.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 23:51:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Simon Glass <sjg@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] scripts/make_fit: Add option to disable compression for DTBs
Date: Tue, 21 May 2024 14:51:05 +0800
Message-ID: <20240521065107.30371-3-wenst@chromium.org>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
In-Reply-To: <20240521065107.30371-1-wenst@chromium.org>
References: <20240521065107.30371-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Old bootloaders found on RK3399 and MT8173 based Chromebooks only
support compression for the kernel image in the FIT image, and not the
DTBs. While compression could be disabled, aforementioned bootloaders
also limit the kernel image size to 32 MiB, making compression necessary
for any practical setup.

Add an option to disable DTB compression to support this case.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 scripts/Makefile.lib |  1 +
 scripts/make_fit.py  | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 9f06f6aaf7fc..84d9b0166cc0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -522,6 +522,7 @@ quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
 		--name '$(UIMAGE_NAME)' \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
+		$(if $(FIT_DISABLE_DTB_COMPRESSION),--no-dtb-compression) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
 
 # XZ
diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 263147df80a4..626cf3422079 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -22,6 +22,10 @@ the entire FIT.
 Use -c to compress the data, using bzip2, gzip, lz4, lzma, lzo and
 zstd algorithms.
 
+Use -C to disable compression for DTBs regardless of the setting of '-c'.
+This is intended for old bootloaders that support compression of the
+kernel image but not the devicetree blobs.
+
 The resulting FIT can be booted by bootloaders which support FIT, such
 as U-Boot, Linuxboot, Tianocore, etc.
 
@@ -64,6 +68,8 @@ def parse_args():
           help='Specifies the architecture')
     parser.add_argument('-c', '--compress', type=str, default='none',
           help='Specifies the compression')
+    parser.add_argument('-C', '--no-dtb-compression', action='store_true',
+                        help='Disables compression for included DTBs')
     parser.add_argument('-E', '--external', action='store_true',
           help='Convert the FIT to use external data')
     parser.add_argument('-n', '--name', type=str, required=True,
@@ -247,7 +253,10 @@ def build_fit(args):
         if os.path.splitext(fname)[1] == '.dtb':
             seq += 1
             size += os.path.getsize(fname)
-            model, compat = output_dtb(fsw, seq, fname, args.arch, args.compress)
+            compress = args.compress
+            if args.no_dtb_compression:
+                compress = 'none'
+            model, compat = output_dtb(fsw, seq, fname, args.arch, compress)
             entries.append([model, compat])
 
     finish_fit(fsw, entries)
-- 
2.45.0.215.g3402c0e53f-goog


