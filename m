Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5788D650C4
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 06:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbfGKEOy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 00:14:54 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53452 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKEOx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 00:14:53 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x6B4EehG001381;
        Thu, 11 Jul 2019 13:14:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x6B4EehG001381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562818481;
        bh=LmHL0cs5B5tYwdkfq3PX+j/nTcIWEfzF4ptL7RyDxIU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a4nbuK6BvKkbk78YwHLqcwgkysQazGuqJNdIxWSOMnEGf9s7xzI/eqyZ+LiA8xQao
         dXyOB2sFPS63KxLAlzmDDu9MsvHclFPpSzj0W+phTxABydK5ZWEQ7G+tu/wiH6cRwY
         mA0Y1e2/1GAIB0HlVbjhtJCIO1lbLOZM6pmwDzKQyZufRK624dOoKOwLLjvhMDclYc
         x0D6Y078V4fNocFw+oo5nXC0HYna0f9Rv/qRIyWt626jhvsOuyb1rnmEGlsXI6fijs
         ih/TXgs6pDt/UOr8FARqhimIa5919bmvIFTTPcnT3hwV42k7ueUbT3qmSvqFPp+Ki0
         eRvpTmltCGIgA==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id v20so1802645uao.3;
        Wed, 10 Jul 2019 21:14:40 -0700 (PDT)
X-Gm-Message-State: APjAAAVN3fwJnJiyxq0UNiVKdZfy6DibE8upfoYMVvkiIPbf9yQqksCl
        LBfCNbd2wCtDBXlyotvNwWxGwe5I1UdzAKeUEZM=
X-Google-Smtp-Source: APXvYqwLYHnnTrutXlEq6mzJZ1SJJYPspIP0lAuUV9jnep0jOCM2CDpI05wpTLdbcZ0mSHAMSblnRduIRxyVpIN4mMo=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr904661uaf.95.1562818479734;
 Wed, 10 Jul 2019 21:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190709132639.26802-1-geert@linux-m68k.org> <20190709163042.GA28716@infradead.org>
In-Reply-To: <20190709163042.GA28716@infradead.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 11 Jul 2019 13:14:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARKaj9Tw+Am0hvQOOW8ZTh_LvY-tSPoZjvJWez4RaOPQA@mail.gmail.com>
Message-ID: <CAK7LNARKaj9Tw+Am0hvQOOW8ZTh_LvY-tSPoZjvJWez4RaOPQA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Inform user to pass ARCH= for make mrproper
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 10, 2019 at 1:30 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> Is there any chance we could save ARCH in .config?  That would make
> cross compile builds so much easier..  Same for CROSS_COMPILE.


Then, I have no idea how "make clean", "make help", etc. should work.

If a user has configured the kernel, do they work for CONFIG_ARCH
stored in the .config file or still for the host-arch?

If not yet, do they fall-back to host-arch?



-- 
Best Regards
Masahiro Yamada
