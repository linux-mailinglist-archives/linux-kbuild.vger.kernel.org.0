Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A262F639B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 16:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbhANPC1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 10:02:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:55666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726459AbhANPC0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 10:02:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4211F23A7E;
        Thu, 14 Jan 2021 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610636505;
        bh=9B84DmHm2+LoU9vhzsqNNfyGvLUj3dh2HjqdmTrBpJs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=I3vcu7zZ+kwwHRprxq+sVbd2kjWbAAfkkuKssqt/dp+PxIDqJL3R5am0MtQ4JwSJQ
         V3KZim1N+ZxLZQlj47GFFTuaAeYiOEqAqyRLHK+tKukkqPK7FqjFpdIQgDomJ+Zf45
         3spt6ztsS5eQgdkevVXcopUwSMA5SCtBMJ9TZwsylDHUb1O5yrdrKk2BTw1I2wPFAq
         J1V62QloCRvBf6EgsUjxPVBEcmX9qh6ZV5hZM6ypYWHs9SkNEd4b6x1PrJMqfsu4Kk
         kh/v7sKMbB3PfdQwTuqQKisaxoMJNuNAEinJPFHU/8IY4menlR0LyVvOJPeQHVEEq6
         UoIaYFapl7Clg==
Received: by mail-ed1-f51.google.com with SMTP id p22so5997832edu.11;
        Thu, 14 Jan 2021 07:01:45 -0800 (PST)
X-Gm-Message-State: AOAM530s9rSebuNziJlfla1pbQOGDmVrddVWP3dcolGs9sgbNV2UFXJl
        n1wdF2zwYHtSYLdpTGE6Z6kJfob0Wbb3KghKPQ==
X-Google-Smtp-Source: ABdhPJxN5d0vZEvTJNolKULIWiaph0OQBqrRQaIswy0bO5DCN9vovErPYaXiKZjEaFqTrP06tQ39Axga+QYnpLISToQ=
X-Received: by 2002:a05:6402:ca2:: with SMTP id cn2mr5976211edb.137.1610636503797;
 Thu, 14 Jan 2021 07:01:43 -0800 (PST)
MIME-Version: 1.0
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <CAL_JsqLpbSOk-OST8Oi7uyFVjekX-15713F1FbDCQWfVWgikMw@mail.gmail.com> <20210114050309.wokrhw4o3cjxj5uo@vireshk-i7>
In-Reply-To: <20210114050309.wokrhw4o3cjxj5uo@vireshk-i7>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 14 Jan 2021 09:01:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ=jxBo2JsjNTcBnV_8OrGjUc4ZQEpdVWsfFwWb9YzyFQ@mail.gmail.com>
Message-ID: <CAL_JsqJ=jxBo2JsjNTcBnV_8OrGjUc4ZQEpdVWsfFwWb9YzyFQ@mail.gmail.com>
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

On Wed, Jan 13, 2021 at 11:03 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 11-01-21, 09:46, Rob Herring wrote:
> > On Fri, Jan 8, 2021 at 2:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > Now that fdtoverlay is part of the kernel build, start using it to test
> > > the unitest overlays we have by applying them statically.
> >
> > Nice idea.
> >
> > > The file overlay_base.dtb have symbols of its own and we need to apply
> > > overlay.dtb to overlay_base.dtb alone first to make it work, which gives
> > > us intermediate-overlay.dtb file.
> >
> > Okay? If restructuring things helps we should do that. Frank?
>
> Frank, do we want to do something about it ? Maybe make overlay_base.dts an dtsi
> and include it from testcases.dts like the other ones ?

No, because overlay_base.dts is an overlay dt. I think we need an
empty, minimal base.dtb to apply overlay_base.dtbo to.

And then fdtoverlay needs a fix to apply overlays to the root node?

Rob
