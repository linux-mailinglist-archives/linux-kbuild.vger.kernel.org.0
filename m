Return-Path: <linux-kbuild+bounces-1384-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C5B8911FE
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 04:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6983828B79C
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 03:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4362AE68;
	Fri, 29 Mar 2024 03:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DXQHNkM9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639438F9A
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Mar 2024 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711682946; cv=none; b=ukK9gPIyconJjPIOGabGnxzZUm3msQYUGa6p4eQlIbgEmBr5gfT3AJwUDWg9Hx5a9qAuureL/j8yCniaLZuaICHUTl74ycPofLTJR5ufwVFc7Plu9QpYJPfKZnWSk+yvyZnWsm+sfH+NXrvmvcrK994qe3dlTllMFexpVU9AKRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711682946; c=relaxed/simple;
	bh=zxKmzxnSx9PjVgeDbZCPKKdWSiAMc87p77knFPKdQWI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vp2KO88mEYpeh95+JfvDxLYtgp77y7fce2tquoaNwVIh+QrFzk0UgFVL8pPa3KLKtubjCmtj/ocGVStpXR1Wx2H0cf398yqCeEd/1ahkDVE8WMXZFvrYnjSL5ltmGE0G6l+rGqnJvru/Pky2Ufhih36qFdNn5lq7Urcs4Y3H3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DXQHNkM9; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7c7f3f66d17so50579739f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Mar 2024 20:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711682944; x=1712287744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4UbQsk5JfCEGbuiJGPYChkxKlb06kKR5FuZVR4mueQ=;
        b=DXQHNkM9AUszNS/1MVcK8YGOP3Zhw73zLOzXEUeo7VACaMxrGFpzC/lJ48sd3omrz1
         8VtuPn6orqM1fYmFav0pk1ElipPcSOVUZYMCggIcGg1U2IcrStt3HR7J/F67qOMN5u8i
         t4jrvFOIPOHp0ruEahD5sALok3NtXxvu1A17w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711682944; x=1712287744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4UbQsk5JfCEGbuiJGPYChkxKlb06kKR5FuZVR4mueQ=;
        b=qovQHnLHa9ICDUqZdL28S1rWdJAGBAk2qJh41vVja49VTrQ78jC+N9c+K5HY0+HIuM
         Ns8S4t13T5xXxhDxNGuYIdxFJkvcMlfe6hKRdcowuNjWn1CjfdKpXJsUZfUr5RgjbwVV
         mLlYlUuUVcNwwnK9Iv9nxLb39huNi+0DPC1nYlXSo+HvY3FfEugo0XXs/ei7HMi75cW+
         g+6alp/pADrPpH1b/AJwP6gMczrebbqVyJnbjJFlvwBzKO8iG17cbkPfCvNT7agJGgVS
         xwr621kiqotBhiFhXyuX7tS9LHt71Cg/BGP4vuOPdSkxnWHOZPXrBRORkmTUYCA0d5YH
         Zklw==
X-Forwarded-Encrypted: i=1; AJvYcCXn8BSolTd353k1I63rhoZX698K3BIaZg3uWjZHUHmzbig/TETf18XVQKA6tmqPIfGOdXrMlHzC/mwX3iBG61RTtnZZmcB+ad78sP83
X-Gm-Message-State: AOJu0YxRMb6mUojBmEIpPGI5tUxybcF3YwbpjoI7Xg8GwBPKSRMmjOCY
	zN9y7CcHesb62zZCRQyvhdAUnP6dSxm9EMSQSmM2iXH1ExIZq+gwAS0TkUQqgw==
X-Google-Smtp-Source: AGHT+IGqWxBBoE3CxFg/cl5Fd1n0LDcdDA7ZaQ+Cun7xZlmWrNgimznfOIOY+KlqexqgjDjjC38tDg==
X-Received: by 2002:a92:ca4e:0:b0:366:ab6f:f6a with SMTP id q14-20020a92ca4e000000b00366ab6f0f6amr1050509ilo.24.1711682944447;
        Thu, 28 Mar 2024 20:29:04 -0700 (PDT)
Received: from chromium.org ([75.104.105.200])
        by smtp.gmail.com with ESMTPSA id l7-20020a056e021aa700b003685b574968sm815717ilv.51.2024.03.28.20.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 20:29:04 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Simon Glass <sjg@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v12 0/2] arm64: Add a build target for Flat Image Tree
Date: Fri, 29 Mar 2024 16:28:34 +1300
Message-Id: <20240329032836.141899-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Flat Image Tree (FIT) is a widely used file format for packaging a
kernel and associated devicetree files[1]. It is not specific to any
one bootloader, as it is supported by U-Boot, coreboot, Linuxboot,
Tianocore and Barebox.

This series adds support for building a FIT as part of the kernel
build. This makes it easy to try out the kernel - just load the FIT
onto your tftp server and it will run automatically on any supported
arm64 board.

The script is written in Python, since it is easy to build a FIT using
the Python libfdt bindings. For now, no attempt is made to compress
files in parallel, so building the 900-odd files takes a while, about
6 seconds with my testing.

The series also includes a minor clean-up patch.

[1] https://github.com/open-source-firmware/flat-image-tree

Changes in v12:
- Avoid showing FIT message if V=0

Changes in v11:
- Use dtbslist file in image.fit rule
- Update cmd_fit rule as per Masahiro
- Don't mention ignoring files without a .dtb prefix
- Use argparse fromfile_prefix_chars feature
- Add a -v option and use it for output (with make V=1)
- rename srcdir to dtbs
- Use -o for the output file instead of -f

Changes in v10:
- Make use of dtbs-list file
- Mention dtbs-list and FIT_COMPRESSION
- Update copyright year
- Update cover letter to take account of an applied patch

Changes in v9:
- Move the compression control into Makefile.lib

Changes in v8:
- Drop compatible string in FDT node
- Correct sorting of MAINTAINERS to before ARM64 PORT
- Turn compress part of the make_fit.py comment in to a sentence
- Add two blank lines before parse_args() and setup_fit()
- Use 'image.fit: dtbs' instead of BUILD_DTBS var
- Use '$(<D)/dts' instead of '$(dir $<)dts'
- Add 'mkimage' details Documentation/process/changes.rst
- Allow changing the compression used
- Tweak cover letter since there is only one clean-up patch

Changes in v7:
- Drop the kbuild tag
- Add Image as a dependency of image.fit
- Drop kbuild tag
- Add dependency on dtbs
- Drop unnecessary path separator for dtbs
- Rebase to -next

Changes in v6:
- Drop the unwanted .gz suffix

Changes in v5:
- Drop patch previously applied
- Correct compression rule which was broken in v4

Changes in v4:
- Use single quotes for UIMAGE_NAME

Changes in v3:
- Drop temporary file image.itk
- Drop patch 'Use double quotes for image name'
- Drop double quotes in use of UIMAGE_NAME
- Drop unnecessary CONFIG_EFI_ZBOOT condition for help
- Avoid hard-coding "arm64" for the DT architecture

Changes in v2:
- Drop patch previously applied
- Add .gitignore file
- Move fit rule to Makefile.lib using an intermediate file
- Drop dependency on CONFIG_EFI_ZBOOT
- Pick up .dtb files separately from the kernel
- Correct pylint too-many-args warning for write_kernel()
- Include the kernel image in the file count
- Add a pointer to the FIT spec and mention of its wide industry usage
- Mention the kernel version in the FIT description

Simon Glass (2):
  arm64: Add BOOT_TARGETS variable
  arm64: boot: Support Flat Image Tree

 Documentation/process/changes.rst |   9 +
 MAINTAINERS                       |   7 +
 arch/arm64/Makefile               |  11 +-
 arch/arm64/boot/.gitignore        |   1 +
 arch/arm64/boot/Makefile          |   6 +-
 scripts/Makefile.lib              |  16 ++
 scripts/make_fit.py               | 290 ++++++++++++++++++++++++++++++
 7 files changed, 337 insertions(+), 3 deletions(-)
 create mode 100755 scripts/make_fit.py

-- 
2.34.1


