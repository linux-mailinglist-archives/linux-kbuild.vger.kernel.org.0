Return-Path: <linux-kbuild+bounces-2918-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E4E94CFF1
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 14:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10B23B20E7B
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 12:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42FA193092;
	Fri,  9 Aug 2024 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRN/2jYx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC7A190684;
	Fri,  9 Aug 2024 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723205754; cv=none; b=rvgutAaVDLYHGwThMRbQoWwn3YwImYQuWZrjIBb/uAnc7FHzd7vG03kHEMOkA7qpEmDjOtMjL1qRLoBYevf6lipOOcqCPQ/OFhb52jVPs1b7AXwMJqHFk/Gbz977ymSgJB6+GejFyGbVXtBdexZEgLVBjjHroQV6M618uNzSkbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723205754; c=relaxed/simple;
	bh=YmzphMja6XXmXFsRDikB4wVg7CMV9XsA3fHfiK6varY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qshsMgUTJs6RgoRo0sS0PW/HblWgP2MrNw8xIqGyKtUPE8lKS3p3yzftWqwp4Wg/AhNEH0J+TERBjwnQDTNWG+7XzRILYP2oSVzPT3hA+SFCUkfUBz0mlXV8F2hShjQwc+Acd8x+9wxWBET6+uWIiYC0i3wFRNHQXiO/kBG1ZzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRN/2jYx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433BBC4AF18;
	Fri,  9 Aug 2024 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723205754;
	bh=YmzphMja6XXmXFsRDikB4wVg7CMV9XsA3fHfiK6varY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fRN/2jYxvxAK2rPD3+0naMbaZ/DnT37y8CwrQvdGhQ5zxh/2Z+G0bnaEdZKNDyS3l
	 yBGIzBnKK5I66olifKJ+Xe3c70z15ijiIrBrEwB8qDXOFo1cXjMwLfbE1HwtSELDcr
	 cr3NGFHumQf2V5oaCmKYbFErdr17fgRqOndlWO6eoZG9HF+4kHn0PRVEaR2u64sl7w
	 6+nHVpfU8Y9irVsV+NuCz95HvmH+bk0DRm7Hiqr7Ca/EProf7zoSean45ouoNR9xqX
	 WvQT1EfO599+KS8CWjkHm6uEsz2r2ssdlmB3ttsSVZ4xxM6fFpReUasLUCFVn8H5O8
	 rE0BWb9/quglQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-530ae4ef29dso3603303e87.3;
        Fri, 09 Aug 2024 05:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWorwrTi7DfiwYb9aTtQcGBWX3PNyaKplciWD27/8RvsxSxdAEZpLpUoEDyyBi5oEF4RSJ397JsK0LQYetHpef6eCm2n/TfImWbULEEjusBh8M4gAFM/GgFZm6oa09eFLVddjX0DMqE0DZhTWa4hSxJObbqmk8u38Q0K9hjZd5rpWRIpXxJCZ4Q0HLxTQcpuOhTxHWYpzgzuCNiiLKHYmhYFQ==
X-Gm-Message-State: AOJu0YwJjs3rQUFLHpOLuZ4PZE0sqFsB6Cxlm8Zz1L62qPVPWowrB39P
	zIE61RjUPPv+2gPtrymOTihbS5IStMrmosjoPkOXB71WkBVsH3l2lm931kCnwLiFxhdPVe7NGNW
	g7bH3j1BjDyOt/IgmK03PjOA2g8w=
X-Google-Smtp-Source: AGHT+IGlPsd9qpxK+kaW4uaKRNj+aYSzSne6anO3DKhp0I4fJNAaAhyO1zxPErAVmUP4wrg91CYucQo7Gmyudhjr2sM=
X-Received: by 2002:a05:6512:2311:b0:52c:db76:2a7a with SMTP id
 2adb3069b0e04-530ee9b76bemr1127480e87.34.1723205752741; Fri, 09 Aug 2024
 05:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com> <20240807-macos-build-support-v1-11-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-11-4cd1ded85694@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 9 Aug 2024 21:15:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARafZ=zFMeoDdiMh=ZRU_XiJ08Naf=oAdYpOiUN02HizQ@mail.gmail.com>
Message-ID: <CAK7LNARafZ=zFMeoDdiMh=ZRU_XiJ08Naf=oAdYpOiUN02HizQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] tty/vt: conmakehash requires linux/limits.h
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> macOS hosts do not provide the linux/limits.h header required for
> conmakehash. To address this, ensure that usr/include is included in
> the conmakehash HOSTCFLAGS. This will provide the necessary header for
> successful compilation on macOS.
>
> Fixes error:
> HOSTCC  drivers/tty/vt/conmakehash - due to target missing
>   clang -Wp,-MMD,drivers/tty/vt/.conmakehash.d -Wall
> -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
> -std=3Dgnu11   -I ./scripts/include     -o drivers/tty/vt/conmakehash
> drivers/tty/vt/conmakehash.c
> drivers/tty/vt/conmakehash.c:15:10: fatal error: 'linux/
>    limits.h' file not found 15 | #include <linux/limits.h>    |
>    ^~~~~~~~~~~~~~~~


The error is reported at line 15 of drivers/tty/vt/conmakehash.c


The line 15 is #include <stdlib.h>:

https://github.com/torvalds/linux/blob/v6.11-rc1/drivers/tty/vt/conmakehash=
.c#L15


So, host programs cannot include <stdlib.h> on your build machine.



drivers/tty/vt/conmakehash.c has only 5 include directives:

#include <stdio.h>
#include <stdlib.h>
#include <sysexits.h>
#include <string.h>
#include <ctype.h>


You cannot build this, your build machine cannot build anything.









> 1 error generated.
> make[5]: *** [scripts/Makefile.host:116: drivers/tty/vt/conmakehash]
> Error 1
> make[4]: *** [scripts/Makefile.build:485: drivers/tty/vt] Error 2
> make[3]: *** [scripts/Makefile.build:485: drivers/tty] Error 2
> make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
> make[1]: *** [/Volumes/src/kernel/linux-next/Makefile:1925: .] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  drivers/tty/vt/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tty/vt/Makefile b/drivers/tty/vt/Makefile
> index 2c8ce8b592ed..d266895357e5 100644
> --- a/drivers/tty/vt/Makefile
> +++ b/drivers/tty/vt/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_CONSOLE_TRANSLATIONS)    +=3D consolemap.o=
 consolemap_deftbl.o
>  clean-files :=3D consolemap_deftbl.c defkeymap.c
>
>  hostprogs +=3D conmakehash
> +HOSTCFLAGS_conmakehash.o =3D -I$(srctree)/usr/include
>
>  quiet_cmd_conmk =3D CONMK   $@
>        cmd_conmk =3D $(obj)/conmakehash $< > $@
>
> --
> Git-146)
>
>


--
Best Regards
Masahiro Yamada

