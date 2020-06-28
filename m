Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF6120C59F
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 05:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgF1Drn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Jun 2020 23:47:43 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:29721 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgF1Drn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 23:47:43 -0400
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 05S3lTEP027124;
        Sun, 28 Jun 2020 12:47:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 05S3lTEP027124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593316050;
        bh=DLNJ5n4cDSP7nNoCWr7ufMcVCanKA6C664RpkVp1ifQ=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=rU37KV/4lyn1VBBeafbpbk1h3fG+m59OGAmQKlBI/v8De2NtLyFAC9gkAgf9UbTVE
         nimcy8aGMVpl4xPoiRywHQQG4EvsNbtnWFPKoEViTx2F76lWzpsWH7izZKBO8nUpQL
         m9/yYUuBNHWZ4U5FspNrYhBFODANc8rZLBxB8x85S8tT/fDdHs9/mhFP+KMjMDzopc
         HHz+tSIu2x8YPVKqSRDCRiDsaj3jUE51U5/rSDw+2KoM3opm9XzkFjdpo5K3JAoFAc
         16dNlcYq6uQpqGNmRZjoB9LdhdMsFCf7Ith0tGDQwxAmoafe31vpydOJTaWhI5yJUM
         OCP2ec7hafo/A==
X-Nifty-SrcIP: [209.85.221.174]
Received: by mail-vk1-f174.google.com with SMTP id y3so2751660vkg.11;
        Sat, 27 Jun 2020 20:47:30 -0700 (PDT)
X-Gm-Message-State: AOAM530bzBLIiPdnWN/eA106sBLw5SQeYyX2G+8iVy3NECUIYX1XrQZQ
        4IY0gBKq5l2Y/h+V+4bI/L8QdS02u/t9okFGfVk=
X-Google-Smtp-Source: ABdhPJzt0BA+jKtWdgdbGLuDTN7+LBF55P4cEfsNWtT0ID2LbZ77FcdYcud2sM7RwWt/3K2h26n2mx5anxaNCJbK76Y=
X-Received: by 2002:a1f:a8d0:: with SMTP id r199mr6474281vke.26.1593316049260;
 Sat, 27 Jun 2020 20:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200627122505.GA6095@dumbo>
In-Reply-To: <20200627122505.GA6095@dumbo>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 12:46:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQNRdY1B8=XChZsnS8nGJwptKnZL=eES8sXgX+hCu6-Q@mail.gmail.com>
Message-ID: <CAK7LNASQNRdY1B8=XChZsnS8nGJwptKnZL=eES8sXgX+hCu6-Q@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: buildtar: add dtbs support
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
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

On Sat, Jun 27, 2020 at 9:25 PM Domenico Andreoli
<domenico.andreoli@linux.com> wrote:
>
> From: Domenico Andreoli <domenico.andreoli@linux.com>
>
> Make 'make tar-pkg' install dtbs.
>
> v4:
>  - Install the dtbs before modules & kernel, not after
>  - Check for the dtbs_install target before attempting to invoke it
>
> v3:
>  - Check for CONFIG_OF_EARLY_FLATTREE=y instead of ARCH before installing dtbs
>
> v2:
>  - Add the kernel release to the destination path
>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>


Applied to linux-kbuild.
Thanks.

> ---
>  scripts/package/buildtar |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> Index: b/scripts/package/buildtar
> ===================================================================
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -53,6 +53,18 @@ rm -rf -- "${tmpdir}"
>  mkdir -p -- "${tmpdir}/boot"
>  dirs=boot
>
> +
> +#
> +# Try to install dtbs
> +#
> +if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then
> +       # Only some architectures with OF support have this target
> +       if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
> +               $MAKE ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> +    fi
> +fi
> +
> +
>  #
>  # Try to install modules
>  #
>
> --
> rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
> ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05



-- 
Best Regards
Masahiro Yamada
