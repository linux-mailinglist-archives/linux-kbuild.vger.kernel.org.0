Return-Path: <linux-kbuild+bounces-72-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E57F06FE
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 16:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0DD280CA6
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 15:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA0BE540;
	Sun, 19 Nov 2023 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KEzJhvN0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02738C2
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 07:02:34 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7a9857c14c5so131511839f.3
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 07:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700406153; x=1701010953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N51tl/zj6hx3y8C/i7pvWONxuVI4d2CkVjaNAa9KVfw=;
        b=KEzJhvN0vrEgKamwqdG9mDVInm4xSfTFPMFqyjZgwOisiumSyX8gix15ChoNUpIZJw
         DrtSJvpIScPxlikJbrLrSF8lipP4Tk5UXy7EwYvAZi4RDHiy8dAE90jxnZdK7HM1i9C8
         ydth7g3Joi5uMnmY81yhw8cIugvWy1p2GBjp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700406153; x=1701010953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N51tl/zj6hx3y8C/i7pvWONxuVI4d2CkVjaNAa9KVfw=;
        b=VWN6Qc/J/d4YUz91inmsMSB/EEDGG8YD/QDnLT6oPn2yhC07RfyvrdBLhwwq/+DK54
         2GDDNSTaDYnY+VyYgTjk6DgxQHq8vqgJMtxdx//fc7SslF0cPo3L7PzOW/MA2w03Ywyk
         90I0U4EDtpDCcDmA86zT4TxbPZMNndNUpuRsYBkhijnSaabMyq7dlehoTyBRlUVcwoCt
         6ieujGT8O03ACBLHABKSVGjnRTuGkRwoDj88oX83aailV2//UJ+GWmBfEcN+jCDyZcYy
         w7aCiFyXHgIvFTPJdzw9hD64nCaVAypF9ISOrFND1JfSxHSNv47t/Zhyeje0STuw8cCF
         rbeQ==
X-Gm-Message-State: AOJu0YyyrVIyXOiNKwWjdWDtHAD4j6OLxPzQAVYKZ1E7krS3XRWhEnnS
	Qlho8on94ZzQdGppLWBYd5nzUg==
X-Google-Smtp-Source: AGHT+IHKjO+9V/Ov2s/qDvhWacbsJZSlSMrqQojB8Glj0ndNWo7mxL+WGv1jtXPHhdXCO+WYlSj6Lg==
X-Received: by 2002:a6b:c505:0:b0:7b0:aee5:f9c2 with SMTP id v5-20020a6bc505000000b007b0aee5f9c2mr3285969iof.14.1700406153095;
        Sun, 19 Nov 2023 07:02:33 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id w24-20020a056638379800b004665bec29d1sm79923jal.128.2023.11.19.07.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 07:02:32 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] arm64: Add a build target for Flat Image Tree
Date: Sun, 19 Nov 2023 08:01:13 -0700
Message-ID: <20231119150229.634424-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
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
  kbuild: arm64: Add BOOT_TARGETS variable
  arm64: boot: Support Flat Image Tree

 MAINTAINERS                |   7 +
 arch/arm64/Makefile        |   7 +-
 arch/arm64/boot/.gitignore |   1 +
 arch/arm64/boot/Makefile   |   6 +-
 scripts/Makefile.lib       |  13 ++
 scripts/make_fit.py        | 289 +++++++++++++++++++++++++++++++++++++
 6 files changed, 321 insertions(+), 2 deletions(-)
 create mode 100755 scripts/make_fit.py

-- 
2.43.0.rc0.421.g78406f8d94-goog


