Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5870308667
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Jan 2021 08:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbhA2H2O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Jan 2021 02:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbhA2H2N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jan 2021 02:28:13 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D6EC061573
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 23:27:33 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id u11so4751335plg.13
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 23:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XoPaMVURm5bRi8Ttr7dF9SUUqibbHGdovvNFGhRlDUo=;
        b=cpWA9C59QBUyKAMI1fRhLyF+pmGzsfi7Lqq+UcJ1wiW+DN78Ij91odl5ALsMoIEQBN
         hfVInKG9FSoCSU7kEYoaz8clgP7TPkHzxxla5l4hH9EjdbS2IpqAgHiD1BiACIU7uOsu
         EXnfYY76OsR405imsMbuKyi6wCszHklV73Eh59xzpHvq0HHOqU+ulLs4DUqSbj1VCI6u
         J3AV6cyG2haHBCFjx8cDTwiD6wAoo1sPFQCmnm+TYlvHoo5h8NHwo1ezdIFnKhn5O50Y
         JLSLhwD19LJ1zG50IWjRbDfjWFU6u2dgNG2gtOSG9FYGXodVOPAGdeB8lfOAgXdNJV4z
         b2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XoPaMVURm5bRi8Ttr7dF9SUUqibbHGdovvNFGhRlDUo=;
        b=BW0yVqOO2PRoaAWTqz2mTzzdDYj8BAky0g2/LwvZgOQlr1vwMgQejWNvygaGQVaX6o
         y6Qxjb6jlGz1+1b7S8tYSZattNOifHSmYagdGR/2OsqH/EPrilcA7MOBKO5E0u1M7pw4
         MlnL3Qq2BcRFLHd4C8ULVYKLQHFzGd7BRjGaUdC6RUu65Zp4NsmgaTd6kzFlcZ0eYm0P
         CkWb5nGypZ/YXd6EqTy1Ek795+4Zuj7rid5PaL5hvBavklLSEY5I3IAV+doIERlMR0Nw
         H//O5wt0yZUNxYKTGuuGt5Hnn0kXyCjeh7AtjrzJc6SlUB1fF9AK3we9n+Jk6pVyQBE5
         Y87A==
X-Gm-Message-State: AOAM531KU3Wp2rTXQuih6L0JcBm7yesEatWhJaDsBKPOAe74AbdrmTsC
        pd2CUVlf9Lv2UO6EFBzSIl/M4A==
X-Google-Smtp-Source: ABdhPJxQVczYesYyyM7xmUDHF+3eyNOatnNn3eWNoo/ReP2UIPnQ2bgnUxdxZMFMuLQof/NZpGs8zg==
X-Received: by 2002:a17:902:b40c:b029:df:e75a:711b with SMTP id x12-20020a170902b40cb02900dfe75a711bmr2944772plr.75.1611905252639;
        Thu, 28 Jan 2021 23:27:32 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id v16sm7559737pfu.76.2021.01.28.23.27.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jan 2021 23:27:31 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, anmar.oueja@linaro.org,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH V7 0/6] dt: build overlays
Date:   Fri, 29 Jan 2021 12:54:04 +0530
Message-Id: <cover.1611904394.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

This patchset makes necessary changes to the kernel to add support for
building overlays (%.dtbo) and the required fdtoverlay tool. This also
builds static_test.dtb using most of the existing overlay tests present
in drivers/of/unittest-data/ for better test coverage.

Note that in order for anyone to test this stuff, you need to manually
run the ./update-dtc-source.sh script once to fetch the necessary
changes from the external DTC project (i.e. fdtoverlay.c and this[1]
patch).

I have tested this patchset for static and runtime testing (on Hikey
board) and no issues were reported.

V7:
- Add a comment in scripts/dtc/Makefile
- Add Ack from Masahiro for patch 4/6.
- Drop word "merge" from commit log of 2/6.
- Split apply_static_overlay, static_test.dtb, and static_base.dts into
  two parts to handle overlay_base.dts and testcases.dts separately.

V6:
- Create separate rules for dtbo-s and separate entries in .gitignore in
  4/6 (Masahiro).
- A new file layout for handling all overlays for existing and new tests
  5/6 (Frank).
- Include overlay.dts as well now in 6/6 (Frank).

V5:

- Don't reuse DTC_SOURCE for fdtoverlay.c in patch 1/5 (Frank).

- Update .gitignore and scripts/Makefile.dtbinst, drop dtbo-y syntax and
  DTC_FLAGS += -@ in patch 4/5 (Masahiro).

- Remove the intermediate dtb, rename output to static_test.dtb, don't
  use overlay.dtb and overlay_base.dtb for static builds, improved
  layout/comments in Makefile for patch 5/5 (Frank).

--
Viresh

[1] https://github.com/dgibson/dtc/commit/163f0469bf2ed8b2fe5aa15bc796b93c70243ddc
[2] https://lore.kernel.org/lkml/74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com/

Viresh Kumar (6):
  scripts: dtc: Fetch fdtoverlay.c from external DTC project
  scripts: dtc: Build fdtoverlay tool
  scripts: dtc: Remove the unused fdtdump.c file
  kbuild: Add support to build overlays (%.dtbo)
  of: unittest: Create overlay_common.dtsi and testcases_common.dtsi
  of: unittest: Statically apply overlays using fdtoverlay

 .gitignore                                    |   1 +
 Makefile                                      |   5 +-
 drivers/of/unittest-data/Makefile             |  56 ++++++
 drivers/of/unittest-data/overlay_base.dts     |  90 +---------
 drivers/of/unittest-data/overlay_common.dtsi  |  91 ++++++++++
 drivers/of/unittest-data/static_base_1.dts    |   4 +
 drivers/of/unittest-data/static_base_2.dts    |   4 +
 drivers/of/unittest-data/testcases.dts        |  18 +-
 .../of/unittest-data/testcases_common.dtsi    |  19 ++
 .../of/unittest-data/tests-interrupts.dtsi    |   7 -
 scripts/Makefile.dtbinst                      |   3 +
 scripts/Makefile.lib                          |   5 +
 scripts/dtc/Makefile                          |   8 +-
 scripts/dtc/fdtdump.c                         | 163 ------------------
 scripts/dtc/update-dtc-source.sh              |   3 +-
 15 files changed, 204 insertions(+), 273 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
 create mode 100644 drivers/of/unittest-data/static_base_1.dts
 create mode 100644 drivers/of/unittest-data/static_base_2.dts
 create mode 100644 drivers/of/unittest-data/testcases_common.dtsi
 delete mode 100644 scripts/dtc/fdtdump.c


base-commit: 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04
-- 
2.25.0.rc1.19.g042ed3e048af

