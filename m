Return-Path: <linux-kbuild+bounces-3468-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF9F9704A8
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 03:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297E41C212DA
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 01:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57582BA3D;
	Sun,  8 Sep 2024 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iw0ZyrY4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DC179D1;
	Sun,  8 Sep 2024 01:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725759010; cv=none; b=mIyvUa1WDq8q8fO0t4Un9ULgjZAYFAaqlpdZ58KBMrdMkgUaAcQE3gy75gnhqbmoo2yz6e/w5uhJiFS4wCVPdSE7yggwJ1TnalHAomBXDJiS3H+SpyXgnwuqeSifZHdF8w8zFzVoX3iThIaoIxhUxevYeEOw0ojbddlemTgsmMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725759010; c=relaxed/simple;
	bh=fyOnv3k2017y/ErSznnZHp0l9XWS0bPVAmjp32U6Etk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiHjL4Tzy5i31RbsEn6je4RjbHmNv/Z8TjjDp8/nurtqllW0NwmPkTVFa8CCNcXmUzwlvdJpBTTQJVWsRqKRk1/38Eo7NTmtOHPvPBZJxpfnFD3HUhav/icvyJ2F6bTfpjssyaHjC/Uf9JjBVLfediTy4MMaEZa+ZAE87rzG5T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw0ZyrY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81720C4CEDF;
	Sun,  8 Sep 2024 01:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725759008;
	bh=fyOnv3k2017y/ErSznnZHp0l9XWS0bPVAmjp32U6Etk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iw0ZyrY4vuLZ21JCPOC7RhuX7jH+ga/520Dv1aaM8uNgOoHpA/cMaELxoMFbt9WhQ
	 6cWjNnSP4o7rT5Xc1qm3XtbFn4YS0prmu2KTWtXTjxFFhomNRnXeVVh9JP5z7M7miU
	 RsaI6nAFHnSgzlWx+0avsFEestaO6zMIOeHJmmJYY2W/sPtsC3Enk28MuA6dyzDfS8
	 B0BwayB0He+GmuHbYvmm98cgYqbFocvJdNDrBPe2nLlyhExI1t8DoPlC1Xy7y6a7TS
	 6nqNvu2hKR3rjjA6O1+SusQWQQ2vp9f+8BBS60UzZLI2p5UciVSLsD54+sq6iFumv2
	 XlPJ61sFI6v6g==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f75de9a503so7223721fa.0;
        Sat, 07 Sep 2024 18:30:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3SCwfLp1T2Y1j+OVEz8N+WhRl4mhNcXwGodCaVVzfkAs3oKXlWsIqBLGkFHtdqkYWMIpY8GVQ/g==@vger.kernel.org, AJvYcCWPfFwjpUVuAnL0PIExQOVBoIJ8FVK6y/0LTPkoyeq1VLAiSnAPW9odWSMZW5rCGHD2jjn/M5M6GIQ7szQ=@vger.kernel.org, AJvYcCX3S2+OwNqRPFAe6ksoR3PMZBXEvdOSAOpXPP298TG9IaYsO6wxn6f/WPcU7r7BEruKPPywI7iZFMeTdjCx@vger.kernel.org, AJvYcCXCDHJxeDlTDJRJtMrM/aaMCqJcPMbAVwVzTXtr1mKsacSBlvrekGAv7rQVrI8NPxXFsLlrtGPp5a2XsExa@vger.kernel.org
X-Gm-Message-State: AOJu0YzXpRjEP5WoRKduaKRtQ75nNja1TFS2fvk4cAafRIpKoa48pOtm
	VYekmZLSMUXQbYGHft9fwZo5Yk+2DPUsiI+9q8Huf7gByukMqzFCMPTkV4JIAXhz/L6IhJaZ6jO
	uD1RIFG+86BzE5xYL+oG1GAV0azA=
X-Google-Smtp-Source: AGHT+IF+h293KpoI++f+ufbs7y7oQSzJ8FqYF6U09FVXsYlA3fTualWC6YvD7rLK4LHaRVS5cfnW7EaXVcZxWqO9e3g=
X-Received: by 2002:a05:6512:1598:b0:535:66bb:3303 with SMTP id
 2adb3069b0e04-536587a4100mr4487964e87.12.1725759006849; Sat, 07 Sep 2024
 18:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-8-06beff418848@samsung.com>
 <CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com> <CABj0suBQCc8=0tLng=OWW=K1hjFuLFZWhbjsqHtz2FzZt4i0sw@mail.gmail.com>
In-Reply-To: <CABj0suBQCc8=0tLng=OWW=K1hjFuLFZWhbjsqHtz2FzZt4i0sw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Sep 2024 10:29:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNARqUTC2GixVeUQpMvzWt=h8KZvLHTHvp3ftxNwJQU6pWQ@mail.gmail.com>
Message-ID: <CAK7LNARqUTC2GixVeUQpMvzWt=h8KZvLHTHvp3ftxNwJQU6pWQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] Documentation: add howto build in macos
To: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 6:32=E2=80=AFPM Daniel Gomez (Samsung)
<d+samsung@kruces.com> wrote:
>
> On Sat, Sep 7, 2024 at 10:33=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> > <devnull+da.gomez.samsung.com@kernel.org> wrote:
> > >
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > Add documentation under kbuild/llvm to inform about the experimental
> > > support for building the Linux kernel in macOS hosts environments.
> > >
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> >
> >
> > Instead, you can add this instruction to:
> >
> > https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md
>
> Sure, that can be done as well. But the effort here is to have this
> integrated. So, I think documentation should be in-tree.



I do not think so.


Most people are not compile-testing on macOS.

This is an unofficial tip, which you can advertise
somewhere else.




--=20
Best Regards
Masahiro Yamada

