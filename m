Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60A030F706
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Feb 2021 17:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237627AbhBDQAF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Feb 2021 11:00:05 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:46432 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237695AbhBDP7p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Feb 2021 10:59:45 -0500
Received: by mail-ot1-f53.google.com with SMTP id d1so3813404otl.13;
        Thu, 04 Feb 2021 07:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=etT7X4K+k0BfrP2kEIs+zpn4CYM9jnwbFRYIw/Vpixw=;
        b=Kj7q/y/6JtcVSYS6Dsw/3Ix3o/eVDnfa2UD/GiYSDNvYNKX+/v3Y5xx4T6tiOeNezN
         LWBKP1kYhFOu4RJYSZ+PTP45HvJbtc5HKAyO/CSAYwz0wNTcuOsQ4gwx6yRE1lagsjLz
         SwR69u3PvdVfeFUW3rXjiMBYAtU/i210zE1clNHWU7w4bGmW/VSifShUi758HwU5hb0j
         9LJEAXAy/hWcHBGQ7JHSUdTYviY4e7IEBBDMWju/pIOIwrjFvtYxc0Fw+SLowZCciPZg
         bQ/UQdo/W3gfa8ccpChNNS43wUoGLff8HeOuk0k42xdAjhVElPPUgnkRT/fHFmY4BTok
         kzIg==
X-Gm-Message-State: AOAM531/u4c8AfXpOB1g7S6dTgkrPuXMxgDcpm1EFDu8ODgscQ9VMrjS
        WEYZJhSkuBkhwETh/Zi7SMCORVRBYw==
X-Google-Smtp-Source: ABdhPJwVocn+Ng0f/439/DQREsxWgxQRuh6eH4eFJYY0ZzCWr10/uXUh6klDpHTyzqOK6IdTgPd9Rw==
X-Received: by 2002:a9d:5f0b:: with SMTP id f11mr5820687oti.263.1612454341191;
        Thu, 04 Feb 2021 07:59:01 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g13sm1174935otl.60.2021.02.04.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:59:00 -0800 (PST)
Received: (nullmailer pid 521229 invoked by uid 1000);
        Thu, 04 Feb 2021 15:58:59 -0000
Date:   Thu, 4 Feb 2021 09:58:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        anmar.oueja@linaro.org, linux-kernel@vger.kernel.org,
        Bill Mills <bill.mills@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V7 0/6] dt: build overlays
Message-ID: <20210204155859.GB519221@robh.at.kernel.org>
References: <cover.1611904394.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611904394.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 29 Jan 2021 12:54:04 +0530, Viresh Kumar wrote:
> Hi,
> 
> This patchset makes necessary changes to the kernel to add support for
> building overlays (%.dtbo) and the required fdtoverlay tool. This also
> builds static_test.dtb using most of the existing overlay tests present
> in drivers/of/unittest-data/ for better test coverage.
> 
> Note that in order for anyone to test this stuff, you need to manually
> run the ./update-dtc-source.sh script once to fetch the necessary
> changes from the external DTC project (i.e. fdtoverlay.c and this[1]
> patch).
> 
> I have tested this patchset for static and runtime testing (on Hikey
> board) and no issues were reported.
> 
> V7:
> - Add a comment in scripts/dtc/Makefile
> - Add Ack from Masahiro for patch 4/6.
> - Drop word "merge" from commit log of 2/6.
> - Split apply_static_overlay, static_test.dtb, and static_base.dts into
>   two parts to handle overlay_base.dts and testcases.dts separately.
> 
> V6:
> - Create separate rules for dtbo-s and separate entries in .gitignore in
>   4/6 (Masahiro).
> - A new file layout for handling all overlays for existing and new tests
>   5/6 (Frank).
> - Include overlay.dts as well now in 6/6 (Frank).
> 
> V5:
> 
> - Don't reuse DTC_SOURCE for fdtoverlay.c in patch 1/5 (Frank).
> 
> - Update .gitignore and scripts/Makefile.dtbinst, drop dtbo-y syntax and
>   DTC_FLAGS += -@ in patch 4/5 (Masahiro).
> 
> - Remove the intermediate dtb, rename output to static_test.dtb, don't
>   use overlay.dtb and overlay_base.dtb for static builds, improved
>   layout/comments in Makefile for patch 5/5 (Frank).
> 
> --
> Viresh
> 
> [1] https://github.com/dgibson/dtc/commit/163f0469bf2ed8b2fe5aa15bc796b93c70243ddc
> [2] https://lore.kernel.org/lkml/74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com/
> 
> Viresh Kumar (6):
>   scripts: dtc: Fetch fdtoverlay.c from external DTC project
>   scripts: dtc: Build fdtoverlay tool
>   scripts: dtc: Remove the unused fdtdump.c file
>   kbuild: Add support to build overlays (%.dtbo)
>   of: unittest: Create overlay_common.dtsi and testcases_common.dtsi
>   of: unittest: Statically apply overlays using fdtoverlay

I've applied the first 4 patches and did a dtc sync after patch 1.

Rob
