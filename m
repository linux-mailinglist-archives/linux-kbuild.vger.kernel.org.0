Return-Path: <linux-kbuild+bounces-6106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DD0A5E903
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 01:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38E9F189C8D5
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 00:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380A12E337D;
	Thu, 13 Mar 2025 00:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szJI721i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1A0BE49;
	Thu, 13 Mar 2025 00:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741826111; cv=none; b=tb8a9kjjSC7ZLmcBH58gsDyQBrBbK2+ut9+LeCmdDU7ajdPAQHAArc4SYa46uuFscAJO1IaXRUPLR5479dZ4UcIHDWPAdfu4hoidD0silT6fgOWBhNqhT7FIa2DcCk7SMObpdSuSu1U6nTxrkUj4ofJyDcEd8zuHkTEWzX3lee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741826111; c=relaxed/simple;
	bh=ZNMXClnUZbe+u7N9g4p0/U2o58T3siXKyG+xYh1KNH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXRl4WxnLTjlVVcfKA4f54cgFbpqQpleJwTy0+7dxqYtZyyhie86MyM7daCYjt37NPwEIxfhSCq6+Fa9qag4hGa2ci5JK6+thCmIlJn5si8FocmWd6FiKezk2nrU2Ppmad25emtjWb5hbo1qFNEStmyeblUIY/ljXgEW4omVqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szJI721i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753E8C4CEEB;
	Thu, 13 Mar 2025 00:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741826110;
	bh=ZNMXClnUZbe+u7N9g4p0/U2o58T3siXKyG+xYh1KNH8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=szJI721ijiOwmyHqsOOzxkpLyFXE+rOlu87Xzg0kQcOuJdh2rJh6pTkxHOfEppdPX
	 XKYnLleHgSCDzLndKsa3GzLTM3hmG8MzxEHel17dcGvTAfgcCnQwP3/qJ5uxpV4mDQ
	 nWX70u156V1cVteJc0ePeqd9Pfua619gVkwd4jIEuIhjK3nLmZ7Ym5uUaJsfRZ9RB0
	 omQFlv8x6RAsYrFq928GtWjByY6xLGThdekDrMeoNcjtAHRhwqVu8sy8AE2M1Q6ELV
	 c+Tt8VDTb6EXflUKiuWhXrup3YxoGXKcA2ZEtmwvWmsUugIWEA0QUPPV0gMN8gYBK2
	 xOyqr0/H8iM7g==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bf8632052so4063811fa.0;
        Wed, 12 Mar 2025 17:35:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+9jChGobUwinU354f5Cf4V3QDuvKf8CzmHnrTOaBlsCfo2WiqFHGJNY+pcZQQcsyHyK6S6tr1JP8EEZA=@vger.kernel.org, AJvYcCVO1hbOFn651p91dssMmLmmgXszdpFVDfwJNBRJnU+NTxcwqTJFPWmgvUBE4acR7b9B0iF022+BKjDnT4YY@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCW5vwU4gXOuxAcT2B8fE88PKtH2DGcYwMs7TLA3DUOzhXqiL
	/z4vX7WW+rrp52DEleO9eGDciyvObDCBi8qMjr6R4aEb2t6oQhykdioRHITlzUlIYKczHYIuflV
	i9ia9WO5Ou75AATnu6ZVPcyuvAj4=
X-Google-Smtp-Source: AGHT+IGYyXeYfkhDSwHrnAla25ar+VcB90pwC91yOVQMoN+zBq8t5iMIE1/pEMS8tJ0BkbPnYsR6nXBNJHT5Kb2jIXU=
X-Received: by 2002:a05:6512:b14:b0:545:c89:2bc9 with SMTP id
 2adb3069b0e04-549910cb4a9mr9227384e87.43.1741826109127; Wed, 12 Mar 2025
 17:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com>
In-Reply-To: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Mar 2025 09:34:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYFEFFbnqwDuJNf4ngU9uLavJuQqknOimpYeAeHyk1zQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrQVAU-kF3eCnB0QvYcxVn-E2rNqouk7YLKaG-duzbfrpmut8i_jiufYdk
Message-ID: <CAK7LNASYFEFFbnqwDuJNf4ngU9uLavJuQqknOimpYeAeHyk1zQ@mail.gmail.com>
Subject: Re: [PATCH] script: modpost: require a MODULE_DESCRIPTION()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 4:49=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> description is missing"), a module without a MODULE_DESCRIPTION() has
> resulted in a warning with make W=3D1. Since that time, all known
> instances of this issue have been fixed. Therefore, now make it an
> error if a MODULE_DESCRIPTION() is not present.
>
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
> did my treewide cleanup for v6.11, Arnd had a few more stragglers that
> he was going to fix. I hope that by posting, some of the 0-day bots
> will pick it up and hopefully provide some feedback.


I pushed this patch to a separate branch,
so that 0day bot can compile-test it.

If there is no error reported, I will move it to
the for-next branch.




> Note: I'm not really sure if *all* of these have been fixed. After I
> ---
>  scripts/mod/modpost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index c35d22607978..c0b7a869ed24 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1596,8 +1596,8 @@ static void read_symbols(const char *modname)
>                                                      namespace);
>                 }
>
> -               if (extra_warn && !get_modinfo(&info, "description"))
> -                       warn("missing MODULE_DESCRIPTION() in %s\n", modn=
ame);
> +               if (!get_modinfo(&info, "description"))
> +                       error("missing MODULE_DESCRIPTION() in %s\n", mod=
name);
>         }
>
>         for (sym =3D info.symtab_start; sym < info.symtab_stop; sym++) {
>
> ---
> base-commit: 4d872d51bc9d7b899c1f61534e3dbde72613f627
> change-id: 20250311-moddesc-error-2ad949dcc6ba
>


--=20
Best Regards
Masahiro Yamada

