Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC80671622
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jan 2023 09:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjARI0M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Jan 2023 03:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjARIZ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jan 2023 03:25:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D76F47404
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Jan 2023 23:51:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1982F61544
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jan 2023 07:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E86C433F0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jan 2023 07:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674028290;
        bh=mOxbsvAkGzEXEVQoRxbk7Lvx+aUlDl8nW+P9rPGpf30=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FHXkPmlMfUjE1bgRFco9W4FnSabSZc06kuY/FfkvrwdvmZ1iBaIF4mmWRdcIgqR/1
         2FoiYqLv+3YhXr+WYntMYOAP19WXzCxofQB5Z8VkvtbY1s3n9TeeXVifJ4An707Koo
         pws+gwp1me724XABFf6ML69w22WHkD4qtRNEkA45ChzbznzzJ08/hdZKHYiZEOTDJb
         /EikCwqSGqV4gHuwbbJPHauQb+CYCYJV0VV2FO/JAkAl6PRbFDwbRAdUEMJnXv/e0s
         tHXsDttDbES+7s4mSVeOcnEumuDD6agY8nhXowBqu734AQwaubicchqCZ31NBtZJOT
         kfaOfnURZPL6Q==
Received: by mail-oi1-f176.google.com with SMTP id r9so17216329oie.13
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Jan 2023 23:51:30 -0800 (PST)
X-Gm-Message-State: AFqh2kr6jS4KyupQEam8Y3SQuUrWQXRtFnLEAIQ9tH9nNknpBYeBCKxF
        6YlQivziRtZqxCL4NF239BIJjIguhBRccqHPM0I=
X-Google-Smtp-Source: AMrXdXtnfyS+u+BdkpIB3+QgCkWVBK70cVaMxW/ixbWoWSmQbU8ClJpeguxk3qArnqgA1CsdGvNbXxjYhA35ZxYmvmI=
X-Received: by 2002:aca:acd5:0:b0:364:5d10:7202 with SMTP id
 v204-20020acaacd5000000b003645d107202mr279587oie.194.1674028289671; Tue, 17
 Jan 2023 23:51:29 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
 <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com> <CA+icZUXJgR1MFtgpChvwr5iFa_FVr4bEGe3GAM62_3xNSmDeXQ@mail.gmail.com>
In-Reply-To: <CA+icZUXJgR1MFtgpChvwr5iFa_FVr4bEGe3GAM62_3xNSmDeXQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Jan 2023 16:50:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARzDnVk7JV6WLRYm54HkY4CVmpcv17YWkr9Q8GT2Epdig@mail.gmail.com>
Message-ID: <CAK7LNARzDnVk7JV6WLRYm54HkY4CVmpcv17YWkr9Q8GT2Epdig@mail.gmail.com>
Subject: Re: [6.2-rc4] warning: cannot check the header due to sha1sum missing
To:     sedat.dilek@gmail.com
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 18, 2023 at 4:45 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, Jan 16, 2023 at 4:21 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Mon, Jan 16, 2023 at 11:02 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > I saw these warnings in my build-log:
> > >
> > >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > ::p' include/linux/atomic/
> > > atomic-arch-fallback.h)" != "$(sed '$d'
> > > include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
> > > .*//')" ]; then echo "error: include/linux/atomic/atomic-arch-f
> > > allback.h has been modified." >&2; exit 1; fi; touch
> > > .checked-atomic-arch-fallback.h
> > >  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > ::p' include/linux/atomic/
> > > atomic-instrumented.h)" != "$(sed '$d'
> > > include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
> > > ]; then echo "error: include/linux/atomic/atomic-instrume
> > > nted.h has been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
> > >  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > ::p' include/linux/atomic/
> > > atomic-long.h)" != "$(sed '$d' include/linux/atomic/atomic-long.h |
> > > sha1sum | sed 's/ .*//')" ]; then echo "error:
> > > include/linux/atomic/atomic-long.h has been modified
> > > ." >&2; exit 1; fi; touch .checked-atomic-long.h
> > >
> > > NOTE: I did a `make distclean` before I started my build.
> > >
> > > Can you please comment on this?
> >
> >
> >
> >
> > Please clarify your problem.
> >
> > My best guess is, you just added V=1 option to
> > print the full log, didn't you?
> >
> >
> >
> > I can see the same build log by running the following command.
> >
>
> Hi Masahiro,
>
> you had a chance to look into this?


I already replied.
This is the output of V=1.
There is no issue.




>
> Thanks.
>
> Regards,
> -Sedat-
>
> >
> > $ make V=1 mrproper defconfig  prepare | grep sha1sum
> > + [ clean = clean ]
> > + cleanup
> > + rm -f .btf.*
> > + rm -f System.map
> > + rm -f vmlinux
> > + rm -f vmlinux.map
> > + exit 0
> >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > ::p' include/linux/atomic/atomic-arch-fallback.h)" != "$(sed '$d'
> > include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
> > .*//')" ]; then echo "error:
> > include/linux/atomic/atomic-arch-fallback.h has been modified." >&2;
> > exit 1; fi; touch .checked-atomic-arch-fallback.h
> >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > ::p' include/linux/atomic/atomic-instrumented.h)" != "$(sed '$d'
> > include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
> > ]; then echo "error: include/linux/atomic/atomic-instrumented.h has
> > been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
> >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > ::p' include/linux/atomic/atomic-long.h)" != "$(sed '$d'
> > include/linux/atomic/atomic-long.h | sha1sum | sed 's/ .*//')" ]; then
> > echo "error: include/linux/atomic/atomic-long.h has been modified."
> > >&2; exit 1; fi; touch .checked-atomic-long.h
> >
> >
> >
> >
> >
> >
> > >
> > > Thanks.
> > >
> > > Best regards,
> > > -Sedat-
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
