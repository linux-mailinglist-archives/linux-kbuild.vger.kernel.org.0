Return-Path: <linux-kbuild+bounces-4871-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C389D9A1A
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 16:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1095B26423
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 15:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321771CCB4A;
	Tue, 26 Nov 2024 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwU225ko"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092E278C6D;
	Tue, 26 Nov 2024 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732633260; cv=none; b=dZOaK+OVYv+9BKFla0IRkjwgUYpdcfi94V5CSNkK3jWaIC5UzLIj6NTtTdQg6J6yp0NxQ4WIUdQqrZY0eq5TcmFlU23QbbqoQ+369F3ERofUAyJxF7aZ+TcmK1e10nI8rHUrqfdd+A9FfDI6WjsS7kZ62ZwsCUp1baELpXwydck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732633260; c=relaxed/simple;
	bh=NZzthVN5SkVCoTAI/WKvZ9z79jq+ZgEOlT7DZBX4Evc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCeRcwb/Qs1MMdLiNeWm/R8+rMC+c0ROfmnbMvbv0dT8dD6iuv1FrRq8OeRg1TVpgFGXRHiaKaYIwmRcF+m+xGk5uceiS8sU2djZ+ztDMsUsxi8AvQnKK1pWN4KP91/8L11yozqE6OnhQZisr4goWokDsfxqzhw5TxhVrs8bQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwU225ko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C1BC4CECF;
	Tue, 26 Nov 2024 15:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732633259;
	bh=NZzthVN5SkVCoTAI/WKvZ9z79jq+ZgEOlT7DZBX4Evc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JwU225ko3PUOE7f0K643j8d3l6gXk5/X0t9Kb0cUOxuVf+LtsCMNMAGFr2JitGwfO
	 SsV1wWMDzojyFxWDOkCa5NaRUaIkQ0n8Z6Rw+UaqpO08vsC2V+hRdemmq0xdbW9d+w
	 z0espEbReBnDE8Ee/uSo17qCk+5+Gq/ndGBi9CqfraK8qO8iigt0JGxmHxuO9CKQiH
	 YWcSLbRKNfQe6sCa0pVwHTJ/yTqvASvmZw+o8G2pbr3QvT/iRtaevxZE08TZxpvvew
	 3VYTd85y4mmxd3Dp1+nSmyt+M0gHBrysrolwukRyaPc7Xzs92DUaoDSBpICGpLrGNp
	 qvp9irEg0o0dw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso56573811fa.1;
        Tue, 26 Nov 2024 07:00:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2WDKvFHexji203y/CG5i6lTJcE3PhwhiFcpTa4ZQsFlPFcsAcTGsGWNcIm7nH0OmlNc+3fbeV00GBgmfP@vger.kernel.org, AJvYcCUgzlm5b50wLDQaRMLst/ArIWjc5pDAXnZag6rsw/Vq4SjkbbTuMWKmvtTgPop+NvUSfYUuOGNRGf/Z6v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjtWn3F90IImCM/6qY7BzIPwHTe30LFzvIs1v7YA0MkmhAXIyI
	lb3PKYMGkw7APAXDGLxe40ksJruRnyHF0z0Gs4KL2bX3waljZqNOrzIiVvqPBw/80sA5p+kRfOk
	fSwN/rkm3GnSafwBc4HTEuOHNv9c=
X-Google-Smtp-Source: AGHT+IFZKLqpk2nX/urDuc5LTJL9ji5a+4EoVsoyepR9zHosSRwN3nRtO71BzIO+tcYyqaLjABLdAt5gBeQdlVM0CtU=
X-Received: by 2002:a05:6512:3b0c:b0:53d:ed3e:4dbb with SMTP id
 2adb3069b0e04-53ded3e4ed3mr1198443e87.21.1732633258202; Tue, 26 Nov 2024
 07:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123132237.15700-1-sedat.dilek@gmail.com>
In-Reply-To: <20241123132237.15700-1-sedat.dilek@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 27 Nov 2024 00:00:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQL4Ht5W2qZrx5+ACX7Xc0pr4FRht7jYFyyjUKR1Afi=w@mail.gmail.com>
Message-ID: <CAK7LNAQL4Ht5W2qZrx5+ACX7Xc0pr4FRht7jYFyyjUKR1Afi=w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix names of .tmp_vmlinux kallsyms files
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 10:22=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com=
> wrote:
>
> For details, see thread "kbuild-next: .tmp vmlinux syms files"
>
> INFO: This patch is against Linux v6.12.
>
> Link: https://lore.kernel.org/all/CA+icZUXvu0Kw8RH1ZGBKgYGG-8u9x8BbsEkjtm=
4vSVKkXPTg+Q@mail.gmail.com/

This is not the right way to input a commit description.




>
> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> ---
>  scripts/link-vmlinux.sh | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index a9b3f34a78d2..c9088436baff 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -203,8 +203,8 @@ kallsymso=3D
>  strip_debug=3D
>
>  if is_enabled CONFIG_KALLSYMS; then
> -       true > .tmp_vmlinux.kallsyms0.syms
> -       kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
> +       true > .tmp_vmlinux0.kallsyms.syms
> +       kallsyms .tmp_vmlinux0.kallsyms.syms .tmp_vmlinux0.kallsyms

If you aim for naming consistency, this should be

.tmp_vmlinux0.syms



>  fi
>
>  if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
> @@ -231,14 +231,14 @@ if is_enabled CONFIG_KALLSYMS; then
>         # Generate section listing all symbols and add it into vmlinux
>         # It's a four step process:
>         # 0)  Generate a dummy __kallsyms with empty symbol list.
> -       # 1)  Link .tmp_vmlinux.kallsyms1 so it has all symbols and secti=
ons,
> +       # 1)  Link .tmp_vmlinux1.kallsyms so it has all symbols and secti=
ons,
>         #     with a dummy __kallsyms.
> -       #     Running kallsyms on that gives us .tmp_kallsyms1.o with
> +       #     Running kallsyms on that gives us .tmp_vmlinux1.kallsyms.o =
with
>         #     the right size
> -       # 2)  Link .tmp_vmlinux.kallsyms2 so it now has a __kallsyms sect=
ion of
> +       # 2)  Link .tmp_vmlinux2.kallsyms so it now has a __kallsyms sect=
ion of
>         #     the right size, but due to the added section, some
>         #     addresses have shifted.
> -       #     From here, we generate a correct .tmp_vmlinux.kallsyms2.o
> +       #     From here, we generate a correct .tmp_vmlinux2.kallsyms.o
>         # 3)  That link may have expanded the kernel image enough that
>         #     more linker branch stubs / trampolines had to be added, whi=
ch
>         #     introduces new names, which further expands kallsyms. Do an=
other
> --
> 2.45.2
>


--=20
Best Regards
Masahiro Yamada

