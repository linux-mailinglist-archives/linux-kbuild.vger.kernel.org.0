Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D695EA77C
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Sep 2022 15:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235604AbiIZNkP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Sep 2022 09:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234998AbiIZNj2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Sep 2022 09:39:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499287B1D4
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Sep 2022 04:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664193441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=El6s5Me40WjqNMPIsI01upfNOG9tCRVFThB/uqNE3Fc=;
        b=AkaKGJh48VVWrJO/1hqUtCftnDjZdRIKhx/hvjuyO8dgo0tuWFIc7WvAWJnqANuAO3Q85K
        LkJ9kKuwkQb9F+RN/3/55r7BtWgBb0KhzkAjlYq9kq7BZTAZ2Ne4dtihAI2hOjtwuaLjzk
        QTyYSbvH156QFf0p0dVOJ4U4plZ3ZA0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-370-5duyb1-SMO-vcKU1R3g0IQ-1; Mon, 26 Sep 2022 07:35:32 -0400
X-MC-Unique: 5duyb1-SMO-vcKU1R3g0IQ-1
Received: by mail-ua1-f71.google.com with SMTP id a26-20020ab0081a000000b003b752547aadso1462935uaf.22
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Sep 2022 04:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=El6s5Me40WjqNMPIsI01upfNOG9tCRVFThB/uqNE3Fc=;
        b=EqfEBLa3zmb/D03mLEJJF+9xO2k+MJJhic+vA1vgwqW0DSrIFXnIq5B12hTgN6s0oc
         CAi1UGtaAaopOu4Wq0JvAd08H4NFZpP84NOh/ftw+83SLHPgpepaLLsRPSEUyBxCXYTn
         NgEa0e5gNe8Hi93ZoZlryMTK6YBLYcPZDRL+QSZ0y0fuWy+6DeZ9BnXYDctKuxJXCG/J
         IJ/9RxnVlaCRyFQWQsrqTIhzPh/r1+HjuO6EwTOzyQVhKpAZcZiPtXBt2J4GS308QriU
         2UJSsQZGK4hF6+3YeuPe3ttPb4PRTZ7f3r62w4kyRPFa+nvHdGjBMlNisC6u6HdewJCN
         ykiQ==
X-Gm-Message-State: ACrzQf3IWjVwRhLYQFG1KAg0hbCUh8w+CdsCdEnmUX3+cZAZ/ZUD/9z1
        WUdFYXG+mQE66yKBFAsqXJkPtdFt8Y/N9GOk5oTadrub+53VgwFid2xG+xWUIMUfNBDoiZY7zAe
        6UoPbBZEDGqggS33dm4ehX0ZdsqU/HxxvMuRANeO7
X-Received: by 2002:a67:dc98:0:b0:398:c70f:9357 with SMTP id g24-20020a67dc98000000b00398c70f9357mr7700214vsk.76.1664192131937;
        Mon, 26 Sep 2022 04:35:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7QffRF1yNXJ07+v6HXx6c3EHwuogm4Tj8Rvx8Y1YOfwF0OM48DctOrSJEUHph+UD/b5tVJ6lKINT5kRwE2x6k=
X-Received: by 2002:a67:dc98:0:b0:398:c70f:9357 with SMTP id
 g24-20020a67dc98000000b00398c70f9357mr7700205vsk.76.1664192131763; Mon, 26
 Sep 2022 04:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAH7mPvj64Scp6_Nbaj8KOfkoV5f7_N5L=Tv5Z9zGyn5SS+gsUw@mail.gmail.com>
 <ba821ade-1573-4c35-8fbb-285283817147@app.fastmail.com> <478D9484-E404-4A96-908C-4DE0F7C23997@cutebit.org>
In-Reply-To: <478D9484-E404-4A96-908C-4DE0F7C23997@cutebit.org>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Mon, 26 Sep 2022 12:35:15 +0100
Message-ID: <CAOgh=Fx-sjUKBCPSYX+6JEn39Vv6LLkTMBVRCOGOa9AfJ4Trag@mail.gmail.com>
Subject: Re: Any interest in building the Linux kernel from a MacOS host?
To:     =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc:     Sven Peter <sven@svenpeter.dev>,
        Nick Desaulniers <nick.desaulniers@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <llvm@lists.linux.dev>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        asahi@lists.linux.dev,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 26 Sept 2022 at 10:21, Martin Povi=C5=A1er <povik+lin@cutebit.org> =
wrote:
>
> FWIW my current workflow includes building the kernel under macOS, so
> there=E2=80=99s some interest from me, but that will pass once the portin=
g
> project progresses enough. So far I get by with some local duct tape.
>
> > On 26. 9. 2022, at 10:09, Sven Peter <sven@svenpeter.dev> wrote:
> >
> > On Mon, Sep 26, 2022, at 09:51, Nick Desaulniers wrote:
>
> (...)
>
> >> If this might seem helpful
> >> to anyone's workflow, I wouldn't mind pursuing this (with some
> >> cleanup, sending a more formal patch set).  Maybe this helps us
> >> bootstrap or get Linux up and running sooner on these machines?
> >
> > I've been either using a Linux VM or just a bare metal system running
> > on these machine for quite a while now to build kernels. This would've
> > been useful when I originally started though and VMs weren't working ve=
ry
> > well yet so maybe it's still worth pursuing.
>
> I really wanted to do it in a VM as a saner path, but I didn't find
> a satisfactory way to share the working source tree between the macOS
> host and Linux guest (which wouldn't slow down the build).

My way of doing this efficiently is to create throwaway commits, in
git, just to push code around to various physical or virtual machines
in my house. Because git is really fast at pushing incremental changes
around:

https://github.com/ericcurtin/staging/blob/master/git-push.sh

But if you eventually find a way to share a filesystem (which wouldn't
slow down the build) between MacOS and a Linux host via qemu or
something like that I'd be interested, that's most ideal of course.

>
> Martin
>
> >>
> >> Take a look at the commit message linked below for the trials &
> >> tribulations:
> >> https://github.com/ClangBuiltLinux/linux/commit/f06333e29addbc3d714adb=
340355f471c1dfe95a
> >>
> >> Thanks,
> >> ~Nick Desaulniers
> >
> >
> > Best,
> >
> >
> > Sven
> >
>
>

