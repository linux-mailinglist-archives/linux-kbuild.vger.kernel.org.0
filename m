Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700F32F19E2
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 16:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730725AbhAKPlm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 10:41:42 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:26853 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbhAKPlm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 10:41:42 -0500
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10BFeiF9015872;
        Tue, 12 Jan 2021 00:40:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10BFeiF9015872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610379645;
        bh=92u5oyvx07CgdmY35pNqgIKcY7bZ9dVnwxJcos9+FlA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BjMUV+PQBGXEZ8sKSUb2kxGeK7mJ2+jD5FeIelPp7Dl4shGUHf+Wl419kIlDaBXA2
         530bEGn/NNVVughL90TaedYs1Qjfd/RJSV1Q3npGpdh6QxswUeEo2RggRxqj76kB+l
         NZfCuxrAPIp5tn9dwOOUEq6MyBVAIW978UvRiyPpEuSYKRvl1gO/YX7RhUv07X8kdu
         L+c2AaK4T4OAFdQRzgu9wCCj/lk9L8yuYVTCbqAnNH2gkYdDvl2SlUu8Q/tbOeFz1B
         +WL9XEuvgGaQFTbOt9Ny06DAULXgIYtYB8/2X72mcJ8hzkp/WJ5+4Q75lA3bQfLw93
         UrvlK5FuvCuZA==
X-Nifty-SrcIP: [209.85.215.170]
Received: by mail-pg1-f170.google.com with SMTP id p18so12709308pgm.11;
        Mon, 11 Jan 2021 07:40:45 -0800 (PST)
X-Gm-Message-State: AOAM531sYZoj0e+Yha0mctncBabapspR9teXqWy7Tfz2Ii7mCHH0rcQH
        drhOsiBlt6ci5qvaE1t39oOfbREQq1qwUoI2nYM=
X-Google-Smtp-Source: ABdhPJyMDvJbegafb3/FFMgw5BDoL6BTmVrEK60ISDDFR392feEkFRF3SFHH5UiXszjPTc9NGE9mJWXNeaUYCHfo6hQ=
X-Received: by 2002:a62:820d:0:b029:1ad:d810:6805 with SMTP id
 w13-20020a62820d0000b02901add8106805mr17033953pfd.63.1610379644310; Mon, 11
 Jan 2021 07:40:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609844956.git.viresh.kumar@linaro.org> <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
 <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com> <20210111111711.r2xesydzhq5js2nf@vireshk-i7>
In-Reply-To: <20210111111711.r2xesydzhq5js2nf@vireshk-i7>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 Jan 2021 00:40:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com>
Message-ID: <CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com>
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
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

On Mon, Jan 11, 2021 at 8:17 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 07-01-21, 14:28, Masahiro Yamada wrote:
> > Viresh's patch is not enough.
> >
> > We will need to change .gitignore
> > and scripts/Makefile.dtbinst as well.
> >
> > In my understanding, the build rule is completely the same
> > between .dtb and .dtbo
> > As Rob mentioned, I am not sure if we really need/want
> > a separate extension.
> >
> > A counter approach is to use an extension like '.ovl.dtb'
> > It clarifies it is an overlay fragment without changing
> > anything in our build system or the upstream DTC project.
>
> By the time you gave feedback, I have already sent the dtbo change for
> DTC to the device-tree-compiler list (based on Rob's suggestion).
>
> And it got merged today by David:
>
> https://github.com/dgibson/dtc/commit/163f0469bf2ed8b2fe5aa15bc796b93c70243ddc
>
> Can we please finalize what we need to do with naming here and be done
> with it, so I can rework my patches and get going ?
>
> Thanks.
>
> --
> viresh



It is unfortunate to see such a patch merged
before getting agreement about how it should work
as a whole.




>+# enable creation of __symbols__ node
>+ifneq ($(dtbo-y),)
>+DTC_FLAGS += -@
>+endif

I am not convinced with this code.

A single user of the dtbo-y syntax gives -@ to all
device trees in the same directory.

This is not a solution since Rob already stated -@ should be
given per board (or per platform, at least).

I still do not understand why adding the new syntax dtbo-y
is helpful.




Have we already decided to use separate ".dtb" and ".dtbo" for blobs?

Will we use ".dts" for all source files?
Or, will we use ".dtso" for overlay source files?

How should the build system determine the targets
that should have -@ option?



For consistency, will we need a patch like follows?


diff --git a/dtc.c b/dtc.c
index bdb3f59..474401e 100644
--- a/dtc.c
+++ b/dtc.c
@@ -120,6 +120,8 @@ static const char *guess_type_by_name(const char
*fname, const char *fallback)
                return fallback;
        if (!strcasecmp(s, ".dts"))
                return "dts";
+       if (!strcasecmp(s, ".dtso"))
+               return "dts";
        if (!strcasecmp(s, ".yaml"))
                return "yaml";
        if (!strcasecmp(s, ".dtb"))
@@ -349,6 +351,8 @@ int main(int argc, char *argv[])

        if (streq(outform, "dts")) {
                dt_to_source(outf, dti);
+       else if (streq(outform, "dtso")) {
+               dt_to_source(outf, dti);
 #ifndef NO_YAML
        } else if (streq(outform, "yaml")) {
                if (!streq(inform, "dts"))



Overall solution looks unclear to me.


Again, it is unfortunate that we did not take enough time
(in spite of the RFC prefix) before proceeding.


-- 
Best Regards
Masahiro Yamada
