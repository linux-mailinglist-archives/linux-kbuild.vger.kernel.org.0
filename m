Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0A82F1A00
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 16:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733125AbhAKPrl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 10:47:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:59764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727824AbhAKPrk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 10:47:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78ADF22473;
        Mon, 11 Jan 2021 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610380019;
        bh=B7pAu6xb4W4CG2lBET6J5+8UN7VzgigB8RyIdadVeJw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bOZdfVEilMIntKEsSjdnmnuOVDAtTNBWvmsLDcOJ/CoTY57/+YYPYqVl2fyzpV+qZ
         83mfhdpoD05RsXzsCBiN5mIXg8ZyxZnJZ7i+a9O+XLdXU3mqMFd/BSNsv3PUPabysO
         uusSkYZT0Czs41ZsiEYjcfJjU6Vm9GTHHfznKEPAKMQ+jdNUFbdc2gMw0KbZH2QYp3
         CYdWdx6xy8pHPYss/GFgeHfcLdKSpsoTtbMlZNiDh6ApFEVsR47CfWIFsCeKIqjTF8
         thPrkNTJgRCfgLYs1RNBP72FtvemE2hho1mKZGUeAL6ss750YABCEq5iR+pWrEyX8d
         1Hai7StCrnw3w==
Received: by mail-ej1-f46.google.com with SMTP id d17so216131ejy.9;
        Mon, 11 Jan 2021 07:46:59 -0800 (PST)
X-Gm-Message-State: AOAM531ljM90HYs59CPnWuzbxe7dilnKKIcKT319mdyXVQym8ZB90vLZ
        Yix5+6+4Wa8fMkQ94htuMv7mFEMUdzgx0yKzOQ==
X-Google-Smtp-Source: ABdhPJzj1E7cc0H9h91zrX0rjwn89IVo98O7vgg0UIi/29oszS9ryGirnSXXnUSJXuaZR6bZ+MzREzK6W0unfeIH8So=
X-Received: by 2002:a17:906:31cb:: with SMTP id f11mr69710ejf.468.1610380017955;
 Mon, 11 Jan 2021 07:46:57 -0800 (PST)
MIME-Version: 1.0
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
In-Reply-To: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 11 Jan 2021 09:46:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLpbSOk-OST8Oi7uyFVjekX-15713F1FbDCQWfVWgikMw@mail.gmail.com>
Message-ID: <CAL_JsqLpbSOk-OST8Oi7uyFVjekX-15713F1FbDCQWfVWgikMw@mail.gmail.com>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 8, 2021 at 2:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Now that fdtoverlay is part of the kernel build, start using it to test
> the unitest overlays we have by applying them statically.

Nice idea.

> The file overlay_base.dtb have symbols of its own and we need to apply
> overlay.dtb to overlay_base.dtb alone first to make it work, which gives
> us intermediate-overlay.dtb file.

Okay? If restructuring things helps we should do that. Frank?

> The intermediate-overlay.dtb file along with all other overlays is them

s/them/then/

> applied to testcases.dtb to generate the master.dtb file.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> ---
> Depends on:
>
> https://lore.kernel.org/lkml/be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org/
>
> I have kept the .dtb naming for overlays for now, lets see how we do it
> eventually.
>
> Rob/Frank, this doesn't work properly right now. Maybe I missed how
> these overlays must be applied or there is a bug in fdtoverlay.
>
> The master.dtb doesn't include any nodes from overlay_base.dtb or
> overlay.dtb probably because 'testcase-data-2' node isn't present in
> testcases.dtb and fdtoverlay doesn't allow applying new nodes to the
> root node, i.e. allows new sub-nodes once it gets phandle to the parent
> but nothing can be added to the root node itself. Though I get a feel
> that it works while applying the nodes dynamically and it is expected to
> work here as well.

Sounds like a bug in fdtoverlay to me. Though maybe you need an empty
base tree. An overlay serving as the base is a bit odd so it's
somewhat understandable fdtoverlay couldn't handle that. OTOH,
combining 2 overlays together seems like a valid use.

>
> (And yeah, this is my first serious attempt at updating Makefiles, I am
> sure there is a scope of improvement here :))

Usually I write something and Masahiro rewrites it for me. :)

Rob
