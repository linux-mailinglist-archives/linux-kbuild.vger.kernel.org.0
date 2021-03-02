Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4F532B019
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Mar 2021 04:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbhCCBbW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Mar 2021 20:31:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:35664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1580256AbhCBUSL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 15:18:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA75464F38;
        Tue,  2 Mar 2021 20:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614716236;
        bh=tIYebdQOBUhRkZ+In7rw/tRl4yxyxN7IcGIa91jqkzo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lruYtSiI+tUmu8BTTkSHtSmBXa62yFfFgeFuMDDfVFYlaajEsU4IG3H8/LX8Yxxez
         9sFT3rAGR1495Czy1CzO40ktfQxvcY97fA+JcLbi6ow0THXPxlRExLIQzFfQ7qWYlT
         DW09aHTRSEbnfpKPPMR5kRUeP1d//jn+8CqBEYSi9WSv3flYHNWGfhhsFdDq2Cgq1Q
         XeQx/jJQ/tE3iNMAINSjyi0ywQEni1P4F94B7+2XLI7ASMGjodGqHRGUySumlf+OVW
         P4czf9kb+xDkLAh8pT96z1CojBEuKxVeTZXENdhLcj8edHJaDdER16CDl3JyuVaS3F
         WPBpH7AzNYu7w==
Received: by mail-ed1-f49.google.com with SMTP id c6so26942626ede.0;
        Tue, 02 Mar 2021 12:17:15 -0800 (PST)
X-Gm-Message-State: AOAM532CnT1mpbSmOYgrn8jzgf62G8KSxttlHHLT8PL5qKN2dj4qqdf/
        H29nVyWTNTYIZTbiO2KkOeC9WtgFmGx1ccmdZA==
X-Google-Smtp-Source: ABdhPJx08xQX0m7/aMZI3r+mpKrhViwcChF8LJASNAGO1eiAuWETR4ysi6zoX5cujOZwr4vjVFCHMLAsZFDcKyaKYYM=
X-Received: by 2002:aa7:d385:: with SMTP id x5mr11110466edq.289.1614716234329;
 Tue, 02 Mar 2021 12:17:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1613127681.git.viresh.kumar@linaro.org> <20210301065625.rgo2xvr7ol2vycyf@vireshk-i7>
 <31cbc900-fad2-4838-21d2-7204f1029a81@gmail.com> <20210302040258.erg6mn4ykxvxhnqm@vireshk-i7>
In-Reply-To: <20210302040258.erg6mn4ykxvxhnqm@vireshk-i7>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 2 Mar 2021 14:17:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZrFh-7GPEQP-a411yF_2-nMz5iGp6vm4m0W8xxd+=Hw@mail.gmail.com>
Message-ID: <CAL_JsqKZrFh-7GPEQP-a411yF_2-nMz5iGp6vm4m0W8xxd+=Hw@mail.gmail.com>
Subject: Re: [PATCH V8 0/4] dt: Add fdtoverlay rule and statically build unittest
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 1, 2021 at 10:03 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 01-03-21, 21:14, Frank Rowand wrote:
> > Hi Viresh,
> >
> > On 3/1/21 12:56 AM, Viresh Kumar wrote:
> > > On 12-02-21, 16:48, Viresh Kumar wrote:
> > >> Hi,
> > >>
> > >> This patchset adds a generic rule for applying overlays using fdtoverlay
> > >> tool and then updates unittests to get built statically using the same.
> > >>
> > >> V7->V8:
> > >> - Patch 1 is new.
> > >> - Platforms need to use dtb-y += foo.dtb instead of overlay-y +=
> > >>   foo.dtb.
> > >> - Use multi_depend instead of .SECONDEXPANSION.
> > >> - Use dtb-y for unittest instead of overlay-y.
> > >> - Rename the commented dtb filess in unittest Makefile as .dtbo.
> > >> - Improved Makefile code (I am learning a lot every day :)
> > >
> > > Ping!
> > >
> >
> > Please respin on 5.12-rc1, and pull in the change you said
> > you would make in response to my post v8 comment about the
> > v7 patches.
>
> Yes, I will do that.
>
> I must have been more explicit about the Ping I believe. It was
> more for Masahiro and Rob to see if the kbuild stuff (which is
> relatively new) makes sense or not before I respin this..

LGTM, I was mainly waiting on Acks from Masahiro and Frank.

Rob
