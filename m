Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1082E1188
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2019 07:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389090AbfJWFWV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Oct 2019 01:22:21 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39393 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732286AbfJWFWU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 01:22:20 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x9N5MD1d007091;
        Wed, 23 Oct 2019 14:22:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x9N5MD1d007091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571808134;
        bh=4uWhQkSgKJyJpi9dgEd8rnoW9JQaybqUylXhhSC0nec=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AzcLO0MjlBC1/BEeJm9qyRkRgcPAkYv4QxMtxeUo3Re7hVadzJzlkr5g7u8mhf8wL
         I+FMIbGBt8bkCzOTcIPamlUfqvlNGvtpEsBYRyKfjRIYHYFT4wSiqZzNWOFUEnb15o
         hWUQlgxEJv3mbTl/jyR4fr/ZdqE8uH/8GN+Fhd4ko8xwKe9gfKUG2g20ZZDWqO0P1s
         /plJux5tDnUCVn4pFMz+DABNLRK0tD114Ty+lCe15mBfEA3Kb8QH9RQ4GjOb4doMG6
         DAl4aRfvENZzyWk7XJ0sBdiLQHwbQOS3gTV2ItHPoVXIXamYJsftRc+Hk8VhWOJ9zs
         8PZTF/aGNWHVA==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id c25so359145uap.10;
        Tue, 22 Oct 2019 22:22:13 -0700 (PDT)
X-Gm-Message-State: APjAAAWGp1y1nH591KZ/9/uQ/oi+d2onTR7whgW3HK3buHnMglNPfh6E
        g20YLU1NngUZnQZCrgqOXk2g8by3vryN9O2KrOo=
X-Google-Smtp-Source: APXvYqxLqGkSOgIFRyd9PTxHyI25VNUcERzN0x2gYGlStMqZTJ+flp75axCjaZb/WyR7UjkEmRdgV01UzlT91dSwPgk=
X-Received: by 2002:a9f:3824:: with SMTP id p33mr4091753uad.109.1571808132530;
 Tue, 22 Oct 2019 22:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
 <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org> <02874ECE860811409154E81DA85FBB58968DBE54@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARyUEakeG_N9TWcO2cjFSzbgY__k_QJm6C+oOz+fW0aeg@mail.gmail.com> <02874ECE860811409154E81DA85FBB58968E1402@ORSMSX121.amr.corp.intel.com>
In-Reply-To: <02874ECE860811409154E81DA85FBB58968E1402@ORSMSX121.amr.corp.intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 23 Oct 2019 14:21:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNARAhZtzdnS9+mgtamj=pLdV81dudnYVDa8NRxcQPpF0bw@mail.gmail.com>
Message-ID: <CAK7LNARAhZtzdnS9+mgtamj=pLdV81dudnYVDa8NRxcQPpF0bw@mail.gmail.com>
Subject: Re: [PATCH] namespace: fix namespace.pl script to support relative paths
To:     "Keller, Jacob E" <jacob.e.keller@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 1, 2019 at 5:49 AM Keller, Jacob E <jacob.e.keller@intel.com> wrote:
>
> > -----Original Message-----
> > From: Masahiro Yamada [mailto:yamada.masahiro@socionext.com]
> > Sent: Saturday, September 28, 2019 5:21 PM
> > To: Keller, Jacob E <jacob.e.keller@intel.com>
> > Cc: Randy Dunlap <rdunlap@infradead.org>; intel-wired-lan@lists.osuosl.org; linux-
> > kernel@vger.kernel.org; linux-kbuild <linux-kbuild@vger.kernel.org>
> > Subject: Re: [PATCH] namespace: fix namespace.pl script to support relative paths
> >
> > On Sat, Sep 28, 2019 at 8:30 AM Keller, Jacob E
> > <jacob.e.keller@intel.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Randy Dunlap [mailto:rdunlap@infradead.org]
> > > > Sent: Friday, September 27, 2019 4:12 PM
> > > > To: Keller, Jacob E <jacob.e.keller@intel.com>
> > > > Cc: intel-wired-lan@lists.osuosl.org; linux-kernel@vger.kernel.org; linux-kbuild
> > <linux-
> > > > kbuild@vger.kernel.org>; Masahiro Yamada <yamada.masahiro@socionext.com>
> > > > Subject: Re: [PATCH] namespace: fix namespace.pl script to support relative paths
> > > >
> > > >
> > > > re: https://lore.kernel.org/lkml/20190129204319.15238-1-
> > jacob.e.keller@intel.com/
> > > >
> > > > Did anything happen with this patch?
> > > >
> > > > Please send it to linux-kbuild@vger.kernel.org and
> > > > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > >
> > > > You can also add:
> > > > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > > > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> > > >
> > > >
> > > > I was just about to fix this script but I decided to first see if anyone else
> > > > had already done so.  Thanks.
> > > >
> > > > --
> > > > ~Randy
> > >
> > > Done, thanks.
> > >
> > > Regards,
> > > Jake
> >
> >
> > Applied to linux/kbuild. Thanks.
> >
>
> Great, thanks!


This scripts has been 5-year broken,
and I did not see any complaint except from you.
So, I wonder how many people are using this.

Nor, do I understand how to use it.

Could you teach me a bit more about this script?



Something might be missing in my mind, but
I do not know how to use this script in a useful way.



It provides three checks.

[1] list_multiply_defined()

This warns multiple definition of functions.

The compiler would fail if it saw any multiple definition,
so the reports from this check are all false-positive.


[2] resolve_external_references()

This warns unresolved symbols.

The compiler would fail if it saw any unresolved symbol,
so the reports from this check are all false-positive, too.




[3] list_extra_externals

This warns symbols with no reference.

This potentially contains lots of false-positives.
For example, the core framework provides APIs, but if all drivers
are disabled, there is no user of those APIs.




I built the kernel with x86_64_defconfig,
and namespacecheck provides

1400 line reports for [1].
200 line reports for [2].
6800 line reports for [3].

Most of these seem false-positives.



How can I use it for the code improvement?

[3] might be still useful to find 'static' candidates,
but it would be difficult given the amount of the report.

-- 
Best Regards
Masahiro Yamada
