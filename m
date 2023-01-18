Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5549E671899
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jan 2023 11:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjARKKp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Jan 2023 05:10:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjARKK2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jan 2023 05:10:28 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0DF6FFB3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jan 2023 01:17:44 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id bn6so35898604ljb.13
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jan 2023 01:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=StTuZ2Bua1HjSF/m6fwYuJtXSGg9vB7chLQqJSxTQig=;
        b=JW9lrVwWB7Ddf4bITQ6OHLlImlWvHFhs7M3Zj5AkWEsGmwoBuKP2TBVuWOcqoTVOA2
         +3mmG5RfPE2L2x2we1z0AEsxlLzsZAYdNExURg747x2a+i/1NqQtJqFFh+SuQtKeoXR7
         3NTUAc0RpOP/fIA+fVJIzGOWKffvbiHSGCiOymEH6wySRqrq2Sdk3SxrMWZLWv8VI8C8
         z5Kf/C1XfSHuD+bBzIIdzCUxsKwdN8RzN6IqqsmBSoPDQwHic12BC2QsSC/U12hTFY8G
         hm+oYD3jiph+md4KiEHg9QeXbl6zTK6UpQp8r3oy/kOm/pYudAqwflgZKikOfiI1Z/LW
         39OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StTuZ2Bua1HjSF/m6fwYuJtXSGg9vB7chLQqJSxTQig=;
        b=e+FjSn515VU1Ao3TQdLYJe29nP0fjl88/5vBIcptOAGpeQLf63M9yHOvkK53/0KQjy
         Utvbv4ryT0ruJYhOODdkUNn4vBbjCSLbiRD8CF33wMV1dNLFMC2BMU4i3+n8/HjBfhpj
         MyIFdZ8z6FqWTvfcbkEoHnrJ584LIlBKmlHC7uqj1nkxyQmiJdnHW3MtEQART2jAfaJt
         y0t0Ddw5gLynhH7/yFB4bRryddFIAUmqxDDFuYEAplLDCLNieT5WcibneFU2D7DdwUe+
         p7eYhDSrrqnANJ5ziVXnPr4z39ClHNi0PxOfsU3szi6Hsn3iZjMWnTELEFGrmgfam2Ic
         C4cg==
X-Gm-Message-State: AFqh2kq1WdkBUZ40YmJRObSESAXr5ZavfnCeip7qlq5FXTRZfPaspgY7
        Bl/gGLdMFHJ+y8r/sSuQXdgRCpQ0A6uggl8BjA/uq5uh/NqqmA==
X-Google-Smtp-Source: AMrXdXscAH5YlBKImGsd8mtnTy/wERqo6svue1vFpW65bewSiwH0kg4+Sdyo9WT/OWk09yJExa4USHGAL0jQbsq+tvQ=
X-Received: by 2002:a2e:95d5:0:b0:282:bc5a:b025 with SMTP id
 y21-20020a2e95d5000000b00282bc5ab025mr475957ljh.459.1674033462785; Wed, 18
 Jan 2023 01:17:42 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
 <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
 <CA+icZUXJgR1MFtgpChvwr5iFa_FVr4bEGe3GAM62_3xNSmDeXQ@mail.gmail.com> <CAK7LNARzDnVk7JV6WLRYm54HkY4CVmpcv17YWkr9Q8GT2Epdig@mail.gmail.com>
In-Reply-To: <CAK7LNARzDnVk7JV6WLRYm54HkY4CVmpcv17YWkr9Q8GT2Epdig@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 18 Jan 2023 10:17:05 +0100
Message-ID: <CA+icZUVpDwrB2VbcyZmxE6asfPVh4ANYCvEsTd+rhVtZCHitLA@mail.gmail.com>
Subject: Re: [6.2-rc4] warning: cannot check the header due to sha1sum missing
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 18, 2023 at 8:51 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Jan 18, 2023 at 4:45 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Mon, Jan 16, 2023 at 4:21 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Mon, Jan 16, 2023 at 11:02 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > >
> > > > Hi Masahiro,
> > > >
> > > > I saw these warnings in my build-log:
> > > >
> > > >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > > ::p' include/linux/atomic/
> > > > atomic-arch-fallback.h)" != "$(sed '$d'
> > > > include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
> > > > .*//')" ]; then echo "error: include/linux/atomic/atomic-arch-f
> > > > allback.h has been modified." >&2; exit 1; fi; touch
> > > > .checked-atomic-arch-fallback.h
> > > >  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > > ::p' include/linux/atomic/
> > > > atomic-instrumented.h)" != "$(sed '$d'
> > > > include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
> > > > ]; then echo "error: include/linux/atomic/atomic-instrume
> > > > nted.h has been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
> > > >  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > > ::p' include/linux/atomic/
> > > > atomic-long.h)" != "$(sed '$d' include/linux/atomic/atomic-long.h |
> > > > sha1sum | sed 's/ .*//')" ]; then echo "error:
> > > > include/linux/atomic/atomic-long.h has been modified
> > > > ." >&2; exit 1; fi; touch .checked-atomic-long.h
> > > >
> > > > NOTE: I did a `make distclean` before I started my build.
> > > >
> > > > Can you please comment on this?
> > >
> > >
> > >
> > >
> > > Please clarify your problem.
> > >
> > > My best guess is, you just added V=1 option to
> > > print the full log, didn't you?
> > >
> > >
> > >
> > > I can see the same build log by running the following command.
> > >
> >
> > Hi Masahiro,
> >
> > you had a chance to look into this?
>
>
> I already replied.
> This is the output of V=1.
> There is no issue.
>

Hi Masahiro,

No, I disagree.

You demonstrated by:

$ make V=1 mrproper defconfig  prepare | grep sha1sum

That you see these warnings, too.

There is no statement that these warnings are OK.
If so, why?

Are those headers generated in build-time thus getting no/wrong sha1sums?

Please, clarify.

If you have time:
kbuild-next with a rework/refactoring of make V=xx does show these warnings?

Sorry for being pedantic - I started with Linux v6.2-rc4, again doing
some kernel-testing.
My goal is to have a warning-free build with LLVM-15 (ThinLTO + KCFI).

Right now, I will do some more testing.

Thanks.

BR,
-Sedat-

>
> >
> > Thanks.
> >
> > Regards,
> > -Sedat-
> >
> > >
> > > $ make V=1 mrproper defconfig  prepare | grep sha1sum
> > > + [ clean = clean ]
> > > + cleanup
> > > + rm -f .btf.*
> > > + rm -f System.map
> > > + rm -f vmlinux
> > > + rm -f vmlinux.map
> > > + exit 0
> > >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > ::p' include/linux/atomic/atomic-arch-fallback.h)" != "$(sed '$d'
> > > include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
> > > .*//')" ]; then echo "error:
> > > include/linux/atomic/atomic-arch-fallback.h has been modified." >&2;
> > > exit 1; fi; touch .checked-atomic-arch-fallback.h
> > >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > ::p' include/linux/atomic/atomic-instrumented.h)" != "$(sed '$d'
> > > include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
> > > ]; then echo "error: include/linux/atomic/atomic-instrumented.h has
> > > been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
> > >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > ::p' include/linux/atomic/atomic-long.h)" != "$(sed '$d'
> > > include/linux/atomic/atomic-long.h | sha1sum | sed 's/ .*//')" ]; then
> > > echo "error: include/linux/atomic/atomic-long.h has been modified."
> > > >&2; exit 1; fi; touch .checked-atomic-long.h
> > >
> > >
> > >
> > >
> > >
> > >
> > > >
> > > > Thanks.
> > > >
> > > > Best regards,
> > > > -Sedat-
> > >
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
>
>
>
> --
> Best Regards
> Masahiro Yamada
