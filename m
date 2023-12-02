Return-Path: <linux-kbuild+bounces-233-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC5B801A50
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Dec 2023 04:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7B7CB20F4C
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Dec 2023 03:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBB58BFB;
	Sat,  2 Dec 2023 03:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HPSYutuD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AACD10C2
	for <linux-kbuild@vger.kernel.org>; Fri,  1 Dec 2023 19:55:24 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6cb749044a2so2917831b3a.0
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Dec 2023 19:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701489324; x=1702094124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nagqp0QINZEQDYIsDAmXj4OVh5WUG+529LOayf8ho24=;
        b=HPSYutuDqeOfz6M2IKDuhm9aqtQW0sFHtewuPHe1Tm//oQOCxVEXE9uQl5WkuScfui
         UK7vkHG/OemvWnhHcZBAR5/qXM3QgONq9KJk9j+LrVzRBbjoSHgHmdfbWNsqoF8yIwcJ
         4imI4gZa5QmlBuYevgFkiQJzG1JwdW79IoFKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701489324; x=1702094124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nagqp0QINZEQDYIsDAmXj4OVh5WUG+529LOayf8ho24=;
        b=dt1JV4s15gvU3awrN5n0zi1GU0y0jhQd8ECevcreXKLMaFuns0RUDRR6fHjCr0c0Kl
         Fm2wHARvIKCbNK9LgL1gDpRzpW8OJBTFmLfnePRF0nJlbl7/oCum2J7xLM99rN2V/Qfl
         fZza7ygItx/HqbPUGfP9VHwtG4o2e0D+skmldJFuYyZachRKM4lGQjsrkQOVfPbLKu1H
         JX+6z0vjRR9mvHpJt55zWTWs91MIG3WIqyjYffiCK6kz4EJCX6C2TPME3Yat6QeuAwFm
         eT51G9dxefQRtUOuFLkeUEGf5W60MNp2andcEglVtUfyqgXtTrgMLa0Px6Fshlce8S+l
         JC7A==
X-Gm-Message-State: AOJu0YzAS8h3FOZUmtquvnKGnHFq+ZxufPyc7rzrjTkMN5pWyMJqQVPv
	HVkK4pWemhQ2A6M48itdhCvtSw==
X-Google-Smtp-Source: AGHT+IHknJk9EJeTCI+YGHGGAESdUt1vn2NNWbC28hZ2Kj/CzojYjDIpyW5vNlBm0dNz1t8I64kaug==
X-Received: by 2002:a05:6a20:54a3:b0:18b:8158:86ea with SMTP id i35-20020a056a2054a300b0018b815886eamr754283pzk.10.1701489323714;
        Fri, 01 Dec 2023 19:55:23 -0800 (PST)
Received: from sjg1.roam.corp.google.com ([202.144.206.254])
        by smtp.gmail.com with ESMTPSA id t7-20020a62d147000000b006cb60b188bdsm3866565pfl.196.2023.12.01.19.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 19:55:23 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
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
Subject: [PATCH v9 0/2] arm64: Add a build target for Flat Image Tree
Date: Fri,  1 Dec 2023 20:54:40 -0700
Message-ID: <20231202035511.487946-1-sjg@chromium.org>
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
 scripts/make_fit.py               | 291 ++++++++++++++++++++++++++++++
 7 files changed, 338 insertions(+), 3 deletions(-)
 create mode 100755 scripts/make_fit.py

-- 
2.43.0.rc2.451.g8631bc7472-goog


