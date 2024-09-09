Return-Path: <linux-kbuild+bounces-3483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA123970D07
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2024 07:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD800B218B0
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2024 05:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33F81ACE0F;
	Mon,  9 Sep 2024 05:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4V1IAKJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E8C1741C3;
	Mon,  9 Sep 2024 05:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725860490; cv=none; b=Ns3BAQoFYZPvEyH1fXDQ4dBfwP8/S1CrcsU5mBOX6y4vMNwCYK/4eqFT5LbgWLnTRQQPJVtNKOr4sL4dmyv/9VeilDvzmls9bLcPotUZ1INrAWsWlNSPxglXm2C1yOflhRfx8y4xnVEArWiXJTMbQxPnWJrqjcMXyzYi/cen0Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725860490; c=relaxed/simple;
	bh=OTGCX2VKTWNg7JAPpYr9MFc9b3r06DZVg97o1hSt/ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuNO36ReXSY5+4kL8NQd0AE+8+Z5W1UyKkag8a0gtP+2axwfpBDcDFIGiO5MTp1kLS/5syLe2e5TUlXUJqJ3iWPFaqNGhkUY8zY2I58sByRBDgW+FC617OMUr2SKrI4uEfBGzELb2Q52lEMgo2CPJoLt2Md+A32BELbFJHtu6Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4V1IAKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75F5C4CED8;
	Mon,  9 Sep 2024 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725860490;
	bh=OTGCX2VKTWNg7JAPpYr9MFc9b3r06DZVg97o1hSt/ng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f4V1IAKJIpX4Rvaz2H2X7xqKiSTyq7ukodz2zX0TBSNji13HCicMFzYCpaH5j2zYZ
	 YPszECNMNLzDkrCqNQYTany6zlUk0fbJlWBtz4HZMZCTKEEWm3Pk8XlTzJLrypGLLG
	 DLqnyt4aAJ4PDsFLrjRKzCfovQpnQhS86CAWWSBK4TuRv8HBCjQQ/aH9eFU8S1Hfxk
	 HhrGI+vVEgCrdaY+sFDsWAbooALZxTQIB7p2r6Ggwxulf7hlXEhxo6ByrvIdWxaUzZ
	 rKJZ7XGonnAiXKG33iKW6OybC/uu3TY6sueNH6Uix0yEeB/YZPyScT5lYz8QU/Bc+l
	 cDzXOI7ZCQ0Lg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso6874558e87.2;
        Sun, 08 Sep 2024 22:41:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAv/VSXCsH1v6s62hRjR9ZZKA7nG1wN3q/lneNsrly6ZqBzN6TVo6EtpySkl8FucfeufUy5WNd5njZ5Ck=@vger.kernel.org, AJvYcCVkY1feoR5Ppkj2faksXl2Gc6gh+16Mw//3Nr409DYEvBv7UHxx7FiikXmQqwhWTfjr7r89fJNphrGKjXXe@vger.kernel.org, AJvYcCXBJGublogdwwEfNHDzD3amRO47eo2XLF2YA5/d1e23CRqeynnLzpGr991socV2P2QqvcxeZl8o6A==@vger.kernel.org, AJvYcCXkK9SjYT3bliV+Bnv4yEL6APAwieMGmSo/ocIPpjiD0N/yJlpm/ABTP/OR1A6JqllppZrQOydEfKMMK+qn@vger.kernel.org
X-Gm-Message-State: AOJu0YzCqBH+1+S20jkQMmBMHYLaDWJd+cDCCRmOqSck3/DkN5INDBUG
	HvChZNoQg8Pin4qr0Vxo0ZgUElNR5sUr6c7YGKqn/g4FxBjYRq8kQF1SO+lsSj94eu5W5qyOlaw
	CLeJaTPy0WzgcGW5mWFA6X2y6DGM=
X-Google-Smtp-Source: AGHT+IE/eeAL3wg4+8lM40atumui+ijWmakaqLgAR4P5hoc1oVKlVHlObEKIEHv2t3Afuag93sP746lU4PC9rYvIgVg=
X-Received: by 2002:a05:6512:3e27:b0:536:5529:f718 with SMTP id
 2adb3069b0e04-5365880c60bmr7800264e87.54.1725860488188; Sun, 08 Sep 2024
 22:41:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-2-06beff418848@samsung.com>
 <CAK7LNARw-7uwJB7ibmSYE5nYUtPXcr4J9cHBQqm9BnNS=SRUhQ@mail.gmail.com> <CABj0suCHeWGDXX-S6U9X5iCzwMqn9pq=i84PSKwKtUXhGxaBjQ@mail.gmail.com>
In-Reply-To: <CABj0suCHeWGDXX-S6U9X5iCzwMqn9pq=i84PSKwKtUXhGxaBjQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Sep 2024 14:40:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPS2cdRso_zHt1Z0Gyugc4KOhZVYAFP35f=Eaoy6-8Cg@mail.gmail.com>
Message-ID: <CAK7LNATPS2cdRso_zHt1Z0Gyugc4KOhZVYAFP35f=Eaoy6-8Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] file2alias: fix uuid_t definitions for macos
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

On Mon, Sep 9, 2024 at 2:41=E2=80=AFAM Daniel Gomez (Samsung)
<d+samsung@kruces.com> wrote:
>
> On Sun, Sep 8, 2024 at 1:56=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> > <devnull+da.gomez.samsung.com@kernel.org> wrote:
> > >
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > The uuid_t struct defined in sys/types.h on macOS hosts conflicts wit=
h
> > > the one defined in file2alias, resulting in the typedef redefinition
> > > error below. To resolve this conflict, define the _UUID_T and
> > > __GETHOSTUUID_ in file2alias HOSTCFLAGS.
> > >
> > > Error:
> > >   HOSTCC  scripts/mod/file2alias.o scripts/mod/file2alias.c:45:3:
> > > error: typedef redefinition with different types ('struct uuid_t' vs
> > > '__darwin_uuid_t' (aka 'unsigned char[16]'))    45 | } uuid_t;       =
|
> > > ^
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    sys/_types/_uuid_t.h:31:25: note: previous definition is here 31 |
> > >    typedef __darwin_uuid_t uuid_t;    |                         ^
> > > scripts/mod/file2alias.c:1354:7: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1354:19: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1354:31: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1354:43: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1354:55: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:7: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:19: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:31: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:43: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:55: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:7: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:20: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:33: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:46: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:59: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1357:7: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1357 |
> > >  uuid->b[15]);      |                 ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > 17 errors generated.
> > >
> > > Suggested-by: Nicolas Schier <nicolas@fjasle.eu>
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > > ---
> > >  scripts/mod/Makefile     | 2 ++
> > >  scripts/mod/file2alias.c | 3 +++
> > >  2 files changed, 5 insertions(+)
> > >
> > > diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> > > index c729bc936bae..75c12c045f21 100644
> > > --- a/scripts/mod/Makefile
> > > +++ b/scripts/mod/Makefile
> > > @@ -8,6 +8,8 @@ modpost-objs    :=3D modpost.o file2alias.o sumversio=
n.o symsearch.o
> > >
> > >  devicetable-offsets-file :=3D devicetable-offsets.h
> > >
> > > +HOSTCFLAGS_file2alias.o +=3D -D_UUID_T -D__GETHOSTUUID_H
> > > +
> > >  $(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FOR=
CE
> > >         $(call filechk,offsets,__DEVICETABLE_OFFSETS_H__)
> > >
> > > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > > index 99dce93a4188..ab743f6d60ef 100644
> > > --- a/scripts/mod/file2alias.c
> > > +++ b/scripts/mod/file2alias.c
> > > @@ -11,6 +11,9 @@
> > >   */
> > >
> > >  #include "modpost.h"
> > > +#ifdef __APPLE__
> > > +#define uuid_t sys_uuid_t
> > > +#endif
> > >  #include "devicetable-offsets.h"
> >
> >
> >
> >
> > Is this what Nicolas suggested?
> > https://lore.kernel.org/lkml/20240807-sexy-roadrunner-of-acceptance-a84=
bbf@lindesnes/
> >
> >
> > I thought he suggested replacing #ifdef __APPLE__
> > with -D_UUID_T -D__GETHOSTUUID_H.
> >
> >
> > You added -D_UUID_T -D__GETHOSTUUID_H,
> > keeping #ifdef __APPLE__.
>
> I forgot to remove this.
>
> Based on your suggestion in the other thread to use/overwrite
> HOSTCFLAGS via the command line, it seems I should drop this patch.
> Can you confirm?


Yes, I think this patch is unnecessary because:

 [1] You can feed "-D_UUID_T -D__GETHOSTUUID_H"
     from the HOSTCFLAGS env variable
 [2] uuid_t may be dropped if I succeed in
     refactoring modpost in the future





--=20
Best Regards
Masahiro Yamada

