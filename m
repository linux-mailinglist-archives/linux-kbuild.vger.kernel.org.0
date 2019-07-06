Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDD16111B
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2019 16:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfGFObQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jul 2019 10:31:16 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:20388 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbfGFObQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 10:31:16 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x66EUn7u022189;
        Sat, 6 Jul 2019 23:30:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x66EUn7u022189
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562423450;
        bh=Bepz+VDqL2CS7UF5pC+BrXp2jbRzIaOMnzArYXGSTrQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kMiED+4tKNapSEQY/eTp2mbPb9GANSvQld3p26NjccmxXc00nTJOf8k3Jqn7ucPZB
         ZjRV4f9eOq8/RpWlvN3+C5axMvYrq5k3dZHfbMap/mK6CcGgk6ZXt67U0LZMICj56E
         FRan7BcJddeNCx2iIY3Kse8cKRRVFvT/kSdM+Nt2hbmRNQQdOGe6PbgUHMLejc2KAE
         dDzViS2K+WiddIoq1PBCHuHCigxowtGBGnENeufT/CBY7/gW5Rx+uv9KsPaKFJVGKK
         vHGE24rYXSgJwIfhzB5S6HBYMzzh1HijA31ZxvIMC+jMgh7yWMWo0HjNHQgXkDUD5y
         5OLd2RNAVJ+pw==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id h28so5506458vsl.12;
        Sat, 06 Jul 2019 07:30:50 -0700 (PDT)
X-Gm-Message-State: APjAAAVMsDqzgA6ggKLJ8gMXq4gMGQxf+sjchtt69L2o4XNBSmC2PM07
        q+A0qSmOx7AiHeubkvtIim9bjuZw0oHyKKeg6SI=
X-Google-Smtp-Source: APXvYqzKkPnGMwxJaqnDeRfi6kMqiA6kVDFTNddG1hi+bBgeSX+WWgaUE1n2i3RKOJefn07RPtPr6TlhmQ34iDvbRdo=
X-Received: by 2002:a67:f495:: with SMTP id o21mr5351982vsn.54.1562423448924;
 Sat, 06 Jul 2019 07:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190625085127.9446-1-yamada.masahiro@socionext.com> <20190626143046.GA12510@ravnborg.org>
In-Reply-To: <20190626143046.GA12510@ravnborg.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 6 Jul 2019 23:30:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASKv4gRSQemA-yKqguuwpcMhATZ1hCxM2pfXDRXRcCJpg@mail.gmail.com>
Message-ID: <CAK7LNASKv4gRSQemA-yKqguuwpcMhATZ1hCxM2pfXDRXRcCJpg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add more hints about SUBDIRS replacement
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Xi Wang <wangxi11@huawei.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 26, 2019 at 11:30 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Tue, Jun 25, 2019 at 05:51:27PM +0900, Masahiro Yamada wrote:
> > Commit 0126be38d988 ("kbuild: announce removal of SUBDIRS if used")
> > added a hint about the 'SUBDIRS' replacement, but it was not clear
> > enough.
> >
> > Multiple people sent me similar questions, patches.
> >
> >   https://lkml.org/lkml/2019/1/17/456
> >
> > I did not mean to suggest M= for building a subdirectory in the kernel
> > tree.
> >
> > >From the commit 669efc76b317 ("net: hns3: fix compile error"), people
> > already (ab)use M=... to do that because it seems to work to some extent.
> >
> > Documentation/kbuild/kbuild.txt says M= and KBUILD_EXTMOD are used for
> > building external modules.
> >
> > In fact, Kbuild supports the single target '%/' for this purpose, but
> > this may not be noticed much.
> >
> > Kindly add more hints.
> >
> > Makefile:213: ================= WARNING ================
> > Makefile:214: 'SUBDIRS' will be removed after Linux 5.3
> > Makefile:215:
> > Makefile:216: If you are building an individual subdirectory
> > Makefile:217: in the kernel tree, you can do like this:
> > Makefile:218: $ make path/to/dir/you/want/to/build/
> > Makefile:219: (Do not forget the trailing slash)
> > Makefile:220:
> > Makefile:221: If you are building an external module,
> > Makefile:222: Please use 'M=' or 'KBUILD_EXTMOD' instead
> > Makefile:223: ==========================================
> >
> > Suggested-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Nice!
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
>         Sam

Applied to linux-kbuild.

-- 
Best Regards
Masahiro Yamada
