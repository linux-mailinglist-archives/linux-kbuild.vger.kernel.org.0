Return-Path: <linux-kbuild+bounces-192-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED17FDE3A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 18:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82EDE282781
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 17:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F7638F91;
	Wed, 29 Nov 2023 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OSOyCY5P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6C0111
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 09:22:48 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-35ca48d48d6so2979565ab.0
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 09:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701278568; x=1701883368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmMU4E/b+uSxcWr7/YV1tz9g4DZ7LEAYA6oOOjTn5rY=;
        b=OSOyCY5PTnD9nka1J7K7FbnbTgHQNbJPJRVEJygwmvVTLR11rIB9FVTzQUc7ein4MP
         /RMZkKMn6A4l4Bbu6FLAuIABOZdFJvq5FnhqreqWQOR4CdUPdTS4D8moX5OUmE10dbig
         GqBtzMCvvXOnvzq/oKrNUkanKYcqNMTZyu0iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701278568; x=1701883368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmMU4E/b+uSxcWr7/YV1tz9g4DZ7LEAYA6oOOjTn5rY=;
        b=w7YhJh4fPeICBIlW/Yv7MQVWgxTABO7rGBoN2ejYiddiml6y7fsaS8jVg12EIw6K9B
         rOq7hYbR4OmSepgC3mYHQ/JBbjZ93RsnCjilkj2U/txZPvdG4d85Ho0zjm9p9R2L/Ogk
         1yqakZV4yW58f7WEbIhUmcP57KGr9dHtvF5zheI+8fDLldC8J9SwSKEd7wo1+KqRGxXz
         5QA0BC51dErQZrO3Bz/vtdLOzEXhuZQK0j5rAKPeXOlrVuLLCghFhERf7ih0eR1bAj5l
         AIHoks4lia9ezkebVAVEGJ4Vxj9bQ9ZVVjDpJk6bJ0PVeZmLZw7NWuqB9wvJxFbTS/fn
         DZCA==
X-Gm-Message-State: AOJu0YxS5TghE0cw2cv0vbUWW6Lsse4ZUiusP3yB71xiQT0eDh2rVLqb
	Vqu43G4gTovibwNWxvCF386CIeJnNPAaxsWI19Y=
X-Google-Smtp-Source: AGHT+IGBxziXrcPo8J6ti14stg5UnqZ33EBytnwprKYBbSzdEFUFDixLcVYV2vqJhDc547Ifaf7fVQ==
X-Received: by 2002:a05:6e02:1c88:b0:35c:c82c:c79c with SMTP id w8-20020a056e021c8800b0035cc82cc79cmr9781849ill.7.1701278567855;
        Wed, 29 Nov 2023 09:22:47 -0800 (PST)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:f4fd:5056:45a8:b749])
        by smtp.gmail.com with ESMTPSA id di5-20020a056e021f8500b0035d2fc4ce47sm471212ilb.9.2023.11.29.09.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 09:22:47 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	lkml <linux-kernel@vger.kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Simon Glass <sjg@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v7 0/2] arm64: Add a build target for Flat Image Tree
Date: Wed, 29 Nov 2023 10:21:51 -0700
Message-ID: <20231129172200.430674-1-sjg@chromium.org>
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

 MAINTAINERS                |   7 +
 arch/arm64/Makefile        |  13 +-
 arch/arm64/boot/.gitignore |   1 +
 arch/arm64/boot/Makefile   |   6 +-
 scripts/Makefile.lib       |  13 ++
 scripts/make_fit.py        | 289 +++++++++++++++++++++++++++++++++++++
 6 files changed, 326 insertions(+), 3 deletions(-)
 create mode 100755 scripts/make_fit.py

-- 
2.43.0.rc2.451.g8631bc7472-goog


