Return-Path: <linux-kbuild+bounces-681-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65A83EB2B
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 06:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D07C1C22D15
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 05:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3588612E41;
	Sat, 27 Jan 2024 05:08:38 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B77133D5
	for <linux-kbuild@vger.kernel.org>; Sat, 27 Jan 2024 05:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706332118; cv=none; b=i4yQyZ93aW+lHp+mgIapWQ16sDi4fAXey4xh/iL5JT1Lj7uN4J9UpDZypDnnTKmqIrDqD5rmZOaNwl2v0OQ9g3w9qKEh8/7IEDD5EG+4BqVdC/2z7n5JX8YSodDL3MfcZMVc2RgieC/rWO4/KU/hXErgoe1dRlR0wwFQwZuMS4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706332118; c=relaxed/simple;
	bh=du8JnSk1v2gC0WW2DoWM6Kkq19h+cimR9p2mzTXkIAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzvjR7ZzhIgs/QplfU8v6Gg2ei8y3rUA2Re5p3OlIB+OdJcv4BphpN/cjvHGhlHSJg8r2BCh6baCTyt2dK2M5yKeB++3heZ629Jl1hSrrHIRPYvsEqfV1ijN20JoFnCJbE3Tpw0B7nyKAV4rM2uw7/93BQ+UrSLGsFX3c66VK7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.219.170])
	by gateway (Coremail) with SMTP id _____8Cx77vJj7RlbcwGAA--.3262S3;
	Sat, 27 Jan 2024 13:08:26 +0800 (CST)
Received: from mail-yb1-f170.google.com (unknown [209.85.219.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxPs_Ej7RlgE8eAA--.62527S3;
	Sat, 27 Jan 2024 13:08:22 +0800 (CST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbe344a6cf4so1459257276.0
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jan 2024 21:08:22 -0800 (PST)
X-Gm-Message-State: AOJu0Yxj9zbP/YD5DB4hHIJenOC5Dqb0RizDZv85WaPNJV0kY79H5fJ1
	d1nA7Yv0pkAT8RASOC74b/1H6nNG+LNG1TusgHRvl9DwsBMWIMrcRGv12p1XrgMQd0SLhuITtrF
	g/9kZ2O72ijbZo8z9i7UBhjsVOZZqiMzgfZTUrg==
X-Google-Smtp-Source: AGHT+IGYDcc7xr0fWVHNVsv8o4zNLB5BZHFXPlFRotx1GpDxIomAF+hhYdD6JAwkil/3JgOZjO0/+g6/bVFcZBK7FCY=
X-Received: by 2002:a0d:e88b:0:b0:5ff:8113:4d9d with SMTP id
 r133-20020a0de88b000000b005ff81134d9dmr829991ywe.40.1706332099756; Fri, 26
 Jan 2024 21:08:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com> <CALNs47vzQm5MbfJtMQR3p+W1xub3KHiNqRgEQGWT3u28fpQ-oA@mail.gmail.com>
 <CAHirt9jhbnXz34D-pmHNecMfkefL4wTr9LYj_V28OsVd=fkdZA@mail.gmail.com> <CAK7LNAQKxrV-oxouv9F6+_i9-oGvJNBzFNLo+5PdqwWVd9qWZQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQKxrV-oxouv9F6+_i9-oGvJNBzFNLo+5PdqwWVd9qWZQ@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Sat, 27 Jan 2024 13:08:08 +0800
X-Gmail-Original-Message-ID: <CAHirt9josVNzcwCM5Y3MsVJC9dz+iRg6r_64OK4NWPeOOo_X8g@mail.gmail.com>
Message-ID: <CAHirt9josVNzcwCM5Y3MsVJC9dz+iRg6r_64OK4NWPeOOo_X8g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8CxPs_Ej7RlgE8eAA--.62527S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3XF1kXFyfZF45ur4xXF1kZwc_yoW7Aw1kpa
	nYyF43AFWUJ3yUCws7tFy3Wr4Yyw1rKr10gF18Kw1jyr1qqFn2gr4Ikr43uF18Cw4UCrWr
	XF1I9F97ur45AwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=

On Sat, Jan 27, 2024 at 3:38=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Jan 25, 2024 at 12:20=E2=80=AFPM WANG Rui <wangrui@loongson.cn> w=
rote:
> >
> > Hello,
> >
> > On Mon, Jan 22, 2024 at 5:17=E2=80=AFPM Trevor Gross <tmgross@umich.edu=
> wrote:
> > >
> > > On Fri, Oct 20, 2023 at 10:59=E2=80=AFAM Jamie Cunliffe <Jamie.Cunlif=
fe@arm.com> wrote:
> > > >
> > > > Eventually we want all architectures to be using the target as defi=
ned
> > > > by rustc. However currently some architectures can't do that and ar=
e
> > > > using the target.json specification. This puts in place the foundat=
ion
> > > > to allow the use of the builtin target definition or a target.json
> > > > specification.
> > > >
> > > > Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> > > > ---
> > > >  Makefile          | 1 -
> > > >  arch/x86/Makefile | 1 +
> > > >  rust/Makefile     | 5 ++++-
> > > >  scripts/Makefile  | 4 +++-
> > > >  4 files changed, 8 insertions(+), 3 deletions(-)
> > >
> > > Adding LoongArch maintainers - this patch will need a small update to
> > > arch/loongarch/Makefile similar to the change in arch/x86/Makefile
> > > (included below), since that support is now in-tree and uses
> > > generate_rust_target [1]. Also a very minor conflict in docs at patch
> > > 2/2.
> > >
> > > I believe this patchset is still waiting on an ack from the kbuild
> > > team. Series at [2] for reference.
> > >
> > > Thanks,
> > > Trevor
> > >
> > > [1]: https://lore.kernel.org/rust-for-linux/20240108032117.215171-1-w=
angrui@loongson.cn/
> > > [2]: https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-=
Jamie.Cunliffe@arm.com/
> >
> > I can confirm that the fix patch [2], based on patch [1], is suitable
> > for LoongArch. LoongArch encounters no issues when using the built-in
> > `loongarch64-unknown-none-softfloat` target. Once patch [1] is merged
> > into the mainline, I'll send a patch to switch to using the built-in
> > target.
>
> But, [1] and [2] must be squashed together.
> Otherwise, [1] is changing the behavior of loongach,
> while the commit description does not mention it.

I agree. It would be great if Jamie could squash them together.

Thanks,
Rui

>
>
>
>
> > Thanks,
> > Rui
> >
> > [1]: https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Ja=
mie.Cunliffe@arm.com/
> > [2]: https://github.com/heiher/linux/commit/c504d83a6edd963e2ba58ec538e=
3f06da78b187e.patch
> >
> > >
> > > > diff --git a/Makefile b/Makefile
> > > > index 88ebf6547964..23100f193da3 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -566,7 +566,6 @@ KBUILD_CFLAGS +=3D -fno-strict-aliasing
> > > >
> > > >  KBUILD_CPPFLAGS :=3D -D__KERNEL__
> > > >  KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
> > > > -                   --target=3D$(objtree)/scripts/target.json \
> > > >                     -Cpanic=3Dabort -Cembed-bitcode=3Dn -Clto=3Dn \
> > > >                     -Cforce-unwind-tables=3Dn -Ccodegen-units=3D1 \
> > > >                     -Csymbol-mangling-version=3Dv0 \
> > > > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > > > index 5bfe5caaa444..0f339d4abd40 100644
> > > > --- a/arch/x86/Makefile
> > > > +++ b/arch/x86/Makefile
> > > > @@ -68,6 +68,7 @@ export BITS
> > > >  #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53383
> > > >  #
> > > >  KBUILD_CFLAGS +=3D -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> > > > +KBUILD_RUSTFLAGS +=3D --target=3D$(objtree)/scripts/target.json
> > > >  KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-=
sse4.1,-sse4.2,-avx,-avx2
> > > >
> > > >  ifeq ($(CONFIG_X86_KERNEL_IBT),y)
> > > > diff --git a/rust/Makefile b/rust/Makefile
> > > > index 87958e864be0..8d75a6ffe951 100644
> > > > --- a/rust/Makefile
> > > > +++ b/rust/Makefile
> > > > @@ -428,8 +428,11 @@ $(obj)/core.o: private skip_clippy =3D 1
> > > >  $(obj)/core.o: private skip_flags =3D -Dunreachable_pub
> > > >  $(obj)/core.o: private rustc_objcopy =3D $(foreach sym,$(redirect-=
intrinsics),--redefine-sym $(sym)=3D__rust$(sym))
> > > >  $(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
> > > > -$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs scripts/target.json=
 FORCE
> > > > +$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
> > > >         $(call if_changed_dep,rustc_library)
> > > > +ifdef CONFIG_X86_64
> > > > +$(obj)/core.o: scripts/target.json
> > > > +endif
> > > >
> > > >  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
> > > >  $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/cor=
e.o FORCE
> > > > diff --git a/scripts/Makefile b/scripts/Makefile
> > > > index 576cf64be667..c85d130a4125 100644
> > > > --- a/scripts/Makefile
> > > > +++ b/scripts/Makefile
> > > > @@ -11,12 +11,14 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)   =
             +=3D sign-file
> > > >  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)    +=3D insert=
-sys-cert
> > > >  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=
=3D rustdoc_test_builder
> > > >  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=
=3D rustdoc_test_gen
> > > > -always-$(CONFIG_RUST)                                  +=3D target=
.json
> > > >
> > > > +ifdef CONFIG_X86_64
> > > > +always-$(CONFIG_RUST)                                  +=3D target=
.json
> > > >  filechk_rust_target =3D $< < include/config/auto.conf
> > > >
> > > >  $(obj)/target.json: scripts/generate_rust_target include/config/au=
to.conf FORCE
> > > >         $(call filechk,rust_target)
> > > > +endif
> > > >
> > > >  hostprogs +=3D generate_rust_target
> > > >  generate_rust_target-rust :=3D y
> > > > --
> > > > 2.30.2
> > > >
> > > >
> > >
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada
>


