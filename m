Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30FCB5F0C5
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 02:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfGDAn5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jul 2019 20:43:57 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30930 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfGDAn5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jul 2019 20:43:57 -0400
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x640hfs5007948;
        Thu, 4 Jul 2019 09:43:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x640hfs5007948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562201022;
        bh=YEglfdV6gwtLpwefdXYa4i8HSGcTtqk+NU8k5bljqhg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Qw5x5vW+HodXAsAM9eWx3LsERWErLbDHquz+/fNNvOizzhYBpWG6Wcg7/DpeJQx94
         ousyH9k2gTLYlzvRSsSFBjOBLNC8UA78HsYGaBP+YZgg/DdZQWZPixX6la/rEVtUJB
         rRBlI4we8YDrikrXsG4S3EDpJieEMFpTMqZUtsYB9V1KY1yafQhZ9WgUY3Kt+w/tr2
         TCFxYZzaTLr3G7upREzePgw9jNb2HTSBFFTabaz0mm48hK64k/QMPApQki6w88MaEl
         t14mn3q/7pBm/7qd8xyFmeHhpJKjJ3M5Ym6XWod4QDobzripQuwCjCt7/sCMeFX698
         FbzFHhib2sstQ==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id g124so301546vkd.1;
        Wed, 03 Jul 2019 17:43:42 -0700 (PDT)
X-Gm-Message-State: APjAAAUyTLLQOiFNMkHux7LMeJuPlZf9y2gLzwtZFZJOXM06FD/cwrhC
        sb/0jEg9wXv5SGAIJkITS8RzeEKdzDq30ZAhgnE=
X-Google-Smtp-Source: APXvYqwTIxDogC/SIRRHuAggdytqIbbtVGJ6ZbmryGi7Bqodet01ybGaLvoRyZFlQniP0SXM6NV/EYHc5F00hR1vxas=
X-Received: by 2002:a1f:728b:: with SMTP id n133mr1331102vkc.84.1562201021033;
 Wed, 03 Jul 2019 17:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <1560752096-1323-1-git-send-email-Cedric_Hombourger@mentor.com>
In-Reply-To: <1560752096-1323-1-git-send-email-Cedric_Hombourger@mentor.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 4 Jul 2019 09:43:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASCmZyS11WkUWXLXVWgk-WU5JV=MMw=S6pXAzMhkVJ40Q@mail.gmail.com>
Message-ID: <CAK7LNASCmZyS11WkUWXLXVWgk-WU5JV=MMw=S6pXAzMhkVJ40Q@mail.gmail.com>
Subject: Re: [PATCH] builddeb: generate multi-arch friendly linux-libc-dev package
To:     Cedric Hombourger <Cedric_Hombourger@mentor.com>
Cc:     isar-users@googlegroups.com,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

CCed a couple of people.

On Mon, Jun 17, 2019 at 3:15 PM Cedric Hombourger
<Cedric_Hombourger@mentor.com> wrote:
>
> Debian-based distributions place libc header files in a machine
> specific directory (/usr/include/<libc-machine>) instead of
> /usr/include/asm to support installation of the linux-libc-dev
> package from multiple architectures. Move headers installed by
> "make headers_install" accordingly.
>
> Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
> Reviewed-by: Henning Schild <henning.schild@siemens.com>
> ---
>  scripts/package/builddeb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b03dd56a4782..8f7afb3a84e9 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -132,6 +132,11 @@ fi
>  if [ "$ARCH" != "um" ]; then
>         $MAKE -f $srctree/Makefile headers_check
>         $MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
> +       # move asm headers to /usr/include/<libc-machine>/asm to match the structure
> +       # used by Debian-based distros (to support multi-arch)
> +       libc_mach=$($CC -dumpmachine)
> +       mkdir $libc_headers_dir/usr/include/$libc_mach
> +       mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$libc_mach/
>  fi
>
>  # Install the maintainer scripts


I am not sure but,
I just worried about the backward compatibility...
Was this previously broken?

I guess debian is using own control file
instead of the one in upstream kernel.
So, this is almost a matter for developers, I think.

How did debian-base distros managed this before,
and will this introduce no breakage?

Ben,
Could you comment on this?


-- 
Best Regards
Masahiro Yamada
