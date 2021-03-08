Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A23330B8F
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Mar 2021 11:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbhCHKpd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Mar 2021 05:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbhCHKpS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Mar 2021 05:45:18 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F6DC061760
        for <linux-kbuild@vger.kernel.org>; Mon,  8 Mar 2021 02:45:18 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so2884187pjb.2
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Mar 2021 02:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/pTyVDjFKopMOn0gnz6T1wmQQU1rKBs2MJpuJdbdZfM=;
        b=kf3VuOaLkdhglu2lUqKc/d6Gi6P0vyrrE5mBCnW5RAitA2v8amHMv79uhQDzV3aU5K
         T+I1EjnIY7iU488Wjhctl0EVuBAYEUJeYQXQE7q7D8FjvTnnLyJijip4fh3EIvHU3Q4/
         2oXJCOboDdDqtvZgHC0UDzI/GTJv0l9wjMrFI76lwD9wMtRA+zJJPVWTMYI5Jssu4OuH
         tBC8AqmbF5X99AHRw74R6hDOHYKjZkLsq1swGnDkUhOlXoOShHC8CzHu3t9TPhWZglTg
         dgh70MPI65Nt6Fuq1rw0bYd/QkTzy+nt8wBuxuPENwzknJgZh1/8exECqV1PGmC1N5zm
         SrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/pTyVDjFKopMOn0gnz6T1wmQQU1rKBs2MJpuJdbdZfM=;
        b=Hr/twrK/Dgi88PuSt0R2aQw2qQ8h1HWJ1HQfKZttUYNzrJrIPd62E9FHiyHNBrNmYO
         QCThPxhVrHaVXL4uEXATtP00FXdN+5DnhBrIV6wZ2THG5g48FyLkMNoE8rp3CHGby2IH
         X3LjdEcY/abQj0xc1zmLv0wOyyRbegWLVRUxqpziPt3BaosZMjI5VL26xI0HLrdWe/4u
         7eYFgS5ynl6NssRoltARrSY2C8iQfthhbXVKgmY3DihnnSszcd3b9N1GoytbjIYqWwRX
         IXC2ZM30XPWGDsrqv/oMs/tCKY0P+3j09Zffs2HWgZn97rm2Bo2kkHlj96Sii7IYq88o
         q63w==
X-Gm-Message-State: AOAM532h/PTYceKsfRXz4cMcYX3urFAUhTCAgWEbEKS1MdIs6VYsGwf6
        6Vpf3hYUbzrcVfl4+nzGu3YW4Q==
X-Google-Smtp-Source: ABdhPJz/yarSkPHujAzGLux3X7UyzxPhdN0NzvnvRgjysu/7yoM4sDhcPaMytblnNe0y7I3PfnnVbA==
X-Received: by 2002:a17:902:ed0a:b029:e4:3589:e4f9 with SMTP id b10-20020a170902ed0ab02900e43589e4f9mr20700124pld.36.1615200317978;
        Mon, 08 Mar 2021 02:45:17 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id e63sm1528619pfe.208.2021.03.08.02.45.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 02:45:16 -0800 (PST)
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
Subject: [PATCH V10 0/5] dt: Add fdtoverlay rule and statically build unittest
Date:   Mon,  8 Mar 2021 16:15:05 +0530
Message-Id: <cover.1615199908.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

This patchset adds a generic rule for applying overlays using fdtoverlay
tool and then updates unittests to get built statically using the same.

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

