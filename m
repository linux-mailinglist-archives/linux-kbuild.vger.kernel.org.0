Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E084C15C846
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2020 17:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgBMQdH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 Feb 2020 11:33:07 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38207 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbgBMQdF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Feb 2020 11:33:05 -0500
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01DGWokT002501;
        Fri, 14 Feb 2020 01:32:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01DGWokT002501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581611571;
        bh=wKRP4PMiJ2IIqnmJRC2UTIJLpaMd+XxtGPhf3FJKZ/M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yTtGgtPhBnuwpwkCH17hBCIM/rKPC+8pFUpGEoYdZxLF2GAX7vg/feqOAgufcIm3J
         zieohZHNp+W4Ych43SSR8jeYVQwBzbBmADqzVG4DDZ+PN4XqoSTgLYm+V0DDHpCk3B
         Vq/FfOzZB9F6NOlkBOKRRCBnHDb8A7UITXpLWC9hjUHM2/LDjRzeBNPA3CqS1wIDcC
         tP4OdrrmDTE0GW2Lvhrh/wc3IOqpV+zYpu3Kyq9ZRyxQjNCA+bAQhEEu0klMRp+NJc
         NIdAeUynpXcCmTG3/X7dKVM9d8fYxKeItU6YguZnp8/HsR8fuojBQ0WDmDrvvkA1jw
         f5PdY9EKtwx0g==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id 7so3974344vsr.10;
        Thu, 13 Feb 2020 08:32:51 -0800 (PST)
X-Gm-Message-State: APjAAAWKsZ/ZYh5Eh/DI1sgSfX1QnXlGOgk2D08N91yc3z4ZBVSl9L+G
        /xvTvMAUQZhWfJhloYaZccVtqj456tlDM/KE5s4=
X-Google-Smtp-Source: APXvYqwEsintGgJNmjOFlGSj4kj9cN649OMLNc21RvW/X1xvDkZiYgRkUpxRjlwZdbJXJ05zElgZel71AjYYWxgMxwE=
X-Received: by 2002:a05:6102:190:: with SMTP id r16mr2524000vsq.215.1581611569913;
 Thu, 13 Feb 2020 08:32:49 -0800 (PST)
MIME-Version: 1.0
References: <874kvz10rx.fsf@mpe.ellerman.id.au>
In-Reply-To: <874kvz10rx.fsf@mpe.ellerman.id.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 14 Feb 2020 01:32:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASePHZ78O6fnScU_fVHkDOKJEgT+B+OC7NPxkW+tb7q1Q@mail.gmail.com>
Message-ID: <CAK7LNASePHZ78O6fnScU_fVHkDOKJEgT+B+OC7NPxkW+tb7q1Q@mail.gmail.com>
Subject: Re: install is no longer PHONY?
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Michael,

On Mon, Feb 10, 2020 at 2:15 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi Masahiro,
>
> I noticed that "install" seems to be no longer PHONY, or at least if I
> have a file/directory called install then the build doesn't run.
>
> eg:
>   $ touch install
>   $ make install
>   make: 'install' is up to date.
>   $ rm install
>   $ make install
>     LDS     arch/powerpc/boot/zImage.lds
>     WRAP    arch/powerpc/boot/zImage.pseries
>     WRAP    arch/powerpc/boot/zImage.epapr


I think the reason is
'install' is not specified as a phony target.


You can add 'PHONY += install' to fix it.



PHONY += install    # please add this!
install:
        $(Q)$(MAKE) $(build)=$(boot) install


Please do so in both arch/powerpc/Makefile and
arch/powerpc/boot/Makefile.




> In the past the presence of an install file/directory didn't have any
> affect.
>
> It seems this changed in:
>   d79424137a73 ("kbuild: do not update config when running install targets")
>
> Was that expected?
>
> cheers


I do not think commit is related.

Prior to this commit, I still see the same issue.


$ git checkout d7942413^
$ touch install
$ make -s ARCH=powerpc allnoconfig
$ make  ARCH=powerpc install
make: 'install' is up to date.



-- 
Best Regards
Masahiro Yamada
