Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A797D7D92
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Oct 2023 09:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjJZH0l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Oct 2023 03:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjJZH0k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Oct 2023 03:26:40 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75982184
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Oct 2023 00:26:38 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bdf4752c3cso4153525ad.2
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Oct 2023 00:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698305198; x=1698909998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=crl60Str28pt651eqf4nmclTHVudykiY/eZ0krpY9aQ=;
        b=b4ogdCd3QD6WQGnED/7tM731vD17+bzFrUWgb2eoYgx4ug0MLbQZIe/JOswW3WVMiS
         SmZt1BK2rB9WXOqDjWc0U9kGGNTP17+nlA8D3YtzosAnKaUP76CNVbAQfg1NP0RZFgRf
         bjUm7Os9sdUv0iWWY+NXphIbA9i2y1+zM8riU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698305198; x=1698909998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crl60Str28pt651eqf4nmclTHVudykiY/eZ0krpY9aQ=;
        b=EdMfFaKxRSzGR7kP1LA12577ObZK8gU7YyFgamSM9umoy8K2v655NY645bMu1gbAi9
         gA/Cu7YCYli9lzZ/PkOESNmbTktvnScoKzg+WEaOr6xe1I9a1PmfnTyQjjrErmIOJ3km
         IgqzXhADV1moSI/gQLxbKTRBEX8bG+UgB01JfJJyubZFQiAWaVpPdwwanG89XE6pJypk
         lhSVR1p2QXR8LGhwDORjyoTOKNj/6EQSHxM14+uQcAUfA17q/5kXnw3g9v5wZ+ybG8rh
         C935Cj0uUbERVNy9SnwNGgruwFgo1CTWgXkjdBm/jJpYKTYtFLtobheUEz4LFHOq5qKi
         iGKQ==
X-Gm-Message-State: AOJu0YzCFXHRDB2ZgPxTbY1hVXe/vZ+J6cpA/iL94xkOjFeBxXBH605Q
        oTX7T6WY3BSxB3WORXpXvr35aQ==
X-Google-Smtp-Source: AGHT+IFAdvhaKLgojDavPL6jfCwALsYDKQgHxk5a0vAeNPu/TcvJvklixGPP43czx011qTe2l4IkQA==
X-Received: by 2002:a17:902:da92:b0:1c7:4f87:3dbe with SMTP id j18-20020a170902da9200b001c74f873dbemr17779216plx.31.1698305197884;
        Thu, 26 Oct 2023 00:26:37 -0700 (PDT)
Received: from sjg1.roam.corp.google.com ([202.144.206.130])
        by smtp.gmail.com with ESMTPSA id n17-20020a170902e55100b001b7cbc5871csm10294023plf.53.2023.10.26.00.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 00:26:37 -0700 (PDT)
From:   Simon Glass <sjg@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        Simon Glass <sjg@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: Add a build target for Flat Image Tree
Date:   Thu, 26 Oct 2023 20:26:22 +1300
Message-ID: <20231026072628.4115527-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Flat Image Tree (FIT) is a widely used file format for packaging a
kernel and associated devicetree files. This series adds support for
building a FIT as part of the kernel build. This makes it easy to try
out the kernel - just load the FIT onto your tftp server and it will
run automatically on any supported arm64 board.

The script is written in Python, since it is easy to build a FIT using
the Python libfdt bindings. For now, no attempt is made to compress
files in parallel, so build the 900-odd files takes a while, about
6 seconds with my testing.

The series also includes a few minor clean-up patches.


Simon Glass (3):
  kbuild: Correct missing architecture-specific hyphens
  kbuild: arm64: Add BOOT_TARGETS variable
  arm64: boot: Support Flat Image Tree

 MAINTAINERS              |   7 +
 Makefile                 |  10 +-
 arch/arm64/Makefile      |   7 +-
 arch/arm64/boot/Makefile |   8 +-
 scripts/Makefile.lib     |  16 ++-
 scripts/make_fit.py      | 285 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 324 insertions(+), 9 deletions(-)
 create mode 100755 scripts/make_fit.py

-- 
2.42.0.758.gaed0368e0e-goog

