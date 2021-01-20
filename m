Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5A32FCB43
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 08:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbhATHIX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 02:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbhATHIU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 02:08:20 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240B4C061757
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 23:07:40 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id o20so5522930pfu.0
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 23:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9smo0xuaPm7gfHG1uvtUQgG4c1Mt5zbBVDBw98pRJd0=;
        b=XzW+00TuT50HE4l265/PY4mooymj9tShL6kJ4Y59thj3dfuUohyGcUAs3VTwDS+cmW
         45h64uIwLytvu890QRFBxqB9u73d1fO51lXdodCWzm45ATnQEcT1wvfo0XT1oChLQRhU
         E4QvgIATATDVQk9fF9J/uBxCVgdpLJSyYbMiwL3xpNzGncOORVR+4NWFO44BMv7/A+LR
         qhlB7RIvUyy6ZWmt+xDA6zlYXOh0yhg46EP/puldooroBUpy+PnceCTtPw5G+QG+cb1y
         xH76S6OKFQgc12glvV+95vm7h8pwNMuyfMoqsjydjrrmhWfW8Fz0QOULJ16wVkSOiC9E
         nEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9smo0xuaPm7gfHG1uvtUQgG4c1Mt5zbBVDBw98pRJd0=;
        b=i41L3ixDY4kPYcceH2+aCUzNpcIaBcqsQ0xzUip5qAT10Sv9icg6jeD9ER+Z8kvrHC
         jTXSBwrceGPHen3MV+XDAQF0i/DJS4Qxd3fkVlqDnUxs+rJQL7zYBJ1LNQ3b+nC0ikL8
         Sp04ygEtMw2LG8ia9MIaLSH43pHZu9Y01Whfw8/wNXNVVom8jXx6ojsj1ZnsnGzZgUBs
         NkxiX6sJOoQLUeOg9dzZlR2pF3vF9yNsxDi8ZVGq7kVIq2dTUBgTMjJ915xvg2CsxzY2
         AlFOnQNz5CXlcMDky/XJQlWd+0AP8FnK8GQ2iU8G6ZEKRdBfaC7oNNAzWYpNp1+47+G+
         v6IQ==
X-Gm-Message-State: AOAM531hazbx0pWHLj+6Ra5U8+ZYY248idbWBEn8xTMNL805g+DuBwLZ
        xKJ9LW8YCB3jtXTcAH7l67unAg==
X-Google-Smtp-Source: ABdhPJwGqpBdM988Q6vHDKu/RDWzUrXvL064DnDiT4hBd0PAr/oHn86c94kzcZVOTl57yz1p4pVbtw==
X-Received: by 2002:a63:5d3:: with SMTP id 202mr8010895pgf.286.1611126459450;
        Tue, 19 Jan 2021 23:07:39 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id h11sm1122242pjg.46.2021.01.19.23.07.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 23:07:38 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Gibson <david@gibson.dropbear.id.au>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH V5 0/5] dt: build overlays
Date:   Wed, 20 Jan 2021 12:36:42 +0530
Message-Id: <cover.1611124778.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Frank/Rob,

I have picked all the related patches together into a single patchset,
so they can be properly reviewed/tested.

This patchset makes necessary changes to the kernel to add support for
building overlays (%.dtbo) and the required fdtoverlay tool. This also
builds static_test.dtb using some of the existing overlay tests present
in drivers/of/unittest-data/ for better test coverage.

Note that in order for anyone to test this stuff, you need to manually
run the ./update-dtc-source.sh script once to fetch the necessary
changes from the external DTC project (i.e. fdtoverlay.c and this[1]
patch).

Also note that Frank has already shared his concerns towards the error
reporting done by fdtoverlay tool [2], I have still included the patch
in this series for completeness, will see how to get that sorted out.

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

Viresh Kumar (5):
  scripts: dtc: Fetch fdtoverlay.c from external DTC project
  scripts: dtc: Build fdtoverlay tool
  scripts: dtc: Remove the unused fdtdump.c file
  kbuild: Add support to build overlays (%.dtbo)
  of: unittest: Statically apply overlays using fdtoverlay

 .gitignore                        |   3 +-
 Makefile                          |   4 +-
 drivers/of/unittest-data/Makefile |  50 +++++++++
 scripts/Makefile.dtbinst          |   3 +
 scripts/Makefile.lib              |   4 +-
 scripts/dtc/Makefile              |   6 +-
 scripts/dtc/fdtdump.c             | 163 ------------------------------
 scripts/dtc/update-dtc-source.sh  |   3 +-
 8 files changed, 66 insertions(+), 170 deletions(-)
 delete mode 100644 scripts/dtc/fdtdump.c

-- 
2.25.0.rc1.19.g042ed3e048af

