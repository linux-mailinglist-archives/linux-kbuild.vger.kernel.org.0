Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168402F1AAD
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 17:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387501AbhAKQOV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 11:14:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:46020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733195AbhAKQOV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 11:14:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10E4322B30;
        Mon, 11 Jan 2021 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610381620;
        bh=Urfi7MuRhpUGvVyUz/7tHdR5Pc8foT1YLXVK04grcPw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FUkxZVko6R4B8OZL/LcJ4ziS9Rg3RtGjxiuL/FwgtkuQJuEK82TqdoD9P43saVScv
         AVlA41qIFoegqW+caPtCCEBnWNUI1AhvgaapeEpufBVqOW2bvBlCoTFeq1fCjUJdY/
         j8dCTQ74YRR/roq4poMVd+iY+GK3PxLNYIT2u+vWve/+nCVHKAVRlgWUocj8YFMNdl
         urXh48m2JtDsb//ysP2avRfTahHCmwamaPHj6nncN4geoj8Tr6oqPMcB0Ds8Sz5h47
         ZDd5ASM14XnkoMXhnPUEEi+ECqZw4PzA3yy4baaATIC7Ug2ipFwsfhKE0IPFD03z3c
         HKUOdkaSM2ofQ==
Received: by mail-ed1-f47.google.com with SMTP id i24so279343edj.8;
        Mon, 11 Jan 2021 08:13:39 -0800 (PST)
X-Gm-Message-State: AOAM533BO+5NTUdeJUlcjdwSECo538bGLkLerfei8cvaXpZFVMh55he7
        gf2b6p5Kuq//slrQjGm8JINbEJRN/n/UG41T9Q==
X-Google-Smtp-Source: ABdhPJw3c24e6XlhnbwSziA36wFuxQ1NccGshiVNtFSYA/nBEpCNmyhnpRmoijksjLsuhy3dxE3S9ZYziuy47Kt4DkA=
X-Received: by 2002:aa7:d154:: with SMTP id r20mr106799edo.258.1610381618452;
 Mon, 11 Jan 2021 08:13:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609844956.git.viresh.kumar@linaro.org> <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
 <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
 <20210111111711.r2xesydzhq5js2nf@vireshk-i7> <CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com>
In-Reply-To: <CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 11 Jan 2021 10:13:24 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+HiPv1x8B8ZdM2yjFLyiCwzcRR79SVsHCk80asySWp4w@mail.gmail.com>
Message-ID: <CAL_Jsq+HiPv1x8B8ZdM2yjFLyiCwzcRR79SVsHCk80asySWp4w@mail.gmail.com>
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
To:     Masahiro Yamada <masahiroy@kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+David Gibson

On Mon, Jan 11, 2021 at 9:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Jan 11, 2021 at 8:17 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 07-01-21, 14:28, Masahiro Yamada wrote:
> > > Viresh's patch is not enough.
> > >
> > > We will need to change .gitignore
> > > and scripts/Makefile.dtbinst as well.
> > >
> > > In my understanding, the build rule is completely the same
> > > between .dtb and .dtbo
> > > As Rob mentioned, I am not sure if we really need/want
> > > a separate extension.
> > >
> > > A counter approach is to use an extension like '.ovl.dtb'
> > > It clarifies it is an overlay fragment without changing
> > > anything in our build system or the upstream DTC project.
> >
> > By the time you gave feedback, I have already sent the dtbo change for
> > DTC to the device-tree-compiler list (based on Rob's suggestion).
> >
> > And it got merged today by David:
> >
> > https://github.com/dgibson/dtc/commit/163f0469bf2ed8b2fe5aa15bc796b93c70243ddc
> >
> > Can we please finalize what we need to do with naming here and be done
> > with it, so I can rework my patches and get going ?
> >
> > Thanks.
> >
> > --
> > viresh
>
>
>
> It is unfortunate to see such a patch merged
> before getting agreement about how it should work
> as a whole.

Given the feedback that dtbo is already a standard, I'd suggest we
just stick with dts->dtbo.

> >+# enable creation of __symbols__ node
> >+ifneq ($(dtbo-y),)
> >+DTC_FLAGS += -@
> >+endif
>
> I am not convinced with this code.
>
> A single user of the dtbo-y syntax gives -@ to all
> device trees in the same directory.
>
> This is not a solution since Rob already stated -@ should be
> given per board (or per platform, at least).

Agreed.

> I still do not understand why adding the new syntax dtbo-y
> is helpful.

I think we should stick with 'dtb-y' here.


> Have we already decided to use separate ".dtb" and ".dtbo" for blobs?
>
> Will we use ".dts" for all source files?
> Or, will we use ".dtso" for overlay source files?
>
> How should the build system determine the targets
> that should have -@ option?

The way it does already. Either:

DTC_FLAGS += -@

in a directory of dts files. Or on a per file basis like:

DTC_FLAGS_foo_base += -@

> For consistency, will we need a patch like follows?
>
>
> diff --git a/dtc.c b/dtc.c
> index bdb3f59..474401e 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -120,6 +120,8 @@ static const char *guess_type_by_name(const char
> *fname, const char *fallback)
>                 return fallback;
>         if (!strcasecmp(s, ".dts"))
>                 return "dts";
> +       if (!strcasecmp(s, ".dtso"))
> +               return "dts";
>         if (!strcasecmp(s, ".yaml"))
>                 return "yaml";
>         if (!strcasecmp(s, ".dtb"))
> @@ -349,6 +351,8 @@ int main(int argc, char *argv[])
>
>         if (streq(outform, "dts")) {
>                 dt_to_source(outf, dti);
> +       else if (streq(outform, "dtso")) {
> +               dt_to_source(outf, dti);
>  #ifndef NO_YAML
>         } else if (streq(outform, "yaml")) {
>                 if (!streq(inform, "dts"))
>
>
>
> Overall solution looks unclear to me.
>
>
> Again, it is unfortunate that we did not take enough time
> (in spite of the RFC prefix) before proceeding.

I should have added David here from the start. Honestly, I expected
some discussion there.

Rob
