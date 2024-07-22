Return-Path: <linux-kbuild+bounces-2625-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5CD938D68
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 12:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D50F2B2099D
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 10:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056CF34CDE;
	Mon, 22 Jul 2024 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVv6U1Iz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4023DE;
	Mon, 22 Jul 2024 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721643851; cv=none; b=rE3eHEkiqN2jCLBaH69otmuMqjjM0IbfhyvrAFkkDD9WW4Nwof3A5YISF+ZRNAZEG27mtS7yAV1qAN4zcUUO2eu31ZrbI2t/sHoKq4UfPmb7JCGM3MsJXPqEEmHyEAaa8t83iWjuk1JpYxcb+Drg4ofmeOnOkWRmzI5m/2VfwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721643851; c=relaxed/simple;
	bh=5VaYzgbt0J7GPtaG6rRV1Br4DXdI291awdYYd3jN9pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvsThG2V9tHya1C0hfKU5r3hAZk3vh71pbRgBNcCg9yaRtscCGSS5xrYi08uqghXce4rbLE2H+B9Hco9dPGiUyRLqvIEPMxp18DC8Trb+LFVVAunwNlEu7tJVxWzHnJeGQ/2DxGX1jR61MxH4nV4RwJKBzRPIHaCr1BvOHy46zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVv6U1Iz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA33C116B1;
	Mon, 22 Jul 2024 10:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721643851;
	bh=5VaYzgbt0J7GPtaG6rRV1Br4DXdI291awdYYd3jN9pY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FVv6U1IzzroYWc7GcqZrDeF6KL7KWMV22lrAQCgFjtIvR5KPpaxvcNTC5JXOH2nEQ
	 md1IqoeLr1HeuFoBp61k0ZQZenD0sHJgL8kihqcNm5JwhNp0s6MUY2VtG6b65VGZJr
	 JqrCJRk0ulOB5nsXBCnqiAQTLFQbldADkQpO7xYRa1JpTSVTJHmAH03gafEo8pHuXR
	 57ol9RJ69yDnVtBuhJYplttdCSPyOz7wHucR11XRlc8VfOUT9ZGz9GZWXrkiumTh5f
	 yZhz6It3qnTd0YRy26HSQButI+1OoK0gkqajsyqsItmGpzj9Q9ZHgxmFBerzIBKJaL
	 9rcewKbzYPdhw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f024f468bso1416746e87.1;
        Mon, 22 Jul 2024 03:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtV1GViAw3bCp5joCbRqtxMjH1umqUPv22p2TeWalIwWVpjMERBDsXaT+a/ZSQpz8jXYKxrpR96XsAUylJatS2c8/ztv9J+ldCmdE6KgXjvErrx0DoKCptKkiTCCnOLbJVqEb12lRH/skDdmqrBVvjsVHtNpOsJ00bHK4zlKJ6F1PiZWUTnXJZpg==
X-Gm-Message-State: AOJu0Yzh5q28kDfG8VSdf7MsS8EI4hqwnxfrEeUMP4E6zITtCYf6rXiN
	0qhwoP6sCago+SvO8GHst4ZeOznZBjmVR+XYOY0Xdtoz5kjox15DwRwRac1orNPFUojknZvw8In
	PuKk9EjaT1sml5Rx5vNBDNPymdlI=
X-Google-Smtp-Source: AGHT+IHCMwyOvhOVoYwO9D5qsJ5G1COWoX6qwnneUOepPJ2Uv1CE50rCiUP9dKQHtXLpsMUr3CPTtr5uKFzieKPBTss=
X-Received: by 2002:a05:6512:2209:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-52efb7e8103mr4327063e87.29.1721643849719; Mon, 22 Jul 2024
 03:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722090622.16524-1-petr.pavlu@suse.com> <20240722090622.16524-2-petr.pavlu@suse.com>
In-Reply-To: <20240722090622.16524-2-petr.pavlu@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 22 Jul 2024 19:23:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATG-kYuxGgzC7e-BbTPMnSH+MCAEVOXoQkdGYH9xLincA@mail.gmail.com>
Message-ID: <CAK7LNATG-kYuxGgzC7e-BbTPMnSH+MCAEVOXoQkdGYH9xLincA@mail.gmail.com>
Subject: Re: [PATCH 1/2] module: Split modules_install compression and
 in-kernel decompression
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 6:07=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> The kernel configuration allows specifying a module compression mode. If
> one is selected then each module gets compressed during
> 'make modules_install' and additionally one can also enable support for
> a respective direct in-kernel decompression support. This means that the
> decompression support cannot be enabled without the automatic compression=
.
>
> Some distributions, such as the (open)SUSE family, use a signer service f=
or
> modules. A build runs on a worker machine but signing is done by a separa=
te
> locked-down server that is in possession of the signing key. The build
> invokes 'make modules_install' to create a modules tree, collects
> information about the modules, asks the signer service for their signatur=
e,
> appends each signature to the respective module and compresses all module=
s.
>
> When using this arrangment, the 'make modules_install' step produces
> unsigned+uncompressed modules and the distribution's own build recipe tak=
es
> care of signing and compression later.
>
> The signing support can be currently enabled without automatically signin=
g
> modules during 'make modules_install'. However, the in-kernel decompressi=
on
> support can be selected only after first enabling automatic compression
> during this step.
>
> To allow only enabling the in-kernel decompression support without the
> automatic compression during 'make modules_install', separate the
> compression options similarly to the signing options, as follows:
>
> > Enable loadable module support
> [*] Module compression
>       Module compression type (GZIP)  --->
> [*]   Automatically compress all modules
> [ ]   Support in-kernel module decompression
>
> * "Module compression" (MODULE_COMPRESS) is a new main switch for the
>   compression/decompression support. It replaces MODULE_COMPRESS_NONE.
> * "Module compression type" (MODULE_COMPRESS_<type>) chooses the
>   compression type, one of GZ, XZ, ZSTD.
> * "Automatically compress all modules" (MODULE_COMPRESS_ALL) is a new
>   option to enable module compression during 'make modules_install'. It
>   defaults to Y.
> * "Support in-kernel module decompression" (MODULE_DECOMPRESS) enables
>   in-kernel decompression.
>
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---



My preference is to add
 CONFIG_MODULE_DECOMPRESS_GZIP
 CONFIG_MODULE_DECOMPRESS_XZ
 CONFIG_MODULE_DECOMPRESS_ZSTD
instead of
 CONFIG_MODULE_COMPRESS_ALL.




For example,


if MODULE_DECOMPRESS

config MODULE_DECOMPRESS_GZIP
       bool "Support in-kernel GZIP decompression for module"
       default MODULE_COMPRESS_GZIP

config MODULE_DECOMPRESS_XZ
       bool "Support in-kernel XZ decompression for module"
       default MODULE_COMPRESS_XZ

config MODULE_DECOMPRESS_ZSTD
       bool "Support in-kernel ZSTD decompression for module"
       default MODULE_COMPRESS_ZSTD

endif





OR, maybe



config MODULE_DECOMPRESS_GZIP
       bool "Support in-kernel GZIP decompression for module"
       select MODULE_DECOMPRESS

config MODULE_DECOMPRESS_XZ
       bool "Support in-kernel XZ decompression for module"
       select MODULE_DECOMPRESS

config MODULE_DECOMPRESS_ZSTD
       bool "Support in-kernel ZSTD decompression for module"
       select MODULE_DECOMPRESS

config MODULE_DECOMPRESS
       bool




You can toggle MODULE_COMPRESS_GZIP and
MODULE_DECOMPRESS_GZIP independently


Of course, the current kernel/module/decompress.c does not
work when multiple (or zero) CONFIG_MODULE_DECOMPRESS_* is
enabled. It needs a little modification.


I will wait for Lius's comment.







>  kernel/module/Kconfig    | 61 ++++++++++++++++++++--------------------
>  scripts/Makefile.modinst |  2 ++
>  2 files changed, 33 insertions(+), 30 deletions(-)
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 4047b6d48255..bb7f7930fef6 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -278,64 +278,65 @@ config MODULE_SIG_HASH
>         default "sha3-384" if MODULE_SIG_SHA3_384
>         default "sha3-512" if MODULE_SIG_SHA3_512
>
> -choice
> -       prompt "Module compression mode"
> +config MODULE_COMPRESS
> +       bool "Module compression"
>         help
> -         This option allows you to choose the algorithm which will be us=
ed to
> -         compress modules when 'make modules_install' is run. (or, you c=
an
> -         choose to not compress modules at all.)
> -
> -         External modules will also be compressed in the same way during=
 the
> -         installation.
> -
> -         For modules inside an initrd or initramfs, it's more efficient =
to
> -         compress the whole initrd or initramfs instead.
> -
> +         Enable module compression to reduce on-disk size of module bina=
ries.
>           This is fully compatible with signed modules.
>
> -         Please note that the tool used to load modules needs to support=
 the
> -         corresponding algorithm. module-init-tools MAY support gzip, an=
d kmod
> -         MAY support gzip, xz and zstd.
> +         The tool used to work with modules needs to support the selecte=
d
> +         compression type. kmod MAY support gzip, xz and zstd. Other too=
ls
> +         might have a limited selection of the supported types.
>
> -         Your build system needs to provide the appropriate compression =
tool
> -         to compress the modules.
> +         Note that for modules inside an initrd or initramfs, it's more
> +         efficient to compress the whole ramdisk instead.
>
> -         If in doubt, select 'None'.
> +         If unsure, say N.
>
> -config MODULE_COMPRESS_NONE
> -       bool "None"
> +choice
> +       prompt "Module compression type"
> +       depends on MODULE_COMPRESS
>         help
> -         Do not compress modules. The installed modules are suffixed
> -         with .ko.
> +         Choose the supported algorithm for module compression.
>
>  config MODULE_COMPRESS_GZIP
>         bool "GZIP"
>         help
> -         Compress modules with GZIP. The installed modules are suffixed
> -         with .ko.gz.
> +         Support modules compressed with GZIP. The installed modules are
> +         suffixed with .ko.gz.
>
>  config MODULE_COMPRESS_XZ
>         bool "XZ"
>         help
> -         Compress modules with XZ. The installed modules are suffixed
> -         with .ko.xz.
> +         Support modules compressed with XZ. The installed modules are
> +         suffixed with .ko.xz.
>
>  config MODULE_COMPRESS_ZSTD
>         bool "ZSTD"
>         help
> -         Compress modules with ZSTD. The installed modules are suffixed
> -         with .ko.zst.
> +         Support modules compressed with ZSTD. The installed modules are
> +         suffixed with .ko.zst.
>
>  endchoice
>
> +config MODULE_COMPRESS_ALL
> +       bool "Automatically compress all modules"
> +       default y
> +       depends on MODULE_COMPRESS
> +       help
> +         Compress all modules during 'make modules_install'.
> +
> +         Your build system needs to provide the appropriate compression =
tool
> +         for the selected compression type. External modules will also b=
e
> +         compressed in the same way during the installation.
> +
>  config MODULE_DECOMPRESS
>         bool "Support in-kernel module decompression"
> -       depends on MODULE_COMPRESS_GZIP || MODULE_COMPRESS_XZ || MODULE_C=
OMPRESS_ZSTD
> +       depends on MODULE_COMPRESS
>         select ZLIB_INFLATE if MODULE_COMPRESS_GZIP
>         select XZ_DEC if MODULE_COMPRESS_XZ
>         select ZSTD_DECOMPRESS if MODULE_COMPRESS_ZSTD
>         help
> -
>           Support for decompressing kernel modules by the kernel itself
>           instead of relying on userspace to perform this task. Useful wh=
en
>           load pinning security policy is enabled.
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 0afd75472679..bce4a9adb893 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -51,9 +51,11 @@ $(foreach x, % :, $(if $(findstring $x, $(dst)), \
>         $(error module installation path cannot contain '$x')))
>
>  suffix-y                               :=3D
> +ifdef CONFIG_MODULE_COMPRESS_ALL
>  suffix-$(CONFIG_MODULE_COMPRESS_GZIP)  :=3D .gz
>  suffix-$(CONFIG_MODULE_COMPRESS_XZ)    :=3D .xz
>  suffix-$(CONFIG_MODULE_COMPRESS_ZSTD)  :=3D .zst
> +endif
>
>  modules :=3D $(patsubst $(extmod_prefix)%.o, $(dst)/%.ko$(suffix-y), $(m=
odules))
>  install-$(CONFIG_MODULES) +=3D $(modules)
> --
> 2.35.3
>


--=20
Best Regards
Masahiro Yamada

