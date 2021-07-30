Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CCE3DBDDC
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 19:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhG3RjE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 13:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbhG3RjE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 13:39:04 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24220C06175F;
        Fri, 30 Jul 2021 10:38:59 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id a201so814419ybg.12;
        Fri, 30 Jul 2021 10:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rM9HLpn3Mru11rr6wTme6jqjzsQsEvMXYiFywcoRNNM=;
        b=jCojo2dODTyduygoBbT1onhC7wFTe2J7cOSqAEodyoyLqpiSu6bDGE/H6LNWDNqjuY
         CHriceamhqsIrHyLIn8Mj57DGgvLojD/EK+75c0b37hrCpSafZqJLQ3F7ZefVoJB6ljY
         /lmObnq4arARmZV/omaimCsRw/LfA5k6BIAZWwTGvrrItIYMe5nPCwbOnMW10GoztK+L
         2FuROFVl6i8FRVGLoO0KzC33hchd1tiyEcb/WFG4wEZGf3VwsxW9mBYhqo9uVsZnfUlC
         F7Yz+BjnjLPyhOV4WKrYuMsQyTjrBIRZ9ZUOFTMPgLvXQY32g2j5ai1tCeExpfMP6tyy
         bymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rM9HLpn3Mru11rr6wTme6jqjzsQsEvMXYiFywcoRNNM=;
        b=uJSr9cQ/SmLQkK3R+d0nVamLVdbarJhvgjoh7SjyBMUndnZbrODanvau5+CahaSysE
         4Nu7XmTKa9p4GXHsLFR2XOkgprX4xbTHIgyjFHqYBHcnxixz4FxDXqbLwa2FjOErl9fj
         x7CzUjyiOvSR+UHv2Tl5qG7jIHdGCtfgYbCu6PNh5C5QXu75AqmNPDEm447HiFJ0NknS
         ZEICGsIYOzVB4AmjtpzpJVIfwKehewkzXeuKojnUXUHkZBpqFJoE/xzkBOIzTe87Zk7V
         RZvVe4i5kBnksbN9seO0/TunNcwE+iuCJxDo8wGn1M0lrzBYPEeAcvD8Hr+Kz/NUTgEy
         VJHQ==
X-Gm-Message-State: AOAM532Zlusi3HjAgeV/oJWbzRvJ4al/CxDfA+gjiR0Kr3opqlhXKVGg
        9cGY+ZTuB7usnrJBQ0dJXFI18jnUVf0wfBLrnmY=
X-Google-Smtp-Source: ABdhPJzhHQIpKIr8iIWnPF4UflUTrqVzZznsTECHUW5OfzaL5ieD5tLCtHGZUff821gp7UCMWPRDh6W+JIFMlwFkLCg=
X-Received: by 2002:a25:e74d:: with SMTP id e74mr4584014ybh.124.1627666738305;
 Fri, 30 Jul 2021 10:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210729001254.327661-1-masahiroy@kernel.org>
In-Reply-To: <20210729001254.327661-1-masahiroy@kernel.org>
From:   John S Gruber <johnsgruber@gmail.com>
Date:   Fri, 30 Jul 2021 13:38:46 -0400
Message-ID: <CAPotdmRSCnuTwHXc3Fi5b4w3TjEbJmwWUig4mcSNgFo7gXKNHw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: cancel sub_make_done for the install target to
 fix DKMS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 28, 2021 at 8:13 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit bcf637f54f6d ("kbuild: parse C= and M= before changing the
> working directory"), external modules invoked by DKMS fail to build
> because M= option is not parsed.
>
> I wanted to add 'unset sub_make_done' in install.sh but similar scripts,
> arch/*/boot/install.sh, are duplicated, so I set sub_make_done empty
> in the top Makefile.
>
> Fixes: bcf637f54f6d ("kbuild: parse C= and M= before changing the working directory")
> Reported-by: John S Gruber <johnsgruber@gmail.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index bb10a93edf5c..4193092f7c38 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1316,6 +1316,16 @@ PHONY += scripts_unifdef
>  scripts_unifdef: scripts_basic
>         $(Q)$(MAKE) $(build)=scripts scripts/unifdef
>
> +# ---------------------------------------------------------------------------
> +# Install
> +
> +# Many distros have the custom install script, /sbin/kernelinstall.
> +# If DKMS is installed, 'make install' will eventually recuses back
> +# to the this Makefile to build and install external modules.
> +# Cancel sub_make_done so that options such as M=, V=, etc. are parsed.
> +
> +install: sub_make_done=
> +
>  # ---------------------------------------------------------------------------
>  # Tools
>
> --
> 2.27.0
>

This patch tested successfully on my system on 5.14.0-rc3.
