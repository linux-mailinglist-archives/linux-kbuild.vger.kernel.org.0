Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7103E333568
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 06:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhCJFgA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 00:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhCJFfi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 00:35:38 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2C2C061760
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Mar 2021 21:35:38 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id t18so941278pjs.3
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Mar 2021 21:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nRnrFT1YqPUDIU197TcM7AC/4HppNFNzx22dG+q8QeY=;
        b=S4VdKYpUiEI+r7VKqKpEIKrURY7IxhIHX49wiiI/D+uaGx/cbdk0XsI4UPYb7Ck44J
         0AmNBZwOLQtaeTisMvie9M7XprhLsWDG4o4qRo+7SXfzfrJPczvbPuShCeJC4eIFPYQY
         ssGitZ9l6VbhUE+wrtGqIxNBNwaFHUp3/IEt4n3Xxq8kKKzYiX6cw7CAC1696+Y0yCsX
         VK+Kuzy9lLXsj/RFQ6hT6kCqIiLf00lLnzT373XuI+/PT0plB0sq2XwgZLZeFrxcr5Us
         x1V9XcyytmikZ4g/arR6TDg1ba5e9bDgaXuDNwg1bOVap8zCwZJ9Xift/CqCv7vTbM3d
         LBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nRnrFT1YqPUDIU197TcM7AC/4HppNFNzx22dG+q8QeY=;
        b=OpunlPuc0RqFq3QxFekd/6mlHHlBvpmoxI94/UtQ7I02zw/D3O8zVAPh7RHuCiI61p
         p50mFzWkWBR9giHS4GMmSHQpp7cG6yfmJRxqtNfnRlyXgOSqyjQw9WTgiTIYWJmu6ngQ
         7cHyGVhRQCAQAHBSsFjYQay2oArx4IyLbKuzL+ziNFbsJWDPV/qzzK8myVeorRuob94z
         tJadYFbPRHO+krKB9uvkCXorE0C0QcA5lbqJdAbBq2XS1W9GM2FmGXtcoQRaqEnzhBji
         BVl+FENwYTV2NFwKKm4Mg/XaeVZ0uwfGC9CucLv63d2yvQ5PitVj+kNmS2ipTQh2rur7
         Qbew==
X-Gm-Message-State: AOAM530ynIrcqEkBztveTLNhBrtO4f9wSYDw0V7w5QwoGxaEI0jfNB8D
        p7znEKFa3Cimw/MJB8R9j0OCcw==
X-Google-Smtp-Source: ABdhPJxaA9sNCrS37RO5bNLy2bEQyB2nnUJokHcvSh+MgOHyipJEzMpGtjUWe2GPsSUGgeyiwpkeWg==
X-Received: by 2002:a17:90b:f15:: with SMTP id br21mr1777298pjb.234.1615354538081;
        Tue, 09 Mar 2021 21:35:38 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id f19sm15222229pgl.49.2021.03.09.21.35.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 21:35:37 -0800 (PST)
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
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH V11 0/5] dt: Add fdtoverlay rule and statically build unittest
Date:   Wed, 10 Mar 2021 11:05:28 +0530
Message-Id: <cover.1615354376.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

This patchset adds a generic rule for applying overlays using fdtoverlay
tool and then updates unittests to get built statically using the same.

V10->V11:
- Update patch 4/5 to fix checkpatch warning on spaces and tabs.
- Added Acked-by from Masahiro for patch 2/5.

V9->V10:
- Add a new patch to allow .dtso files.
- Update 2/5 to be more efficient and also generate symbols for base
  files automatically.
- No need to add lines like DTC_FLAGS_foo_base += -@ in patch 5/5.
- Add Ack by Masahiro for 1/5.

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

Viresh Kumar (4):
  kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
  kbuild: Allow .dtso format for overlay source files
  of: unittest: Create overlay_common.dtsi and testcases_common.dtsi
  of: unittest: Statically apply overlays using fdtoverlay

 drivers/of/unittest-data/Makefile             | 48 ++++++++++
 drivers/of/unittest-data/overlay_base.dts     | 90 +-----------------
 drivers/of/unittest-data/overlay_common.dtsi  | 91 +++++++++++++++++++
 drivers/of/unittest-data/static_base_1.dts    |  4 +
 drivers/of/unittest-data/static_base_2.dts    |  4 +
 drivers/of/unittest-data/testcases.dts        | 23 ++---
 .../of/unittest-data/testcases_common.dtsi    | 19 ++++
 .../of/unittest-data/tests-interrupts.dtsi    | 11 +--
 scripts/Makefile.lib                          | 40 ++++++--
 9 files changed, 218 insertions(+), 112 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
 create mode 100644 drivers/of/unittest-data/static_base_1.dts
 create mode 100644 drivers/of/unittest-data/static_base_2.dts
 create mode 100644 drivers/of/unittest-data/testcases_common.dtsi


base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
-- 
2.25.0.rc1.19.g042ed3e048af

