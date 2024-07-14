Return-Path: <linux-kbuild+bounces-2513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A5930B53
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 21:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F57C1F21286
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 19:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A52713C3D3;
	Sun, 14 Jul 2024 19:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eX6C3Wrs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117311FDD;
	Sun, 14 Jul 2024 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720985136; cv=none; b=o0vxmXYOGttJYlDSIw/FQXp+CARhBWpV1qKxF4NHhFcNs+Q5m0cfpUctYHISkapp5eEH5oURVujcILUSAjut//S+E+rX/H/dyfuU2qfJ6MgZbDQrhSjMtD97M70mI4a6uNZFxwYkObJuYjboKMpwS31/KJ2IwwDxA7lXnGv19z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720985136; c=relaxed/simple;
	bh=pWElLRFvLTb94HVMKGtwP+k/lzQ0EhEm/hblzKYrhEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLRpLQF+Cy6iBzho8NkkAR2QilgLMbK3NJcMMwG84F7GJfMEvkefYN6mTmaVlgT0bUo4CHkcvzJKmJSlP3vHzVBxKN7iKNzGSRCdIOvInRGSLg0tvvK4v4DuIMolSyMVUjOJEAc9AokfHvMyiGP2aZ786M6prSIjYA5+Yd7IHVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eX6C3Wrs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B59DC4AF09;
	Sun, 14 Jul 2024 19:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720985135;
	bh=pWElLRFvLTb94HVMKGtwP+k/lzQ0EhEm/hblzKYrhEg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eX6C3Wrsm9BCcg/uR+nBsC9Yi9uiQzgkg8uRD/Jxx6sYZ5wokC3asSl4RYiGCrCxb
	 vGQWDmPOjWA+gvjDRT9l60XO86VesoxuhbYGiI5QU9t4vp8mBi98lbUDjsbJ5Ut/WC
	 g92fQjnaqDgyk06toDZq7zfe+bACJyU6pBR8IFOYMwI6pJ7gbX5CCfAP8SKrifMMVP
	 5TWxwi+PBHkfw1l6lnfoaQBMyyLcdEIZCS+ICceIENxg3b1TqSYWYqBg8yM1dbxUOs
	 VzK1CY6n90CbPeKTPQm4bUx8TE4PKU+3fEIXAHq/o8xzTZ0qBlMFi4ToNO3ymxz52u
	 2XLQz5drH1QjA==
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4279ca8af51so20242985e9.3;
        Sun, 14 Jul 2024 12:25:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsCMBsJanaKuclQrtUpsSnjXYZda4OVHpsVKmSCRPEjREJr2ZBq+Sfxadi2hBpF/CE4glOCUnY5gabxVxQSVxNy4CuTq5ZtOmoaV8J/IdcXLoaKe1XhACviPTKu2Yz6NGFcLgnNOG4Yc5bKO5PUMqiJ/ye8qlskimIymsgPdcPQ5MCV85vme/E0PlE5/m4txKS+6lgKbWmIAn0tCOIYUItpUjFr1AHyv65SFWtkDjqP60fC+uzB7P5oStrukVK8iM=
X-Gm-Message-State: AOJu0YzqlRNOKVwrdDkWESGlKuClgNwe40dbTu/wxXzCF4HG8dDk0XiR
	IpRBfQi2HPBo3GZMuB9E1+0dOO0kdDj0QB/xrEWrEQo6sOe0g8GPApo4WcrO8BFT8pOw3UD2/ZW
	aBdvKrMKnZ1H8f9T3eKteWBXhTnI=
X-Google-Smtp-Source: AGHT+IHNi+bkhtGO/tFdAGdozXKSzwunOc9SL8x+E8ESxsKl+svJChMzCUdwALSjb4LjW8Uu8yudrhwNRE6vlxT8+cQ=
X-Received: by 2002:a05:6512:3985:b0:52c:cc46:d59 with SMTP id
 2adb3069b0e04-52eb9999d90mr13194916e87.18.1720985113376; Sun, 14 Jul 2024
 12:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714085751.176357-1-xtex@envs.net> <20240714085751.176357-3-xtex@envs.net>
In-Reply-To: <20240714085751.176357-3-xtex@envs.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 04:24:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfe7284DrJzo5MCy_vhd+JDytKYbzSbWvRJGiyMT462A@mail.gmail.com>
Message-ID: <CAK7LNAQfe7284DrJzo5MCy_vhd+JDytKYbzSbWvRJGiyMT462A@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Create INSTALL_PATH directory if it does not exist
To: Zhang Bingwu <xtex@envs.net>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Zhang Bingwu <xtexchooser@duck.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 14, 2024 at 5:58=E2=80=AFPM Zhang Bingwu <xtex@envs.net> wrote:
>
> From: Zhang Bingwu <xtexchooser@duck.com>
>
> If INSTALL_PATH is not a valid directory, create it, like what
> modules_install and dtbs_install will do in the same situation.
>
> Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
> ---
>  scripts/install.sh | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/install.sh b/scripts/install.sh
> index 9bb0fb44f04a..02b845e7ab33 100755
> --- a/scripts/install.sh
> +++ b/scripts/install.sh
> @@ -20,6 +20,10 @@ do
>         fi
>  done
>
> +if [ "${INSTALL_PATH}" !=3D "" ] && ! [ -e "${INSTALL_PATH}" ]; then

I changed the first check to [ -n "${INSTALL_PATH}" ]
Applied to linux-kbuild. Thanks!


> +       mkdir -p "${INSTALL_PATH}"
> +fi
> +
>  # User/arch may have a custom install script
>  for file in "${HOME}/bin/${INSTALLKERNEL}"             \
>             "/sbin/${INSTALLKERNEL}"                    \
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

