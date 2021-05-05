Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A5F37472C
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 May 2021 19:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhEERuL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 May 2021 13:50:11 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:46778 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbhEERsK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 May 2021 13:48:10 -0400
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 145HkmQx014950
        for <linux-kbuild@vger.kernel.org>; Thu, 6 May 2021 02:46:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 145HkmQx014950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620236809;
        bh=9hV0x77gYoBi1iEtmKaO+XbFcGZPmwYeF+D6J6ojjHg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=H/5R32t3v7t955NFUuPKvfQXj0csZb3miKKhLWVvAk3QSX6Bus4PH/Y9EavT61plh
         KZyAG4TPpkC9Kdz1R0vtmCs+mQtTrmMnzUzzHfam9LLHRK92glD8AidiUQtnBkRp9j
         bFexeCqVhIRCynYAUWts0Q8z/RWJcX7HWImw/ByTN5sHFiltBlX3HgWb1ThytvFIIo
         TwRuJ+lQwiF1WGNzqXd2HKq4FTB0ZyZUeX0h89KyW7tUmqg264o19bTFpL8z8CCkrW
         yObvHqd4HNKAQq/L5jcidWB89G30QXyL6t2rdo17JMKqgb75bUZx5pLCPH93peUo2k
         rwcFKkUvsQirQ==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id t4so1510055plc.6
        for <linux-kbuild@vger.kernel.org>; Wed, 05 May 2021 10:46:48 -0700 (PDT)
X-Gm-Message-State: AOAM532xP1Wa83thTqZ4c2OR9fjyCT7srogtJIN76qymxSx/EWrHnN1l
        RRAvXt/dG5e6rVBYj5Ctq5sgb0lwRDWHYNbn/JE=
X-Google-Smtp-Source: ABdhPJw5WlRekSPp53j0pktqtohe7QY/eU6vfpSHQEhcQ3eHObGEVCEJGsf46WaLrWiG9Mfa/1XhPoNz4t79nsKAdK8=
X-Received: by 2002:a17:90a:8b12:: with SMTP id y18mr15034956pjn.153.1620236808071;
 Wed, 05 May 2021 10:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210505033527.1282488-1-ak@linux.intel.com>
In-Reply-To: <20210505033527.1282488-1-ak@linux.intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 6 May 2021 02:46:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJkCEkNQKjwUSML_2RL3Wnjyn5RL+RAMqG9BaVnwp-qw@mail.gmail.com>
Message-ID: <CAK7LNARJkCEkNQKjwUSML_2RL3Wnjyn5RL+RAMqG9BaVnwp-qw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Don't remove link-vmlinux temporary files on exit/signal
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 5, 2021 at 12:35 PM Andi Kleen <ak@linux.intel.com> wrote:
>
> Keep them around until they are cleaned up by make clean. This
> uses a bit more disk space, but makes it easier to debug any
> problems with the kernel link process.
>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/link-vmlinux.sh | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 7d112681f332..f4de4c97015b 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -320,20 +320,6 @@ cleanup()
>         rm -f .vmlinux.d
>  }
>
> -on_exit()
> -{
> -       if [ $? -ne 0 ]; then
> -               cleanup
> -       fi
> -}
> -trap on_exit EXIT
> -
> -on_signals()
> -{
> -       exit 1
> -}
> -trap on_signals HUP INT QUIT TERM
> -
>  # Use "make V=1" to debug this script
>  case "${KBUILD_VERBOSE}" in
>  *1*)
> --
> 2.25.4
>


-- 
Best Regards
Masahiro Yamada
