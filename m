Return-Path: <linux-kbuild+bounces-35-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1BD7EDFCC
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 12:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 287DB1C208A3
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 11:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54912D7B2;
	Thu, 16 Nov 2023 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJ27a72F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A230D28E28;
	Thu, 16 Nov 2023 11:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EBAC43395;
	Thu, 16 Nov 2023 11:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700134012;
	bh=4QnrU+T7A4PPFaa324goRY8z/JD/4JlPeYt9ZszkaI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fJ27a72FLlMzBMTqWhGsgEK125XpfAhy41DiOq5j41Ywtd0vIaLGPrhviCIsC5GuI
	 6TEiyybEpgLOpRjCH3eZ5wmXbP96/KVoLHVUDef18KGycnTxYz94gp6MzSeVO2rOO0
	 1jYvLjxnO3vs+sHY+o1FQXLmF/VxkJzOcNYwp4lUQr9B0T9W0DAdrJwAOdfCSXOr5+
	 vT4Z/RKeS2m+SRKbUuX6XGCTuwDVgHVDM16KD0sabGV2AVjgiHit9RERmHOHwhuisP
	 OXgeSaE9EEIGk1FGdgmAdndZmWnPKKe88xLHbplaHHDvvThRoNvTdTfeinZlelZThp
	 OxltEIalEz+nQ==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-58a0154b4baso883329eaf.1;
        Thu, 16 Nov 2023 03:26:52 -0800 (PST)
X-Gm-Message-State: AOJu0YymdJP9tD9E8Fx5OJCWTxzc2KcOqOgCDDwlCKL9IxPa+B8gEqAK
	Fc+BAEaBNoNwteurA0pRgxsmNBDnVBxzb6O6KJA=
X-Google-Smtp-Source: AGHT+IGDcffi8phs1WBi/QHk+wGSokV1cI3UwAr+Cpu2pzIdMN/vSgc3IfVJajHC6EZ1RwfhIY9LcMv8V4pwNqe0QXo=
X-Received: by 2002:a05:6870:460d:b0:1e9:668f:46d0 with SMTP id
 z13-20020a056870460d00b001e9668f46d0mr596839oao.19.1700134011815; Thu, 16 Nov
 2023 03:26:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231110120722.15907-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20231110120722.15907-1-lukas.bulwahn@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 16 Nov 2023 20:26:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNATE5Vp44OuZ5K7Z7Cs8d5yKfUrUNAjEqOD1Bb5kLMdeLQ@mail.gmail.com>
Message-ID: <CAK7LNATE5Vp44OuZ5K7Z7Cs8d5yKfUrUNAjEqOD1Bb5kLMdeLQ@mail.gmail.com>
Subject: Re: [PATCH] linux/export: clean up the IA-64 KSYM_FUNC macro
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Helge Deller <deller@gmx.de>, linux-kbuild@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 9:07=E2=80=AFPM Lukas Bulwahn <lukas.bulwahn@gmail.=
com> wrote:
>
> With commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture"),
> there is no need to keep the IA-64 definition of the KSYM_FUNC macro.
>
> Clean up the IA-64 definition of the KSYM_FUNC macro.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Applied to linux-kbuild/fixes.
Thanks.


>  include/linux/export-internal.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/include/linux/export-internal.h b/include/linux/export-inter=
nal.h
> index 45fca09b2319..69501e0ec239 100644
> --- a/include/linux/export-internal.h
> +++ b/include/linux/export-internal.h
> @@ -50,9 +50,7 @@
>             "   .previous"                                              "=
\n"    \
>         )
>
> -#ifdef CONFIG_IA64
> -#define KSYM_FUNC(name)                @fptr(name)
> -#elif defined(CONFIG_PARISC) && defined(CONFIG_64BIT)
> +#if defined(CONFIG_PARISC) && defined(CONFIG_64BIT)
>  #define KSYM_FUNC(name)                P%name
>  #else
>  #define KSYM_FUNC(name)                name
> --
> 2.17.1
>


--=20
Best Regards
Masahiro Yamada

