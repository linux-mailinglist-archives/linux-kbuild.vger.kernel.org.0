Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF71319D39
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 12:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhBLLTa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Feb 2021 06:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbhBLLTZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Feb 2021 06:19:25 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A5FC061786
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Feb 2021 03:18:45 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id j12so5605339pfj.12
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Feb 2021 03:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DiH+0nsh0TFSeG09Dd5i67FW61zv+WlXR+4na8usw8M=;
        b=dstpR3OZccsYNKmvZ/hTIXfK8fOejY/E98zi84c90kxjsQ7EBLijoTbCmTkCmuIBbF
         X+GGSytGTFlSjU9UuYEaOx6sj8/sNka6gT7pjs0ik1gb1G4WQrFnc2cwFTLlGm4knwUf
         iCowTv+Qqv7XL1zF9ewVIiSGF/HehKlmYlUbn69m7gMmfYqD5lj8KfXZY4msYJ4YA9jl
         cP1/8j0xXtGmG1/siNeOUXeW8pSi3cZ6cFzrdv7/4XVBaqUpKs/VVx86hckfpPMcW6Q/
         q78C7ZQNUYupCAIzhGcEF9cKSVFEMlruom/bQNjKl40UrAaCN9OToOg80gfWrc0k/GvU
         c1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DiH+0nsh0TFSeG09Dd5i67FW61zv+WlXR+4na8usw8M=;
        b=oe095dfZqkiYF+C5LSZc3H/XCV/fAB5H41ns/2a+OW+gUix5nVBCNokc7NI1uGTaVb
         LrBau81vgOYYnB24tzM1ZKnP6lBXJ4BVxBsIhB4sLYfmp5N4JErDufrhjoq3avxm7ZPz
         2rijvTVfI+pu+PE/8WQkNK2VUCAysOC67fWCrt5klnPSBvUKGFnpMxX7ao6usthKv/+6
         0hFBE+8OX13rYSO06nf9g54FHarmhTJFmwDQGbG92jGeDmK5iaj7ZutWGEgfmQtgR7yZ
         qQfEcfXn50YPdMimbxvwtUraOesHxOfTOl7Lr22nQQBXoHJeqa8VpNlmTSDOnKc2OnIB
         MYqA==
X-Gm-Message-State: AOAM533u0q8E3xL3LlRItmQO9wu8JntjFzi9utGCe6/tJ4d9LdJQ0E95
        Fqre8fjwqG+O79e2jwimjjpqPQ==
X-Google-Smtp-Source: ABdhPJxRLdhA24PIbVGs7N1vm0OoG/+dEpN8+1SGQg64ZwDg/XUKglrx192K9Y5V03Z2d7uBWUdIKA==
X-Received: by 2002:a62:1bc9:0:b029:1e6:3492:2d88 with SMTP id b192-20020a621bc90000b02901e634922d88mr2540051pfb.72.1613128724860;
        Fri, 12 Feb 2021 03:18:44 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id v31sm9092762pgl.76.2021.02.12.03.18.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2021 03:18:44 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH V8 0/4] dt: Add fdtoverlay rule and statically build unittest
Date:   Fri, 12 Feb 2021 16:48:34 +0530
Message-Id: <cover.1613127681.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

This patchset adds a generic rule for applying overlays using fdtoverlay
tool and then updates unittests to get built statically using the same.

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
 drivers/of/unittest-data/testcases.dts        | 18 ++--
 .../of/unittest-data/testcases_common.dtsi    | 19 ++++
 .../of/unittest-data/tests-interrupts.dtsi    |  7 --
 scripts/Makefile.lib                          | 29 +++++-
 9 files changed, 200 insertions(+), 112 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
 create mode 100644 drivers/of/unittest-data/static_base_1.dts
 create mode 100644 drivers/of/unittest-data/static_base_2.dts
 create mode 100644 drivers/of/unittest-data/testcases_common.dtsi

-- 
2.25.0.rc1.19.g042ed3e048af

