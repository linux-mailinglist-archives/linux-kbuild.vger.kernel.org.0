Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45CD216734
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 09:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgGGHTz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 03:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgGGHTz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 03:19:55 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECFBC061755;
        Tue,  7 Jul 2020 00:19:55 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id i4so42025506iov.11;
        Tue, 07 Jul 2020 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pUcELUyx1ePV8JGPwNHC9kj6M/wJ4Z99BXP40MiJsuQ=;
        b=Iiqc7L/1eoO3HhnVjs00e1l5cW8R/SVcbdQRqn9fHQ2wzm3mS3qjOOkM2wiKChUUii
         dv5Dp2fNaU1yiHXsaGHvbuVhfn6Zdg+MtM8pHRR4bJuKT8D8uohOM7TgUfOFNmN5G+bs
         16gHzTvDXQNM8qRNyXiQ8LEKV2yokA6LVkxcKrfTis/koaT0fiOWh+5QbhWeZ4AF0At+
         Fqnak8r/4JFUl3wPTF1bPRqcMbvk6WpGpMJ9CVmxOaz47w3j80XNkwIAqYWoqlsBckZJ
         5EKvPqb2hxKsrZRtshmIUWoFzujX8T7ahYgAqC2z84dRT+NDfxJJ/m5OQ+hTkrVxQWpc
         ZTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pUcELUyx1ePV8JGPwNHC9kj6M/wJ4Z99BXP40MiJsuQ=;
        b=S+rSxA8CFaf7cAX/5j6vPJxZoVALJI+e63Xu6PFYguiC6/HIu6OjlGAMCa2JkP1JUp
         d7oGTiYPRcukNy57s9xAXL77JuJDCrYfMvXaOiZDKMk+Q8ODSDrkxm5Ew7pq8MWKHZc7
         AF4kFfvWqdeR/ifQuGffAkUdA1S4sigKLtDxmhVVvVzD8cLc/Wv5oW/c6bAbnZi+V400
         1c5UtKdglXANHko7aJp5Ngd+6y+NXP4oVf/PktK4Tl0g77iGyIsRsJsfl076QK+39z30
         ErNlW0C8X2pNBIwp+0q+lgLA2Z1Ry6SCidRtfT0YzTevfrzblTSUzVYLtmPFzhJrzEqt
         Pc6Q==
X-Gm-Message-State: AOAM530lfGBLahmdw31uFzSHapbAxl6EB6peM/axUMXSqW2naKr7Rzyw
        CUmz1RYXzvOI8D8n2pXjopobo6MS+XJwJs/yn8g=
X-Google-Smtp-Source: ABdhPJwuOppFGl440K2H40VeufUBRaWxM3V5jvkd7dqeqQXmhj+0K84TRGSTBjL1aMFjLSwfzGj4b/lM4Qas8No65wI=
X-Received: by 2002:a6b:ee02:: with SMTP id i2mr29458822ioh.110.1594106394647;
 Tue, 07 Jul 2020 00:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200707034604.1539157-1-nickrterrell@gmail.com> <20200707034604.1539157-5-nickrterrell@gmail.com>
In-Reply-To: <20200707034604.1539157-5-nickrterrell@gmail.com>
From:   Norbert Lange <nolange79@gmail.com>
Date:   Tue, 7 Jul 2020 09:19:43 +0200
Message-ID: <CADYdroOfCsGsjid9aSOLoRf9gycc1iLD9JndH8WF+Rg+a5Gu-g@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] init: add support for zstd compressed kernel
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org,
        x86@kernel.org, gregkh@linuxfoundation.org,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks for the respin.

Am Di., 7. Juli 2020 um 05:51 Uhr schrieb Nick Terrell <nickrterrell@gmail.com>:
>
> From: Nick Terrell <terrelln@fb.com>
>
> * Adds the zstd cmd to scripts/Makefile.lib
> * Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options
>
> Architecture specific support is still needed for decompression.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Terrell <terrelln@fb.com>
> ---
>  init/Kconfig         | 15 ++++++++++++++-
>  scripts/Makefile.lib | 15 +++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 0498af567f70..8d99f0c5e240 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -191,13 +191,16 @@ config HAVE_KERNEL_LZO
>  config HAVE_KERNEL_LZ4
>         bool
>
> +config HAVE_KERNEL_ZSTD
> +       bool
> +
>  config HAVE_KERNEL_UNCOMPRESSED
>         bool
>
>  choice
>         prompt "Kernel compression mode"
>         default KERNEL_GZIP
> -       depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERNEL_UNCOMPRESSED
> +       depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERNEL_ZSTD || HAVE_KERNEL_UNCOMPRESSED
>         help
>           The linux kernel is a kind of self-extracting executable.
>           Several compression algorithms are available, which differ
> @@ -276,6 +279,16 @@ config KERNEL_LZ4
>           is about 8% bigger than LZO. But the decompression speed is
>           faster than LZO.
>
> +config KERNEL_ZSTD
> +       bool "ZSTD"
> +       depends on HAVE_KERNEL_ZSTD
> +       help
> +         ZSTD is a compression algorithm targeting intermediate compression
> +         with fast decompression speed. It will compress better than GZIP and
> +         decompress around the same speed as LZO, but slower than LZ4. You
> +         will need at least 192 KB RAM or more for booting. The zstd command
> +         line tools is required for compression.
> +
>  config KERNEL_UNCOMPRESSED
>         bool "None"
>         depends on HAVE_KERNEL_UNCOMPRESSED
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 916b2f7f7098..d960f8815f87 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -413,6 +413,21 @@ quiet_cmd_xzkern = XZKERN  $@
>  quiet_cmd_xzmisc = XZMISC  $@
>        cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
>
> +# ZSTD
> +# ---------------------------------------------------------------------------
> +# Appends the uncompressed size of the data using size_append. The .zst
> +# format has the size information available at the beginning of the file too,
> +# but it's in a more complex format and it's good to avoid changing the part
> +# of the boot code that reads the uncompressed size.
> +# Note that the bytes added by size_append will make the zstd tool think that
> +# the file is corrupt. This is expected.
> +
> +quiet_cmd_zstd = ZSTD    $@
> +cmd_zstd = (cat $(filter-out FORCE,$^) | \
> +       zstd -19 && \
> +        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> +       (rm -f $@ ; false)

Is there any reason not to use '--ultra -22' ?
As far as I understand the other patches, the decompression should be
able to handle it,
and in terms of time required for a kernel build the difference is
insignificant.

And would it be better to run zstd on a prepared file instead of
stream enconding?
windowsize would be adjusted to min(windowsize, filesize) for one.

Regards, Norbert
