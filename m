Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CC72F1BBC
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 18:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730697AbhAKREi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 12:04:38 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:44092 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbhAKREi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 12:04:38 -0500
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 10BH3U0G032490;
        Tue, 12 Jan 2021 02:03:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 10BH3U0G032490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610384611;
        bh=xMJfVSshWgEj0lAcfWPBo8KWgtflf02LM4k6kBZa15U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kaT+42xO4dFBEec3CudgE1dh/SUOSLoqX7ghFIucj0iYivP7tVDmCwxbcZgxuYy40
         qaI1b2iwPKhkQ329RV/DIJSOJD/SBrxQ7gixBwwPuN0CGwKi4cssd/gEXwvkzul6WA
         JD9hVL0rUdXCWZ8wgEx2/AqFuQLDRDmLSFNY7XN2r83baNSUdXV+LnxituaXhmIhnm
         MkyTakUP+74DbAL6v/3bfoLnb+NgecLmTLa80/YFaMVvKtgj8Nmj51GZD2BOfocM+I
         bXNGKi+rSuGREh/AzyLnfD2CV5Wa0eUWJAFucxfePqRiWTge34f9Z3bxyu6sijtHQ9
         xa/bQ8A2x3tTw==
X-Nifty-SrcIP: [209.85.214.170]
Received: by mail-pl1-f170.google.com with SMTP id be12so161310plb.4;
        Mon, 11 Jan 2021 09:03:30 -0800 (PST)
X-Gm-Message-State: AOAM530oZsA80kDfAC2B+LEZiyIM7vbac/qOO+M7KNoQv8qmA6nbq9C9
        JVLD13UeXHCpvv83hf1+QHTaIApf4XF6SkP08S0=
X-Google-Smtp-Source: ABdhPJyUA5+oxQkL5skgzW9ZWfhX7RWwI9VtRGRsokXYuQyDJip+D4jAHc26m+eGa0c9JDlXONDuzKnF4DhngoDziG8=
X-Received: by 2002:a17:902:9b91:b029:db:f003:c5eb with SMTP id
 y17-20020a1709029b91b02900dbf003c5ebmr660291plp.1.1610384609949; Mon, 11 Jan
 2021 09:03:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609844956.git.viresh.kumar@linaro.org> <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
 <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
 <20210111111711.r2xesydzhq5js2nf@vireshk-i7> <CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com>
 <CAL_Jsq+HiPv1x8B8ZdM2yjFLyiCwzcRR79SVsHCk80asySWp4w@mail.gmail.com>
In-Reply-To: <CAL_Jsq+HiPv1x8B8ZdM2yjFLyiCwzcRR79SVsHCk80asySWp4w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 Jan 2021 02:02:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS4V0ohZM+V5xJypejb6Powx2bj_6_kvAGU9L5EnRF=Bw@mail.gmail.com>
Message-ID: <CAK7LNAS4V0ohZM+V5xJypejb6Powx2bj_6_kvAGU9L5EnRF=Bw@mail.gmail.com>
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
To:     Rob Herring <robh+dt@kernel.org>
Cc:     David Gibson <david@gibson.dropbear.id.au>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
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

On Tue, Jan 12, 2021 at 1:13 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> +David Gibson
>
> On Mon, Jan 11, 2021 at 9:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Mon, Jan 11, 2021 at 8:17 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 07-01-21, 14:28, Masahiro Yamada wrote:
> > > > Viresh's patch is not enough.
> > > >
> > > > We will need to change .gitignore
> > > > and scripts/Makefile.dtbinst as well.
> > > >
> > > > In my understanding, the build rule is completely the same
> > > > between .dtb and .dtbo
> > > > As Rob mentioned, I am not sure if we really need/want
> > > > a separate extension.
> > > >
> > > > A counter approach is to use an extension like '.ovl.dtb'
> > > > It clarifies it is an overlay fragment without changing
> > > > anything in our build system or the upstream DTC project.
> > >
> > > By the time you gave feedback, I have already sent the dtbo change for
> > > DTC to the device-tree-compiler list (based on Rob's suggestion).
> > >
> > > And it got merged today by David:
> > >
> > > https://github.com/dgibson/dtc/commit/163f0469bf2ed8b2fe5aa15bc796b93c70243ddc
> > >
> > > Can we please finalize what we need to do with naming here and be done
> > > with it, so I can rework my patches and get going ?
> > >
> > > Thanks.
> > >
> > > --
> > > viresh
> >
> >
> >
> > It is unfortunate to see such a patch merged
> > before getting agreement about how it should work
> > as a whole.
>
> Given the feedback that dtbo is already a standard, I'd suggest we
> just stick with dts->dtbo.

OK.
dtbo seems a stanrdard already...



> > >+# enable creation of __symbols__ node
> > >+ifneq ($(dtbo-y),)
> > >+DTC_FLAGS += -@
> > >+endif
> >
> > I am not convinced with this code.
> >
> > A single user of the dtbo-y syntax gives -@ to all
> > device trees in the same directory.
> >
> > This is not a solution since Rob already stated -@ should be
> > given per board (or per platform, at least).
>
> Agreed.
>
> > I still do not understand why adding the new syntax dtbo-y
> > is helpful.
>
> I think we should stick with 'dtb-y' here.
>
>
> > Have we already decided to use separate ".dtb" and ".dtbo" for blobs?
> >
> > Will we use ".dts" for all source files?
> > Or, will we use ".dtso" for overlay source files?
> >
> > How should the build system determine the targets
> > that should have -@ option?
>
> The way it does already. Either:
>
> DTC_FLAGS += -@
>
> in a directory of dts files. Or on a per file basis like:
>
> DTC_FLAGS_foo_base += -@


Ah yes.  I like this.




We do not need the dtbo-y syntax.


We can simply use dtb-y for
base boards and overlay fragments:



dtb-$(CONFIG_ARCH_FOO) += \
     foo-base.dtb \
     foo-overlay1.dtbo \
     foo-overlay2.dtbo

DTB_FLAGS_foo-base += -@







>
> > For consistency, will we need a patch like follows?
> >
> >
> > diff --git a/dtc.c b/dtc.c
> > index bdb3f59..474401e 100644
> > --- a/dtc.c
> > +++ b/dtc.c
> > @@ -120,6 +120,8 @@ static const char *guess_type_by_name(const char
> > *fname, const char *fallback)
> >                 return fallback;
> >         if (!strcasecmp(s, ".dts"))
> >                 return "dts";
> > +       if (!strcasecmp(s, ".dtso"))
> > +               return "dts";
> >         if (!strcasecmp(s, ".yaml"))
> >                 return "yaml";
> >         if (!strcasecmp(s, ".dtb"))
> > @@ -349,6 +351,8 @@ int main(int argc, char *argv[])
> >
> >         if (streq(outform, "dts")) {
> >                 dt_to_source(outf, dti);
> > +       else if (streq(outform, "dtso")) {
> > +               dt_to_source(outf, dti);
> >  #ifndef NO_YAML
> >         } else if (streq(outform, "yaml")) {
> >                 if (!streq(inform, "dts"))
> >
> >
> >
> > Overall solution looks unclear to me.
> >
> >
> > Again, it is unfortunate that we did not take enough time
> > (in spite of the RFC prefix) before proceeding.
>
> I should have added David here from the start. Honestly, I expected
> some discussion there.
>
> Rob




-- 
Best Regards
Masahiro Yamada
