Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBD48101956
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2019 07:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfKSG0L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Nov 2019 01:26:11 -0500
Received: from mail-qk1-f169.google.com ([209.85.222.169]:42493 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfKSG0L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Nov 2019 01:26:11 -0500
Received: by mail-qk1-f169.google.com with SMTP id i3so4862827qkk.9
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2019 22:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SIxCKnkKzKFuiW294oszAJja2nNuZFcn2HEVJx85tIU=;
        b=immxAQCpxeixRJnW/KIOjBxbmu4EQNc/33R8O1qzLRipWyS7SJImMyvMbZceEZsQwO
         F8O0FpNI217eFm02LAhqoUk9CNluBD0SqM+e/xmK4pQWw+miIbtxgpVzNL7ww0ixZ8ac
         dXy4t2B4IdNBKK9vjeuLfi4VYJLf6TXpq98EAw00xKgw6MQbGHHLpSQz+nw1Pq00xcLO
         lthvWsBFY8eDY2UTA/yjpCd8m1X2BzncbXYWVoHK3Fj8qhPD4BiECU/hlvRSlkuZDMzB
         NXgLKh+tlY07Y/5izNaM5lPGYc8GZZlLCwRS8mx80iWdD1WFlqy3wjZJT85WMUg0lsz0
         O7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SIxCKnkKzKFuiW294oszAJja2nNuZFcn2HEVJx85tIU=;
        b=cTYQbbO3uma0pHS5vYhtfr+UVUkdjqeJuiNXh808BLbp77V5SrsA/VmVQEeYY9pp36
         P91gvxSPAIzudVBPwQNWlN0xLMQUnNpDGUmPl33sxLJuodn2JG1RKrJMxetPGvdvvqdM
         xXXMhCyQcJVskd+iQ4DP8TW2mnHdUC5OIFOJnK2WvExVftYSUQyHxf4pLoXaRbkMzW4y
         CbB/JaD1noGtNZCD8QMA45xqB299crEOYtpIWwfEU0SCSLlUqbc9Oh7RgvTycwv14U78
         HooZyvxBTkUlIy9ApJ4rBnvrMX3aBMmXn8xygCXuU1gV84iNc+OMjn2RUt9i1dEJJlxw
         TBiA==
X-Gm-Message-State: APjAAAUaB9QcV+gXV6PWC4uQCqLzsWMp3gxb9aMLm4SjdDgpvmQyEsNi
        GLKXwHuCDyI2dEdOlDxfbKdV9KVlfEZ9CjsJgV4=
X-Google-Smtp-Source: APXvYqz8pOSmReAHKlRBJSI3EheBGU/h1WE8yihC6/PmPvflcPfEW+EmdQ0wDebIJ1gdAp9h8PsPNRpOlqU+r6iK0FU=
X-Received: by 2002:ae9:eb06:: with SMTP id b6mr26136988qkg.422.1574144770038;
 Mon, 18 Nov 2019 22:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20191114060236.GA13066@oxygen> <CAK7LNAQDczMHTx_T2bY4ujQ0NmbxVV2fdzHWckV-uSwk8ue9gg@mail.gmail.com>
In-Reply-To: <CAK7LNAQDczMHTx_T2bY4ujQ0NmbxVV2fdzHWckV-uSwk8ue9gg@mail.gmail.com>
From:   vijai kumar <vijaikumar.kanagarajan@gmail.com>
Date:   Tue, 19 Nov 2019 11:55:59 +0530
Message-ID: <CALLGG_KCr6N6iGyZNE+=x1dJiShbz-NH7J2fyb2GQL0ZfcN28g@mail.gmail.com>
Subject: Re: KBUILD_IMAGE-reg
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 15, 2019 at 7:55 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Thu, Nov 14, 2019 at 3:02 PM Vijai Kumar K
> <vijaikumar.kanagarajan@gmail.com> wrote:
> >
> > Hi All,
> >
> > I see that we have moved from directly using KBUILD_IMAGE to "make image_name"
> > to decide the image to be included in the final deb package. Long ago when
> > I remember we could override KBUILD_IMAGE in the environment to include
> > the image of our choice in the deb pkg.
>
> I checked the old code, but I think it is unrelated to
> the image_name conversion.
>
> As far as I saw the code, it is not possible to
> override it from the environment variable,
> but possible from the command line.

I don't remember exactly but yeah something like that.

>
> >
> > Is this possible now by any other means? Because there are times when I
> > would like to include vmlinux instead of vmlinuz and just wondering how
> > one could go about accomplishing that.
>
>
> make bindeb-pkg KBUILD_IMAGE=vmlinux
>
> might work?
>

Let me give it a try.

Thanks,
Vijai Kumar K

>
>
> --
> Best Regards
> Masahiro Yamada
