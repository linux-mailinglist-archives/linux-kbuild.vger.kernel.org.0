Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898ABE27AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2019 03:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392237AbfJXBWj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Oct 2019 21:22:39 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:30540 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbfJXBWj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 21:22:39 -0400
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x9O1MYXU012475;
        Thu, 24 Oct 2019 10:22:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x9O1MYXU012475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571880154;
        bh=geAUxe+Ff9Y2Jv7XM1GA4xSYAZEDzRqLo9nk9PiEblg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tb9N+EMxvyHzDhZv7JF9FmYBRAi+LLFjNhOABzHjfnXw8Bpx+8q517V2wG98xlQKd
         brUuNyAHNpOuOvSIVsAD1g5LFFQrS/XpOHJ3iuvyFMuOrH9WOZ7SupCkvyYb2bpzQu
         9pa3UsbWp02UsfSmBmrGHl7EFZEfKJw09X54FAlQukJVC9X+J6Q9xrLJsVCOf3Xh2y
         h/DWu7CZJShdlnjl7O/kTDcjFPBjHzhW/7mKThPeQoENweXYSqYv6IRcnNHdh4ASIU
         aK20p0f8GFjhRMdvVj2viMIQYzesP22AJN7XlwUDMvkta4b4G/KfLNIZJkjJHIAnc5
         i4mZ+/VBAnEBA==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id u31so6643490uah.0;
        Wed, 23 Oct 2019 18:22:34 -0700 (PDT)
X-Gm-Message-State: APjAAAWp1tDDL2kp3IoTc3cDnS7KA//77CPStxDi2GtQwfSTyElv4eaF
        7ZQbKqr7JW0a+FuF2xEWuzPKG/dUAsFUt0C7DuE=
X-Google-Smtp-Source: APXvYqy9MnE6a8zlXdK8RgZ13zxQkZtNSf6lCRsUJYZynPIbxfNruMIbpkSGbKOEW//zNOd27Yv03EgJOvtVF4h1hiQ=
X-Received: by 2002:a9f:3e81:: with SMTP id x1mr7429935uai.121.1571880153351;
 Wed, 23 Oct 2019 18:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
 <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org> <02874ECE860811409154E81DA85FBB58968DBE54@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARyUEakeG_N9TWcO2cjFSzbgY__k_QJm6C+oOz+fW0aeg@mail.gmail.com>
 <02874ECE860811409154E81DA85FBB58968E1402@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARAhZtzdnS9+mgtamj=pLdV81dudnYVDa8NRxcQPpF0bw@mail.gmail.com> <02874ECE860811409154E81DA85FBB589693A38A@ORSMSX121.amr.corp.intel.com>
In-Reply-To: <02874ECE860811409154E81DA85FBB589693A38A@ORSMSX121.amr.corp.intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 24 Oct 2019 10:21:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQow8N9a5e_=pu7qDiuvETy1x1P5fxp20zYOZgQhXPJhg@mail.gmail.com>
Message-ID: <CAK7LNAQow8N9a5e_=pu7qDiuvETy1x1P5fxp20zYOZgQhXPJhg@mail.gmail.com>
Subject: Re: [PATCH] namespace: fix namespace.pl script to support relative paths
To:     "Keller, Jacob E" <jacob.e.keller@intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 24, 2019 at 6:34 AM Keller, Jacob E
<jacob.e.keller@intel.com> wrote:
>
> > -----Original Message-----
> > From: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Sent: Tuesday, October 22, 2019 10:22 PM
> > To: Keller, Jacob E <jacob.e.keller@intel.com>; Randy Dunlap
> > <rdunlap@infradead.org>
> > Cc: intel-wired-lan@lists.osuosl.org; linux-kernel@vger.kernel.org; linux-kbuild
> > <linux-kbuild@vger.kernel.org>
> > Subject: Re: [PATCH] namespace: fix namespace.pl script to support relative
> > paths
> >
> > This scripts has been 5-year broken,
> > and I did not see any complaint except from you.
> > So, I wonder how many people are using this.
> >
> > Nor, do I understand how to use it.
> >
> > Could you teach me a bit more about this script?
> >
> >
> >
> > Something might be missing in my mind, but
> > I do not know how to use this script in a useful way.
> >
> >
> >
> > It provides three checks.
> >
> > [1] list_multiply_defined()
> >
> > This warns multiple definition of functions.
> >
> > The compiler would fail if it saw any multiple definition,
> > so the reports from this check are all false-positive.
> >
> >
> > [2] resolve_external_references()
> >
> > This warns unresolved symbols.
> >
> > The compiler would fail if it saw any unresolved symbol,
> > so the reports from this check are all false-positive, too.
> >
> >
>
> The compiler won't necessarily fail when building modules, because the symbol might be in another loadable module.

Right, but this is already checked by modpost, isn't it?



> >
> >
> > [3] list_extra_externals
> >
> > This warns symbols with no reference.
> >
> > This potentially contains lots of false-positives.
> > For example, the core framework provides APIs, but if all drivers
> > are disabled, there is no user of those APIs.
> >
>
> We use this to help verify that driver modules do not expose symbols.

Ah, the output is quite large, so
you search for only modules in your interest. Right?


If you want to detect missing 'static',
have you tried 'sparse'?



> Thanks,
> Jake



-- 
Best Regards
Masahiro Yamada
