Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABC5386BE0
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 May 2021 23:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239602AbhEQVFF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 May 2021 17:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244672AbhEQVFF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 May 2021 17:05:05 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC63C061573
        for <linux-kbuild@vger.kernel.org>; Mon, 17 May 2021 14:03:47 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id b13so2086033pfv.4
        for <linux-kbuild@vger.kernel.org>; Mon, 17 May 2021 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NFB5106dlh914kkGvof6mmjDplB5zuvKbDYJ0xUs4tY=;
        b=GqleHTmFQ/ZUdnEMmDPY/eRGtzR7Dkhz3torZnN3f97390cguw8vPOAjTEejyRUQun
         6qhNJ0vbQsRaEgbPlqomAzVoPsN6ZpM/lJkgymi5eIp2wDvSTp45WNTRtU3/KyyFfKP5
         PRxpoRfnBmiAxzDqRBq4qMQAMFSQdTeZBHtofy32AxjfnZKnigmKCO+bSSOYSq2eGxck
         /bS7T/aJhm1wgWU7LsGbsd95/nNrxyVx2AWeIcf0MPvxv2ux+5pqeWawX0Ur/zWThfyU
         5Prciczax1dw0J0847tTS7vN9ijhyJGummYcizCZ2P+UXEhESNIPEGw8nHv8ydjJA63P
         VNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NFB5106dlh914kkGvof6mmjDplB5zuvKbDYJ0xUs4tY=;
        b=pTVW0aA995lDAdPCQJodTSUJC/MMyPWRMtuJNE6zr5HT4HliGWAcNR39E5RUIiedUA
         MyJYRwzDEG7NVxv4unbjIKDNB8f9PCm6p5YY1PPO9hgkAt0aU8AJ/H0d0ufSENeviOZX
         IstssRfNzQhJlMbC7Zq6zyZ/kjmhoc+Nnv7Qsm+mXRuc47FjC/0MPdkXU42PYeVvTs/x
         oMi5JCG9Q6PsTq5+zYK2VTfPMpu1bY9caf9Wf6lnZtpnf8AGBe4E5i6UgbW2xo4bCYA1
         mmWDQnuaCxFSwhf95SWA2dBbbJDaikHJs85YsuUajf7rzYCKbu/aVP3bqHscoPFCRfAU
         FeCQ==
X-Gm-Message-State: AOAM533A3v5/pxo5SF18WsK0h/XItVrrXEVBggW2BAFTs1cQQzyeH9Y3
        utZF1wmoiHpinfaCvi30KEY0WJEOVeXe0H8fUiOsDOUb+gs=
X-Google-Smtp-Source: ABdhPJzoWVe+uo1zPRBf/vE6584VjSj6vvVJhBN1I5+/vp45VCkYZ3xAm7LFllKkP1ZSthsNUou7KVkB1OgWtI/eAXw=
X-Received: by 2002:a63:344c:: with SMTP id b73mr1396254pga.79.1621285426533;
 Mon, 17 May 2021 14:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRSmLsJmR_NFcovYSP-gK52qDASP4csbaOjx2Sfk9HvhHvAfQ@mail.gmail.com>
 <CAGRSmLtsWvPhbmEkLNWC8FAtkvXBWSBRunAKNYUCRah2m+y2sQ@mail.gmail.com>
 <CAK7LNASoK0yhDdeoj1GPELTQ_sz3h=aVdTPUNj-4m6Zacj1fvw@mail.gmail.com> <CAGRSmLtY0WejKxNJ3xggPivmYhTK6tQ7LSfEZHtAaJQCQHdeTw@mail.gmail.com>
In-Reply-To: <CAGRSmLtY0WejKxNJ3xggPivmYhTK6tQ7LSfEZHtAaJQCQHdeTw@mail.gmail.com>
From:   "David F." <df7729@gmail.com>
Date:   Mon, 17 May 2021 14:03:35 -0700
Message-ID: <CAGRSmLsCOTxYD3nA-JTNBeVA0aAe8RTGkj18pSBJKMYAtqiQXg@mail.gmail.com>
Subject: Re: 5.10 build issue creating library for driver support.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Any ideas on a patch to fix it?

On Fri, Apr 30, 2021 at 10:04 PM David F. <df7729@gmail.com> wrote:
>
> The old 5.4 patch fixed the problem I had then which was linking with
> a library, this one is that it won't *create* the library.
>
> "No rule to make target '/path/to/sourcefile.o', needed by '/path/to/lib.a' Stop
>
> With 5.10 you get the above problem with 5.4 without the patch you can
> still create it, just can't link with it, with the patch it works
> perfectly.  So it's new in 5.10.
>
> Thanks!!
>
> On Sun, Apr 25, 2021 at 10:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Sat, Apr 24, 2021 at 10:26 PM David F. <df7729@gmail.com> wrote:
> > >
> > > Hello,
> > >
> > > I moved to 5.10 from 5.4 now I have build problem:
> > >
> > > "No rule to make target '/path/to/sourcefile.o', needed by '/path/to/lib.a' Stop
> > >
> > > The build will build a small library file of shared driver support
> > > routines, but it doesn't appear the build will support a library
> > > anymore?  Is there a patch for that?
> > >
> > > There was a patch that fix a prior problem of linking to a lib.a file:
> > >
> > > Subject: Moving from 4.x to 5.4.22 breaks custom module build.
> > >
> > > Is there a fix for this new issue?
> > >
> > > Thanks.
> >
> >
> > I think you asked the same question before,
> > and you found a patch.
> >
> > https://patchwork.kernel.org/project/linux-kbuild/patch/20200106032324.3147-1-masahiroy@kernel.org/#23088533
> > Doesn't this solve your problem?
> >
> > --
> > Best Regards
> > Masahiro Yamada
