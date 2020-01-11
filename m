Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1787D137C12
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2020 08:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgAKHXX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Jan 2020 02:23:23 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:63361 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgAKHXX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:23:23 -0500
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 00B7Mu9p017938;
        Sat, 11 Jan 2020 16:22:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 00B7Mu9p017938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578727377;
        bh=3wxlM6qDi89jG0/wNk22bO2HVsYRMj0sDf0KIkLmFvI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g5fzQkjDcXYA1ZPnyABl3NRF0JlgthILbf6hYFsAA0WADPKVIE2AT7A4d3MMVyEDf
         NY2KAQRa4119v+ESae4rf0oaUtYtxscKP20JQBKKai3R8NC9+S8ikj+RB2E+3aqN6J
         65Yvsabko4ZMoDYUObEXN4aW9trca2Gvuk+sVs2WmwkbiGivzmsJ4N0HBC+/ILUyBH
         FWKMJyJf/0PmCr0casUUWq9ExBvR7d9zxGPCjH+Fj+OoR6rQESJLRhmBgZ4pihp2t1
         E0AW+VCFoL0H6CRphvvZRGuPf5MCR4HnOq3YyDytmYy9LxDLv7NtvyspiNDuNy9qq4
         dsSOYJeAcU4og==
X-Nifty-SrcIP: [209.85.221.177]
Received: by mail-vk1-f177.google.com with SMTP id c129so1256820vkh.7;
        Fri, 10 Jan 2020 23:22:57 -0800 (PST)
X-Gm-Message-State: APjAAAX2eHmvCFBMOZWRZ5V6lZZeU5iDsxPY5VJDLCECtO1QcoZ13KBj
        4zueMrfT2Q+xVZaAF8tvo1Cgz+Ga5r88WiyGVoo=
X-Google-Smtp-Source: APXvYqyGlgP2mqLTiUIT6I5VF+Tj2Zm+P86994PzexYmx0XTfUFyfyzZq9n4BzorCN9YnNFriZshI73R9oLB/PC2dKg=
X-Received: by 2002:a1f:252:: with SMTP id 79mr4876918vkc.96.1578727376169;
 Fri, 10 Jan 2020 23:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20200106032324.3147-1-masahiroy@kernel.org> <20200108154406.GA21695@infradead.org>
 <20200108154835.GA2449518@kroah.com>
In-Reply-To: <20200108154835.GA2449518@kroah.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 11 Jan 2020 16:22:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQCFjUBQu355LkckYzzX7nf_BhfXpnEPACTbBHrGRPGMw@mail.gmail.com>
Message-ID: <CAK7LNAQCFjUBQu355LkckYzzX7nf_BhfXpnEPACTbBHrGRPGMw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow modules to link *.a archives
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Fumiya Shigemitsu <shfy1014@gmail.com>,
        Yongxin Liu <yongxin.liu@windriver.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 9, 2020 at 12:48 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 08, 2020 at 07:44:06AM -0800, Christoph Hellwig wrote:
> > On Mon, Jan 06, 2020 at 12:23:24PM +0900, Masahiro Yamada wrote:
> > > Since commit 69ea912fda74 ("kbuild: remove unneeded link_multi_deps"),
> > > modules cannot link *.a archives.
> > >
> > > I do not see such a usecase in the upstream code, but multiple people
> > > reported this issue, so it seems to be a desired feature for external
> > > modules.
> >
> > Kernel policy is to not keep around infrastructure not used upstream.
> > And linking archives in the kernel doesn't really make any sense, so
> > this shouldn't go in in any form.
>
> Yeah, I agree, it's just going to bit-rot and people really shouldn't be
> doing stuff like this in their kernel modules.
>
> If they want to, they need to figure out how to do it themselves :)
>
> greg k-h


OK, I will abandon this patch.

-- 
Best Regards
Masahiro Yamada
