Return-Path: <linux-kbuild+bounces-2093-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53631904AA1
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 07:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98BE285703
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 05:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBFA364BA;
	Wed, 12 Jun 2024 05:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNw/2eOe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623D331A83;
	Wed, 12 Jun 2024 05:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718168816; cv=none; b=gD7Vscj7bBiklGrxS+Z34TJoktiF7JBv5vYG85a3yI1uphLQbdfraHKG9VEmMTIuNG7hoAZpKIlz1U/M7l2407WQRLBlHyxnjstiwOn5bQl4XmnkTPnbJXzoBCsMJkck7doy5rIV3q9EevUmtwpElmQnSFH4pTui5HULjOdJYsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718168816; c=relaxed/simple;
	bh=cTRnCH0nwBTkCrdtg0XBxRgW7inGdX9jawKr9m856vE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ll+gGYHsBapVhSwCsseguLjFcK+PUAS3/h5ouBGkShTKg/5RgdGaZBQEjdmMeS7YpJrQkJA7/5cLdpUEiKD2N6a9dp1J3FI07SYVVFM0BRTiFgwHAqMCyPrVdvzDwqHq1+Hor6Cv4gQ4QY7Hwhn0O84c4U0ZwiSVNWl9naDkFr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNw/2eOe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B04C4AF4D;
	Wed, 12 Jun 2024 05:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718168815;
	bh=cTRnCH0nwBTkCrdtg0XBxRgW7inGdX9jawKr9m856vE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SNw/2eOe1RXhRuZQyqkln1jwVD/P6RrLFm5AGi/Yg8PN4okQURPBR7ZolLdFaH+VI
	 vN/YEZ+mvJNUsyYfl7wU3TsQkX8BoR3Qbx+v+oB5HEkfM8Ql7rO+jFUJHd0WjTGSwA
	 OVrX6rN2cmS+51c1g1fEbWjuSWolSWmVjPvToKDpZmsxPOmPMSkLoyRD+2lw4POzC2
	 X1enO3Pw2WrrKtzTG/NKUhc/1f3Mv83cHBVeeiRuA0LQqOyxtep2RodvLseIfEhJLd
	 dCrl6B7PTHsA1uxOhpj9dtKQUfTOPElE5a7SF8vjadCK13bccYlzudwWM398js7eDY
	 Sm8lMstedQHlQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c8342af5eso3595215e87.3;
        Tue, 11 Jun 2024 22:06:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYtSWaTzgMQF3ult42BulMUfhcfKkHX2+oyGY+qhfSjK85hvTLFQGSGFD31PN1qhWT/bK6H9RbC/89nY1nsav6zZ9nL/aHBrgpi/eMyxXpHnS08isk8MGMZhizv+RmCIk7at4WveX53Iu/
X-Gm-Message-State: AOJu0YwNvdoP4YWj6uZllfUDRHa2lG4qUZu/rPh6EyFkhwvc5RMmcTz0
	qgsa9dyUt5YfEztOtUVox/GKy0UEY7pslchHYYbyhSxRlM1YqTSWVcvE5YFmt8BopovSeyMJnDx
	MoQr5jzHu7ScEYRSGamQqEfOlzYI=
X-Google-Smtp-Source: AGHT+IG1rqBUefuW4bvyoT0nqp6MWJxMUDzrG4vBTCX0zOVt8do+6olg8ya+XzPdB2v6MMpxjZrCs8UZsrGk+oYjdM0=
X-Received: by 2002:a05:6512:210c:b0:52c:83cf:d8f9 with SMTP id
 2adb3069b0e04-52c9a3b7961mr270022e87.13.1718168814502; Tue, 11 Jun 2024
 22:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-as-instr-opt-wrussq-v2-1-bd950f7eead7@gmail.com>
In-Reply-To: <20240612-as-instr-opt-wrussq-v2-1-bd950f7eead7@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Jun 2024 14:06:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNARe9ijaNT_FSfM2M5pJh-+89REmU1xZxXO-eM_nZnfkiA@mail.gmail.com>
Message-ID: <CAK7LNARe9ijaNT_FSfM2M5pJh-+89REmU1xZxXO-eM_nZnfkiA@mail.gmail.com>
Subject: Re: [PATCH RFC v2] kbuild/x86: Use $(KBUILD_AFLAGS) in Kbuild's
 version of $(as-instr)
To: 0x7f454c46@gmail.com
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 12:29=E2=80=AFPM Dmitry Safonov via B4 Relay
<devnull+0x7f454c46.gmail.com@kernel.org> wrote:
>
> From: Dmitry Safonov <0x7f454c46@gmail.com>
>
> At Arista some products use compatible 32-bit userspace running on x86.
> As a part of disto build for ia32 it also compiles the 64-bit kernel.
> While the toolchain for the kernel build is yet the same, with 64-bit gcc=
:
> > / @Bru-na-Boinne% file /usr/bin/gcc-11
> > /usr/bin/gcc-11: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV=
), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha=
1]=3D6571ad50d8f12eece053f1bac7a95a2c767f32c9, for GNU/Linux 3.2.0, strippe=
d
>
> It seems that gcc is being smart and detects that it's running in
> a 32-bit container (personality flag? 32-bit mmap base? something else
> inherited post-exec?  haven't yet figured it out) and by default tries
> to build 32-bit binaries.
>
> That results in a failing toolchain check:
> > / @Bru-na-Boinne% printf "%b\n" "wrussq %rax, (%rbx)" | /usr/bin/gcc-11=
 -Wa,--fatal-warnings -c -x assembler-with-cpp -o /dev/null -
> > <stdin>: Assembler messages:
> > <stdin>:1: Error: `wrussq' is only supported in 64-bit mode
>
> Which passes when -m64 is directly specify for the build check:
> > / @Bru-na-Boinne% printf "%b\n" "wrussq %rax, (%rbx)" | /usr/bin/gcc-11=
 -m64 -Wa,--fatal-warnings -c -x assembler-with-cpp -o /dev/null -
> > / @Bru-na-Boinne% echo $?
> > 0
>
> As a result, kbuild produces different value for CONFIG_AS_WRUSS
> for native 64-bit containers and ia32 containers with 64-bit gcc,
> which produces different kernels with enabled/disabled
> CONFIG_X86_USER_SHADOW_STACK.
>
> arch/x86/Makefile already properly defines KBUILD_AFLAGS +=3D -m64,
> which is luckly already available at the point of toolchain check
> in arch/x86/Kconfig.assembler
>
> By hacking around Kbuild variable the following way:
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -13,7 +13,8 @@ left_paren  :=3D (
> >
> >  # $(if-success,<command>,<then>,<else>)
> >  # Return <then> if <command> exits with 0, <else> otherwise.
> > -if-success =3D $(shell,{ $(1); } >/dev/null 2>&1 && echo "$(2)" || ech=
o "$(3)")
> > +if-success =3D $(shell,echo '$(1)' 1>&2;{ $(1); } >/dev/null 2>&1 && e=
cho "$(2)" || echo "$(3)")
>
> I got the following output for the toolchain check, before:
> > linux @Bru-na-Boinne% make ARCH=3Dx86_64 oldconfig V=3D1 2>&1 | grep wr=
us
> > printf "%b\n" "wrussq %rax,(%rbx)" | gcc  -c -x assembler-with-cpp -o /=
dev/null -
>
> and after:
> > linux @Bru-na-Boinne% make ARCH=3Dx86_64 oldconfig V=3D1 2>&1 | grep wr=
us
> > printf "%b\n" "wrussq %rax,(%rbx)" | gcc -D__ASSEMBLY__ -fno-PIE -m64 -=
c -x assembler-with-cpp -o /dev/null -
>
> Which seems appropriate to me.
> This also reflects the existing definition in scripts/Makefile.compiler
> for $(as-instr) that already has $(KBUILD_AFLAGS).
>
> In order to eliminate a possible circular dependency of
> Kconfig =3D> arch/.../Makefile =3D> Kconfig =3D> ...
> which exist i.e. in arm64/Makefile for KASAN_SHADOW_SCALE_SHIFT that
> depends on CONFIG_KASAH_SW_TAGS and CONFIG_KASAN_GENERIC kconfigs,
> ignore KBUILD_AFLAGS difference in auto.conf.cmd as it is expected that
> the variable will differ between fist and later Makefile passes.
> Use that in Kconfig toolchain checks.
>
> Signed-off-by: Dmitry Safonov <0x7f454c46@gmail.com>



Perhaps, you could pass CROSS_COMPILE=3Dx86_64-linux-gnu-
when building the 64-bit kernel.

x86_64-linux-gnu-gcc may understand 'wrussq %rax,(%rbx)'
even if the default gcc does not.

I am not sure if x86_64-linux-gnu-gcc is available
on your build machine.


Anyway, I think it should be possible to fix it with less hacky code.


Please test this patch:
https://lore.kernel.org/all/20240612050257.3670768-1-masahiroy@kernel.org/T=
/#u




--=20
Best Regards
Masahiro Yamada

