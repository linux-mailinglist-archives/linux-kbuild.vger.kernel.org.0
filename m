Return-Path: <linux-kbuild+bounces-6962-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F92AABC6F
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 10:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7401D3B1A39
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 07:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542012046B3;
	Tue,  6 May 2025 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cy8dYRUX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F3A12B93;
	Tue,  6 May 2025 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746515079; cv=none; b=qnTG+nD8mOE8ikR5VWCfnHPrLjdTVSwq9AueGlW0SdHIkNC8CZ+1rQURzDK5c0wLpJG+O53GWHNUdO1v5dizWHdGNR+z9dbHbWHPjzx2JGcj7QxzZohd3gIlkxCd1134nG18fdOuf055cppSxHa+Tr4bz3gN3yCr1GC32qt25Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746515079; c=relaxed/simple;
	bh=U7vPQzIh/TPqjXhn3LlZrogq0OsLAzFu5cmMvri3CzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkIgQd+MMrmDqk78J8ZTOSqcygBqV5nFgjDN+Ll7z9fPuF3oBO64i7wfcpVB0j4UH7c9LqZzXmcilDetRe064ymbvyjR0l9chSvFXALKBgO8KDVasMh7ntQ4orMnIo6lstGRbjcNecRWFD+UoDJdI7JZGUqLDQwDjCDtZmkjGCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cy8dYRUX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992D4C4CEE4;
	Tue,  6 May 2025 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746515078;
	bh=U7vPQzIh/TPqjXhn3LlZrogq0OsLAzFu5cmMvri3CzI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cy8dYRUXdLag9ya92zrbGqsEiENiuJSOTOmJFKpBuSyjlrwv4jYknsg9HpjV0EH6e
	 xwXDbiu8CuRRMGVHNk/DeariGcxDqOB9nfB2gRD5UinXfuwEEMstx1IxElrVOxl5Gt
	 ndIoINPzjzjpPv2Lm2e0NwiykfFZSNGCYo3Pfqyvm3qt0FWef2M7MK94ibZrmI3/oj
	 ycmAhmDwIaH5Pmhjs+x/JZStSG8goaXxjj1b7NQCjfvUoWYchJN54v/GzzHFQaQgX0
	 urRqcKJcZhS59yJPden2VjKAT4ad2rNb8ZNZziC4+3jmZ5jxbHUoHb2gx735G+4ZS9
	 LxFglxlqjfzeA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso6681858e87.1;
        Tue, 06 May 2025 00:04:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3dDhjEvXgRDNdNlKq1dG7My0mP05BGsoNWVU8or0GrOV08MjhqWZfA1Knh3Y9Vwa2QtE/MzybhF2zDL79@vger.kernel.org, AJvYcCW3uU2nEG21f5twj7RpunBBR9Ee9b+a0u4mqLyjIlAV+ACb2J73N40oXYYTaS4fkI7YUnf3YwQF1gkhvbtZ3w==@vger.kernel.org, AJvYcCXAyaFOQQvfC5PxMoB9uNSYh927pckCivCEbh1EFi0UHAMjZ4JbXk+cM7IPiHL0triTc1GrLnD5wKffyuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhizR9Cv/R0Rcj/ww6FV650BTEaHwz1sinktAdjuiY0oiwa8mE
	9zN06NauSE3LbIporpiFsbiZb5SKa5en9TWgMR7lNxrU4gta2zcPe2q+7DB7GfgJ8ANcLQsblC1
	/laWA//JFGJydEr980/6jj2JCjmI=
X-Google-Smtp-Source: AGHT+IGY075FvxCyQwotSzfgDZIEaPEf40nFfkQvQ3BK2NzlWcurXunCQmDPuAjgxC94sIVjzvnCIuyFOtnIV5m20xI=
X-Received: by 2002:a05:6512:1087:b0:54b:117b:dc9d with SMTP id
 2adb3069b0e04-54fb4aa2c32mr631166e87.55.1746515077321; Tue, 06 May 2025
 00:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407230843.1952850-2-samitolvanen@google.com>
In-Reply-To: <20250407230843.1952850-2-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 May 2025 16:03:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSsMF2E57fTNk6jYfb3OocB1RYgZKShfPoEDYdU_fQoA@mail.gmail.com>
X-Gm-Features: ATxdqUGJb3RnUBCvP04tim1O15c5qPAMrbUKSntNdzalPfODIJxEsDgAcdt7S2E
Message-ID: <CAK7LNARSsMF2E57fTNk6jYfb3OocB1RYgZKShfPoEDYdU_fQoA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Require pahole <v1.28 or >v1.29 with
 GENDWARFKSYMS on X86
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Pisati <paolo.pisati@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:08=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> With CONFIG_GENDWARFKSYMS, __gendwarfksyms_ptr variables are
> added to the kernel in EXPORT_SYMBOL() to ensure DWARF type
> information is available for exported symbols in the TUs where
> they're actually exported. These symbols are dropped when linking
> vmlinux, but dangling references to them remain in DWARF.
>
> With CONFIG_DEBUG_INFO_BTF enabled on X86, pahole versions after
> commit 47dcb534e253 ("btf_encoder: Stop indexing symbols for
> VARs") and before commit 9810758003ce ("btf_encoder: Verify 0
> address DWARF variables are in ELF section") place these symbols
> in the .data..percpu section, which results in an "Invalid
> offset" error in btf_datasec_check_meta() during boot, as all
> the variables are at zero offset and have non-zero size. If
> CONFIG_DEBUG_INFO_BTF_MODULES is enabled, this also results in a
> failure to load modules with:
>
>   failed to validate module [$module] BTF: -22
>
> As the issue occurs in pahole v1.28 and the fix was merged
> after v1.29 was released, require pahole <v1.28 or >v1.29 when
> GENDWARFKSYMS is enabled with DEBUG_INFO_BTF on X86.
>
> Reported-by: Paolo Pisati <paolo.pisati@canonical.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>

Applied to linux-kbuild.

Thanks.



> Changes in v2:
> - Also allow pahole <v1.28.
> - Update comment to include the affected commit range.
>
> ---
>  kernel/module/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index d7762ef5949a..39278737bb68 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -192,6 +192,11 @@ config GENDWARFKSYMS
>         depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
>         # Requires ELF object files.
>         depends on !LTO
> +       # To avoid conflicts with the discarded __gendwarfksyms_ptr symbo=
ls on
> +       # X86, requires pahole before commit 47dcb534e253 ("btf_encoder: =
Stop
> +       # indexing symbols for VARs") or after commit 9810758003ce ("btf_=
encoder:
> +       # Verify 0 address DWARF variables are in ELF section").
> +       depends on !X86 || !DEBUG_INFO_BTF || PAHOLE_VERSION < 128 || PAH=
OLE_VERSION > 129
>         help
>           Calculate symbol versions from DWARF debugging information usin=
g
>           gendwarfksyms. Requires DEBUG_INFO to be enabled.
>
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> --
> 2.49.0.504.g3bcea36a83-goog
>


--=20
Best Regards
Masahiro Yamada

