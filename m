Return-Path: <linux-kbuild+bounces-222-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0497FFC92
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 21:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3313B20F92
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 20:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1E055764;
	Thu, 30 Nov 2023 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ckmxY9i3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5C11708
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 12:34:07 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7b37223bbf4so39598239f.2
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 12:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701376447; x=1701981247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXRrWs5DXJwxwGqPai+zsQ4ZfWnj9YsfxyCdirfcQYs=;
        b=ckmxY9i30/GS3ITnNDm0E+ptKQ1Sqz7Pe/KZsG9OHs3a0QGXw2dG1+y6i+CVrD0tpU
         XOZzhB2QOtl00HUa5y4xkG2VeKjZl5LhrlO4KCy1VlMi4r7j3HR1K9sLbfbCQKYJBpMN
         IiiPOuYUzgP7UUDwxTLQVAneYXNYmNbSWCCps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701376447; x=1701981247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXRrWs5DXJwxwGqPai+zsQ4ZfWnj9YsfxyCdirfcQYs=;
        b=KwkVh8s7g9iP3vZklFiT/YfBf29zD0zYCkrLVrpE7PL555tWGy4M3jYouXO4CzTfEL
         xH8whpBbYXlx9kOBARrW00zhPE6NIsoWgtjlNNhwd+oUqGhtVIDu/J+j9GVd+yNwoM6A
         34GJRsgwle5WYYQfcJDIrjypAatfUAwoNJfE4tXJ+3s4O2PeSAoB5IYbtoJZkzxmk4ZI
         cKsG8rw2HAdrdy2kObFoULH9Tol6Up0wxa8x/dRF1/9FyKN/pG2ZMRrMhMqMarNqeklR
         fcixCEHS1Rrk13HcesT98QRFfvWNPr4yzqeW84+DhwIPi+62WeVhM+FitbMhFasmVEj7
         ZefQ==
X-Gm-Message-State: AOJu0YxGtXjRSoxt/5aHk9Z40vbVxCnWvzr918bLlLh2vzT9T8TUiemb
	lly/wsi4/NYD3eyBb9bZxbP0Zw==
X-Google-Smtp-Source: AGHT+IE4ZiKtC3C0LWUhphjc5pFc+x3DQeUolNyPVmSK92iDtbxcs0WdG2nxUMCfHZ7sJr/zWX/9nQ==
X-Received: by 2002:a05:6602:3a11:b0:79f:cdb4:3f87 with SMTP id by17-20020a0566023a1100b0079fcdb43f87mr23799870iob.4.1701376447077;
        Thu, 30 Nov 2023 12:34:07 -0800 (PST)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:d134:ced6:d34f:38a6])
        by smtp.gmail.com with ESMTPSA id r21-20020a056638101500b004665c3f56ebsm484788jab.15.2023.11.30.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:34:06 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	lkml <linux-kernel@vger.kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v8 0/2] arm64: Add a build target for Flat Image Tree
Date: Thu, 30 Nov 2023 13:33:53 -0700
Message-ID: <20231130203358.879796-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
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

The series also includes a few minor clean-up patches.

[1] https://github.com/open-source-firmware/flat-image-tree

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
 arch/arm64/boot/Makefile          |   9 +-
 scripts/Makefile.lib              |  13 ++
 scripts/make_fit.py               | 291 ++++++++++++++++++++++++++++++
 7 files changed, 338 insertions(+), 3 deletions(-)
 create mode 100755 scripts/make_fit.py

-- 
2.43.0.rc2.451.g8631bc7472-goog


