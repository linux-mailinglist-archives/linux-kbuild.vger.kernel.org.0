Return-Path: <linux-kbuild+bounces-2346-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABB927793
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AC62B22EA8
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 13:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C15A1AED33;
	Thu,  4 Jul 2024 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nivqRoXF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541F41AE852;
	Thu,  4 Jul 2024 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720101567; cv=none; b=r2FpXUAp+sV/W69jAlyQZEBU+FTDp1Ol+x7dvcgDacm5zFo23psjnaNauFKlBckYjwjEKOC9eskioiI0ZzKJzrkOUugFp98DHEiveMVn7z6LrpUyyj6k2iG/1jJl+u30v03Q+uVI/KLIxwEQYVWbnr95Ri+hD3hJbURPRJULX9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720101567; c=relaxed/simple;
	bh=GiFNrRC5ZHb7Hxbh4vVwGtsfmzcjtWemmZgP3AnxegY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS2eLVA8Rm2TeUsQZf0yUVuL3y71lZCE3muU6ncbm0Cdadwny5Em6B8xL4Qxj8Pvfa29jeAclMmQcToSYSgJSx+dTBXAqH8rnGV3LHF/fRjMZvIvuvqwnRZ/25AzoIXgUjeuDKc7quQ4akX2bG4g7wmay48Hl22RYHKqlOhSGEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nivqRoXF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D147DC3277B;
	Thu,  4 Jul 2024 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720101566;
	bh=GiFNrRC5ZHb7Hxbh4vVwGtsfmzcjtWemmZgP3AnxegY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nivqRoXFiy5R/h79TRhpMSLyeCBWRjHCX0d/Z4P9Gg/hB4yH64j/dLLwMjR/gVvON
	 UXD5WxmmbLeQHYopqQuKJYkzUeqyBSy5feIxtI1S1/o5syfMsgHY4+N6oE9LU+jrlM
	 rK0HINvg+4QMygsLQZGhirfIyq42t4xjq3++CFYS5LVh/8R7jbds+6EcM1Yyy0tOkK
	 Q3j/xhPiZ37x2UDvMnhxF8wH69YGn9Q7ZBteUa66PXw5pB5CcovGhMqXJTZ5xtBqpP
	 QkWOmH4zbalHvaRlsfohKUu2WPc/7sPquoKXSR1GuR6B8LPiA81vc5JoFw731zdvcf
	 dSUit0cUM5usw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ee794ec046so7193101fa.2;
        Thu, 04 Jul 2024 06:59:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjf1+HENO+5SVqWc6yaTaNOIaZ2BoS6QUsKZE0GduBoUNhUgsz8G8ZHJabs4+zMiGFcPqnFISqzV7J1TpPlv2AodsLLn7BR8QSAeYF
X-Gm-Message-State: AOJu0Ywp63cEIkkRtwRQRr/oGHqDMq1Dzn7LHQiaXHXnKzV4scwj2sTd
	mcX0YQ8p4HofZF2pdNA+pqbLADtOUohi/skv92xmvwcRNwpgyEgbNUW2xC+pMcUax7QpnLPnl/W
	UG05NjKr+/knzMZxcP+DN1U1OpEo=
X-Google-Smtp-Source: AGHT+IF+CHxSsSYPe+elMB6CRNK5thn1dazWoWQgYaGFhA+1aiJhuLN8GpIixNnM9hbQ+rlQWVkF3e5f4fSARKAoA0U=
X-Received: by 2002:a2e:3c03:0:b0:2ee:4ccf:ca4f with SMTP id
 38308e7fff4ca-2ee8eda42e4mr11245841fa.31.1720101565403; Thu, 04 Jul 2024
 06:59:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATxSePzOrHaQvS1MQo4mpAwdfwrDu3iuUsYZ+RL=LiirA@mail.gmail.com>
 <20240611211123.959459-2-aquini@redhat.com>
In-Reply-To: <20240611211123.959459-2-aquini@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 4 Jul 2024 22:58:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQviPKzppow8Vpjz_hOT0kidLihgjS5gBxTx82SOzj9PQ@mail.gmail.com>
Message-ID: <CAK7LNAQviPKzppow8Vpjz_hOT0kidLihgjS5gBxTx82SOzj9PQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rpm-pkg: make sure to have versioned
 'Obsoletes' for kernel.spec
To: Rafael Aquini <aquini@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 6:11=E2=80=AFAM Rafael Aquini <aquini@redhat.com> w=
rote:
>
> Fix the following rpmbuild warning:
>
>   $ make srcrpm-pkg
>   ...
>   RPM build warnings:
>       line 34: It's not recommended to have unversioned Obsoletes: Obsole=
tes: kernel-headers
>
> Signed-off-by: Rafael Aquini <aquini@redhat.com>
> ---
>  scripts/package/kernel.spec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index e095eb1e290e..19e458341f45 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -27,7 +27,7 @@ The Linux Kernel, the operating system core itself
>  %package headers
>  Summary: Header files for the Linux kernel for use by glibc
>  Group: Development/System
> -Obsoletes: kernel-headers
> +Obsoletes: kernel-headers < %{version}
>  Provides: kernel-headers =3D %{version}
>  %description headers
>  Kernel-headers includes the C header files that specify the interface
> --
> 2.45.1
>
>

Applied to linux-kbuild.
Thanks!


--=20
Best Regards
Masahiro Yamada

