Return-Path: <linux-kbuild+bounces-8418-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22829B23D0D
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 02:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F2812A5491
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 00:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2BB1519A0;
	Wed, 13 Aug 2025 00:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OA1DajgA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E0E8635C;
	Wed, 13 Aug 2025 00:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045011; cv=none; b=rCSmVAss/v85zpKaAgXd4/604EQpXHzsz3B8Yxyky3iZ+10LHTdfBXd3wYcJcbhHd4QERqjI7PjmqCLyoKzPHjpxdrQgDRb6FS/nHV2eVOeiwjtZJlJFpJNTPgD+pkGDVdGd798FRVWxBiHW5c6VvhoMVN7TDH0PudwEY1DwKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045011; c=relaxed/simple;
	bh=6qZcuQboKYro3Tc9zdYnRWOVNjdhc9q+McZ+m/rj2dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGZmwNpDLpSZUh0V5HwOdGDrZUzquC42WKVu26ebAst/n51drjx3QORqfYK6xuCZz85IJZNB6TxZi79vix8pGWsJJQh+3wrGGo7K/cmN30GW5NsrRAKetTEhMMTPhCEsKIHami6blSvg5KsArJfMjTI0of63XlKGC250mTapKxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OA1DajgA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A62C4CEF1;
	Wed, 13 Aug 2025 00:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755045009;
	bh=6qZcuQboKYro3Tc9zdYnRWOVNjdhc9q+McZ+m/rj2dQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OA1DajgAfUDiuzBqg1m0ukndhriV7AsyXTSoaQGj3XlaM1wUFIp+ozT61jzXDtxxq
	 eXOb83nFGLc7CCDXdQJfZPoD+pRetUl0qJ/O0rv0Dwpsl5722pyNsJBNAc1YHtmRe3
	 0ThaQ7RpEqNhVg3wXVPRl/IfMuowd22W11d3E/BKa+Qq0i5XmG1k0X37Grzak6kNda
	 NUw9h2Q/noxnAARkJ0zilBCCr6e1wjavyzfy1TuWMwidFxE9JcS79HjRtOQuoAQrSW
	 PulsN3F1Qn6byy0LdrBcytAp2SdPiaAPZGV+u/kZ6YnHpMth9YHu4E79vrtbLr/PeP
	 vLR4m9wzHSBxw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55b8736b1d6so6021783e87.1;
        Tue, 12 Aug 2025 17:30:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1Ea8OcvDBN3WbImxGwyUQKu8xP3FltqRu6eYAPga58eb/ZXVjVMUKiJifRQzVq1o+N5q7abJIYBWjZwk=@vger.kernel.org, AJvYcCV5p7Ug/GVe0o8A4O4Bwoy1wSTwhV+FNtS4qxVu6Oo/nafENbnKgP/BhIG8iJIMfYZyWWB5k0/2nzzRYfxc@vger.kernel.org
X-Gm-Message-State: AOJu0YwSZHySw9h2Ba+aQvCXAsPgWTg4JTR2pizIa03ojN0FGLFYoMrh
	1gGe8xfQV8I1FmLrHmWQQuhunxzgpSlqE6VDtg42LYk+fsdf9t94Bl4I+XT1NACHWQAjMHvnBkz
	WLg3TT2hccmbv2nTr3Htp+yYijTVNLmg=
X-Google-Smtp-Source: AGHT+IHNXJqLlJpd/vYuxNg1oxotvn19NuEek+/jueUwuYjS/urMu6BnMBWNuVxylHGdfquEZLVuM+kwC4gMxfGKY8w=
X-Received: by 2002:a05:6512:68d:b0:553:2f47:ed21 with SMTP id
 2adb3069b0e04-55ce03c8a40mr358154e87.41.1755045008623; Tue, 12 Aug 2025
 17:30:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de> <20250812-kbuild-hdrtest-fixes-v1-2-7ad2af66cd58@linutronix.de>
In-Reply-To: <20250812-kbuild-hdrtest-fixes-v1-2-7ad2af66cd58@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 13 Aug 2025 09:29:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARdhx+L6VeN2Q-gykcoWMY0MtoiNyhpY+Q9v_3tYA6o-w@mail.gmail.com>
X-Gm-Features: Ac12FXwwwIvSn2rVlgccTsqB5jDxwZMBYln6NxgLuBkSbc1z22-rAuyPN6muD98
Message-ID: <CAK7LNARdhx+L6VeN2Q-gykcoWMY0MtoiNyhpY+Q9v_3tYA6o-w@mail.gmail.com>
Subject: Re: [PATCH 2/6] kbuild: uapi: only update hdrtest output on success
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 2:33=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> If a header test fails, the output should not be updated.
> Otherwise the next make invocation will not rerun the test.
>
> Also headers_check.pl should only run if the syntax check invocation
> before succeeded.
>
> Add explicit sequencening.

Did you test this?

See scripts/Kbuild.include line 153

The macro 'cmd' has "set -e".

Any single error in a series of commands
bails out.



>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  usr/include/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index c7f164952b33acf6c7b8eb7ce91cd192bfc39ad2..6868d183f36d532cd3d4023b9=
36c67b8a58a9ba5 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -81,8 +81,8 @@ always-y :=3D $(patsubst $(obj)/%.h,%.hdrtest, $(shell =
find $(obj) -name '*.h' 2>/
>  quiet_cmd_hdrtest =3D HDRTEST $<
>        cmd_hdrtest =3D \
>                 $(CC) $(c_flags) -fsyntax-only -x c /dev/null \
> -                       $(if $(filter-out $(no-header-test), $*.h), -incl=
ude $< -include $<); \
> -               $(PERL) $(src)/headers_check.pl $(obj) $<; \
> +                       $(if $(filter-out $(no-header-test), $*.h), -incl=
ude $< -include $<) && \
> +               $(PERL) $(src)/headers_check.pl $(obj) $< && \
>                 touch $@
>
>  $(obj)/%.hdrtest: $(obj)/%.h $(src)/headers_check.pl FORCE
>
> --
> 2.50.1
>
>


--=20
Best Regards
Masahiro Yamada

