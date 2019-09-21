Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96CF3B9C9A
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Sep 2019 08:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730976AbfIUGbZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 21 Sep 2019 02:31:25 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63707 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729346AbfIUGbZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Sep 2019 02:31:25 -0400
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x8L6V3co010207;
        Sat, 21 Sep 2019 15:31:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x8L6V3co010207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569047463;
        bh=I2MuW03AliQw/gaYqV9LysZAy2kLY2LmxSGuO1+KXSA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BI5a+GuFu55tec5avj/1Y+0ePxka/rxrCS8vR+x9WORJGDyeQfdbR/oe/f1x170xo
         c/eLvydjxVJscY8Ea3CcruiTMeVRnOl2NApzdLbooVtWZ9Dos5P0BZIhAd7X4AHXL+
         g2ee0HZVovnTSX27iO8g3J5QCOVaAi7aXGSlY5pFGXKChSoQf8VQUDd+udTuJnaXb6
         1t78cq7/4ecJwk6lZVM3lRJxgbfEIK3WaPbFMGAaja7TBSNDigK5fI+uYb1SM/XfJq
         DadroPJKs3Q5DDLnKeIxDl+s74jMNkimbYwxDV9fefDUykfmUpUI1Uk+JCmxRyXCQn
         tyyeckXSbp2Xw==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id q186so2043722vkb.0;
        Fri, 20 Sep 2019 23:31:03 -0700 (PDT)
X-Gm-Message-State: APjAAAUis8hFdn7Bb9jrxJqHz6vPV3TJ4DVJcIleM1x8KP1LtKg7IByT
        CL6pRQeW0TNu/2KX+bNHmk8ICn2TDCVbnCpB47g=
X-Google-Smtp-Source: APXvYqx+/dL8nburdX1VqaeNQP8WSs8ZCkOLM2bBvOWhD93+WGpKH8Xgg6seoQYhLdNlViSC1GyWRHsEdIPzBuoapnc=
X-Received: by 2002:a1f:294a:: with SMTP id p71mr10664037vkp.74.1569047462532;
 Fri, 20 Sep 2019 23:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <1569006062-17862-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1569006062-17862-1-git-send-email-jhugo@codeaurora.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 21 Sep 2019 15:30:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNATHu6M8zKQi4O30Dvijg0zi8Lvxv6EBbWOE+H_s=E6m+Q@mail.gmail.com>
Message-ID: <CAK7LNATHu6M8zKQi4O30Dvijg0zi8Lvxv6EBbWOE+H_s=E6m+Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: binrpm-pkg: Propagate O= to rpmbuild
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jeffrey,

On Sat, Sep 21, 2019 at 4:01 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> If the user specifies O= to indicate a specific output directory for the
> build, rpmbuild does not honor this, and will use its default, which could
> be the user's home directory.  In cases where the user has limited home
> directory space, this could cause the build to outright fail.
>
> In the case of the binrpm-pkg target, redefine the top directory for output
> to be what the user specified in O=, thus the user will find a "rpmbuild"
> subdirectory in that location with all of the RPM artifacts.
>
> This does not apply to rpm-pkg, since we already cannot handle creating
> the source tarball out of tree.
>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>


binrpm-pkg creates intermediate build artifacts in $(objtree)/,
but puts only the final .rpm into ${HOME}/rpmbuild/RPMS/${ARCH}/.

It has worked like that since a long time before
probably in order to respect the default of rpmbuild.


If you change this behavior, it should be consistent.
The 'rpmbuild' should be always located in the kernel tree
instead of the user's home directory.

But, doing so might give impact to other users who
rely on having 'rpmbuild' in the home directory.
I have to hear opinions from others
if this change is desired.

Meanwhile, if you are unhappy with that, one solution is to use RPMOPTS.
RPMOPTS exists to tweak the default behavior.


Thanks.


> ---
>  scripts/Makefile.package | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 56eadcc..aab0711 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -21,7 +21,7 @@ include $(srctree)/scripts/Kbuild.include
>  # - Use /. to avoid tar packing just the symlink
>
>  # Note that the rpm-pkg target cannot be used with KBUILD_OUTPUT,
> -# but the binrpm-pkg target can; for some reason O= gets ignored.
> +# but the binrpm-pkg target can
>
>  # Remove hyphens since they have special meaning in RPM filenames
>  KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
> @@ -33,6 +33,12 @@ TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
>                 Kbuild Kconfig COPYING $(wildcard localversion*)
>  MKSPEC     := $(srctree)/scripts/package/mkspec
>
> +RPM_OUTDIR :=
> +ifneq ($(objtree),$(srctree))
> +# Using absolute path as relative path will cause parts of rpmbuild to fail
> +        RPM_OUTDIR := --define "_topdir $(abs_objtree)/rpmbuild"
> +endif
> +
>  quiet_cmd_src_tar = TAR     $(2).tar.gz
>        cmd_src_tar = \
>  if test "$(objtree)" != "$(srctree)"; then \
> @@ -65,8 +71,8 @@ PHONY += binrpm-pkg
>  binrpm-pkg:
>         $(MAKE) -f $(srctree)/Makefile
>         $(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
> -       +rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
> -               $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
> +       +rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" $(RPM_OUTDIR) \
> +               --target $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>
>  PHONY += deb-pkg
>  deb-pkg:
> --
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
>


--
Best Regards
Masahiro Yamada
