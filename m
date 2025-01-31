Return-Path: <linux-kbuild+bounces-5579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B10A23F1B
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 15:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC32D1665A2
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 14:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AE11C68B6;
	Fri, 31 Jan 2025 14:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGMXW7mE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919371C3BE9;
	Fri, 31 Jan 2025 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738333618; cv=none; b=DOsVEHHwj5m0fhzPFtfTtRzSnSF7Q1/Om9+rhL6eKCT4rS89cTxhLEzcfMogZnRpQYxS5u+YS5mbSvHG2gLnbnoz4QjBeKt8oKjXzZDY7jS3wFKeMpbPg16XwIoVUwruGhaT7sBqg1DuPsQB2TgzNo3+e4oHEMmlF3GrTm69fFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738333618; c=relaxed/simple;
	bh=ujZbR815iF3mj6tqoxuOtug/iMzC9IUM6fWGUVIusPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJAy48A/2iHBEYt9rvbM0b7EVsggT/f0nShbUecK56gw1X87Tye+tz1v+NGRZn8x/vB1cSSGqbu+oHj4Xd4QKZYfyWdeZJng1ombBzMB7a278I01lP78ZnftyFIFezPq8p6GvrxTqtRCy5Fe2gzN9HhjzVzby9CbsDHcb2XCg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGMXW7mE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AEBC4CEDF;
	Fri, 31 Jan 2025 14:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738333617;
	bh=ujZbR815iF3mj6tqoxuOtug/iMzC9IUM6fWGUVIusPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mGMXW7mExNbU6bQmd93wQQt6d5ry/RynV1fHu4NmfUtnZ2aMTzz4vms5D4tW9Zrak
	 QUSSuUcRGuzzn9xWl0N5WsJiSOdHFDg51je7VrxAFD49GBjewW+jnvpivga4Ev8nek
	 Oqmfwl8/AsM6JXJgND7qxuzvlGGxCXtqsCuvTTPPmge8ovCfaSU/UZvFhUp063VxGD
	 vIihRqPOM4AyhiomBpxW5y63gdwoxtLdokcXEjyX37P9LazA69yYyDtX7yZtLegZ2Q
	 AYib8Pc/b7nDsaBYXesgZcZBtRqRuv9wcWwijIkHYDjUxUxToSvlWpU+2BVoDQpeAy
	 sIZuQZZ+MCx8A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54298ec925bso2200251e87.3;
        Fri, 31 Jan 2025 06:26:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDbwwrMf7RaD8qRsU+gFiwQaOebK56p3Krg+L7LxQHI7OPks+soZb7No7Xzl2y36bBb9UjW9+pn7v17iHA@vger.kernel.org, AJvYcCXzEnCssFLHarhlGwIDoDJoLp3+bfbdfVJXYxBiPFQoJwRlSzLG7K9PrVVuX6mv8wj9YzVtlqsww9JFloo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxph/G/zqbui75DqM3UpgBojeArefRblBSwGS+1Sofzf5PaiaVr
	xwCIqGJ+3q8ppjSMPw8yIk5hlDQKpNX0zC8zAYAOpXbCGyZq49svIbyU6Bef5fnc6MLruiQ+P6b
	kylwHhglpEOD9zq5Dy5g4xxJ/q3o=
X-Google-Smtp-Source: AGHT+IF8Cac0tmWanGGOOlz/cEJMJMGdx7DSE2UBvSPqkABw3XevhQpnkCeE4SWfyIL/czLwtS22JNoqpCyu+dKdthA=
X-Received: by 2002:a05:6512:401e:b0:53e:385c:e86b with SMTP id
 2adb3069b0e04-543e4c031a5mr3787294e87.27.1738333615673; Fri, 31 Jan 2025
 06:26:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com> <20250131035245.GA47826@ax162>
In-Reply-To: <20250131035245.GA47826@ax162>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 31 Jan 2025 23:26:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ809M8VKAOBfqSn_Sc8iPgTMVu5icOgnddH_YKDvOpzA@mail.gmail.com>
X-Gm-Features: AWEUYZmkrU5sHHDgWFjl5VPFUxom-aMzrXt8zBIX0wtQAy1LFt5U2X-q_7whJbo
Message-ID: <CAK7LNAQ809M8VKAOBfqSn_Sc8iPgTMVu5icOgnddH_YKDvOpzA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
To: Nathan Chancellor <nathan@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 12:52=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> > On riscv, kernel modules end up with a significant number of local
> > symbols. This becomes apparent when compiling modules with debug symbol=
s
> > enabled. Using amdgpu.ko as an example of a large module, on riscv the
> > size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> > (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
> > (--strip-debug), and 20MB (--strip-unneeded).
> >
> > Use --strip-unneeded instead of --strip-debug to strip modules so
> > decrease the size of the resulting modules. This is particularly
> > relevant for riscv, but also marginally aids other architectures.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>
> Is there any sort of regression risk with this patch? If so, another
> option may be to give another level to INSTALL_MOD_STRIP like 2 so that
> INSTALL_MOD_STRIP=3D1 continues to behave as before but people can easily
> opt into this option. No strong opinion because I am not sure but was
> not sure if it was considered.


I do not think INSTALL_MOD_STRIP=3D2 is worth supporting because
it is equivalent to INSTALL_MOD_STRIP=3D--strip-unneeded


Documentation/kbuild/kbuild.rst explains that
any value other than '1' is passed to the strip command.


INSTALL_MOD_STRIP
-----------------
INSTALL_MOD_STRIP, if defined, will cause modules to be
stripped after they are installed.  If INSTALL_MOD_STRIP is '1', then
the default option --strip-debug will be used.  Otherwise,
INSTALL_MOD_STRIP value will be used as the options to the strip command.



RISCV users can pass INSTALL_MOD_STRIP=3D--strip-unneeded.


So, the question is, is it better to change the default option
of INSTALL_MOD_STRIP=3D1 ?





>
> Regardless:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >  scripts/Makefile.modinst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index f97c9926ed31b2b14601ff7773a2ea48b225628b..c22f35f6b9db3cac3923b9e=
787b219f752570642 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -80,7 +80,7 @@ quiet_cmd_install =3D INSTALL $@
> >  ifdef INSTALL_MOD_STRIP
> >
> >  ifeq ($(INSTALL_MOD_STRIP),1)
> > -strip-option :=3D --strip-debug
> > +strip-option :=3D --strip-unneeded
> >  else
> >  strip-option :=3D $(INSTALL_MOD_STRIP)
> >  endif
> >
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250122-strip_unneeded-cab729310056
> > --
> > - Charlie
> >



--
Best Regards
Masahiro Yamada

