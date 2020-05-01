Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3092F1C0DCA
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 07:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgEAFhY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 May 2020 01:37:24 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42442 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFhY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:37:24 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0415ap88007551;
        Fri, 1 May 2020 14:36:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0415ap88007551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588311412;
        bh=t0pKWv7OLdo6Gy+B9iyp24NSIc9TALsWpiCXeOcivbo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K4Hg3woRn8zwDO8ozvRSW0zAvBCjQVmEUkvskv4FWc/9dwhRMoO3cJSKVRJhGcTuX
         AGbtCntwzqJ1hWawaZra2soQcM/E9J+KwrKLttICQbOcxdPZWP6aha3NQYF6LDACrw
         W+N+NGaULlNpQqvXHAflwOi0QgzZXiZsfI4ECIetGhnV1D/o3cMH164ioZ1x3meMR7
         zp6gXyKmLal/D7VDI1czZiVXv6GRvJPXokysIqcQdbiCxVWG1EAyy0SCT5QOLvK4T6
         LQPSaRTxwL8DKFTfNhk7wqkpilRP1eO73pwrgUhgembsBDL+5eqnquBjn61yI+jVk/
         7wbZAgvdjNDSQ==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id 1so5745571vsl.9;
        Thu, 30 Apr 2020 22:36:51 -0700 (PDT)
X-Gm-Message-State: AGi0PuZMH4vrR6acnQhtKPJTcJbmbCqotU1I7JgR8dx7cKafkX9UQqMa
        wOMhKD4sOkW02Xh9jXE2KVSqbFIDAML8Rdht90M=
X-Google-Smtp-Source: APiQypL66b6AWKOM5l+hkSPG1YC/tq4LRk3VvSIL+cu5uhiZ7Nevbe4tuppKyxjp0S3RGk7XcOSB9t+AzVHFoClks1A=
X-Received: by 2002:a05:6102:3c7:: with SMTP id n7mr2093908vsq.179.1588311410598;
 Thu, 30 Apr 2020 22:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200425131810.991717-1-masahiroy@kernel.org>
In-Reply-To: <20200425131810.991717-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 1 May 2020 14:36:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYYcBRt3n6oQF_jWDEh8ZGiUfmog-v-KK+f6ZRPr828w@mail.gmail.com>
Message-ID: <CAK7LNASYYcBRt3n6oQF_jWDEh8ZGiUfmog-v-KK+f6ZRPr828w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove '/' target
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 25, 2020 at 10:18 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This notice has been here for a while. Remove it entirely now.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>



Applied to linux-kbuild.


>  Makefile | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 49b2709ff44e..95c2d8c2dfe8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1650,10 +1650,6 @@ _emodinst_post: _emodinst_
>  clean-dirs := $(KBUILD_EXTMOD)
>  clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps
>
> -PHONY += /
> -/:
> -       @echo >&2 '"$(MAKE) /" is no longer supported. Please use "$(MAKE) ./" instead.'
> -
>  PHONY += help
>  help:
>         @echo  '  Building external modules.'
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
