Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D44D3AA8B2
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jun 2021 03:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbhFQBkH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Jun 2021 21:40:07 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:57827 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbhFQBkH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jun 2021 21:40:07 -0400
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 15H1bkrf005688;
        Thu, 17 Jun 2021 10:37:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 15H1bkrf005688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1623893867;
        bh=HIoxq7OeXB/HXXPGf7C+LKUoLnaEXtnEaOxI1wYpvEo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JTge8z/GOUCA3sW+79rtIX8Bpdl6e4ZYhkoxmOZiGyC3mvO304Vj45DJckHrjQacU
         PbnXFt2Z7ftvipWWsV0HlYgo9U+oEVukn5pYIpUbjeqwzVtzP+1QZiRgz/DvGANhmT
         mw9sOge2n90BKEwdPCWkpHy0J/JX/LG5fERB3QQerQqIcplIKrDrblkiejje0MFsDN
         lMmQC8r71JRGCNu0iXYyggmAaql+AfPA3MTkUttAjbKeZWji5lXc8swSD+zrYWvK7o
         1YY7DpNojmM4b6iKsoOvPkzmOTms0oMMuicj/1vLrTJVBAe3/sy234ASkKc33yMrrd
         MtPABW0veC18w==
X-Nifty-SrcIP: [209.85.215.171]
Received: by mail-pg1-f171.google.com with SMTP id q15so3567669pgg.12;
        Wed, 16 Jun 2021 18:37:46 -0700 (PDT)
X-Gm-Message-State: AOAM532z9pQwj7444r3Fr43myDuO33HRQIpwC4tvb5BmZoUik/W51STu
        WWtONVT+/AVzpydL/ZaenM+6sbuHMsfr01t7Avk=
X-Google-Smtp-Source: ABdhPJyBN58fpyRPEPgPvXIEGSZZ6tyzFeJu+323C2GaSIURzTNSrGTPPm18fMAv8mtw8Rnc9+X/B301RsFcQZH75So=
X-Received: by 2002:aa7:9ed2:0:b029:2fc:b328:ad67 with SMTP id
 r18-20020aa79ed20000b02902fcb328ad67mr2669207pfq.63.1623893866033; Wed, 16
 Jun 2021 18:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210602140213.132936-1-masahiroy@kernel.org>
In-Reply-To: <20210602140213.132936-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 17 Jun 2021 10:37:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARLctyjSoVCwLkwrGqRH6QFc93xTP8LFAJVgAz+f4YqFA@mail.gmail.com>
Message-ID: <CAK7LNARLctyjSoVCwLkwrGqRH6QFc93xTP8LFAJVgAz+f4YqFA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: remove trailing slashes from $(KBUILD_EXTMOD)
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 2, 2021 at 11:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> M= (or KBUILD_EXTMOD) generally expects a directory path without any
> trailing slashes, like M=a/b/c.
>
> If you add a trailing slash, like M=a/b/c/, you will get ugly build
> logs (two slashes in a series), but it still works fine as long as it
> is consistent between 'make modules' and 'make modules_install'.
>
> The following commands correctly build and install the modules.
>
>   $ make M=a/b/c/ modules
>   $ sudo make M=a/b/c/ modules_install
>
> Since commit ccae4cfa7bfb ("kbuild: refactor scripts/Makefile.modinst"),
> a problem happens if you add a trailing slash only for modules_install.
>
>   $ make M=a/b/c modules
>   $ sudo make M=a/b/c/ modules_install
>
> No module is installed in this case, Johannes Berg reported. [1]
>
> Trim any trailing slashes from $(KBUILD_EXTMOD).
>
> I used the 'dirname' command to remove all the trailing slashes in
> case someone adds more slashes like M=a/b/c/////. The Make's built-in
> function, $(dir ...) cannot take care of such a case.
>
> [1]: https://lore.kernel.org/lkml/10cc8522b27a051e6a9c3e158a4c4b6414fd04a0.camel@sipsolutions.net/
>
> Fixes: ccae4cfa7bfb ("kbuild: refactor scripts/Makefile.modinst")
> Reported-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.



> Changes in v2:
>   - Use $(filter %/, ) so that the shell invocation is avoided
>     if M= is already good.
>
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index b79e0e8acbe3..8018b8adbcaf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -129,6 +129,11 @@ endif
>  $(if $(word 2, $(KBUILD_EXTMOD)), \
>         $(error building multiple external modules is not supported))
>
> +# Remove trailing slashes
> +ifneq ($(filter %/, $(KBUILD_EXTMOD)),)
> +KBUILD_EXTMOD := $(shell dirname $(KBUILD_EXTMOD).)
> +endif
> +
>  export KBUILD_EXTMOD
>
>  # Kbuild will save output files in the current working directory.
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
