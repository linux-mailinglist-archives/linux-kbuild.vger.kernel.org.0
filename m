Return-Path: <linux-kbuild+bounces-9903-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BB700C9193D
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 11:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 15FFC3500F7
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 10:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB2E2FD68E;
	Fri, 28 Nov 2025 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJqpK8dB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3E83002D7
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Nov 2025 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764324683; cv=none; b=mlOAp6HmUlPXiXDAL6DM6yDZQwOKN1QJUqeqj9j5Pr8+zww3LGCKZ8CmlBzK3CFnDu24we2zZjTRNMQFgM0NtI0fzFqqYzjVYqii/iPWxV6S3rc0HB5G3AwmBs42ogukGxxcoh6KAHeXpVXPA/WbVAg/GUiH1xaowm14X2reDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764324683; c=relaxed/simple;
	bh=PWsRhLp6z6n29IRXVTS5+3foE+B/FlguofEGjtrPnAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9480xLHqV6ojRzYrsFtxFj8DcBVfdrW5L+Kgl+yaPhlnnZ2UtfmlR2kZygnDqrt2NA0w8S/fZrPszG7AqJK+JNSoyexPgSk8P2OGRTMXRQr7kGyPS3FcEw5AXchaeiBiTp54yXGaSmLoHKuE9lkId2T8Rg+4/a9bRyQ+MYOamY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJqpK8dB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B21C2BC86
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Nov 2025 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764324683;
	bh=PWsRhLp6z6n29IRXVTS5+3foE+B/FlguofEGjtrPnAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sJqpK8dBqFSb4b0m9DQYK2iaCS3+Gd3oWB596cjJhVJJk/Zg2OiNnqagNQSREoTKc
	 BFwKZDjHcBOAiK604Fkf8TtdXStOcWZ1rY5nJJGfFTmIJHGnYtOTKtpvkLHpg4XAPa
	 J4vFis/tO92GN+97xn7YNGDC/iLi+aRxZVjGqp2bYJTlE4643EWXts7vMqt3Q1AelD
	 W3o2FD6IbaBn2cpuX96MEOmH02WBhpbJFHoUpuJEim6cupU3bg3FVLhl0vksZ3ZWwq
	 0PpEuF61HEL+G5WbZ3LdqHhMKuelrI0kzOEaloaKlgldOsoG6gznCCFq9QTKkwb2Uq
	 RjRS/eD0HIXrg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b770f4accc0so58003266b.1
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Nov 2025 02:11:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKFmysjUm3tdhxK8T4RRKQ5nOS+yOpbJy8rs7K+Fe4FVp8c20P/W/zr5WkXWOkS6at62CHsj+VMwmBjIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuYPj/hDRF5Glmm8jO+bSDj6/T6o2g/4kSeGNv4QGW5S+JeiOy
	h/YTa0lOAiJxb9X9WyiLm1BQYexcqRwS85EHFW96zOufQfjZJSa7JQi+4vB4kuHDqxiMTqA2GaC
	jaBqWuSGqZ3Gabkr9P0dInKybR3jcy9A=
X-Google-Smtp-Source: AGHT+IER+7jriN3w9Pv8lhWqhpVubB2j1VJ3WiM2RJPPedEcwCvbKIiBl12aNjVZ1s4Ed6Fb1u3VbAod9cGN/G90Wrw=
X-Received: by 2002:a17:907:747:b0:b76:4c16:6afe with SMTP id
 a640c23a62f3a-b76c5515075mr1672433466b.28.1764324682207; Fri, 28 Nov 2025
 02:11:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
 <aRsH7RTpAah4g5Xr@willie-the-truck> <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
 <39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn> <CAAhV-H4fHBuRpDEDQrExApgnREJaT8JWUJ2700bEPFxDqToi2w@mail.gmail.com>
 <fc4fa66f-15a0-ebe3-0a27-f3f38b03bbdb@loongson.cn> <pgzg3tdudow4ww3tnqdvmppufbpbf6ws5adjjcwc7g3ou7yoih@mzk7iwh7trbe>
In-Reply-To: <pgzg3tdudow4ww3tnqdvmppufbpbf6ws5adjjcwc7g3ou7yoih@mzk7iwh7trbe>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 28 Nov 2025 18:11:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4t+zYKmVNdjP53XPbvLFtvik1WRGT0NLtQYBU0m=3GVQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkX3iCrwW5eCVl7oUJENC1CV_iFBcerr6LqbeRJus8VyU5MC421CDs2fZk
Message-ID: <CAAhV-H4t+zYKmVNdjP53XPbvLFtvik1WRGT0NLtQYBU0m=3GVQ@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, Ard Biesheuvel <ardb@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 9:49=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Sun, Nov 23, 2025 at 11:37:14AM +0800, Tiezhu Yang wrote:
> > On 11/23/25 10:29, Huacai Chen wrote:
> > > Is it possible to improve objtool that can handle indirect __noreturn=
 functions?
>
> Someday that will be possible via a new compiler feature or plugin.  But
> today it can't be done.
>
> > > Is it possible to improve objtool that can handle
> > > OBJECT_FILES_NON_STANDARD event LTO is enabled?
>
> No, that is purely a makefile construct which should in general be
> avoided anyway for a variety of reasons.
>
> > > Is it possible to improve objtool that only ignore __efistub prefix
> > > for LoongArch?
> > [...]
> > static int validate_branch()
> > {
> > ...
> >                       if (arch_is_efistub(func))
> >                               return 0;
> >
> >                       if (file->ignore_unreachables)
> >                               return 0;
> >
> >                       WARN("%s() falls through to next function %s()",
> >                            func->name, insn_func(insn)->name);
> >                       func->warned =3D 1;
> >
> >                       return 1;
> > ...
> > }
>
> That only silences the warning, it doesn't prevent objtool from doing
> the actual stack validation or ORC generation.  Neither of which makes
> sense for libstub.
>
> And objtool has many other features beyond just stack validation and
> ORC.  None of those make sense for libstub either.
>
> To fully exclude all libstub code from objtool, these arch_is_efistub()
> checks would need to be sprinkled all over the place.
If the call sites are less than 5, I think it is acceptable.

Huacai

>
> That would be a lot more fragile than just excluding libstub from
> vmlinux.o in the first place.
>
> --
> Josh

