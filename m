Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36142EAECD
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Jan 2021 16:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbhAEPiQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Jan 2021 10:38:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:32778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728412AbhAEPiP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Jan 2021 10:38:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C783322B4B;
        Tue,  5 Jan 2021 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861055;
        bh=VYJOAU7Jrcu6b/Sxpo7mSnkYTF6/uHBd9GZO8euKJWg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FvXSSbd/abOAsmavT974MXjpaP02LheOs4SyeS95w6Jyd84xXCdao48r+NNUUs7Fn
         1VNtfZZRSXQu/e2iMLtSFOdk3lQtesmGQRiZy9uyfdxnx9F3yop+/UvKL1icG+6xQW
         H490oo00P2gkM6vANeZ1sDEbits30d+85Mw8v+AW42NI5dAIM7xWr40itE1gqB5/4X
         jELrdjUEyA4EdHZZQqEhbvfmauuPwTFnnJpAfvjiTYLPJrJ5/+o4QB598QlnmIR4Qf
         CGI2K/Toz5mbWRDQbf37TBdg/a5W4mIg237KkUHoe/gRh4vzsOelnQg8lH4VYMg326
         rxCA9k/eiS/rw==
Received: by mail-ej1-f41.google.com with SMTP id b9so373828ejy.0;
        Tue, 05 Jan 2021 07:37:34 -0800 (PST)
X-Gm-Message-State: AOAM5310rL4KnfO3CtoI86ik+1zf3Lgp6XNgjqA9t3IrXLXpdS2q8wCI
        9cCUvsD227Uv/ilsuYVQ4dxliqmt+HxraKlUBw==
X-Google-Smtp-Source: ABdhPJz9dm4i1z1a2T2dsyBLuctZXpsj7Cv6KR4XDCBN+VEUmRMeCkVfPFFwGtQ9jHe90fkOIIRCNd3IGQ5Rbs0GbsQ=
X-Received: by 2002:a17:906:d87:: with SMTP id m7mr69910226eji.108.1609861053429;
 Tue, 05 Jan 2021 07:37:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609844956.git.viresh.kumar@linaro.org> <7aa70809eff3f32d821761d2a763e4fb72ecc8fb.1609844956.git.viresh.kumar@linaro.org>
In-Reply-To: <7aa70809eff3f32d821761d2a763e4fb72ecc8fb.1609844956.git.viresh.kumar@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 5 Jan 2021 08:37:21 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+0dL=LHo8r9mY_weBP_bQ97UOBnt596J3JoVHwGNinHA@mail.gmail.com>
Message-ID: <CAL_Jsq+0dL=LHo8r9mY_weBP_bQ97UOBnt596J3JoVHwGNinHA@mail.gmail.com>
Subject: Re: [RFC 2/2] scripts: dtc: Handle outform dtbo
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
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
> Update dtc compiler to accept dtbo as an outform.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> ---
> I feel that this needs to go directly to
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git
>
> Right ? I will send it separately if the idea is accepted here.

Yes, needs to go to devicetree-compiler list. I think this came up
before and IIRC David wasn't completely in agreement. I looked briefly
and couldn't find the thread though...

We really don't need a different extension because we could just
examine the dtb to determine if it is an overlay or not. That's less
obvious. We could also add meta-data to overlays defining what base
they apply to. If we had that, a tool could just list all overlays
that should apply to a base and we could use that info for build time
applying overlays. Of course, that and a dtbo extension/format are not
mutually exclusive.

> ---
>  scripts/dtc/dtc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/dtc/dtc.c b/scripts/dtc/dtc.c
> index bdb3f5945699..40fa7128b3d6 100644
> --- a/scripts/dtc/dtc.c
> +++ b/scripts/dtc/dtc.c
> @@ -357,6 +357,8 @@ int main(int argc, char *argv[])
>  #endif
>         } else if (streq(outform, "dtb")) {
>                 dt_to_blob(outf, dti, outversion);
> +       } else if (streq(outform, "dtbo")) {
> +               dt_to_blob(outf, dti, outversion);
>         } else if (streq(outform, "asm")) {
>                 dt_to_asm(outf, dti, outversion);
>         } else if (streq(outform, "null")) {

You also need to extend guess_type_by_name().


Rob
