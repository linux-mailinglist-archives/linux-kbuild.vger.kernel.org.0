Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB072EAE1E
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Jan 2021 16:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbhAEPWb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Jan 2021 10:22:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:58876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727155AbhAEPWa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Jan 2021 10:22:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1C3522B4B;
        Tue,  5 Jan 2021 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609860110;
        bh=97UVCrOKT2ErdgEJfAOSkI21WLa7Deputq5XkcrSorU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NwTwNrVi66RUa3GtNfMNr9IQIcz725PAprzh5MioC9eDPEj3xGYCWy4hHotoKqH8E
         GjvP+MwWSlLBrKVr3NusyLcs6M4RltorOOK/iqcvwIWD2NS5V8K2Ky5TzAvjve6G/g
         VCL5Prj92RXGBsbN/5AMqKXrWaYV0jdi6T4YR6P/C+EhaVAl7yk+48QA+hLtPcfr5+
         /gF4xJQSJ1YMBWwfDO5cwG+zvl8SuwsDlz0CgVbIHNG4Tt6bjNRpFMn1yCSLiVPPBw
         lWwDzcOq54Oi8OVxi7mG7nfy989go6YqxfFNdd3cKr77mBRAY0HrETBh23d7MwmO1N
         Ro1R0RfgHGuOw==
Received: by mail-ed1-f46.google.com with SMTP id c7so363929edv.6;
        Tue, 05 Jan 2021 07:21:49 -0800 (PST)
X-Gm-Message-State: AOAM533TkKfpbQjwK763c3SIjPlrNZ0V1yIAUV6SyXV+isBgJ4EB+aNO
        BDSHlkmmfIYpcyvs43uFozvqxdPahZ/UkJccTQ==
X-Google-Smtp-Source: ABdhPJxr4lrBHt+Qp69qQk6ZwZ9AkMYQpVMgEu/oYmZ68rq63mVXGURBFWpkJLNl5EZw+QhMgDoua1jHUFC8pgLapGU=
X-Received: by 2002:a50:f404:: with SMTP id r4mr286028edm.62.1609860108469;
 Tue, 05 Jan 2021 07:21:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609844956.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1609844956.git.viresh.kumar@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 5 Jan 2021 08:21:36 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
Message-ID: <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 5, 2021 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hello,
>
> Here is an attempt to make some changes in the kernel to allow building
> of device tree overlays.
>
> While at it, I would also like to discuss about how we should mention
> the base DT blobs in the Makefiles for the overlays, so they can be
> build tested to make sure the overlays apply properly.
>
> A simple way is to mention that with -base extension, like this:
>
> $(overlay-file)-base := platform-base.dtb
>
> Any other preference ?

I think we'll want something similar to how '-objs' works for modules:

foo-board-1-dtbs := foo-board.dtb foo-overlay1.dtbo
foo-board-2-dtbs := foo-board.dtb foo-overlay2.dtbo
foo-board-1-2-dtbs := foo-board.dtb foo-overlay1.dtbo foo-overlay2.dtbo
dtbs-y += foo-board-1.dtb foo-board-2.dtb foo-board-1-2.dtb

(One difference here is we will want all the intermediate targets
unlike .o files.)

You wouldn't necessarily have all the above combinations, but you have
to allow for them. I'm not sure how we'd handle applying any common
overlays where the base and overlay are in different directories.

Another thing here is adding all the above is not really going to
scale on arm32 where we have a single dts directory. We need to move
things to per vendor/soc family directories. I have the script to do
this. We just need to agree on the vendor names and get Arnd/Olof to
run it. I also want that so we can enable schema checks by default
once a vendor is warning free (the whole tree is going to take
forever).

> Also fdtoverlay is an external entity right now, and is not part of the
> kernel. Do we need to make it part of the kernel ? Or keep using the
> external entity ?

Part of the kernel. We just need to add it to the dtc sync script and
makefile I think.

Rob
