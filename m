Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98AB47E4212
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Nov 2023 15:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbjKGOt1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Nov 2023 09:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjKGOt0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2023 09:49:26 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B90101
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Nov 2023 06:49:23 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7a66aa8ebb7so233334839f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2023 06:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699368563; x=1699973363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGdhwZC1aoWv4hm325gNK3bTc4NhbyLb0VzfJImw0Uw=;
        b=IVnuJ4CNTqYJhb0nPDjbKLEq5xIz8X+BWoLSOxuj2LhiAF+m6JKIe3EyF2rM9qjUkj
         Xj01ekrwxTLHPmlsRvkq/l72d0tIAvzp0ShUy/Sf2eiDc5iqSrbmUkxJbZ0e4XD31+QF
         u/x8/mmPokz7GOInxcOppgB4pG4W5u9ja0hos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699368563; x=1699973363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGdhwZC1aoWv4hm325gNK3bTc4NhbyLb0VzfJImw0Uw=;
        b=t3IQ6jLURknx6wXoiv7i2wjESdhNFByCBGhvbcPE0nGyVJu5Ly2r2gyJk+IkZz9JZq
         woHs8VSOIhsXXEKk62fDD5GAVYSvUZw2OFJ2/egd/yw/lMzSb03y7ul3Ad0h2ElYRrnb
         +wDQKtq+OEHqP8gBbahyjEaqVvE3R63eh1Vxc4GnK2DwDVFLcbPEtptSsgDBxSdvi+aB
         0LXGkzgS7UApP/g+3XJ9ObaEmIf0IrhAe1TpzA1FcYCgVxw3Lj0lIMpuEGNe47+Mnlfz
         SV4BrqhFqtTvlJBQvEzx60pc7u5dlntMTNN4PadDNrPxN7t0hwuiM6uuoFFDbQO9+sDc
         l/bQ==
X-Gm-Message-State: AOJu0Yw2qOD0NMzhFH/Q48+MPDX9WJhbXhs0NRuajk+NWsR1C19vT2m/
        yY/aE6HgdVf/4pV+c1XFZPtgdg==
X-Google-Smtp-Source: AGHT+IFbWYxmCVLOPBkIKdca7xRPNMPu+WV7uYSe3XtBCvnGL0pLnyu5kmk3VGVXfipxrEiR5YJiqQ==
X-Received: by 2002:a05:6602:29cf:b0:7a9:509c:961 with SMTP id z15-20020a05660229cf00b007a9509c0961mr36574184ioq.13.1699368562862;
        Tue, 07 Nov 2023 06:49:22 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id b16-20020a05663801b000b0045a66a26208sm2815200jaq.128.2023.11.07.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 06:49:22 -0800 (PST)
From:   Simon Glass <sjg@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        Tom Rini <trini@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Simon Glass <sjg@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] arm64: Add a build target for Flat Image Tree
Date:   Tue,  7 Nov 2023 07:48:48 -0700
Message-ID: <20231107144917.48304-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

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

Changes in v4:
- Add a patch to move the single quotes for image name
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

Simon Glass (3):
  kbuild: arm64: Add BOOT_TARGETS variable
  arm: boot: Move the single quotes for image name
  arm64: boot: Support Flat Image Tree

 MAINTAINERS                |   7 +
 arch/arm64/Makefile        |   7 +-
 arch/arm64/boot/.gitignore |   1 +
 arch/arm64/boot/Makefile   |   6 +-
 scripts/Makefile.lib       |  20 ++-
 scripts/make_fit.py        | 289 +++++++++++++++++++++++++++++++++++++
 6 files changed, 326 insertions(+), 4 deletions(-)
 create mode 100755 scripts/make_fit.py

-- 
2.42.0.869.gea05f2083d-goog

