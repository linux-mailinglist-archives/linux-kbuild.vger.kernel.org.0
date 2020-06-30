Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E4A20EC3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 05:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgF3Dyd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 23:54:33 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43326 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgF3Dyd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 23:54:33 -0400
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 05U3s5U1020752;
        Tue, 30 Jun 2020 12:54:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 05U3s5U1020752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593489246;
        bh=JECo40EbR/FAgDdhX7Qpr3obuhVW20QTHLlBWlLFGcI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r++1Y6Le6z4U/01lwLVjmyWCTVWGbc7OLUh3tQDKqh1nicg4d00+cye0xg0u2GB1S
         CIlgcB/PST7oCR2OyA1How/cO0aUK5+BexLpI+XtrPn4gx9qilm5CUkiqIM3pWfKei
         10AxBTfTKIXW9dJKf9kQ5yO/T1WNL63gfndl5qF+7V/2/Zn+UB0qUDS0GegHEyGXwM
         D8vrBmI/91nI6VCCa9wA+4lH8NLtAR4p3r6c5O99xAFsPTxel8qQeITO1zrj0kH1Ym
         +i8vsPXGzItrnjOHjx3qF8yLTsXzBmkBcYEosDUicJSeliYok+FLi0ZpRdwnYgIt3V
         hCSPr+Gxum7tg==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id 66so823732vka.13;
        Mon, 29 Jun 2020 20:54:05 -0700 (PDT)
X-Gm-Message-State: AOAM53332bD+KK4EzIb++Qpg1bVZM02j3O0L6MfxBcetEtd8Lf2dHsjA
        aF9LUKgIqWcHmPE0iA9Mu3tMxBjHe/3yvAX2XnQ=
X-Google-Smtp-Source: ABdhPJw5IgkNKufBPzXbsqTpAGEYtkxHaLH4WvsV/5ztcWnutVf80BHAV+759dcBM3pQwUU6h/r6IyYh0OZweKSu0dM=
X-Received: by 2002:a1f:1f04:: with SMTP id f4mr12354992vkf.73.1593489244899;
 Mon, 29 Jun 2020 20:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200625154226.25692cd1@coco.lan> <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
 <c3c58115168c983eb1d441daa7cc84378cf33f39.camel@redhat.com> <CAK7LNAT5meMz0LF3C-2FnA6S8dettg4uJO-=FvsnCZ3H6+CVng@mail.gmail.com>
In-Reply-To: <CAK7LNAT5meMz0LF3C-2FnA6S8dettg4uJO-=FvsnCZ3H6+CVng@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 30 Jun 2020 12:53:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR55e+7KOULho2smK82Z0LxSg0UC8V9R8GTvfZOhg4i0A@mail.gmail.com>
Message-ID: <CAK7LNAR55e+7KOULho2smK82Z0LxSg0UC8V9R8GTvfZOhg4i0A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: Fix find on split mode
To:     Maxim Levitsky <mlevitsk@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 28, 2020 at 11:42 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sun, Jun 28, 2020 at 5:40 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> >
> > On Thu, 2020-06-25 at 16:52 +0200, Mauro Carvalho Chehab wrote:
> > > The logic handling find on split mode is currently broken.
> > > Fix it, making it work again as expected.
> >
> > I tested this patch and it works well.
> > There is one really small cosmetic issue:
> >
> > If you select search result, and then select another search result
> > which happens not to update the 'menu', then both the results are
> > selected (that is the old one doesn't clear its selection)
>
> I see this too.
> So, this can be improved somehow...



I dropped this one
because it was superseded by the new version.


-- 
Best Regards
Masahiro Yamada
