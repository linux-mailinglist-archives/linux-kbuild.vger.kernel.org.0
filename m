Return-Path: <linux-kbuild+bounces-9851-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D61F4C87480
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 22:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7762A3ADF27
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 21:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F9631D37A;
	Tue, 25 Nov 2025 21:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fEKtmQ3J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6D321F39
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764107907; cv=none; b=YBFcMkk6j/Tp8u8rl1mTOP+t0to/gcYWVBnlegmsQXOlPQ900d7pTZgDLpibBfYnon+qrHIhKn8WK7s/y3d8teCP0I44VePtgVZoxwNHUQ0dtd/OJhZDKz2OYC53rdUqgRRrD9pbRxCaE8t5cooPgObEtZIyptNWoisOZcWda6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764107907; c=relaxed/simple;
	bh=XEtm/GoDHYGyl2BWtHWx1fxNstDUn3ramMXHRRsTaSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdWzW65+qfvXX/bg7JnknT/jptjQLPo5Di+DCz2hp4ULKGGO8EJNgLbYAPGnucMNOAqcajhpcyvXXGULLYslkXgceXc69HVifUxpO5hDsQ37FMplP82IIA3oNfpt9H2wijvz2qvaBH0y1+sarNyU21qkyirLcJLD8uCJ1VZurVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fEKtmQ3J; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b71397df721so260198466b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 13:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764107904; x=1764712704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oComeJJMG/n/pikooZKhX7dZBivNW0ENMs8Il87OfMo=;
        b=fEKtmQ3J0GebuM17O+KjsVH48bqOuQd/ABzumzq4nvXU9jgD6EF3B5mDYlZ7bYpMFU
         zH9W8+Kf8pHie+ug1zsCfOieRH/QEEO0oUU1tQeHPSTF5Yen5ybpRARKAnj0OgtcKKiP
         ixpQ+VmtF1xD08dhRbTo0YB+VuGZMP1mSo1Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764107904; x=1764712704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oComeJJMG/n/pikooZKhX7dZBivNW0ENMs8Il87OfMo=;
        b=n5TY2mBpCLBRkgFpMyqOAupUXtLjO7IZW1u219rDFtzm4spNJpFpQfl1gixCkBq8u3
         pTuwkyVkPKFLGYcC3dJChILRzoPB5+ZjC+Z5YXQOLP6EhHv+2fANGcleE35uHD2kE8r+
         mSuA+oYTUH+3JsS6LU8+eAOYT+OAYwftBd8Xl5hsC993kXim7fY/aEBxx4NqZGBI1Hz5
         xRkr4ShtJAPZJJHdYvC9+D20jlFdQvRzYjCFjETnpIRC+BN/dX35yy3CWcvrdBj8dWMA
         Xtpn/0JpQWgnZ8L4zl8wvD2eLj3b/sVHr0lJonKlAlopJw9H5Hezt8BtoupdhbIdqpHF
         xCoA==
X-Forwarded-Encrypted: i=1; AJvYcCVrUpzWnMRnHCi2Nu7pbvTxB9VEsv6j2OSDkusOHox/vQRpnC7I9OHJsA2Y2oWsDG+dly+7yIEgVKWEwEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo3axJIQPchWvC1drK0pwuPHJ5pZQmy0Aaq4K/klrXCxJwBO7E
	v5M4hIrxFRFcOR2H8URTOSblvoEErsm9pmPjFLYkY8y+Xjvau+lVAtCZulLjihXnIk2EXRyzD5b
	NkCwN4YXP/o15vHnkieFVVrrNBNX4ofGHVJAPFXNT
X-Gm-Gg: ASbGncto26KrFXJpyA7UxDxSKWksN2uC8rNDB/29d20HkcI4O3eNKu0snNd7zeB5QXw
	f6jwegTYKpQWbE+8wuGyPCYW9zNF2kotJ6Z8rJ0QE4zhZezbiQL5jVqbHC4O7kJKk/eo7RW0zWh
	Noyr8L3goa7BgQNkSsn71UQRdz24AWHbQ3uE9GmleEuJGbiyOS4kz8PYrFAvRNUCFWtW12nVEWh
	hBfPtnqtk+h8CnuTFDVKio8qvnWqQTkyc1/4BV6uP6gaHeDkRhYHm8hB1VS/CYkp110Rw==
X-Google-Smtp-Source: AGHT+IEsUyxPvJxd6x+5fzsOBlSU482PAc4Q0juUe71cJWKZiW/Qz9aeuQzjZG9OKhi5GBdJoXFxvsMW6mB204rlNBg=
X-Received: by 2002:a17:907:968f:b0:b73:59b0:34d6 with SMTP id
 a640c23a62f3a-b76c5515041mr521154666b.33.1764107903584; Tue, 25 Nov 2025
 13:58:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119181333.991099-1-sjg@chromium.org> <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
In-Reply-To: <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 25 Nov 2025 14:58:12 -0700
X-Gm-Features: AWmQ_bkAW-iBU3bFIz9dAYOV2fR21yuiXq1XlKKvPkqNxz_z03RLquyhMtItjw0
Message-ID: <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>, 
	"Reviewed-by : Nicolas Schier" <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, 
	Tamir Duberstein <tamird@gmail.com>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Thu, 20 Nov 2025 at 00:49, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:
> > Support 'make image.fit FIT_MODULES=3D1' to put all the modules into a
> > ramdisk image within the FIT.
> >
> > Add image.fit as a target which requires modules, so that modules will
> > built automatically when using FIT_MODULES is not empty.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
> > Acked-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >
> > Changes in v6:
> > - Mention that FIT_MODULES just needs to be non-empty
> > - Make use of modules.order instead of using 'find'
> >
> > Changes in v5:
> > - Build modules automatically if needed (fix from Nicolas Schier)
> >
> > Changes in v4:
> > - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> > - Use an empty FIT_MODULES to disable the feature, instead of '0'
> > - Make use of the 'modules' dependency to ensure modules are built
> > - Pass the list of modules to the script
> >
> >  Makefile             | 1 +
> >  arch/arm64/Makefile  | 1 +
> >  scripts/Makefile.lib | 6 +++++-
> >  3 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 8cd46222fc48..4eccaef95826 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -773,6 +773,7 @@ endif
> >  # Just "make" or "make all" shall build modules as well
> >
> >  modules-targets :=3D all
> > +modules-targets +=3D $(if $(FIT_MODULES),image.fit)
> >  modules-targets +=3D modules
> >  modules-targets +=3D nsdeps
> >  modules-targets +=3D compile_commands.json
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index 73a10f65ce8b..7036f251ab40 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -174,6 +174,7 @@ endif
> >  all: $(notdir $(KBUILD_IMAGE))
> >
> >  image.fit: dtbs
> > +image.fit: $(if $(FIT_MODULES),modules)
> >
> >  vmlinuz.efi image.fit: Image
> >  $(BOOT_TARGETS): vmlinux
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 1d581ba5df66..28e0cc0865b1 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -398,11 +398,15 @@ MAKE_FIT :=3D $(srctree)/scripts/make_fit.py
> >  # Use this to override the compression algorithm
> >  FIT_COMPRESSION ?=3D gzip
> >
> > +# Set this to non-empty to include an initrd with all the kernel modul=
es
> > +FIT_MODULES ?=3D
> > +
> >  quiet_cmd_fit =3D FIT     $@
> >        cmd_fit =3D $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > -             --name '$(UIMAGE_NAME)' \
> > +             --name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
>
> Remnant of a previous revision?

The flags are there to allow extra options to be passed if needed.

>
> >               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> >               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> > +             $(if $(FIT_MODULES),--modules @$(objtree)/modules.order) =
\
>
> I am wondering how module dependencies work without the depmod invocation
> and modules.dep file.

We have a mechanism to place a pre-build initrd with the filesystem,
etc. into the FIT. But for this particular feature (suggested by Ahmad
Fatoum) we are just providing the raw modules. Presumably another
initrd would be needed to provide the startup files?

>
> >               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> >
> >  # XZ
> > --
> > 2.43.0
> >

Regards,
Simon

