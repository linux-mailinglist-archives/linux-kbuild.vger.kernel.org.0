Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B78C332D4F
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 18:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhCIRb7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 12:31:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:41770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231382AbhCIRbp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 12:31:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B0C36523A;
        Tue,  9 Mar 2021 17:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615311105;
        bh=WwGsyYl0mGvs5qNzf2Hgk3C3BWyDW/IU13qsV1twNRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TRx6bl/i3ONSZ4B7O9Zzx78ALkaiABcYVJd5c115UGwT97RbA3lHg6f2V5gKOd5Ed
         zDgVrxjB8H7esgZ0Ume+JxuOQExJLZ9ij0GBKnE88VyzNg79CmnIy/0UGM2+9FWu3T
         pWChYzUgLausUYhHWqZd/OjV09g6Wof/eSLktncDK2b5iuWeGxvhDmX0JE+6szZrYa
         lOpeCrI6NgJIY+qHXbQcWaImoCjf3EtihGOkhOJHm5o9PA4knUvVpVTrKZwNC0pWUT
         uIZ0jtkmDS9f8mmHwnm3VDFhXhlt8rqq2Cm7ryDFwpQbrdCDS4Os7gpeXfEspXVJIO
         abT+6gGVEor3A==
Date:   Tue, 9 Mar 2021 10:31:40 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] Fix ld-version.sh script if LLD was built with LLD_VENDOR
Message-ID: <20210309173140.qbd362rze2d5legg@archlinux-ax161>
References: <20210302221211.1620858-1-bero@lindev.ch>
 <CAK7LNARA3uKsW_G+gnCX6dvSwgXWzqgZON7pc6gBWdw9gimq1A@mail.gmail.com>
 <CAK7LNAQb2pCtFgebADigYoRJUo4M3i_4iwS=88QYZx5H+736Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQb2pCtFgebADigYoRJUo4M3i_4iwS=88QYZx5H+736Hw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 02:09:02AM +0900, Masahiro Yamada wrote:
> On Thu, Mar 4, 2021 at 12:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Thu, Mar 4, 2021 at 9:18 AM Bernhard Rosenkränzer <bero@lindev.ch> wrote:
> > >
> > > If LLD was built with -DLLD_VENDOR="xyz", ld.lld --version output
> > > will prefix LLD_VENDOR. Since LLD_VENDOR can contain spaces, the
> > > LLD identifier isn't guaranteed to be $2 either.
> > >
> > > Adjust the version checker to handle such versions of lld.
> > >
> > > Signed-off-by: Bernhard Rosenkränzer <bero@lindev.ch>
> > > ---
> >
> >
> > Bernhard,
> >
> > Could you senv v2
> > with the suggested code change?
> >
> > Please make sure to add
> > linux-kbuild@vger.kernel.org
> > in the To:
> 
> 
> I did not get v2, but never mind.
> I locally modified the code and applied.
> 
> I added Link: to your original patch
> just in case I make some mistake in the
> code refactoring.
> 
> 
> The final one looks as follows:
> 
> 
> 
> 
> 
> commit 0b2813ba7b0f0a9ff273177e85cbc93d92e76212
> Author: Bernhard Rosenkränzer <bero@lindev.ch>
> Date:   Tue Mar 2 23:12:11 2021 +0100
> 
>     kbuild: Fix ld-version.sh script if LLD was built with LLD_VENDOR
> 
>     If LLD was built with -DLLD_VENDOR="xyz", ld.lld --version output
>     will prefix LLD_VENDOR. Since LLD_VENDOR can contain spaces, the
>     LLD identifier isn't guaranteed to be $2 either.
> 
>     Adjust the version checker to handle such versions of lld.
> 
>     Link: https://lore.kernel.org/lkml/20210302221211.1620858-1-bero@lindev.ch/
>     Signed-off-by: Bernhard Rosenkränzer <bero@lindev.ch>
>     [masahiro yamada: refactor the code]

If it is not too late:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

>     Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index a463273509b5..30debf78aa09 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -44,14 +44,20 @@ if [ "$1" = GNU -a "$2" = ld ]; then
>  elif [ "$1" = GNU -a "$2" = gold ]; then
>         echo "gold linker is not supported as it is not capable of
> linking the kernel proper." >&2
>         exit 1
> -elif [ "$1" = LLD ]; then
> -       version=$2
> -       min_version=$lld_min_version
> -       name=LLD
> -       disp_name=LLD
>  else
> -       echo "$orig_args: unknown linker" >&2
> -       exit 1
> +       while [ $# -gt 1 -a "$1" != "LLD" ]; do
> +               shift
> +       done
> +
> +       if [ "$1" = LLD ]; then
> +               version=$2
> +               min_version=$lld_min_version
> +               name=LLD
> +               disp_name=LLD
> +       else
> +               echo "$orig_args: unknown linker" >&2
> +               exit 1
> +       fi
>  fi
> 
>  # Some distributions append a package release number, as in 2.34-4.fc32
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada
