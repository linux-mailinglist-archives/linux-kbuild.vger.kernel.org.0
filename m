Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E292FBE86
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 19:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391273AbhASSE4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 13:04:56 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:53241 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391729AbhASSEt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 13:04:49 -0500
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 10JI3IuG030161;
        Wed, 20 Jan 2021 03:03:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10JI3IuG030161
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611079399;
        bh=Ih7uwrWIh1HlT4Bc+Bd5iTe6Q63d4u9Mx0JTTh7N4Ug=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KM5PWRQrwfCfqgU14773qcBkj9sdwuMflIn/HzqPOsqDJKxCgDea5uV/7DQFcTL0K
         E9Crbzoui4pWklS6fFn5Lfo8F2oUAsKOmC2Zwe18TKxJ8IGF6tTg/1qN6FLJClKhPg
         Q8hhl9QEHAxQdIshBS1z+7E1iqRHf3I0Wm3svUuyrXD17MtDo6yKPvq2o+xi6JQ6eI
         JfyxEz/1rDCJ4W/QVng6kpMVurtfxxYeYyN4y0qcuTXY+seuGum907PO00X33xZ4re
         7SGlfTpQotEVjrp9qnC0hppDz8Ni3G/qIyi7LyvvcDho7P6e9p3oHxCr2OyZdUNma9
         H8lVJ/OwsAGew==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id t29so7609526pfg.11;
        Tue, 19 Jan 2021 10:03:19 -0800 (PST)
X-Gm-Message-State: AOAM531E7gOaGpMKcBaCFpWbqleDbiXIS90CjEkZsQguQs5eBDQWRk9/
        umtBc7tBIW/5TLF8siJgKRh5ZJ+qKtLITwNtyZU=
X-Google-Smtp-Source: ABdhPJxBpF/ghiNg93VnhoLmAjEg1PtnutvOti9CufgdcHqH6TGkLf7T6urYAC9EXiN5oCOBPAD1P8xkeGWzCC4REkc=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr5491577pgf.47.1611079398308;
 Tue, 19 Jan 2021 10:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20210118195453.761623-1-sashal@kernel.org> <YAb5+R1R74QXds3o@kroah.com>
In-Reply-To: <YAb5+R1R74QXds3o@kroah.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 20 Jan 2021 03:02:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT96ECeS2=UkNFdwU2fLG_3v1jGyO5pLqYkfGVHuJpXXA@mail.gmail.com>
Message-ID: <CAK7LNAT96ECeS2=UkNFdwU2fLG_3v1jGyO5pLqYkfGVHuJpXXA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: give the SUBLEVEL more room in KERNEL_VERSION
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Sasha Levin <sashal@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 12:25 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jan 18, 2021 at 02:54:53PM -0500, Sasha Levin wrote:
> > SUBLEVEL only has 8 bits of space, which means that we'll overflow it
> > once it reaches 256.
> >
> > Few of the stable branches will imminently overflow SUBLEVEL while
> > there's no risk of overflowing VERSION.
> >
> > Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
> > should create a better balance between the different version numbers we
> > use.
> >
> > The downside here is that Linus will have 8 bits less to play with, but
> > given our current release cadence (~10 weeks), the number of Linus's
> > fingers & toes (20), and the current VERSION (5) we can calculate that
> > VERSION will overflow in just over 1,000 years, so I'm kicking this can
> > down the road.
> >
> > Cc: stable@kernel.org
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
>
> Looks good to me, thanks for fixing up the USB code.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Applied to linux-kbuild. Thanks.



-- 
Best Regards
Masahiro Yamada
