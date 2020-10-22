Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48351295742
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Oct 2020 06:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgJVE0P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Oct 2020 00:26:15 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:27083 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgJVE0P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Oct 2020 00:26:15 -0400
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 09M4PsEl016572;
        Thu, 22 Oct 2020 13:25:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 09M4PsEl016572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603340754;
        bh=vzE0DYa0Mh/5XavDIbvww++hF0YOvxIWEQOjqM9vGUE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mQdTHd4kDDR4mzppnI5r/CsolJzt3ZjhZQ32xMNwUfWfB9RzAcor1bDI5gLwZZpfk
         wlyLedpRfHNV8DobCFvKtGbB5J4ZHZg/67BXMr2RoCpHEssC4VvQJ2/bSSad44AyGQ
         hhWb73klByYYYdg3s0drUbTFRzETYDOzHO0k9aQQQCszcbdcNawcG12nr2eHoovUb+
         byk1nsjIBU1PO+QtY/iURj+dxGNcmbLneLrVhCRQC+NcEDf2YX7zAJoIQHPHLdzJbe
         iFoSd/7dn9tXgLhiMxlh8pQ6Akaapu4DvkCywpkT1Xy0SvuwnVel4gvfgMQv/kmVdR
         hOqIvU3PYRqZA==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id g16so319468pjv.3;
        Wed, 21 Oct 2020 21:25:54 -0700 (PDT)
X-Gm-Message-State: AOAM5329YKWhGmTnBXBFCbIyblSWrtHhv2b+pHJSJmueMmCrIftYn3Tx
        CwIkm8QgJG5WccrMvqKRZQ0Rd/kUnBLgfvtc6zw=
X-Google-Smtp-Source: ABdhPJwmwsnVfVXWHxyKpd8wWr/pKzj7oJc6tMlgWb7SbcdJukke9v7i6LH/bME9DRcGviqrluftnzchEutYDy2Ign0=
X-Received: by 2002:a17:90b:1b12:: with SMTP id nu18mr650440pjb.153.1603340753575;
 Wed, 21 Oct 2020 21:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201020093459.GA48796@chrisdown.name>
In-Reply-To: <20201020093459.GA48796@chrisdown.name>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 22 Oct 2020 13:25:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQr8keyEmWgyjy52XfCbCqAyYv_AquBkafFSDVnBHkfAA@mail.gmail.com>
Message-ID: <CAK7LNAQr8keyEmWgyjy52XfCbCqAyYv_AquBkafFSDVnBHkfAA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use uname for LINUX_COMPILE_HOST detection
To:     Chris Down <chris@chrisdown.name>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 20, 2020 at 6:35 PM Chris Down <chris@chrisdown.name> wrote:
>
> `hostname` may not be present on some systems as it's not mandated by
> POSIX/SUSv4. This isn't just a theoretical problem: on Arch Linux,
> `hostname` is provided by `inetutils`, which isn't part of the base
> distribution.
>
>     ./scripts/mkcompile_h: line 38: hostname: command not found
>
> Use `uname -n` instead, which is more likely to be available (and
> mandated by standards).
>
> Signed-off-by: Chris Down <chris@chrisdown.name>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

Applied to linux-kbuild. Thanks.


>  scripts/mkcompile_h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index baf3ab8d9d49..4ae735039daf 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -35,7 +35,7 @@ else
>         LINUX_COMPILE_BY=$KBUILD_BUILD_USER
>  fi
>  if test -z "$KBUILD_BUILD_HOST"; then
> -       LINUX_COMPILE_HOST=`hostname`
> +       LINUX_COMPILE_HOST=`uname -n`
>  else
>         LINUX_COMPILE_HOST=$KBUILD_BUILD_HOST
>  fi
> --
> 2.28.0
>


-- 
Best Regards
Masahiro Yamada
