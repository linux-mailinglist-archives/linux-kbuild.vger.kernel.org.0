Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61BF363704
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 15:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfGINe4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 09:34:56 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32098 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfGINe4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 09:34:56 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x69DYjxD018175;
        Tue, 9 Jul 2019 22:34:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x69DYjxD018175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562679286;
        bh=MhiFviPPcu6nKoAgHxu9kLhRkVqIviOlQ70GIDwHeWY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OSd4xChr4LqPJ0Z4yhqGX3d3kE9XdqIWooNxF5CZvnCr9hYyyM0tkmeXJZiuT7bPA
         3tzbSVxctZN4Mzgg14Ic/hKH6jNms7QB6P3OX7/+r9HSNjgs+k0y1BJZILLxJLsgnj
         x9BA2i0ZhDDUK+A0txJflcwn/4LA/GQXK26qhAV0o9QTgDTDkb+fhg2OWi2WfkqSpk
         JwFmK6lalYppx3rchoEXF8HeBTG49hV0RLM7gBQMS4/0/YbSEO0RYpz/w7EhOTtnuT
         UTnAsty9noOWweofUEuHFiJA90kdbNkgBufO/45pSR2T7fOid43ccGBSOP0Hppmfqa
         7OAdCPxsEDL/w==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id m8so10632931vsj.0;
        Tue, 09 Jul 2019 06:34:46 -0700 (PDT)
X-Gm-Message-State: APjAAAVHmbloNd8NFGdcFI45UlUZQPIxYGyUruMhPUjmqUwz3LKG0hPA
        MjYl/aDvHHgNRqEfvCM9h31wh9xwKw+fYm5fKjI=
X-Google-Smtp-Source: APXvYqyIsj0LNWx9aTVN/OMIaankoVJ8VT6eyJzjNgIeas/TFD8/3C9KDnnCoiLvZA0kmhd14e/lYr8EIcM6As0eMUc=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr14288099vsd.215.1562679285090;
 Tue, 09 Jul 2019 06:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190709132639.26802-1-geert@linux-m68k.org>
In-Reply-To: <20190709132639.26802-1-geert@linux-m68k.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 9 Jul 2019 22:34:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQaoaovbRmOqc80XF_EcwzE5Sju3ZXQDYSkQGSabxQj_A@mail.gmail.com>
Message-ID: <CAK7LNAQaoaovbRmOqc80XF_EcwzE5Sju3ZXQDYSkQGSabxQj_A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Inform user to pass ARCH= for make mrproper
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 9, 2019 at 10:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> When cross-compiling an out-of-tree build with an unclean source tree
> directory, the build fails with:
>
>   /path/to/kernel/source/tree is not clean, please run 'make mrproper'
>   in the '/path/to/kernel/source/tree' directory.
>
> However, doing so does not fix the problem, as "make mrproper" now
> requires passing the target architecture to the make command, else it
> won't remove $(srctree)/arch/$(SRCARCH)/include/generated.
> "git ls-files -o" doesn't give a clue, as it doesn't list (empty)
> directories, only files.
>
> Improve usability by including the ARCH= option in the error output.
>
> Fixes: a788b2ed81abeb94 ("kbuild: check arch/$(SRCARCH)/include/generated before out-of-tree build")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Applied to linux-kbuild. Thanks.



-- 
Best Regards
Masahiro Yamada
