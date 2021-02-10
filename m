Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813133164DD
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Feb 2021 12:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhBJLPo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Feb 2021 06:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhBJLOU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Feb 2021 06:14:20 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B40C061786
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Feb 2021 03:13:39 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id u15so1036954plf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Feb 2021 03:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gwtfzan5OujNTY4a0AKY/xvxM1yAX3PRPFXQBcIR6P4=;
        b=IU90nRwAeBYYGyZkWYotPk+ZSKt5w+cUcF7mh913RpbRX511aCDkFiXaVjvDN2TpG7
         fI8G4oMFlLGEGvVZ2SwqIY4pl2x/02c5AKL1iWzCMpwIaCZXs7Q+viXKYB4FY/zaAL6t
         G2IE3LMFIiKovpjLq2ewgnYDYa85JhRbimvkg4B9FjIDzrkZfO6a3BgSe/cVLRMp+jud
         Lt+N1EipxpI9sTxVomNj7+dwpAxpDgN5Dyi3xf+tBTfaUlh9yHceB8alOE90qapLBaxf
         F4ggh89ein2sua2WTDXDxstLfSPduxneqb0aiD4kdhXhMMmDoIsHV4285prTFI0zFToc
         71Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gwtfzan5OujNTY4a0AKY/xvxM1yAX3PRPFXQBcIR6P4=;
        b=N+IMoSgI5pZn9ZhO7mnC5Lm0U+eacBJI15aWJLAbNQqHjjtWMQeYKHHRyZPhG6HiUq
         SF2Hcpj+NgwV6gqx1rV2b9Y3/7x2GyMEZH2cL2SZlTv9ccAbUlZLjKWdEiB3zQ8ZEexB
         qZsTiOZNDXLjD/4xL/ulG+PTJe2dLPN5tP2+jAqqAUlAsHZ2pl+f8ytnSNPAu0Pwvxxf
         fEtT4EAfmPLIbQP7xsGXkNn468J/uwreZgHzQiQhv6seNaCEE/T4YbM46o6HY3g3YidL
         bQMiYKsCtQxgWSilNislqlLJrYgNJ22/b08NLyAXxpvSUB/lb4JsNMb0Gcn7yrRvE6j1
         khDw==
X-Gm-Message-State: AOAM533mLeUHD0DNetnYP6wnafwedDmwotNC3CiPLRjzjJxSZ11hXAZu
        qFnhmUVL6PSV/iVuntjvv4n+xA==
X-Google-Smtp-Source: ABdhPJwLv60t3YqHGu67xdMHSUO7XONNUEZPH5mofBLybO24/0jjKMpwpQReYFgV/mgBkFiHxUKefg==
X-Received: by 2002:a17:902:9009:b029:dc:52a6:575 with SMTP id a9-20020a1709029009b02900dc52a60575mr2375968plp.57.1612955619345;
        Wed, 10 Feb 2021 03:13:39 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id bo1sm1929911pjb.7.2021.02.10.03.13.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Feb 2021 03:13:38 -0800 (PST)
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
Subject: [PATCH V7 0/3] dt: Build unittests statically with fdtoverlay
Date:   Wed, 10 Feb 2021 16:43:27 +0530
Message-Id: <cover.1612955268.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

The first four patches from the previous patchset are already picked by
Rob for 5.12. This patchset contains the other two that update unittests
and an additional patch suggested by Rob.

V6->V7:
- Dropped the first 4 patches, already merged.
- Patch 1/3 is new, suggested by Rob and slightly modified by me.
- Adapt Patch 3/3 to the new rule and name the overlay dtbs as .dtbo.

--
Viresh

Rob Herring (1):
  kbuild: Add generic rule to apply fdtoverlay

Viresh Kumar (2):
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
 scripts/Makefile.lib                          | 39 +++++---
 9 files changed, 203 insertions(+), 119 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
 create mode 100644 drivers/of/unittest-data/static_base_1.dts
 create mode 100644 drivers/of/unittest-data/static_base_2.dts
 create mode 100644 drivers/of/unittest-data/testcases_common.dtsi

-- 
2.25.0.rc1.19.g042ed3e048af

