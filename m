Return-Path: <linux-kbuild+bounces-6451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C43B2A7CE19
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 15:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E5B3171F93
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 13:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E2E20F09C;
	Sun,  6 Apr 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFpZJz6U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C142A83;
	Sun,  6 Apr 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743945711; cv=none; b=b8pJbKTnnFIjrYbR1vAURSIjBOp227fKmzRToqDYofdqf7R4EipgAVpX20XQ7rkEMvrA4UPBqCokBnIOjwvHz85JZD+sKqeceJEdSuEk5EHj6z8V+BzaRaEsTZQyTI1E8ri/qFTnRO7TZLXKU1CzJ/6bYXTci6VyCcjIqqjTPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743945711; c=relaxed/simple;
	bh=zTNfeivIEWeB/M6GhlSV/pUKytPsSpCbfrPiWp9Y2HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GeVxO4I7E9soFc9LE6QzW9FhKZRnAm9/j75OPDu5zmZjalqK0JLAYNSRd0aFZqLfh2ij25mlkyDU1mrVUyuq1lLXiF4gcvG3lb8ich6koEVb6Vyr0dAhrJVLHHN9XOwewpYzjDoBuENo1gQSFX6aSLF96KR2+aB46cfvq4LY/g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFpZJz6U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23181C4CEE3;
	Sun,  6 Apr 2025 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743945711;
	bh=zTNfeivIEWeB/M6GhlSV/pUKytPsSpCbfrPiWp9Y2HI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aFpZJz6UGxLU3myo3bIa+q0RouY9tpiVkBd8T6FiFvWjRnWcfSYWgUJtGLlsJ5OT+
	 B3iBm8vgs16M86Qg9yytycqdz9AM/a4MPS+8pUPSahGhfWywBg82XpQz3PeU7FNCYy
	 0IeWJRFymRWvNqTzLiIborBOadlQQtDuosiHd/juJry6ZCnzykSxNpW5qlLJazlCbc
	 Jcj0JdrLvsrVHVEdoXqXwlFASrrJZuOfZdHM3c26M1RBrRLvUYZCnDwf6mBIuiUamt
	 WpVZ+3NEuQWErop6pVwuF+R7hkDS3T14I72uqMf56NRda6n8mDHU61xasCwfHlH27O
	 4VW9eptDeYTVA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54991d85f99so4607984e87.1;
        Sun, 06 Apr 2025 06:21:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxwnKKbdRASaVGSzE37oZd0tCi5e97TVtl6RFpK3RfiHLDVn8p2LO1AaRXXtHt8YVthM4US6BAtnmJJ2Q=@vger.kernel.org, AJvYcCWIIyqzyT+9B4nqvIuWOgynkTsakCu14lMlmRphmN2T8SStFHGjCW7X5edfEiux16bFBFk4E8zcZ66gzGfKtg==@vger.kernel.org, AJvYcCXW8UO0Rs7YV85KuGigCvddRH5FZMSzBEgJxDin5RnUUCM5sJcEUTjcfBfmgGDXx+Y2rbkyheZj/Pqpo1bJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwM/nLZbZxxNdtloQyjE+MmFRpl8HV/z7RbV8uz07ZfA8oQJ/Jl
	htYMingOz2lBtVG8ais2Xu8bhzOe53NnMuBqRqQYGSEsEb6Azaf+BISl4BFBGH3WWBLi30tviWO
	O9sgg5C6QIk6aecizAY9yN7v3GNA=
X-Google-Smtp-Source: AGHT+IFNDXzr9hs4vw9S61miB6pkLcxLyV2mIohX3MBPX4KqVSwl6e9m5RFhXoLvVbZizwWbO17Zc1DxUFi/Q5Tqqr8=
X-Received: by 2002:a05:6512:340d:b0:549:9643:68d0 with SMTP id
 2adb3069b0e04-54c1ca86841mr4357622e87.17.1743945709846; Sun, 06 Apr 2025
 06:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320232757.2283956-2-samitolvanen@google.com>
In-Reply-To: <20250320232757.2283956-2-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 6 Apr 2025 22:21:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8t-O2Y-47MEQA2cPYKq2NB+FURbZ8zJKWgT0grG90rQ@mail.gmail.com>
X-Gm-Features: ATxdqUFiUVPy_g6yejilb8bFsi5t1TaoLTJnmDeq8YAMXTg6rlhuRGpWbTH7mNE
Message-ID: <CAK7LNAQ8t-O2Y-47MEQA2cPYKq2NB+FURbZ8zJKWgT0grG90rQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require pahole >v1.29 with GENDWARFKSYMS and BTF
 on X86
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Pisati <paolo.pisati@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 8:28=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> With CONFIG_GENDWARFKSYMS, __gendwarfksyms_ptr variables are added
> to the kernel in EXPORT_SYMBOL() to ensure DWARF type information
> is available for exported symbols in the TUs where they're actually
> exported. These symbols are dropped when linking vmlinux, but
> dangling references to them remain in DWARF.
>
> With CONFIG_DEBUG_INFO_BTF enabled on X86, pahole versions
> before commit 9810758003ce ("btf_encoder: Verify 0 address
> DWARF variables are in ELF section") place these symbols in the
> .data..percpu section, which results in an "Invalid offset" error in
> btf_datasec_check_meta() during boot, as all the variables are at
> zero offset and have non-zero size. If CONFIG_DEBUG_INFO_BTF_MODULES
> is enabled, this also results in a failure to load modules with:
>
>   failed to validate module [$module] BTF: -22
>
> The pahole commit that adds 0 address DWARF variable verification
> was merged after v1.29 was released, so later versions of pahole
> shouldn't have this issue. Require pahole >v1.29 when GENDWARFKSYMS
> is enabled with DEBUG_INFO_BTF on X86.
>
> Reported-by: Paolo Pisati <paolo.pisati@canonical.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

The issue occurs with
47dcb534e253 ("btf_encoder: Stop indexing symbols for VARs"),
then fixed by  9810758003ce ("btf_encoder: Verify 0 address
DWARF variables are in ELF section")


Perhaps, does it make sense to do this?

 depends on !X86 || !DEBUG_INFO_BTF || (PAHOLE_VERSION > 129 ||
PAHOLE_VERSION < 128)



> ---
>  kernel/module/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index d7762ef5949a..7c75832aa1af 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -192,6 +192,10 @@ config GENDWARFKSYMS
>         depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
>         # Requires ELF object files.
>         depends on !LTO
> +       # Requires pahole commit 9810758003ce ("btf_encoder: Verify 0 add=
ress
> +       # DWARF variables are in ELF section") on X86 to avoid conflicts =
with
> +       # __gendwarfksyms_ptr symbols.
> +       depends on !X86 || !DEBUG_INFO_BTF || PAHOLE_VERSION > 129
>         help
>           Calculate symbol versions from DWARF debugging information usin=
g
>           gendwarfksyms. Requires DEBUG_INFO to be enabled.
>
> base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
> --
> 2.49.0.395.g12beb8f557-goog
>


--=20
Best Regards
Masahiro Yamada

