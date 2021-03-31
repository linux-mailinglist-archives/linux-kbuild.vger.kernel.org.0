Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F4F3505F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 20:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbhCaSBf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 14:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234738AbhCaSBY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 14:01:24 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B18C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 11:01:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s17so24917292ljc.5
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 11:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t9nMQTEmpT7k/RP+1/1nM1b4H1NgzFziXfj4iuE1q+g=;
        b=JrmLn+27truBlWU70KBlFbjf3BnhN2BonvBPyaskH1q4fTarMAgSc6yxIQQvh7vW0a
         YIjNBvBnkM5luLwvQ45+/hFGqkBEbutTjNKLX5T0BHeci58bZe9hFmHBOfFOiaYmEJoc
         A39FZyF3IBRNzShPWnHJyBbQSNd+3iiVs65P4DUHh/L5FzTD4knvdzABYZw3+WPyVjea
         esgumkbEOwS17+xhdECxRgvsJLU0v1NqVYBBK/E8qYCFLWJvpRru8PVmvCUQ7Dtsy58B
         G7I/HApX73BZj+z0Tm5QiZQ91kBoqYznQumQkT7v8qAlbqlqCRI0+p1niGn/8I3UTKfv
         wNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9nMQTEmpT7k/RP+1/1nM1b4H1NgzFziXfj4iuE1q+g=;
        b=L8osmyOTX9TBDTlGYMy6+ynyAYKeOjeJPp1bNlQnQ1eWgcFZv/0hHYT5+B9F7Q8hwy
         nZL/rIC8HCf265AQ8hDC94EBkH8D/cBiAHWz4TchK9zp9VhQGZcnjoSzw4UGFcMzuJp+
         ZMTjRdl7+p54bfnL2RTX9fMo2eGHRKJUAo0x4KW+AFh+Ef1NN1aiNmWsCP3MO49HGWPA
         2P8U4eeS+VtbTpxyBqhhvlcvwD6vpRBZnbPrX0s/jg2JBELqbODCf7fmRGyDM0DxwQya
         /Tg0YrERznN9N3n8zclT7V7AyLs/07+M8uIbvLWC26iUL1xRzbOKd4BaU7HqmogZKiUn
         RAYw==
X-Gm-Message-State: AOAM531a0z9AOtulYjYdMnkHrImLEbX2FiqKYO4D5x/ryoc0ZeEtQV+W
        qlTXFOiyjFbb+p/CqI973kcHf2vX0XVNnr0Lic2F+Ewz1eAdqVIM
X-Google-Smtp-Source: ABdhPJx4JPihO8TXaKxQJC0+V3RM2UedfYk6UaUvnoiri/D79GMCh16SgQLa3/M1zJjx47hDMPCJYeeZpyP11qjACss=
X-Received: by 2002:a2e:868e:: with SMTP id l14mr2910204lji.479.1617213682119;
 Wed, 31 Mar 2021 11:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210331133811.3221540-1-masahiroy@kernel.org> <20210331133811.3221540-9-masahiroy@kernel.org>
In-Reply-To: <20210331133811.3221540-9-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 31 Mar 2021 11:01:11 -0700
Message-ID: <CAKwvOdnS_V9GHF2WkdnhYE+v3qKJtEBF9k3T3ythmAc0gCiFzA@mail.gmail.com>
Subject: Re: [PATCH 9/9] kbuild: remove CONFIG_MODULE_COMPRESS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Terrell <terrelln@fb.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 31, 2021 at 6:39 AM Masahiro Yamada <masahiroy@kernel.org> wrote:

Should the online be Kconfig rather than Kbuild, for a commit that
only changes Kconfigs?

>
> CONFIG_MODULE_COMPRESS is only used to activate the choice for module
> compression algorithm. It will be simpler to make the choice visible
> all the time by adding CONFIG_MODULE_COMPRESS_NONE to allow the user to
> disable module compression.
>
> This is more consistent with the "Kernel compression mode" and "Built-in
> initramfs compression mode" choices.
>
> CONFIG_KERNEL_UNCOMPRESSED and CONFIG_INITRAMFS_COMPRESSION_NONE are
> available to choose to not compress the kernel, initrd, respectively.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  init/Kconfig | 45 ++++++++++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 019c1874e609..3ca1ffd219c4 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2225,40 +2225,47 @@ config MODULE_SIG_HASH
>         default "sha384" if MODULE_SIG_SHA384
>         default "sha512" if MODULE_SIG_SHA512
>
> -config MODULE_COMPRESS

The top level Makefile has comments and code that refer to this choice
which is now removed. I think you'll want to fix that up in this
change as well? Ah, patch 7 in the series does that:
https://lore.kernel.org/linux-kbuild/20210331133811.3221540-7-masahiroy@kernel.org/

Ok then this LGTM.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> -       bool "Compress modules on installation"
> +choice
> +       prompt "Module compression mode"
>         help
> +         This option allows you to choose the algorithm which will be used to
> +         compress modules when 'make modules_install' is run. (or, you can
> +         choose to not compress modules at all.)
>
> -         Compresses kernel modules when 'make modules_install' is run; gzip or
> -         xz depending on "Compression algorithm" below.
> +         External modules will also be compressed in the same way during the
> +         installation.
>
> -         module-init-tools MAY support gzip, and kmod MAY support gzip and xz.
> +         For modules inside an initrd or initramfs, it's more efficient to
> +         compress the whole initrd or initramfs instead.
>
> -         Out-of-tree kernel modules installed using Kbuild will also be
> -         compressed upon installation.
> +         This is fully compatible with signed modules.
>
> -         Note: for modules inside an initrd or initramfs, it's more efficient
> -         to compress the whole initrd or initramfs instead.
> +         Please note that the tool used to load modules needs to support the
> +         corresponding algorithm. module-init-tools MAY support gzip, and kmod
> +         MAY support gzip and xz.
>
> -         Note: This is fully compatible with signed modules.
> +         Your build system needs to provide the appropriate compression tool
> +         to compress the modules.
>
> -         If in doubt, say N.
> +         If in doubt, select 'None'.
>
> -choice
> -       prompt "Compression algorithm"
> -       depends on MODULE_COMPRESS
> -       default MODULE_COMPRESS_GZIP
> +config MODULE_COMPRESS_NONE
> +       bool "None"
>         help
> -         This determines which sort of compression will be used during
> -         'make modules_install'.
> -
> -         GZIP (default) and XZ are supported.
> +         Do not compress modules. The installed modules are suffixed
> +         with .ko.
>
>  config MODULE_COMPRESS_GZIP
>         bool "GZIP"
> +       help
> +         Compress modules with XZ. The installed modules are suffixed
> +         with .ko.gz.
>
>  config MODULE_COMPRESS_XZ
>         bool "XZ"
> +       help
> +         Compress modules with XZ. The installed modules are suffixed
> +         with .ko.xz.
>
>  endchoice
>
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
