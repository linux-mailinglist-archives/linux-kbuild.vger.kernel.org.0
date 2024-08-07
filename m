Return-Path: <linux-kbuild+bounces-2890-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3445494ACFC
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 17:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7291C20D1B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 15:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A4984A4D;
	Wed,  7 Aug 2024 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaGbvaL0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FED381741;
	Wed,  7 Aug 2024 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723044919; cv=none; b=ArZAtSGk/Ws0tt5jNiZJlooWNU25AFqZTJiBF3skSGc9TtMI1dK3sNLQMOarneyEyAVtZPK2gfuRiRv8azlQbv859Z/lDlRNaKHqzh/ECnjzO+tixLzI65y+XhJprYcM6djIXEPfIh3fur/FNH8IBNKSxute53kZOaLZwjefWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723044919; c=relaxed/simple;
	bh=wm+VWb1rIQaode09oZdE3sEothizpQCW8kQNxXyWPUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKQvCKjC/I1c11gc6kVTHSY0KK+fRWZgf847HSSFStHkGhus+QuJECtLSammZfbf/I3Xi4bfL+jSIccXebYS1Zc9HqR7IsnOSuxo0nHHDu9WLrApPUxr/C393mhOFSjqsfLL8Gj2B8g9P+zx1kwHWBJOu/HvhVwR5kJ9g+arL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaGbvaL0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5610C4AF12;
	Wed,  7 Aug 2024 15:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723044918;
	bh=wm+VWb1rIQaode09oZdE3sEothizpQCW8kQNxXyWPUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YaGbvaL0vl/AC3n8N5zSm6UAo1FGLsUzRyxiljh53MIfy3FTyfXWHo6Hj6GKbXoLZ
	 jfsQsWNyak8NUhIvWAiJUjZLbfG5MjVoflsb9RDE3zvKrvCWJcMKEfQAcT63rCVpK9
	 iCxNmLo7X6RkTfgN0YiHY8ie0ujIC1FI/qgpOwYGlaZf3kX/y5SGjZjvjf0dmPHewU
	 ArLP3TATM+RzoFNVgM+XbXKEEhdsqtbmCY8x2Yym7WrLb52bIU1QEd7l/qTuSPDyrX
	 8do54V1JkjCYZVdecd+cVh/5S+RS2cYmXy5C6p7KgXouLJXqS/9ESGvb2nT5rO6NrB
	 TPKzAhlhDhVKw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f15790b472so25340661fa.0;
        Wed, 07 Aug 2024 08:35:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJ9jEHyTx7ZguG3wujrOve8oAeK194YrcfzMK0rtuiMYAaZQVDuiI4LhDXiqhWVvdzMHel8n3WmJH7K3iM7yrJ/7CuzEZwCrRDX7jxCh9ArRzc26GrXWQu+S4lFF3MeL87rLRriMyYklcVJOwdMc+0m5cEs2aErCDFBnG8BAiH06IJ/LJwOO80KVFwkB5nrkt8Kr2p7ezKMlYX7ID3TXxCpQ==
X-Gm-Message-State: AOJu0YzWWH4C+WOGcs3Cs9In8LkZ3C0kGCIruK2dTi6Jf4Lm8hJtEm/w
	6OkVPicrea+XrQ4MpLF90l688aX4Uc8z5cAfEzzJVJp3qyQfFZdq+CHHXC6z+zTGp4q4Z3SruZz
	XtJp3KnaEujmTNaQrjMgzeICddUc=
X-Google-Smtp-Source: AGHT+IE/eDS6clCryBkFSzKDJUwO/cLwR+b8LrrNB5prXOgRnnwpkLjNgCVKxPqUzynolVNIM+yIL57HzFJ8CFIwBnI=
X-Received: by 2002:a05:6512:3e1e:b0:52c:df51:20bc with SMTP id
 2adb3069b0e04-530bb3b1531mr13674055e87.16.1723044917569; Wed, 07 Aug 2024
 08:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com> <20240807-macos-build-support-v1-5-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-5-4cd1ded85694@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 8 Aug 2024 00:34:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4kTWSDuGz-EM2p5vXcu9G4_WoEa4ovAWZ95VTfbreHA@mail.gmail.com>
Message-ID: <CAK7LNAQ4kTWSDuGz-EM2p5vXcu9G4_WoEa4ovAWZ95VTfbreHA@mail.gmail.com>
Subject: Re: [PATCH 05/12] accessiblity/speakup: genmap and makemapdata
 require linux/version.h
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

genmap and makemapdata DO NOT require linux/version.h


Removing bogus "#include <linux/version.h>" is the right fix.






On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> Both genmap and makemapdata require the linux/version.h header. To
> ensure successful builds on macOS hosts, make sure usr/include is
> included in the HOSTCFLAGS.
>
> Fixes errors:
> drivers/accessibility/speakup/genmap.c:13:10: fatal error: 'linux/version=
.h' file not found
>    13 | #include <linux/version.h>
>       |          ^~~~~~~~~~~~~~~~~
> 1 error generated.
>
> drivers/accessibility/speakup/makemapdata.c:13:10: fatal error: 'linux/ve=
rsion.h' file not found
>    13 | #include <linux/version.h>
>       |          ^~~~~~~~~~~~~~~~~
> 1 error generated.
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  drivers/accessibility/speakup/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/accessibility/speakup/Makefile b/drivers/accessibili=
ty/speakup/Makefile
> index 6f6a83565c0d..74ee0c31370f 100644
> --- a/drivers/accessibility/speakup/Makefile
> +++ b/drivers/accessibility/speakup/Makefile
> @@ -38,6 +38,7 @@ clean-files :=3D mapdata.h speakupmap.h
>  # Generate mapdata.h from headers
>  hostprogs +=3D makemapdata
>  makemapdata-objs :=3D makemapdata.o
> +HOSTCFLAGS_makemapdata.o +=3D -I$(srctree)/usr/include
>
>  quiet_cmd_mkmap =3D MKMAP   $@
>        cmd_mkmap =3D TOPDIR=3D$(srctree) \
> @@ -51,6 +52,7 @@ $(obj)/mapdata.h: $(obj)/makemapdata
>  # Generate speakupmap.h from mapdata.h
>  hostprogs +=3D genmap
>  genmap-objs :=3D genmap.o
> +HOSTCFLAGS_genmap.o +=3D -I$(srctree)/usr/include
>  $(obj)/genmap.o: $(obj)/mapdata.h
>
>  quiet_cmd_genmap =3D GENMAP  $@
>
> --
> Git-146)
>
>


--
Best Regards
Masahiro Yamada

