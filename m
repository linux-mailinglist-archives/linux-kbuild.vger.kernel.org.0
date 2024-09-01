Return-Path: <linux-kbuild+bounces-3306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471CF967645
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 13:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 541B41C20964
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 11:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A594216DC33;
	Sun,  1 Sep 2024 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUDxN0OR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7EE14F9F1;
	Sun,  1 Sep 2024 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725191028; cv=none; b=g4dVesa0bdktWUXtaHbiNk0uXlCbycR1132gPjvFV9Y+sdC5mE5TKdhQ/OLlFWQ/BuK51nE7iS37r8pEVYUelL7qHoqXeYPf3NtqrZsQLbizA5m8yT9uKm4FjYCpH674t0A0AylaDDzVgPafghN/7zP8NyvDhBEXy50dh2eVziU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725191028; c=relaxed/simple;
	bh=YO84pzNYRSHSCP1pBXu/MraETo66El/kM6ifHgTvGD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhDr0smsb0DQBrxe8AbK9S+qNSuB6uShgy+yO6DEF7Dh4clgoX8cp6TIJgr3wwZO97IgkPQvvgLmabmvcoWE/icR8WaAaAle0vg9WtBKpfWrfeWBm9//sp9gWwbSysUZvsgtcOi9yAsTbKoDbEm/BR7cE7KOmsm/xHjLn1MmQcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUDxN0OR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5A4C4CEC6;
	Sun,  1 Sep 2024 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725191028;
	bh=YO84pzNYRSHSCP1pBXu/MraETo66El/kM6ifHgTvGD0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JUDxN0ORRQSuuaaS0BLngcazqeF13Qroa7hHpD2gBhiNuTh8+fxKj1tlDchcEJMyU
	 FsCRzaUjOpVn9HIR9P8fnZoD+Eh0mVpeb+6pT+DCK7asmtCtzYLPRXLbHXhND6Cdxu
	 9Jw+Ojly8tlBoj+0xdguaBVLJNmymbh+wyNNr+4zRChNZj0yG32Tm6zdd33U9nLi4T
	 XHHvyRZ43U5k6eQdUoyOrKfZ+UCgPF739r4z25dvr8vjogIDr1af+s6sTtSVKC/Cxe
	 THynbQMb25667K9ACL0eoNAs2ayBIsS3svhIw0lAJqbPmNYb204Zl9aI6oP1WvZrUO
	 kv/QEoL0EIPfg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-533488ffaddso4081658e87.1;
        Sun, 01 Sep 2024 04:43:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3v74Z3QYN2j4XIR9FLyD6QcgP9aNlpz7oa1C22ceg9URTsI441eueg3GlQFILkMvsyw4j21wWy+XkcwU=@vger.kernel.org, AJvYcCXI3CiHWR6sC28aXpdx014G1qjAkBQqorJxLX1wOzWCAM2LRTX/rP6JqTeXWTWIx7ZEWBlr/o6N/5nHBuXJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPSlsQuq3OpGvJfi6sPSADX4j3lVOXLuz4oEtexAMDoLUESy6j
	eBUZYcqZ9vaZgCVLfSLLwqkr6m1Q8EdnBwU0SVEcuOP/oKwQdYmfjdnypZfVRPS8sWBzuyX3E7K
	cIwvPDfZYDOl+EcXE8vRiXZzGsy4=
X-Google-Smtp-Source: AGHT+IFmv0pYkmA163ddXQtm8ApWSNMPmqtN6sA01Ur9fnFQWapVQx0mK58O4OV4nTnMmzTrnGmZI3mXR+dhKlwYJ6I=
X-Received: by 2002:a05:6512:3f1a:b0:52c:dac3:392b with SMTP id
 2adb3069b0e04-53546b432e8mr5023528e87.33.1725191026653; Sun, 01 Sep 2024
 04:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d65e598f-4d3e-4092-bc39-16b636181708@cybernetics.com>
In-Reply-To: <d65e598f-4d3e-4092-bc39-16b636181708@cybernetics.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Sep 2024 20:43:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFYs+iJovrf1b=cF_=Y5YBztDwVB4B+uh7PMgsaRFL4w@mail.gmail.com>
Message-ID: <CAK7LNAQFYs+iJovrf1b=cF_=Y5YBztDwVB4B+uh7PMgsaRFL4w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove recent dependency on "truncate" program
To: Tony Battersby <tonyb@cybernetics.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-kbuild@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 10:51=E2=80=AFPM Tony Battersby <tonyb@cybernetics.=
com> wrote:
>
> Remove the recently-added dependency on the truncate program for
> building the kernel.  truncate is not available when building the kernel
> under Yocto.  It could be added, but it would be better just to avoid
> the unnecessary dependency.
>
> Fixes: 1472464c6248 ("kbuild: avoid scripts/kallsyms parsing /dev/null")
> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>


I have no objection.
'true' is a shell-builtin command, so it saves a process fork.


Applied to linux-kbuild. Thanks!


BTW, 'truncate' is used in drivers/firmware/efi/libstub/Makefile.zboot
(CONFIG_EFI_ZBOOT).
It seems to be no problem in Yocto.







> ---
>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 070a319140e8..c27b4e969f20 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -215,7 +215,7 @@ kallsymso=3D
>  strip_debug=3D
>
>  if is_enabled CONFIG_KALLSYMS; then
> -       truncate -s0 .tmp_vmlinux.kallsyms0.syms
> +       true > .tmp_vmlinux.kallsyms0.syms
>         kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
>  fi
>
>
> base-commit: 3e9bff3bbe1355805de919f688bef4baefbfd436
> --
> 2.25.1
>


--
Best Regards
Masahiro Yamada

