Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439DC339798
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 20:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbhCLTnw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 14:43:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234267AbhCLTni (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 14:43:38 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA9EC061574
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Mar 2021 11:43:37 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id u4so8565596ljo.6
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Mar 2021 11:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eABWj2+yA42EvLNjfSsAJEA84NIxGxrcRCODa8CO/7E=;
        b=tTWbiGb5Rnb+LioHbD6nL607zseonFZVxwbH9G/D5Ta4PgPC1Gpeo3N42TheWi/9ir
         FTeI2TbO3YDPvSJ00dp7sU9t2vgGL1SjB0+jR8g/2aK9bJGVebugjVUcRK1RkSrLvMr5
         bPLk4TtKKL6gKmVIXNgt2Cz7ZRPuKqandOs7A2aPJUchNBxiPTaIR8Dc6xHWMxvMugzV
         MB/eOnLJIwPVJEraJkt0tMlv0/dsTMZRUWhtc3DIYE23bRJ1ZwJubiJ5EROOERxE7hNK
         OWklervdcpTpuMKPkkvTjvYkMbeiodbuV+t3eNxWSz2jTTURNWHj4gJ+/VDkBuS032+6
         16ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eABWj2+yA42EvLNjfSsAJEA84NIxGxrcRCODa8CO/7E=;
        b=Qwh+KRVF7dqD/PybNVK7p+P8pbom1ameQPe7vQId4UpgVasY9QQuqnc3JjuAO2CWkr
         h+F2AoXpyvL77Wq7MsxX3VuQ7pAaAsl+s7+OEMRpFeYzY2uu4kZZLOKgI8aqtebfnGgP
         lxeIghokXH+um2QpybsTMii94hussxQ9jFSDPQRGkaUlAfBmy904CxkeKSgPkOC9P2h5
         JSrlre4WsEUDA5naatG9MTxXkh1+PelIAvgJ+SO9a9LF9BKnM220ELQjrh2Aq2DAdpcg
         FTUGaaRIvTyToGr1O/0sMFAUGXPnwAjjtPVyFZtaNfUSEjLSbQksNt8zpFGV5Nkcad9Q
         AKuQ==
X-Gm-Message-State: AOAM5310imIn6xkRzU2ZisZS0lRGCLzyCuxJWsyjguEY/yNOOkAS9Cvl
        +OBpIvDJMKL9NGor/yL+dQZA+KZElVB7iU4pfrennWtH2xtEPg==
X-Google-Smtp-Source: ABdhPJx2fymoXvsaKLaZV+Czq0SHWkfIoDd0NRGCrN8Z1SeW/EjJA7Q2xS8bWri4Car1ue0a9mdViUMyGxgc3o+19bw=
X-Received: by 2002:a2e:5716:: with SMTP id l22mr3268991ljb.244.1615578215858;
 Fri, 12 Mar 2021 11:43:35 -0800 (PST)
MIME-Version: 1.0
References: <20210312193814.132558-1-masahiroy@kernel.org>
In-Reply-To: <20210312193814.132558-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 12 Mar 2021 11:43:24 -0800
Message-ID: <CAKwvOd=x9M_tRekZM83-wJLfJrE=w7vHzV-rkdSxPBsUrSfVkw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix ld-version.sh to not be affected by locale
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 12, 2021 at 11:38 AM Masahiro Yamada <masahiroy@kernel.org> wro=
te:
>
> ld-version.sh checks the output from $(LD) --version, but it has a
> problem on some locales.
>
> For example, in Italian:
>
>   $ LC_MESSAGES=3Dit_IT.UTF-8 ld --version | head -n 1
>   ld di GNU (GNU Binutils for Debian) 2.35.2
>
> This makes ld-version.sh fail because it expects "GNU ld" for the
> BFD linker case.
>
> Add LC_ALL=3DC to override the user's locale.
>
> BTW, setting LC_MESSAGES=3DC (or LANG=3DC) is not enough because it is
> ineffective if LC_ALL is set on the user's environment.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D212105
> Reported-by: Marco Scardovi
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Recensito-Da: Nick Desaulniers <ndesaulniers@google.com>

In realt=C3=A0 non parlo italiano, ma so come usare Google Translate.


> ---
>
>  scripts/ld-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index 30debf78aa09..1bf3aadde9de 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -29,7 +29,7 @@ orig_args=3D"$@"
>  # Get the first line of the --version output.
>  IFS=3D'
>  '
> -set -- $("$@" --version)
> +set -- $(LC_ALL=3DC "$@" --version)
>
>  # Split the line on spaces.
>  IFS=3D' '
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
