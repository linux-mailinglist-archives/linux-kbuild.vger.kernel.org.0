Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAD01B5237
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 04:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgDWCBS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Apr 2020 22:01:18 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:55269 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgDWCBR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Apr 2020 22:01:17 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 03N20sDr027698;
        Thu, 23 Apr 2020 11:00:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 03N20sDr027698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587607255;
        bh=ISn1zcDbqD2LVlnbauksd8MruLENNun6WMcR58P2qcI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LZ2hy/m3kyAspFf0n8gbMqzG8q4/ENsAcC6y5X0tdE4JTA71wFtqCu14vIQPS6koh
         bqA4kNA/0drF4SSyQBZDo5r7chGkgod2Cft6VW2XTgFMxwqXCLkUcrku7IxZxBzNTm
         o2stTctbF5u/gzU/8GW8SHhbxyXdksJEysZB+f2g70znIIYxnCepCovSLn0WTO7fIM
         2io+52tVX+/On4MmDF/H1/qhJxD+COeuDYqtV+lhWUbjAQ1B+qMaKBle42WIeaQPdV
         e+9bPOi4SciFKMyjpEJqzQ7Ut4OqASVeOJr/YBtnKXQvW+M7Ah5bo78GESV28fND8O
         0Fh5Q4H/Ik5Rw==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id t8so4149226uap.3;
        Wed, 22 Apr 2020 19:00:55 -0700 (PDT)
X-Gm-Message-State: AGi0PubpXU8+nChOB5qI0KFcE6ZqAxyf8G2Hr2WLIglNjvkITKoOkY4y
        5KMX9L01kZQ/ZIT4A8AOeR5HZ22fNLY3vy468/k=
X-Google-Smtp-Source: APiQypKRgU7oPWeRAT900AuP/QQ6Sr147jDjr+iq+LfPL1juv5V1gaXnJ4FqIKsaY6bSqjdDXnBMPKQ5GXKMoNZv7lQ=
X-Received: by 2002:a67:6542:: with SMTP id z63mr1467003vsb.179.1587607254226;
 Wed, 22 Apr 2020 19:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200423014919.31713-1-masahiroy@kernel.org>
In-Reply-To: <20200423014919.31713-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 23 Apr 2020 11:00:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ-5aKSn0J81NMey5+nTis8LZT_mv+bYbndx99SBf_w6w@mail.gmail.com>
Message-ID: <CAK7LNAQ-5aKSn0J81NMey5+nTis8LZT_mv+bYbndx99SBf_w6w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kbuild: fix the section title format
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 23, 2020 at 10:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Make it consistent with the other sections.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux/fixes.



>  Documentation/kbuild/makefiles.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 04d5c01a2e99..b80257a03830 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1241,7 +1241,8 @@ When kbuild executes, the following steps are followed (roughly):
>         will be displayed with "make KBUILD_VERBOSE=0".
>
>
> ---- 6.9 Preprocessing linker scripts
> +6.9 Preprocessing linker scripts
> +--------------------------------
>
>         When the vmlinux image is built, the linker script
>         arch/$(ARCH)/kernel/vmlinux.lds is used.
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
