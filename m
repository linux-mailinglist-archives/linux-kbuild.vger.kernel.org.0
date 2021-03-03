Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F58F32C1D6
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351349AbhCCT2v (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350532AbhCCEqO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 23:46:14 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A653C0617AA
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Mar 2021 20:36:33 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id p21so15391927pgl.12
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Mar 2021 20:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+K+JVsQKi7Mi6myrR3iz/PWgj0Awrh+5TFM40EBt8aY=;
        b=M5+mLUF5aSMVrz5Uiw8Zit0bKYxSc1fkgnLsFbYga2jGJJuQ02RiXfOY5vCccAKxgx
         M19F8JwGyK62peIgmtye78cbK1nLh6cWGD6epC0B8TvecV8mdWVSAD+HVf5CUKTLXYKy
         9B6MPonsDGw5gG4FFbO55y1nXkYpuX9uCh7JBKQwewT+QgUuHCj+VEN5YzWVkBj6K+Ij
         Zmz8OsTiKNdKQK5C4xBKSM/XRVnzPclfFqrMBnlXddvLxaPBGxy3X3dbc5Sfv10Z7O51
         pNP3nERW6krWBQL6P5ioH5/I509foVdJkC7CFSQhlvQ15DjAcW6Pgu3w+pb+l4useM9m
         qAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+K+JVsQKi7Mi6myrR3iz/PWgj0Awrh+5TFM40EBt8aY=;
        b=cRJJCAMe4wfSIGN0mLse+6GSFwGsNkaoYcSECIxZsWZM/T6fkQLSVikdb3x5MD5M37
         TJVaLjc7JdmtQ70dCJdvmOfs/tgTZk6eijUPxo19UUTqzNjPIlQmsiwIHIc9ipLFcEh/
         EKDyUNr6OZyxBFtpfJZFv5FBybyos69ZPJ/O7FeR938D4JXOTnTdtqynLdvpYL4AX482
         1xP8hRp8MIUtAZMaITJ4zc/2WKnaMF09EFCJK7pxnIdLNWQaBMZuSfUkY5S+JOCDAjNZ
         Fvybpg2MN4ut0Y/Seh4ZnOJssYeAcOjtJZ/jyJ5CPZh+0uJc9TUtubLAdMS3Hc2zU/i7
         yybQ==
X-Gm-Message-State: AOAM532QN6bEk0aoxHptXClhQZWGpY/0N9gBB9GRu8K1iPjG+JWZa5aN
        dtkEN0r1A1gZP59OG37OCN3JHA==
X-Google-Smtp-Source: ABdhPJwrFPTNFRhjHYLXGgAwPqdMGH/7/1mgirrESsjd3vWRq2aphgmsj6phJmEMtXRM25zfBp72DA==
X-Received: by 2002:a65:480c:: with SMTP id h12mr21020612pgs.169.1614746193045;
        Tue, 02 Mar 2021 20:36:33 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id x9sm5004567pjp.29.2021.03.02.20.36.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Mar 2021 20:36:32 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH V9 0/4] dt: Add fdtoverlay rule and statically build unittest
Date:   Wed,  3 Mar 2021 10:06:16 +0530
Message-Id: <cover.1614745266.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

This patchset adds a generic rule for applying overlays using fdtoverlay
tool and then updates unittests to get built statically using the same.

V8->V9:
- Added some comment in patch 3/4 based on Frank's suggestions.

V7->V8:
- Patch 1 is new.
- Platforms need to use dtb-y += foo.dtb instead of overlay-y +=
  foo.dtb.
- Use multi_depend instead of .SECONDEXPANSION.
- Use dtb-y for unittest instead of overlay-y.
- Rename the commented dtb filess in unittest Makefile as .dtbo.
- Improved Makefile code (I am learning a lot every day :)

V6->V7:
- Dropped the first 4 patches, already merged.
- Patch 1/3 is new, suggested by Rob and slightly modified by me.
- Adapt Patch 3/3 to the new rule and name the overlay dtbs as .dtbo.

--
Viresh

Rob Herring (1):
  kbuild: Add generic rule to apply fdtoverlay

Viresh Kumar (3):
  kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
  of: unittest: Create overlay_common.dtsi and testcases_common.dtsi
  of: unittest: Statically apply overlays using fdtoverlay

 drivers/of/unittest-data/Makefile             | 50 ++++++++++
 drivers/of/unittest-data/overlay_base.dts     | 90 +-----------------
 drivers/of/unittest-data/overlay_common.dtsi  | 91 +++++++++++++++++++
 drivers/of/unittest-data/static_base_1.dts    |  4 +
 drivers/of/unittest-data/static_base_2.dts    |  4 +
 drivers/of/unittest-data/testcases.dts        | 23 ++---
 .../of/unittest-data/testcases_common.dtsi    | 19 ++++
 .../of/unittest-data/tests-interrupts.dtsi    | 11 +--
 scripts/Makefile.lib                          | 29 +++++-
 9 files changed, 210 insertions(+), 111 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
 create mode 100644 drivers/of/unittest-data/static_base_1.dts
 create mode 100644 drivers/of/unittest-data/static_base_2.dts
 create mode 100644 drivers/of/unittest-data/testcases_common.dtsi


base-commit: fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8
-- 
2.25.0.rc1.19.g042ed3e048af

