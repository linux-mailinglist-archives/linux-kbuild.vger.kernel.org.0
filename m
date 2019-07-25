Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC73A74CCA
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 13:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403988AbfGYLSX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 07:18:23 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:27299 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403940AbfGYLSX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 07:18:23 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6PBHwWF009905;
        Thu, 25 Jul 2019 20:17:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6PBHwWF009905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564053478;
        bh=O99g3Q92gg15AVvJroWDS691IzdWx4FzeR+mRv04QGU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=k7AKJfvT1vp+mEb24/fVQdxbQh+Am+/duUmK4cEfMp/Wk5fD5S5JgFn1u6o+q2h7T
         vgOWUxseNf9Xb4rK/VJrjj50hFFYi9ouQH04nKCgrZeZorbPMiFIacxufxDhw/7WSE
         uy/9/aDfS4uO6j9APQObmH8Z5AnTluPcMGtN/tg1iDYTTlVLhQu8Gd1fT0pIovCzET
         j5MPIsRiIzpXMOs8qJ9rOL7Na4wL+0913MwFK4344KdhrgO9o9XEuigK3e+4B3xxda
         BydSudCMqbrsvDP0SGgAMyjGqo+Rj1qagmWWuh26dlXISawG2epuIUMmE7IeNwrcEd
         xmjoSa4Hh13lg==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id 2so33420957vso.8;
        Thu, 25 Jul 2019 04:17:58 -0700 (PDT)
X-Gm-Message-State: APjAAAWmI9wIzQHkkARTHvkPTaGm/2eWKigMarZKqAXmMjxe+XuxORmW
        oTKSCKvWT4Kuk9mF3GYf4ZThjCoyEPsCLjk5OgE=
X-Google-Smtp-Source: APXvYqx210g/x+mN1qIDcqKttYDPVJy8/xhLB8dcLLlGrZ0UyGcV7aFyeOxz1KL+5IklRsyYam3rr6gAuZ0GvNSVnr0=
X-Received: by 2002:a67:d46:: with SMTP id 67mr55994217vsn.181.1564053477415;
 Thu, 25 Jul 2019 04:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190725080513.4071-1-yamada.masahiro@socionext.com> <20190725111256.GA30958@kroah.com>
In-Reply-To: <20190725111256.GA30958@kroah.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 25 Jul 2019 20:17:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNATcRXT8ptGpPhc4kods65AQsRbz2wmnq5=df35S2aWn7w@mail.gmail.com>
Message-ID: <CAK7LNATcRXT8ptGpPhc4kods65AQsRbz2wmnq5=df35S2aWn7w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: detect missing "WITH Linux-syscall-note" for uapi headers
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 25, 2019 at 8:13 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 25, 2019 at 05:05:13PM +0900, Masahiro Yamada wrote:
> > UAPI headers licensed under GPL are supposed to have exception
> > "WITH Linux-syscall-note" so that they can be included into non-GPL
> > user space application code.
> >
> > Unfortunately, people often miss to add it. Break 'make headers'
> > when any of exported headers lacks the exception note so that the
> > 0-day bot can easily catch it.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> > This patch depends on the following:
> >
> > https://lore.kernel.org/patchwork/patch/1105289/
> >
> > I will turn on the error after all headers are fixed.
>
> I've taken the dependancy here in the spdx tree and will send it to
> Linus for 5.3-rc2.

Thanks!

>  I can also take this now through that tree, or you
> can add it to yours afterward, which ever is easier for you.

I will create a branch on top 5.3-rc2
and queue this patch by myself.

Thank you.


-- 
Best Regards
Masahiro Yamada
