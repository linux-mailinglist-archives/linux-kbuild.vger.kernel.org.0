Return-Path: <linux-kbuild+bounces-678-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D6C83E2B9
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jan 2024 20:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2A611F24C6A
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jan 2024 19:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E35224F1;
	Fri, 26 Jan 2024 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfscMfuJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF2F224E6;
	Fri, 26 Jan 2024 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706297892; cv=none; b=nmyZbzTTHXZl72nr7ss7CCYyw7ioiZ733kqDV1NnC6c9VMS3naBYtqVIowTnp9XmEzHWLqMmE/U40bpoagQoVM5Wh0opJHCsa2JTs0ix/g720sGUDjBwJQPQlM0i+RbikuwKj6N1f6dJXvZSMIjThQwazyu/fivJMZxUp43iifk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706297892; c=relaxed/simple;
	bh=DHZJrekhJEmaJlDZd71ANYOAMo6Unun/a8pOYenqE8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+RM4sRNq0yYcW66nDFZ/R1VgUyRPmrP9ENnW3bDDOc2XabsfvI8PD/jccaZX3cS1Z/ZxazCxtzHrHD3Ukc67Bvq+suQx+WQNwzFJxp1cbKeVZy+T9xnxbFfDtKKwnxVZcwg686UBAsXLZi7yQTr9tIaz1NoFWgEvesx9Tp5AyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfscMfuJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C6BC43609;
	Fri, 26 Jan 2024 19:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706297891;
	bh=DHZJrekhJEmaJlDZd71ANYOAMo6Unun/a8pOYenqE8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nfscMfuJZ4CRp20E5Ko5Ib/VxY8EHv6hZvjKp8qYl4dXtB3/3/QSZh1GzwT4AWOJI
	 8pI+iuWkEYXnVwoH84JJo8Xy24qWf8gwXzAWbxOTFtlivtsh+E7Jd9XqhtvEO95DeQ
	 iUH4m4Jt1o3QdACeddhPXYVXMKaSvE+59KGXhLBa8P2yal/SauOJioMHRdQSRvy0YH
	 7LThy3Li6jR4YcKhAqnGcHuHp1DUYDXpZtkblzJOmsj/Ri90+LUEQ5toCVPE3i5eQz
	 Dfzr0JPExpHz7v2NyltWGNDk7c23CilHwWKdptVP5bdlBZQ0DI2L8b9m0qIbMDU8wJ
	 sGUc5oL5dDpwA==
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e0d86d4659so512565a34.1;
        Fri, 26 Jan 2024 11:38:11 -0800 (PST)
X-Gm-Message-State: AOJu0Yxcj8d4Z8wVX5O1oetUF3DuBz5HsgzrC6kVZN486jfJvLvg1NQE
	BMXrtqKPHTzZ9uystV+MtscHlbspvOsnV8D4smXetXj2jJKWW1JdaGPSvZRW0Rr8a51uEaOITmc
	8iZG0W8+GHB90uvjp2hI24EF7+Dk=
X-Google-Smtp-Source: AGHT+IHp9YTSTtcAhhp8RJx6QmlQQw7cMZANOe8NDrl+HUm6IkEyCLVNUfI5P+Eh1+rTAxBuqQDJY2AumjSWrUKuZKs=
X-Received: by 2002:a05:6870:9347:b0:214:4bd7:2066 with SMTP id
 j7-20020a056870934700b002144bd72066mr180354oak.24.1706297891250; Fri, 26 Jan
 2024 11:38:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com> <CALNs47vzQm5MbfJtMQR3p+W1xub3KHiNqRgEQGWT3u28fpQ-oA@mail.gmail.com>
 <CAHirt9jhbnXz34D-pmHNecMfkefL4wTr9LYj_V28OsVd=fkdZA@mail.gmail.com>
In-Reply-To: <CAHirt9jhbnXz34D-pmHNecMfkefL4wTr9LYj_V28OsVd=fkdZA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 27 Jan 2024 04:37:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQKxrV-oxouv9F6+_i9-oGvJNBzFNLo+5PdqwWVd9qWZQ@mail.gmail.com>
Message-ID: <CAK7LNAQKxrV-oxouv9F6+_i9-oGvJNBzFNLo+5PdqwWVd9qWZQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: WANG Rui <wangrui@loongson.cn>
Cc: Trevor Gross <tmgross@umich.edu>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 12:20=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wro=
te:
>
> Hello,
>
> On Mon, Jan 22, 2024 at 5:17=E2=80=AFPM Trevor Gross <tmgross@umich.edu> =
wrote:
> >
> > On Fri, Oct 20, 2023 at 10:59=E2=80=AFAM Jamie Cunliffe <Jamie.Cunliffe=
@arm.com> wrote:
> > >
> > > Eventually we want all architectures to be using the target as define=
d
> > > by rustc. However currently some architectures can't do that and are
> > > using the target.json specification. This puts in place the foundatio=
n
> > > to allow the use of the builtin target definition or a target.json
> > > specification.
> > >
> > > Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> > > ---
> > >  Makefile          | 1 -
> > >  arch/x86/Makefile | 1 +
> > >  rust/Makefile     | 5 ++++-
> > >  scripts/Makefile  | 4 +++-
> > >  4 files changed, 8 insertions(+), 3 deletions(-)
> >
> > Adding LoongArch maintainers - this patch will need a small update to
> > arch/loongarch/Makefile similar to the change in arch/x86/Makefile
> > (included below), since that support is now in-tree and uses
> > generate_rust_target [1]. Also a very minor conflict in docs at patch
> > 2/2.
> >
> > I believe this patchset is still waiting on an ack from the kbuild
> > team. Series at [2] for reference.
> >
> > Thanks,
> > Trevor
> >
> > [1]: https://lore.kernel.org/rust-for-linux/20240108032117.215171-1-wan=
grui@loongson.cn/
> > [2]: https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Ja=
mie.Cunliffe@arm.com/
>
> I can confirm that the fix patch [2], based on patch [1], is suitable
> for LoongArch. LoongArch encounters no issues when using the built-in
> `loongarch64-unknown-none-softfloat` target. Once patch [1] is merged
> into the mainline, I'll send a patch to switch to using the built-in
> target.

But, [1] and [2] must be squashed together.
Otherwise, [1] is changing the behavior of loongach,
while the commit description does not mention it.




> Thanks,
> Rui
>
> [1]: https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Jami=
e.Cunliffe@arm.com/
> [2]: https://github.com/heiher/linux/commit/c504d83a6edd963e2ba58ec538e3f=
06da78b187e.patch
>
> >
> > > diff --git a/Makefile b/Makefile
> > > index 88ebf6547964..23100f193da3 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -566,7 +566,6 @@ KBUILD_CFLAGS +=3D -fno-strict-aliasing
> > >
> > >  KBUILD_CPPFLAGS :=3D -D__KERNEL__
> > >  KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
> > > -                   --target=3D$(objtree)/scripts/target.json \
> > >                     -Cpanic=3Dabort -Cembed-bitcode=3Dn -Clto=3Dn \
> > >                     -Cforce-unwind-tables=3Dn -Ccodegen-units=3D1 \
> > >                     -Csymbol-mangling-version=3Dv0 \
> > > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > > index 5bfe5caaa444..0f339d4abd40 100644
> > > --- a/arch/x86/Makefile
> > > +++ b/arch/x86/Makefile
> > > @@ -68,6 +68,7 @@ export BITS
> > >  #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53383
> > >  #
> > >  KBUILD_CFLAGS +=3D -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> > > +KBUILD_RUSTFLAGS +=3D --target=3D$(objtree)/scripts/target.json
> > >  KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-ss=
e4.1,-sse4.2,-avx,-avx2
> > >
> > >  ifeq ($(CONFIG_X86_KERNEL_IBT),y)
> > > diff --git a/rust/Makefile b/rust/Makefile
> > > index 87958e864be0..8d75a6ffe951 100644
> > > --- a/rust/Makefile
> > > +++ b/rust/Makefile
> > > @@ -428,8 +428,11 @@ $(obj)/core.o: private skip_clippy =3D 1
> > >  $(obj)/core.o: private skip_flags =3D -Dunreachable_pub
> > >  $(obj)/core.o: private rustc_objcopy =3D $(foreach sym,$(redirect-in=
trinsics),--redefine-sym $(sym)=3D__rust$(sym))
> > >  $(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
> > > -$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs scripts/target.json F=
ORCE
> > > +$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
> > >         $(call if_changed_dep,rustc_library)
> > > +ifdef CONFIG_X86_64
> > > +$(obj)/core.o: scripts/target.json
> > > +endif
> > >
> > >  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
> > >  $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.=
o FORCE
> > > diff --git a/scripts/Makefile b/scripts/Makefile
> > > index 576cf64be667..c85d130a4125 100644
> > > --- a/scripts/Makefile
> > > +++ b/scripts/Makefile
> > > @@ -11,12 +11,14 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)     =
           +=3D sign-file
> > >  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)    +=3D insert-s=
ys-cert
> > >  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D =
rustdoc_test_builder
> > >  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D =
rustdoc_test_gen
> > > -always-$(CONFIG_RUST)                                  +=3D target.j=
son
> > >
> > > +ifdef CONFIG_X86_64
> > > +always-$(CONFIG_RUST)                                  +=3D target.j=
son
> > >  filechk_rust_target =3D $< < include/config/auto.conf
> > >
> > >  $(obj)/target.json: scripts/generate_rust_target include/config/auto=
.conf FORCE
> > >         $(call filechk,rust_target)
> > > +endif
> > >
> > >  hostprogs +=3D generate_rust_target
> > >  generate_rust_target-rust :=3D y
> > > --
> > > 2.30.2
> > >
> > >
> >
>
>


--=20
Best Regards
Masahiro Yamada

