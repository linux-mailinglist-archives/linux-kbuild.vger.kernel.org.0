Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9484EC9975
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 10:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbfJCID7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Oct 2019 04:03:59 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63836 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbfJCID7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 04:03:59 -0400
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x9383tqX012642;
        Thu, 3 Oct 2019 17:03:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x9383tqX012642
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570089836;
        bh=ywElMDcopw8TFE1ECGxXNxiLFEr+8ZD48GBXZOvm644=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F1L8/y7QLw72synjYb9Nrgh27DtQuVR5PhMLQLq5Qa/mjbpkyEHZ5HfeuW8QlhyJg
         5JHOoTYaBJBl3hE3HCQcpzm/elTzpF3sf/n+fN2uHdODHqPEpG76ghqMkvhGvW+/mS
         dIxOb+GltXbkeG/LIOViWxJS3SXlWE/nSRPONckFrHog16dSzJzjpkwANkxXyBGPij
         m0CKF2dnG151t8vUNDmCi3T9JV1yxMUABBw6soltSpDbemy0lwB842wXuGJ5joMzKD
         +vKIIose2H318QJC9hmI3bLypBIqcpcHNmxjWJfvEOmLdc+4yrNTmGLCeEDSF3oXnx
         YkkJ6RV85DBDQ==
X-Nifty-SrcIP: [209.85.221.180]
Received: by mail-vk1-f180.google.com with SMTP id q186so426896vkb.0;
        Thu, 03 Oct 2019 01:03:55 -0700 (PDT)
X-Gm-Message-State: APjAAAWCSlpm0fmg8IBBEcLqSgryxHlXrT/Rf56Z+SSVH7U0ueQcTLPO
        XJ3yP4IZBDKH6+kyL7RqOwI1sYWL8YVMI+HWJHU=
X-Google-Smtp-Source: APXvYqy5LNXAWTwk0S2UpLneDJtLdgCWOioEoR/q3SaJwmOCjBXrCwISUJUUU8/ZICI0x8tLSLnJXGXo3OPutoSdrdI=
X-Received: by 2002:a1f:2343:: with SMTP id j64mr4251399vkj.84.1570089834846;
 Thu, 03 Oct 2019 01:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927134108.GC187147@google.com> <20191002185701.GA29041@linux-8ccs>
In-Reply-To: <20191002185701.GA29041@linux-8ccs>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 3 Oct 2019 17:03:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQy7FjBeXTA=R=-0Tm+6m0ENVin7SPFQWcvF8zJ2etvvg@mail.gmail.com>
Message-ID: <CAK7LNAQy7FjBeXTA=R=-0Tm+6m0ENVin7SPFQWcvF8zJ2etvvg@mail.gmail.com>
Subject: Re: [PATCH 0/7] module: various bug-fixes and clean-ups for module namespace
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jessica,

On Thu, Oct 3, 2019 at 3:57 AM Jessica Yu <jeyu@kernel.org> wrote:
>
> +++ Matthias Maennich [27/09/19 14:41 +0100]:
> >On Fri, Sep 27, 2019 at 06:35:56PM +0900, Masahiro Yamada wrote:
> >>
> >>I was hit by some problems caused by the module namespace feature
> >>that was merged recently. At least, the breakage of
> >>external module builds is a fatal one. I just took a look at the code
> >>closer, and I noticed some more issues and improvements.
> >>
> >>I hope these patches are mostly OK.
> >>The 4th patch might have room for argument since it is a trade-off
> >>of "cleaner implermentation" vs "code size".
> >>
> >Thanks Masahiro for taking the time to improve the implementation of the
> >symbol namespaces. These are all good points that you addressed!
>
> Agreed, thanks Masahiro for fixing up all the rough edges! Your series
> of fixes look good to me, I will queue this up on modules-next this
> week with the exception of patch 4 - Matthias, you are planning to
> submit a patch that would supercede patch 04/07, right?
>
> Thanks!


I missed to fix one issue in v1.
sym_add_exported() misses to set s->namespace
if the struct symbol is already created by
read_dump() or sym_update_crc().


So, I just sent v2.

-- 
Best Regards
Masahiro Yamada
