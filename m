Return-Path: <linux-kbuild+bounces-7184-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A094ABE47C
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 22:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A4044A7E09
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 20:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776E72882A5;
	Tue, 20 May 2025 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Basbg6MC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96281286893;
	Tue, 20 May 2025 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771763; cv=none; b=KExAaP0bLSGNnTfpzvhzAsAa8gje0sO+v6MlV1g8RfbGxkQf6OjD6DGKBuAF0ZAcnG7mAMlqaq5nohBmCb4e4uQd8vsbX8i4uM3BbkNEu1SEZUR44ZqpAnGoU+O0v9yD6rYXRMs4LXqouKG3C8no/hn2B4uapL1dLyVCWtngNGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771763; c=relaxed/simple;
	bh=V4N2yfPT4vLArvTmMIGEmcZ/2fv5s912zQIeD+Vi+50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQTgDnRHx1AU814cjqJs/ZjbjbItjo8cniRcQRlkmegBd72HzScsK0cDx4vxZXyO86HM6UCy6uF1b4pAgTzRN2u6GG3itgNXhMdzRmiBMFle6PEJEx868kGwxOZ1s/ehMKouNNDOf8wDlSgAXDtUrcmi1l+CAvhqOgqq0PwZgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Basbg6MC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7106453e87.3;
        Tue, 20 May 2025 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771759; x=1748376559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuyoTXp3MODuWVPPgdIVH6d5EFlhvXCFhKmlk5Ftb7c=;
        b=Basbg6MCjDsqlTKxsUndPUD/ptmqVL8ZgQEyFXKuEkuRM4RY1PT/9qwgH8YVe8woNc
         L7wOVkJXxY0zo76Dphsz+hSHUbWj8+8jgjlegHmyJNp4xTksEjtM/hgZQEu7l9G+D6dk
         TAdCtd0dcGNKdNp7uJiUh2/FHk20C5mM3+tDthBwIaOd742+SrDNUo2a+kkmhun07NIm
         R+aftX/IjVHEHlJFMTYklMyOM9trODkVC5j4KFsZ6jnfdOmr73PDMbe6zZZvgzUtNtx/
         DBJ5reyfDZ92jAwi6/p8LBvpxfeHtfsoENFG+wyJPCIPJcNoHmCeCa27vb0bGP7Iil9x
         n+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771759; x=1748376559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuyoTXp3MODuWVPPgdIVH6d5EFlhvXCFhKmlk5Ftb7c=;
        b=R6XNn8Wn/HVzmb/IzONzB8DxWI6c3uR1AjW4m28rye0g8wJy2Zdm3yUjNAfQWIog7x
         C+FtqZ61bHx9NN4M9q5qD1te+jkbZq2jkxWEFdx+zMRCWlRwulsbHNhIxD3MpahHZfv5
         K7m+AWIfvA5xHozhfjg4JuUoxVxqLlRA5vruBdQNd1ZpX4kGE9Y5FBGCGB1DpGn1BW9H
         B83iifmatPlYMflmb7Sm9J4Wl554IoXqIPAmITxcV+b6Yv7f5KiBV6R6yIwQ33yzeGM+
         ROSe3VQ8wl4ueePon3Cc1PfetSQFm+fZmrtX5HwAVlh6o4jSbqoTjCxkVEdQXFPqZ1Pw
         EoEw==
X-Forwarded-Encrypted: i=1; AJvYcCUv3RMPRFfgp+v2acE6oM1ekv34hEQd/3YiPK5Ub6U7p8ThSqUiO8QGdEIkGGWxm5XPXxAXx+YFQ/pvvXzpga0=@vger.kernel.org, AJvYcCVHBOv5pwEm0d3Mi1rXovlGfuT4Y4rx/3I3MiotwOp9vlKFGn8mgYLM59GhCdvsV2ELSXtPjUCK@vger.kernel.org, AJvYcCVWVHF52w9czYb9lfBj1Cov0hoR0sAAzpqkzB6qbYk8T7QiWCLnxmdeRNDafYSgDZe7TN4/mq9bWd2eDRw=@vger.kernel.org, AJvYcCVqe3kWSTAKtQQ9ZpDeC3EN/9GB7tg7Att8A0YqOql2S54zLkKZgGKHBqJRlT/DXRD2y1V+doopCehe4xHJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxakKrPqnw86qCpvg3WkTlyBrw3RS33GXzl60LzncaRYk28ICaW
	x/4l80NO+704ypltcf4BLQzVuNGjG+dncuypn/SGpAwaHP5dWNoJoGwCd/ZqXp4sUvCzemasVKB
	3wC0lCl8ZApyXF7ortCZPf0Zn+7yTYv8=
X-Gm-Gg: ASbGncupQzWTQnyV5pQz6kpSezvyim11xuuh/vzd1dO/Nnjjt36BvJZdIJ55GHRQDUY
	8FvYWc8+1a60rRZyIsxOtEMMXdVYscf9QgCEW0H4/0fKYR0aNVqImndkfg5iqT6+6C93g98XRw0
	az0m+Uavp2tShLO75n8whcTYKnF/p/SDJVC1b/1IqOwcD8jLkvY8MdqoS7G4JLe1n19A==
X-Google-Smtp-Source: AGHT+IFf0lnQCFWkFCfdxrk+JO5rkXC6xmEqU21o1BjXv2ej3TB/usiYBL0/wQcTYaIG0NmijVMU13ndZBXFAgFK5yo=
X-Received: by 2002:a05:6512:6289:b0:54f:bd1b:a556 with SMTP id
 2adb3069b0e04-550e71c96d3mr6396517e87.21.1747771759405; Tue, 20 May 2025
 13:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520195345.905374-1-ojeda@kernel.org>
In-Reply-To: <20250520195345.905374-1-ojeda@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 20 May 2025 16:08:43 -0400
X-Gm-Features: AX0GCFuYtYwPuzH1amM1oKvd4aiYFppH2qm_DIkyK8s7rHnx32DMa7RGwsTYPAo
Message-ID: <CAJ-ks9=mrZnvME=6++fMNaLFZ8a5DXib5ZLuaYorFZv01GBMWQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: rebuild if `.clippy.toml` changes
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:53=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> We rarely modify `.clippy.toml`, but currently we do not rebuild if that
> happens, thus it is easy to miss possible changes in lints.
>
> Thus rebuild in case of changes.
>
> Cc: stable@vger.kernel.org
> Reported-by: Tamir Duberstein <tamird@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1151
> Fixes: 7d56786edcbd ("rust: introduce `.clippy.toml`")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 3aca903a7d08..107299c32065 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -57,6 +57,10 @@ rustdoc_test_quiet=3D--test-args -q
>  rustdoc_test_kernel_quiet=3D>/dev/null
>  endif
>
> +ifeq ($(KBUILD_CLIPPY),1)
> +       clippy_toml :=3D $(srctree)/.clippy.toml
> +endif
> +
>  core-cfgs =3D \
>      --cfg no_fp_fmt_parse
>
> @@ -405,11 +409,12 @@ quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUI=
ET) P $@
>                 --crate-name $(patsubst lib%.$(libmacros_extension),%,$(n=
otdir $@)) $<
>
>  # Procedural macros can only be used with the `rustc` that compiled it.
> -$(obj)/$(libmacros_name): $(src)/macros/lib.rs FORCE
> +$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(clippy_toml) FORCE
>         +$(call if_changed_dep,rustc_procmacro)
>
>  $(obj)/$(libpin_init_internal_name): private rustc_target_flags =3D --cf=
g kernel
> -$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs=
 FORCE
> +$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs=
 \
> +    $(clippy_toml) FORCE
>         +$(call if_changed_dep,rustc_procmacro)
>
>  quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_=
QUIET)) L $@
> @@ -495,7 +500,8 @@ endif
>
>  $(obj)/compiler_builtins.o: private skip_gendwarfksyms =3D 1
>  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
> -$(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FO=
RCE
> +$(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o \
> +    $(clippy_toml) FORCE
>         +$(call if_changed_rule,rustc_library)
>
>  $(obj)/pin_init.o: private skip_gendwarfksyms =3D 1

This is only changing 3 targets, right? libmacros, libpin_init, and
compiler_builtins. Can you help me understand why only these need to
change? Is it because these are leaf nodes in the graph?

The `rusttest` target wouldn't rebuild properly, I think? Is it
possible to apply this rule to all rust targets, rather than
individual ones?

