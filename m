Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A1264CC66
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Dec 2022 15:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238670AbiLNOfn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Dec 2022 09:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238650AbiLNOfl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Dec 2022 09:35:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBE82711
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Dec 2022 06:35:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2C018B818DD
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Dec 2022 14:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEACC43396
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Dec 2022 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671028536;
        bh=cBi5hDO8PMGnnOldzxO1oA3tCWWKbBgek3QPmfFMBcI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qDYaBUzvV77TJqzTM0fIYOCs+kwKTs31zg/kE6+hP78/vNu2RDrbbnLSZVQBgeCmo
         jfuVOxgnEdcf1rLWp/YFzsvyHlCc7BJMIlj8EK5d/HsACE0Q5miW0zDmWV3bOMpojy
         bpwN3sRSZ9qaHu+3xqhuNS+kKRvOeWbtaptROb4eHdANuNDws43jx+VqtU8vx5lwfu
         GhPQnje2QMx17BRMhDxU9LTt/NSEltBQjR11/hBgP/Ih53XANfhN4d8GOKhHVn3/61
         a0+a8+4NUKBIEX0gp3crYf+pQHREu4c9vpZkfLvQN6u5JxHzZKZfvRH0ikeyAAfBwO
         0EDodOJs9G9pg==
Received: by mail-lf1-f46.google.com with SMTP id bp15so10730561lfb.13
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Dec 2022 06:35:36 -0800 (PST)
X-Gm-Message-State: ANoB5pmmSOlZqskE35ugPd/eQxG19qSTZaJ2Pm9qf8Kv48YUbGzDSIP3
        0f224aaK5/kWdynNI+KkrVlEmeIRtotVPSmRavM=
X-Google-Smtp-Source: AA0mqf63lIj9/lf2CazibSyOHVL7lzZ7oLD/aolYwBwrcP6VmQpxW1rBSEKAkeGN4xTi5viQdlQGihYfhqRZlW+ei4k=
X-Received: by 2002:a19:6b19:0:b0:4a2:740b:5b02 with SMTP id
 d25-20020a196b19000000b004a2740b5b02mr30834951lfa.122.1671028534846; Wed, 14
 Dec 2022 06:35:34 -0800 (PST)
MIME-Version: 1.0
References: <20221214132002.2547357-1-vkabatov@redhat.com>
In-Reply-To: <20221214132002.2547357-1-vkabatov@redhat.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 14 Dec 2022 15:35:23 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGR2ZZaGohN+KG=1rj4dtFab4Ga4XxaNnZHs1dCB083Aw@mail.gmail.com>
Message-ID: <CAMj1kXGR2ZZaGohN+KG=1rj4dtFab4Ga4XxaNnZHs1dCB083Aw@mail.gmail.com>
Subject: Re: [PATCH] buildtar: fix tarballs with EFI_ZBOOT enabled
To:     Veronika Kabatova <vkabatov@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>
Cc:     linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        catalin.marinas@arm.com, jeremy.linton@arm.com, will@kernel.org,
        masahiroy@kernel.org, CKI Project <cki-project@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 14 Dec 2022 at 14:20, Veronika Kabatova <vkabatov@redhat.com> wrote:
>
> When CONFIG_EFI_ZBOOT is enabled, the binary name is not Image.gz
> anymore but vmlinuz.efi. No vmlinuz gets put into the tarball as the
> buildtar script doesn't recognize this name. Remedy this by adding the
> binary name to the list of acceptable files to package.
>
> Reported-by: CKI Project <cki-project@redhat.com>
> Signed-off-by: Veronika Kabatova <vkabatov@redhat.com>

Thanks for the patch.

I think the same change should be applied to risc-v as well, cc'ing Palmer.

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> ---
>  scripts/package/buildtar | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index cb54c7f1aa80..4d6f0b128efd 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -122,7 +122,7 @@ case "${ARCH}" in
>                 fi
>                 ;;
>         arm64)
> -               for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo ; do
> +               for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo vmlinuz.efi ; do
>                         if [ -f "${objtree}/arch/arm64/boot/${i}" ] ; then
>                                 cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>                                 break
> --
> 2.38.1
>
