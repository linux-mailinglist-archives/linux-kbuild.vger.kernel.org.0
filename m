Return-Path: <linux-kbuild+bounces-614-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00948835DEE
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jan 2024 10:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835D11F25C25
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jan 2024 09:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8686E39856;
	Mon, 22 Jan 2024 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="RlKlheLp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3D239AC6
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Jan 2024 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915066; cv=none; b=UJIw63ZfVh4LYldj2gob0b9bcP61UOOCr3KmzbtTJu2IyLIWQN9oHwXBDy+PQ2+xALkPfVWWVvKNOydoAsRCayF4vyd+enxDLsQ5PEkzxQEYtByI08pPiWBC85PMtmdXO/oT9jgrjq7C5qnicGKW+cWtHbJwjP0M+ua0j8mcrd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915066; c=relaxed/simple;
	bh=GknMIjNfk3Q+3O5vnCYZusLGMvB08sdNWHOHlOIKyJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmCfp+wbQ9dTGdz3rod6dI+9bdJABf4ZEso/vytBkf7/IwrgpCWOBgzelz0hNeXGuWgyXtVM6R0XiXiSF+rLODyuHYzzaCmco+3knnpfbHFxJVhp5ez8JCjhH15JQPuelW6a5sPClqyNC1l1UkiEyeUDFsxj2yovO4Ylbe1wMJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=RlKlheLp; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ffb07bed9bso7201867b3.0
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jan 2024 01:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705915063; x=1706519863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BroRkqnuO0Oy9O6+ZA0zuSl/25g6dyXPAFX1tfI4BB4=;
        b=RlKlheLpb+CTEJlqF3hAxEn3SFqKlvywgZLLoViYdn/sBt8N/X29h4GP1BTn8Q6DoH
         ZL1PV9wus0cDGVOdeoBQ9hMoSmGSzWM7BmA2TxhlhXmZ4/f7gZsPB+KT+gDVwfjoAmjQ
         g3nrFRAHbqCnLNkZoUrIlnjnoT6WoP0Mth40MPfldarFt3c9g2qJNCI3eO7FT1Gylg6h
         O1beLjFIKDdSJBnk5+2AN91LwwjvoA6p1IirTiYNkcF9bO1w+cgHIDWNNCl7xVtgHnGW
         oS5NEdyQrsgkJXMW6CDqFOuw0YsP17zCa7CiVrFVMFyFSopbbwT5t5EdhfStDHKvODT8
         zyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705915063; x=1706519863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BroRkqnuO0Oy9O6+ZA0zuSl/25g6dyXPAFX1tfI4BB4=;
        b=TTQvs113xbk/7c/o7rL9Ft8A13N8zhKkxOrUxIkLfkcpTDwvV3PY9Z9MXjR6xxr3z6
         6xKgB/AJUVwfJKp65q45hSoI9vEJw1Hzj54fye3LTyDsCXydTcvga5RYx34dHjVbkRzy
         /M4mDjBdHy6c2Mn07p+HJPSV7k3GkkHT/pgHH8DbTjQ783FSzR5IDLybp0FFyhSr4pS0
         nd70TS+5K7mo4yFUEzrdVNbggDZjoGkGGO5Z9fhUDjoAZOJFAwlrqBTdYnWMqHt8lX+u
         aq92u0V5l4leTp8JBlMv8k5S1xgfOorExXDMrhtxXQhKDPzdaEjbcUOmNUgKXpAEJ/tk
         DSsg==
X-Gm-Message-State: AOJu0YwIiJy2+DDygZCQ4RD83/si9/D+5VuQZTOFlYThEK0YnKFKKuaA
	urLig1AF0SE0gafdazLBIc5YzeOcuNzlkN/KfoUckANQPjaKGiy57q9kcWeKnw2/h6YUOEhb/jw
	76yXAJna5T1sF+PxAFOqAlbyX/JT8AygA4BzRfg==
X-Google-Smtp-Source: AGHT+IFg78aukicmcCb2fnJ5R9FQfLOdTdmjXGaSLvdppwU8sjOMbNpvwM8AI+ULHMD/rR0Ozx5UvcvwHM4zryjp3NA=
X-Received: by 2002:a81:bf51:0:b0:5ff:7f45:3933 with SMTP id
 s17-20020a81bf51000000b005ff7f453933mr1605802ywk.80.1705915062981; Mon, 22
 Jan 2024 01:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com> <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
In-Reply-To: <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 22 Jan 2024 03:17:31 -0600
Message-ID: <CALNs47vzQm5MbfJtMQR3p+W1xub3KHiNqRgEQGWT3u28fpQ-oA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 10:59=E2=80=AFAM Jamie Cunliffe <Jamie.Cunliffe@arm=
.com> wrote:
>
> Eventually we want all architectures to be using the target as defined
> by rustc. However currently some architectures can't do that and are
> using the target.json specification. This puts in place the foundation
> to allow the use of the builtin target definition or a target.json
> specification.
>
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> ---
>  Makefile          | 1 -
>  arch/x86/Makefile | 1 +
>  rust/Makefile     | 5 ++++-
>  scripts/Makefile  | 4 +++-
>  4 files changed, 8 insertions(+), 3 deletions(-)

Adding LoongArch maintainers - this patch will need a small update to
arch/loongarch/Makefile similar to the change in arch/x86/Makefile
(included below), since that support is now in-tree and uses
generate_rust_target [1]. Also a very minor conflict in docs at patch
2/2.

I believe this patchset is still waiting on an ack from the kbuild
team. Series at [2] for reference.

Thanks,
Trevor

[1]: https://lore.kernel.org/rust-for-linux/20240108032117.215171-1-wangrui=
@loongson.cn/
[2]: https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Jamie.=
Cunliffe@arm.com/

> diff --git a/Makefile b/Makefile
> index 88ebf6547964..23100f193da3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -566,7 +566,6 @@ KBUILD_CFLAGS +=3D -fno-strict-aliasing
>
>  KBUILD_CPPFLAGS :=3D -D__KERNEL__
>  KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
> -                   --target=3D$(objtree)/scripts/target.json \
>                     -Cpanic=3Dabort -Cembed-bitcode=3Dn -Clto=3Dn \
>                     -Cforce-unwind-tables=3Dn -Ccodegen-units=3D1 \
>                     -Csymbol-mangling-version=3Dv0 \
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 5bfe5caaa444..0f339d4abd40 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -68,6 +68,7 @@ export BITS
>  #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53383
>  #
>  KBUILD_CFLAGS +=3D -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> +KBUILD_RUSTFLAGS +=3D --target=3D$(objtree)/scripts/target.json
>  KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-sse4.1=
,-sse4.2,-avx,-avx2
>
>  ifeq ($(CONFIG_X86_KERNEL_IBT),y)
> diff --git a/rust/Makefile b/rust/Makefile
> index 87958e864be0..8d75a6ffe951 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -428,8 +428,11 @@ $(obj)/core.o: private skip_clippy =3D 1
>  $(obj)/core.o: private skip_flags =3D -Dunreachable_pub
>  $(obj)/core.o: private rustc_objcopy =3D $(foreach sym,$(redirect-intrin=
sics),--redefine-sym $(sym)=3D__rust$(sym))
>  $(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
> -$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs scripts/target.json FORCE
> +$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
>         $(call if_changed_dep,rustc_library)
> +ifdef CONFIG_X86_64
> +$(obj)/core.o: scripts/target.json
> +endif
>
>  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
>  $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FO=
RCE
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 576cf64be667..c85d130a4125 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -11,12 +11,14 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)         =
       +=3D sign-file
>  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)    +=3D insert-sys-c=
ert
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D rust=
doc_test_builder
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D rust=
doc_test_gen
> -always-$(CONFIG_RUST)                                  +=3D target.json
>
> +ifdef CONFIG_X86_64
> +always-$(CONFIG_RUST)                                  +=3D target.json
>  filechk_rust_target =3D $< < include/config/auto.conf
>
>  $(obj)/target.json: scripts/generate_rust_target include/config/auto.con=
f FORCE
>         $(call filechk,rust_target)
> +endif
>
>  hostprogs +=3D generate_rust_target
>  generate_rust_target-rust :=3D y
> --
> 2.30.2
>
>

