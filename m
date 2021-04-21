Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D9B3668E6
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Apr 2021 12:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbhDUKMI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Apr 2021 06:12:08 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:52451 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234167AbhDUKMH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Apr 2021 06:12:07 -0400
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 13LABNlM027158;
        Wed, 21 Apr 2021 19:11:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 13LABNlM027158
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618999883;
        bh=x9jwrVKB/mUpgB3KyUhVePySKe4QS69PYWtHHjgLAWc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qvsIalUxBnviQLCeYX/uLTay+YS/ksK7GQRLTmgMkTRM6xcYzzuNKxsTQWg0dwHbn
         pyPkcw1UQDj/jeW8pMroqxeUw9o/Toc4AABLKFYHpF1QHxnXJw4RP23eM4K6T3TuVO
         gJ3bWc3YYk3HxBKzUyHVkZGo6GjSzyshtTRt6x4xGBjQiCMPKbECL6bO1EDlpeaHxT
         Ewo7aREH3mPXy8FJLrnyLJiQsvS8qLyw+f4NYRx1I8B6665HgDUb0mM3gL/wXsj75W
         lphi/1PKE/yldqOF3mAM3Yila00hpANqgZ5TXo2sDbzism4SrssODaCv15MHkvnqsl
         hrnDqUxcS/eEw==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id i190so28301452pfc.12;
        Wed, 21 Apr 2021 03:11:23 -0700 (PDT)
X-Gm-Message-State: AOAM530SrAhGJdHPOgQDGwblOop4V/3516HRKgjOTx25WqdSGMMVmpgD
        gRltHjDaUxtNWJ2JJ9XfkPlBX4aH4GVKumYMQO4=
X-Google-Smtp-Source: ABdhPJx9Reu2/67C2NgB8IKWML+OR0FcVvXhQx9IQQ534FYn8o0ACoNU7gmhVhIk4H64W+duywMCJTpkwldgyBh2jN8=
X-Received: by 2002:a63:e1d:: with SMTP id d29mr15757887pgl.175.1618999882640;
 Wed, 21 Apr 2021 03:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210421001958.24343-1-patrick.waterlander@intel.com>
In-Reply-To: <20210421001958.24343-1-patrick.waterlander@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 21 Apr 2021 19:10:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR1L=sh=TBj9ZjUZfckKPw4Ys=3UMaYfE+47VF5z=dyww@mail.gmail.com>
Message-ID: <CAK7LNAR1L=sh=TBj9ZjUZfckKPw4Ys=3UMaYfE+47VF5z=dyww@mail.gmail.com>
Subject: Re: [PATCH 1/1] Makefile: Fix cross building
To:     Patrick Waterlander <patrick.waterlander@intel.com>
Cc:     nathan.d.ciobanu@intel.com, Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 21, 2021 at 9:20 AM Patrick Waterlander
<patrick.waterlander@intel.com> wrote:
>
> The native pkg-config is always called which may result in incorrect
> flags and paths being passed to the cross compiler. Implement
> $(CROSS_COMPILE)pkg-config to avoid this issue.
>
> Signed-off-by: Patrick Waterlander <patrick.waterlander@intel.com>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index bc19584fee59..9aa2073f68d6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -462,6 +462,7 @@ LZMA                = lzma
>  LZ4            = lz4c
>  XZ             = xz
>  ZSTD           = zstd
> +PKG_CONFIG     ?= $(CROSS_COMPILE)pkg-config
>
>  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>                   -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
> @@ -1089,7 +1090,7 @@ mod_sign_cmd = true
>  endif
>  export mod_sign_cmd
>
> -HOST_LIBELF_LIBS = $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
> +HOST_LIBELF_LIBS = $(shell $(PKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)


libelf will be linked to host programs.

This is clear from HOST_LIBELF_LIBS.
                   ^^^^

pkg-config should be OK.




>
>  has_libelf = $(call try-run,\
>                 echo "int main() {}" | $(HOSTCC) -xc -o /dev/null $(HOST_LIBELF_LIBS) -,1,0)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
