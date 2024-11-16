Return-Path: <linux-kbuild+bounces-4697-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B09CFD6F
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 10:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D268F287C65
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 09:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01187190462;
	Sat, 16 Nov 2024 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ON2zqxJB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F679D0;
	Sat, 16 Nov 2024 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731748782; cv=none; b=Xp7Wv3WTCIzTndoZlM3iA+D5fPr8xMr9FMvCi6xvZZqNZQ/kw0Q5L5krfUzjDnWuD/haFXX/DmND8TvzD1+hDfx48k4TQwRX80YRTI7j1BmiMaDgaZRYteolljOUGqG6+MhZHOsyqngFoUAr0lhbrWHB07RjYdfKPGa8SsjzhTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731748782; c=relaxed/simple;
	bh=5YFDb9EGxDHpLuh9sMST5+YRVCn4Tzn8KJyyVcOnOFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xn125lbLTnQVakvrdfa5iB9B5fcigvg0HLQgqZbUtFgRi22hAvCfzo3ye5pL+uNWP+IwUel8F/eoChiSIJnI6eKmYWiPqe2lsdVN+7BOcJQRJkXLuRq8t56Hy5qrI/i4zhIspRc7qjSpicDNDjyLW1zPQgJ1QQerL3Yq4GE+lXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ON2zqxJB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F32CC4CED5;
	Sat, 16 Nov 2024 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731748782;
	bh=5YFDb9EGxDHpLuh9sMST5+YRVCn4Tzn8KJyyVcOnOFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ON2zqxJBYOfLMIoAwXbWmf16OoQbo92yQAvO/8FKQfvowc3is6ILR38Bj2jBjNWLj
	 N4DTXhJWYZBA1hqvcj3TWmX2XrJzyJH7faRoQHF8ok8ENz8wOTpYs0XkJVw9uXUz11
	 39EnI3tDoqtmeARKWu/f8bp9nww80Ttb6V/cjzwMCO9PFAtoKIXJk3wx0039IIjoHY
	 AMbgMS7eFILtN/MP2eSVuefHf7xx5TdiEJU2qk+c1hFGe1seqbA+6ghl2gA03RfdJf
	 X26fS1AYNpe2Jeyatt2ttFrWbaYoSFizw4/w3I/9APAKof37JiE49taoSis5Pda1l2
	 HXq0o0Oe7pqKg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb3110b964so2907501fa.1;
        Sat, 16 Nov 2024 01:19:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiAVgeYUnzFPBlkhBrhVSKP/er4anqALQcrKOqsKn6SdKpUjoMzwSX0Oz+ZbBq/oWL9GgzbTqVBcQOWqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05DQpgFLexopdxg2jNbHCAIZcN4YvOLyRzHD/Cdl1dcYe7BAi
	w+5zujtbd/Rm/VRsctOFzLanU8ObzCrFHZzVVBRH3/r6D44ttRcwByarITh//nhf+R71eJOego/
	rO+P6ICAc9rnrWV5bI1/ye0Tuk/Y=
X-Google-Smtp-Source: AGHT+IHY3QgYgVtivEhPjE7YP0TJGBWgi6zgfXrbod8MbwDHRHt/D9srwucNSPS9xKpoIUCwy4g8DYduLuXR3qFA+GY=
X-Received: by 2002:a2e:be9a:0:b0:2f7:5f6e:d894 with SMTP id
 38308e7fff4ca-2ff606f4f7dmr34216851fa.25.1731748780903; Sat, 16 Nov 2024
 01:19:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113234526.402738-1-masahiroy@kernel.org> <20241113234526.402738-2-masahiroy@kernel.org>
In-Reply-To: <20241113234526.402738-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 16 Nov 2024 18:19:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATENKMR0k1WiyOt3uv1+M0Ug+4tPFOYOhZdJ9BX0wd6SQ@mail.gmail.com>
Message-ID: <CAK7LNATENKMR0k1WiyOt3uv1+M0Ug+4tPFOYOhZdJ9BX0wd6SQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: move cmd_cc_o_c and cmd_as_o_S to scripts/Malefile.lib
To: linux-kbuild@vger.kernel.org
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Borislav Petkov <bp@alien8.de>, 
	Nikolay Borisov <nik.borisov@suse.com>, Marco Elver <elver@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 8:45=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> The cmd_cc_o_c and cmd_as_o_S macros are duplicated in
> scripts/Makefile.{build,modfinal,vmlinux}.
>
> This commit factors them out to scripts/Makefile.lib.
>
> No functional changes are intended.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Makefile.build    |  8 --------
>  scripts/Makefile.lib      | 12 ++++++++++++
>  scripts/Makefile.modfinal |  6 ++----
>  scripts/Makefile.vmlinux  |  8 +-------
>  4 files changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 1aa928a6fb4f..24e10c821461 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -141,11 +141,6 @@ ifdef CONFIG_LTO_CLANG
>  cmd_ld_single_m =3D $(if $(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $=
(tmp-target) $@; mv $(tmp-target) $@)
>  endif
>
> -quiet_cmd_cc_o_c =3D CC $(quiet_modtag)  $@
> -      cmd_cc_o_c =3D $(CC) $(c_flags) -c -o $@ $< \
> -               $(cmd_ld_single_m) \
> -               $(cmd_objtool)
> -
>  ifdef CONFIG_MODVERSIONS
>  # When module versioning is enabled the following steps are executed:
>  # o compile a <file>.o from <file>.c
> @@ -336,9 +331,6 @@ cmd_cpp_s_S       =3D $(CPP) $(a_flags) -o $@ $<
>  $(obj)/%.s: $(obj)/%.S FORCE
>         $(call if_changed_dep,cpp_s_S)
>
> -quiet_cmd_as_o_S =3D AS $(quiet_modtag)  $@
> -      cmd_as_o_S =3D $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
> -
>  ifdef CONFIG_ASM_MODVERSIONS
>
>  # versioning matches the C process described above, with difference that
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 5660dfc9ed36..73e385946855 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -298,6 +298,18 @@ $(foreach m, $1, \
>         $(addprefix $(obj)/, $(call suffix-search, $(patsubst $(obj)/%,%,=
$m), $2, $3))))
>  endef
>
> +# Build commads

I will fix the typo.

 s/commads/commands/




--=20
Best Regards
Masahiro Yamada

