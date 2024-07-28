Return-Path: <linux-kbuild+bounces-2695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750A93E432
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 11:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBBCC281A2F
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 09:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D41125C1;
	Sun, 28 Jul 2024 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBMU8rQg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C011877;
	Sun, 28 Jul 2024 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722157441; cv=none; b=FfNDeEL685elRHb3BdMmzZ1HgcOLKjt3LwOKgIt4MpJhCCsrvDibIHb8uDPtvMxX0/HjDKrRMbAMeA1XJjWiKe6ZaWueV5fL6tYpR2VMvgpVNolZF8IydThHNcb1oF3AMomQc0aO3di+KNKLIsk4zKwKk+aR2uV29e7zFOrSdxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722157441; c=relaxed/simple;
	bh=QxM94LwGA2JdJecwH8apfoLuglqSOMOVfCkvfiW9i/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGgSvEufozgKNNX9OWtKMEZsr2tooDLOFP1tQ+cu2ZMl5CO9IvCOIJj31tjSBS69aoazL+z7Ivx71WnMn497IN1VPpZBJtzg8IdGkjalwNKgyi85fvl5Fo/+6dvXxRtn/lb4PuyfvJMO7WbBqJApxLj8OYAXuubnbFHFtWxjvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBMU8rQg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EE4C4AF09;
	Sun, 28 Jul 2024 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722157440;
	bh=QxM94LwGA2JdJecwH8apfoLuglqSOMOVfCkvfiW9i/4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vBMU8rQg/66YMODUCisd2/xQ0kKep+z0VohpL24KTfO4sKFxbA9s1O8M2UH/6x2Yb
	 8ekByf6TX1yFzHQVLDf3YKHjQvnwQ0kflQZIQoPHMUwOShW4fTdXbAAt5iqfzrmfRY
	 nLNEa+WAYcHnBdFpgACSdyTdA0ben4B3eSqp7zjMSV2q4TkG/Nrqmt49ErlHr/pNUN
	 bJ3EDPv3ac5EwKIF/ERyqs2XmuFnY6R+u40xevC9KvKn8jz7UnsmcBqVNXMcPdgV2I
	 5YY8F1938N0z/IiV49sP1RklkRJEwUl+OSf1/ny2By6hjmP5VbD24n6UxItS4n1SWR
	 PkQSi6QhWLY8g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f01993090so3886440e87.2;
        Sun, 28 Jul 2024 02:04:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqhXIc9n2DAZocDpGpOLdJ9RZ09mxIKD3wrev79HeRnq6yAa5dnMinjLFmZS782Oy04Ik3PgJK5L+eeMNuT/SFoYDvRuVIsGy0lfaEJgCUesoBnKOZ3/Bl+sftO9xeRE007rqn79LmHRVIh9eglnB2AuL7sSNrRYmqT4PDDaU/aSIPSuIeeQ2DOg==
X-Gm-Message-State: AOJu0Yxkqc3aFPpgLzEHr7zy6+ZEnI5E2VU6HkILn3DyidyjBjAw9auO
	B0BcMS531CEw9+CVWl5IPEe38Tv+GQfhdzjzg26Ouv1HzFSMuW1QCddQiF5QkNaAfkZQrBiFFyi
	eWwuK8vH3IgRqrEn/XTYlISGjn34=
X-Google-Smtp-Source: AGHT+IEA8iKtDLPkOIolC2s6x/f3cSR63CivhHgQ0vStJfRCj7P7AJL1bEamf+xWVVK8nbJy2NaOQncDu9LXWbZTqgU=
X-Received: by 2002:ac2:54b7:0:b0:52c:db06:ee60 with SMTP id
 2adb3069b0e04-5309b2bb677mr2809814e87.41.1722157439567; Sun, 28 Jul 2024
 02:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722090622.16524-1-petr.pavlu@suse.com> <20240722090622.16524-2-petr.pavlu@suse.com>
 <CAK7LNATG-kYuxGgzC7e-BbTPMnSH+MCAEVOXoQkdGYH9xLincA@mail.gmail.com> <90416ccc-8537-489c-ac15-78aacbcb42b0@suse.com>
In-Reply-To: <90416ccc-8537-489c-ac15-78aacbcb42b0@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jul 2024 18:03:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMR1Pn3Rj6fC-u3qQC4jQGrasD1mqxg-8qPNPdTy61gw@mail.gmail.com>
Message-ID: <CAK7LNARMR1Pn3Rj6fC-u3qQC4jQGrasD1mqxg-8qPNPdTy61gw@mail.gmail.com>
Subject: Re: [PATCH 1/2] module: Split modules_install compression and
 in-kernel decompression
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 9:59=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 7/22/24 12:23, Masahiro Yamada wrote:
> > On Mon, Jul 22, 2024 at 6:07=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com=
> wrote:
> >>
> >> The kernel configuration allows specifying a module compression mode. =
If
> >> one is selected then each module gets compressed during
> >> 'make modules_install' and additionally one can also enable support fo=
r
> >> a respective direct in-kernel decompression support. This means that t=
he
> >> decompression support cannot be enabled without the automatic compress=
ion.
> >>
> >> Some distributions, such as the (open)SUSE family, use a signer servic=
e for
> >> modules. A build runs on a worker machine but signing is done by a sep=
arate
> >> locked-down server that is in possession of the signing key. The build
> >> invokes 'make modules_install' to create a modules tree, collects
> >> information about the modules, asks the signer service for their signa=
ture,
> >> appends each signature to the respective module and compresses all mod=
ules.
> >>
> >> When using this arrangment, the 'make modules_install' step produces
> >> unsigned+uncompressed modules and the distribution's own build recipe =
takes
> >> care of signing and compression later.
> >>
> >> The signing support can be currently enabled without automatically sig=
ning
> >> modules during 'make modules_install'. However, the in-kernel decompre=
ssion
> >> support can be selected only after first enabling automatic compressio=
n
> >> during this step.
> >>
> >> To allow only enabling the in-kernel decompression support without the
> >> automatic compression during 'make modules_install', separate the
> >> compression options similarly to the signing options, as follows:
> >>
> >>> Enable loadable module support
> >> [*] Module compression
> >>       Module compression type (GZIP)  --->
> >> [*]   Automatically compress all modules
> >> [ ]   Support in-kernel module decompression
> >>
> >> * "Module compression" (MODULE_COMPRESS) is a new main switch for the
> >>   compression/decompression support. It replaces MODULE_COMPRESS_NONE.
> >> * "Module compression type" (MODULE_COMPRESS_<type>) chooses the
> >>   compression type, one of GZ, XZ, ZSTD.
> >> * "Automatically compress all modules" (MODULE_COMPRESS_ALL) is a new
> >>   option to enable module compression during 'make modules_install'. I=
t
> >>   defaults to Y.
> >> * "Support in-kernel module decompression" (MODULE_DECOMPRESS) enables
> >>   in-kernel decompression.
> >>
> >> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> >> ---
> >
> >
> >
> > My preference is to add
> >  CONFIG_MODULE_DECOMPRESS_GZIP
> >  CONFIG_MODULE_DECOMPRESS_XZ
> >  CONFIG_MODULE_DECOMPRESS_ZSTD
> > instead of
> >  CONFIG_MODULE_COMPRESS_ALL.
> >
> >
> >
> >
> > For example,
> >
> >
> > if MODULE_DECOMPRESS
> >
> > config MODULE_DECOMPRESS_GZIP
> >        bool "Support in-kernel GZIP decompression for module"
> >        default MODULE_COMPRESS_GZIP
> >
> > config MODULE_DECOMPRESS_XZ
> >        bool "Support in-kernel XZ decompression for module"
> >        default MODULE_COMPRESS_XZ
> >
> > config MODULE_DECOMPRESS_ZSTD
> >        bool "Support in-kernel ZSTD decompression for module"
> >        default MODULE_COMPRESS_ZSTD
> >
> > endif
> >
> >
> >
> >
> >
> > OR, maybe
> >
> >
> >
> > config MODULE_DECOMPRESS_GZIP
> >        bool "Support in-kernel GZIP decompression for module"
> >        select MODULE_DECOMPRESS
> >
> > config MODULE_DECOMPRESS_XZ
> >        bool "Support in-kernel XZ decompression for module"
> >        select MODULE_DECOMPRESS
> >
> > config MODULE_DECOMPRESS_ZSTD
> >        bool "Support in-kernel ZSTD decompression for module"
> >        select MODULE_DECOMPRESS
> >
> > config MODULE_DECOMPRESS
> >        bool
> >
> >
> >
> >
> > You can toggle MODULE_COMPRESS_GZIP and
> > MODULE_DECOMPRESS_GZIP independently
>
> I can implement this, but what would be a use case to enable multiple mod=
ule
> decompression types in the kernel?


I just thought there is a possibility where the singer service A
compresses modules in GZIP, and the singer service B in XZ, etc.

If the compression type is predictable at the Kbuild time,
it is fine.




>
> >
> >
> > Of course, the current kernel/module/decompress.c does not
> > work when multiple (or zero) CONFIG_MODULE_DECOMPRESS_* is
> > enabled. It needs a little modification.
>
> One issue is with the file /sys/module/compression which shows the module
> decompression type supported by the kernel. If multiple types are allowed=
 then
> I think they should all get listed there. This could however create some
> compatibility problems. For instance, kmod reads this file and currently
> expects to find exactly one type, so it would need updating as well.


OK, understood. Then,

Acked-by: Masahiro Yamada <masahiroy@kernel.org>



--
Best Regards
Masahiro Yamada

