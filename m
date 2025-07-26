Return-Path: <linux-kbuild+bounces-8196-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E2B12A2C
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 13:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6349A176665
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 11:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4540C21E094;
	Sat, 26 Jul 2025 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGMm9Ag5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F52747F;
	Sat, 26 Jul 2025 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753527594; cv=none; b=lneEMiTuNoXJlQ6PnIjr2EG3awLMEG3z0UNDfub0PZ9wZtho4WGjfVLmr8Hhh3xA4R4UWjwNpD1imNdl0pUBDRDa+An0TnH1vVTieigZCSP1uq92hSLfmIZrrOjvSRCWQ2EUjq6sQdRUW4s+Es3utmJK08WUKkZI2PcPscvEjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753527594; c=relaxed/simple;
	bh=g+gsOrD6DrMOM9hwmAbfMGxWrCneIpbSg9t1G3B3KiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+iJkBoUC4Fd4IH15iPPxzzvo4ZdTXIP7xTI6q2tt9FPatBZ5YLehCCvZJG5V1wdlaFrlvdkOMX5ZPt03N89+qXk5UwGgs+ngrg5i1i1bQhGYd+Q2bzFza+QGX6sA+YaZtGAHlWeQ5JtUnEDdqFeTUxbfiQECDH9HickXrlny1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGMm9Ag5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FDEC4CEF4;
	Sat, 26 Jul 2025 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753527593;
	bh=g+gsOrD6DrMOM9hwmAbfMGxWrCneIpbSg9t1G3B3KiM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rGMm9Ag5q8RrsMNUHK7IY+2VTiUCBUsrJW59hvvViujoTtrzJWHMtrNj8lFmfFEHQ
	 iFDrTKCxuHKAE1SabyhdL1Dtcz0TdiaODagaiVEdXJE1Qzevr2ktj6WzuU4haV+WrG
	 oL/Ca84oO93/StZ5pe9/qk4cXIVEjFNBBTidDZ5znmZ9sTkKUHSzVbz8zljm6sIyQd
	 wQBSSRAqKNDFGuX0xRh4t/n573hkzbkEmrtz8Ob8eKJb1z1DOZEd5dRqI1pX3m/lVB
	 CwP+c9JzY5OOa+30ZmcA33vRUrb4Ueck/+OLGTLYfnR1V1MU4TsQRGcdZ9j1CAid9v
	 tCZPGhE9U68cg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso2942590e87.0;
        Sat, 26 Jul 2025 03:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGUuuszqo7e0eQ34hlLt7QB2GSZO5iQc1LggUj2VmJr+h8V/WKnzSz20NfXEDuLWvu6ES/dPv1Wx5EmQ==@vger.kernel.org, AJvYcCWbDOzCJDwRl7E9VeH0V337iWUFLnQl4bLUcniAs3EIrF2KvqTqD3BubkZAEiYXickSiE6TdP0vpHHqJwl9ZA==@vger.kernel.org, AJvYcCWxbNaoa2zLo5lNMBKUUxM889a/pzfZ4H1eZadtJ9IbaIt/F0i2ZJ9jh3R6F2O5NbQ/Rim6rk7Igx9tNfd8@vger.kernel.org, AJvYcCXK7hk+vkJklEcSsrQ8P3Pxewry+Qw8fEGDmsfX0Pdv2BwL9sDiC+sCj3r8UIB6xDF/j6zwCBf1IHMoRmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pjKml7+9LwSC1GtJf/vqOYzOb8l5Yc8HncEzpj4P5hm25QoG
	D+gXOg071aWAj4gduUTMvGPiFXKz+Ktl9n9t5FykYhMbT8aZdqZ5s6o0EkcZB8zl5CPHKnsN9R6
	8/006ic0PGqOYQFNt6w50CM3BObTcYJ0=
X-Google-Smtp-Source: AGHT+IHlNlEPyc5mSQJkStepGru4y0Q4yNkOgUcGZgXwg5ckZuEGwpg/qbcmo19sVrfTSq/RGHzvYtX0TkI5gkcfF7c=
X-Received: by 2002:a05:6512:3996:b0:550:d4f3:8491 with SMTP id
 2adb3069b0e04-55b5f496125mr1541036e87.41.1753527592436; Sat, 26 Jul 2025
 03:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753354215.git.legion@kernel.org> <2860d5a5e7c6279b3836537e20b0fa0c40d2ba0f.1753354215.git.legion@kernel.org>
In-Reply-To: <2860d5a5e7c6279b3836537e20b0fa0c40d2ba0f.1753354215.git.legion@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 26 Jul 2025 19:59:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARV+8vZPUtX8iG_hEAt8tCchRPFobK85tv9dbJwVqYgsw@mail.gmail.com>
X-Gm-Features: Ac12FXwWZK-s9uK4FNdURazz50HqFOZm92a27Khcsg-e7lt7_nQEyv1C0fLpN1I
Message-ID: <CAK7LNARV+8vZPUtX8iG_hEAt8tCchRPFobK85tv9dbJwVqYgsw@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] s390: vmlinux.lds.S: Reorder sections
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 10:50=E2=80=AFPM Alexey Gladkov <legion@kernel.org>=
 wrote:
>
> Reorder the sections to be placed in the default segment. The
> .vmlinux.info use :NONE to override the default segment and tell the
> linker to not put the section in any segment at all.
>
> >> s390x-linux-ld: .tmp_vmlinux1: warning: allocated section `.modinfo' n=
ot in segment
> >> s390x-linux-ld: .tmp_vmlinux2: warning: allocated section `.modinfo' n=
ot in segment
> >> s390x-linux-ld: vmlinux.unstripped: warning: allocated section `.modin=
fo' not in segment

Thank you for root-causing!



> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org


Hi s390 maintainers,
I need this patch for kbuild tree.
Ack is appreciated.


> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506062053.zbkFBEnJ-lkp@i=
ntel.com/
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>  arch/s390/kernel/vmlinux.lds.S | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.ld=
s.S
> index ff1ddba96352..3f2f90e38808 100644
> --- a/arch/s390/kernel/vmlinux.lds.S
> +++ b/arch/s390/kernel/vmlinux.lds.S
> @@ -202,6 +202,11 @@ SECTIONS
>         . =3D ALIGN(PAGE_SIZE);
>         _end =3D . ;
>
> +       /* Debugging sections.  */
> +       STABS_DEBUG
> +       DWARF_DEBUG
> +       ELF_DETAILS
> +
>         /*
>          * uncompressed image info used by the decompressor
>          * it should match struct vmlinux_info
> @@ -232,11 +237,6 @@ SECTIONS
>  #endif
>         } :NONE
>
> -       /* Debugging sections.  */
> -       STABS_DEBUG
> -       DWARF_DEBUG
> -       ELF_DETAILS
> -
>         /*
>          * Make sure that the .got.plt is either completely empty or it
>          * contains only the three reserved double words.
> --
> 2.50.1
>


--=20
Best Regards
Masahiro Yamada

