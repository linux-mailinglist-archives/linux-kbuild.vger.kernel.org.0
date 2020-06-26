Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4E220AC30
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 08:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgFZGSE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 02:18:04 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57237 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgFZGSE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 02:18:04 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 05Q6HZEj004759;
        Fri, 26 Jun 2020 15:17:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 05Q6HZEj004759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593152256;
        bh=023J8ksJ4vmuxcmwbZnNX00KqhCMhimoOjFSUNv0M5Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F8YgbYv9uTVGtt06nJM2nCq42dJung2LLDOuj78Ijy2qco6BInAItLqPWW0CSMdw2
         1f/rPNtemf1ASQOJhrkW5V/grtfkHpfOgxcFAcWQbA7vPfsNZTntT/Q2TEU4kFGJQo
         AEmWXMqviw/aFLqtNqwoh25Gi8z89cLOYRwZYILq5tFItGUAxAIOXV8YdzYanhxxtA
         UEum9d3reI4KVOrI/wNeybhXnFEv01RiZC9OF32A/vqB6pH8WpdmbJGywK424RwR3Y
         Ggpca2Hbq3OMA4+Va7Xt/T4QwRjWoDl+d6Tfm/kXqkhP/awlRgUp6U+Yy2cxny9Roc
         ZJwAwmx4jd8jQ==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id o15so4876522vsp.12;
        Thu, 25 Jun 2020 23:17:36 -0700 (PDT)
X-Gm-Message-State: AOAM531R+dX2xvGHN8VNEQcYqWDrYDBS4C/yFEVPGk1NgFfjield2ANY
        rfv81pbnb5XrHCMRBio8OGByEVoJ0xnSSMwuAcY=
X-Google-Smtp-Source: ABdhPJz23K/w9un4HtxmAZ4Lo6s5Frji+9Mn/0mD/OCvddq/ZO+vzwKm1nRNdz+EKc50XVPLdcyaFhuBo1f6KbCCaYA=
X-Received: by 2002:a67:22c7:: with SMTP id i190mr1265479vsi.179.1593152255223;
 Thu, 25 Jun 2020 23:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
In-Reply-To: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 26 Jun 2020 15:16:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
Message-ID: <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
To:     Domenico Andreoli <domenico.andreoli@linux.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 26, 2020 at 5:51 AM Domenico Andreoli
<domenico.andreoli@linux.com> wrote:
>
> From: Domenico Andreoli <domenico.andreoli@linux.com>
>
> Make 'make tar-pkg' install dtbs on arm64.
>
> Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>
>
> v2:
>  - Destination path includes the kernel version, as expected
>
> ---
>  scripts/package/buildtar |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> Index: b/scripts/package/buildtar
> ===================================================================
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -125,6 +125,15 @@ case "${ARCH}" in
>                 ;;
>  esac
>
> +#
> +# Install dtbs
> +#
> +case "${ARCH}" in

Instead of checking ${ARCH},
can you you do

     if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then

?

This is what the deb package build does:
https://github.com/masahir0y/linux/blob/v5.7/scripts/package/builddeb#L145


> +       arm64)
> +               make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> +               ;;
> +esac
> +


Or, you can use INSTALL_PATH="${tmpdir}/boot"
to make it shorter.




--
Best Regards
Masahiro Yamada
