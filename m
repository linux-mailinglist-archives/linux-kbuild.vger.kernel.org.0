Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721CB30480F
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 20:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388476AbhAZFwM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 00:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbhAZDqc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 22:46:32 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FC0C061574;
        Mon, 25 Jan 2021 19:45:52 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id u20so6178887qku.7;
        Mon, 25 Jan 2021 19:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u+F7qjMVkKy+Z/mTlAsnRGcIPEVHPoI7X+UjyEAMBy8=;
        b=JkpNujUg4hjRouN6pl6/AQ1uia3Vl5jlYv7qjTJCaxmNC9JbjSh/5DfSswulPM+9mr
         LtjbiD9w28zln3dTymX9YTMTLyT8kxjekiOQvSo28/UPU8QRbcyidxy5aYDmGRPmGgJg
         Ead0Y23ohH/R1ytYNB14fmANrS8Cy5afHQLI2ucCEqnJliOF506TLfxpFDaqgvN6Wtur
         XdU8+cMc4dTZ5l0WJjG7Hy/FBdPGlttzwjkjcCVDsw0Kbw/gqVaBlDOmJjlYN4bn6nkR
         HZgv4zFBe+P25L/pigy0gfd0THKJLA/T7VlN4H9EkmHXH1fck6UwqjgqRm9leHOoqRLw
         orkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u+F7qjMVkKy+Z/mTlAsnRGcIPEVHPoI7X+UjyEAMBy8=;
        b=W8391kYz1/V8JhbfgJfX2Ul7ndbF9ET4usrbXPw7KyilbHC8MyE6epNRYYDkGq9yZY
         TywxOOdoAm/MYoR+cWWpJrC42NJLIpWiycC0MQQGOPVAnG+62DlsJCWDZxGpLTodO+I4
         WNZyJZ6aG+hJByhxs12dmbKBNmJwVTQ4/orGkNDP85OeSFOU9I/EB6rOXgkOluUelnS4
         kRUUygarjb/pp0W0q3Liq2TIBBTGsJRc9hlnq3FX4MrCu3iZNK3MGu3QeLjJ23rnd2aj
         akjp3xJz6aNnJtyG8GzOJjWZgOF2jDtoy3mOzDTSWu12WVOmOy1J9hZMLCE/YgLS9KyO
         6xeg==
X-Gm-Message-State: AOAM531dJpXLhr723piQYz8ZkPt60uIknjfBKR/mbfDLrYYPVWChYRNT
        j/2j/6FYYmpaYsEqqfyomPyiCcbQwBsdyg==
X-Google-Smtp-Source: ABdhPJwpIYYsN7+FoSV73wY12VTrXEJKc5inFk/jjpyOi9VF8PwYt8XqOaFPYaIPFFftclhKxgsBEQ==
X-Received: by 2002:a37:9ad0:: with SMTP id c199mr4087192qke.112.1611632751332;
        Mon, 25 Jan 2021 19:45:51 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id j66sm13470125qkf.78.2021.01.25.19.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 19:45:51 -0800 (PST)
Subject: Re: [PATCH V6 0/6] dt: build overlays
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, anmar.oueja@linaro.org,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1611312122.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <2d31e19c-7a4e-e848-aacc-8bbaa0916b0a@gmail.com>
Date:   Mon, 25 Jan 2021 21:45:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1611312122.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/22/21 4:50 AM, Viresh Kumar wrote:
> Hi Frank/Rob,
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

> Also note that Frank has already shared his concerns towards the error
> reporting done by fdtoverlay tool [2], and David said it is not that
> straight forward to make such changes in fdtoverlay. I have still
> included the patch in this series for completeness.

I started to reply to this email with questions for David about how to
improve the fdtoverlay error reporting.  But then decided that instead
of trying to paraphrase the comments in v4 of this patch series, it
would be more efficient to ask in the v4 thread.  So my questions are
over there...

-Frank

> 
> FWIW, with fdtoverlay we generate a new build warning now, not sure why
> though:
> 
> drivers/of/unittest-data/tests-interrupts.dtsi:20.5-28: Warning (interrupts_property): /testcase-data/testcase-device2:#interrupt-cells: size is (4), expected multiple of 8
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
> 
>  .gitignore                                    |   1 +
>  Makefile                                      |   5 +-
>  drivers/of/unittest-data/Makefile             |  51 ++++++
>  drivers/of/unittest-data/overlay_base.dts     |  90 +---------
>  drivers/of/unittest-data/overlay_common.dtsi  |  91 ++++++++++
>  drivers/of/unittest-data/static_base.dts      |   5 +
>  drivers/of/unittest-data/testcases.dts        |  17 +-
>  .../of/unittest-data/testcases_common.dtsi    |  18 ++
>  scripts/Makefile.dtbinst                      |   3 +
>  scripts/Makefile.lib                          |   5 +
>  scripts/dtc/Makefile                          |   6 +-
>  scripts/dtc/fdtdump.c                         | 163 ------------------
>  scripts/dtc/update-dtc-source.sh              |   3 +-
>  13 files changed, 187 insertions(+), 271 deletions(-)
>  create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
>  create mode 100644 drivers/of/unittest-data/static_base.dts
>  create mode 100644 drivers/of/unittest-data/testcases_common.dtsi
>  delete mode 100644 scripts/dtc/fdtdump.c
> 

