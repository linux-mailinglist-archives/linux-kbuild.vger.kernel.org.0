Return-Path: <linux-kbuild+bounces-6061-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B8AA5CC1D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 18:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2074A177C20
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 17:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B672627E2;
	Tue, 11 Mar 2025 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwLeDAsr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917522620D1;
	Tue, 11 Mar 2025 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741714124; cv=none; b=aKixyMGuRFlydO8Iyd0uON9tsfJv20pEN1Wbk0qU5ixUGV6ff+TaoSaVks52lEzXdltDi+OSjHkHdZoQevcWCXLlYE5R20HGnyXmDZShrW2DxfLezl3a8uCgKsRVAE9RMa8s/hGKB9Y7YsSA9QqylCz7O1P00+ih+RqSZP0Y7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741714124; c=relaxed/simple;
	bh=d8BD4WOnmIjNqhK1wComNzTCrFFiicudBQP2VVmq7Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzpDZhqqnmdxxn5IgMrNbKSNEgFOQH1whq128XKhYaZD3l+FGHJa2Rm1wbhj8maWPoT+dfUNllITQsDiPj5/yZabtPXz5Pbti4t/+3s7hLh6T4/irnukSNiM/2lTB12XiR9bx9T2INmjUGTzqxtu0F8ohCFxO5hgnojRkJf4PXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwLeDAsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1465BC4AF0B;
	Tue, 11 Mar 2025 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741714124;
	bh=d8BD4WOnmIjNqhK1wComNzTCrFFiicudBQP2VVmq7Z8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SwLeDAsrdikx6ereOClwlIDaeHpYUaVCYIdWA/gqU4jEb9otOGjjdZGvIpu9QgrFU
	 BasH3tSjPtBd6wmXUUXmgtGXJE1c2mXPzeOs5dY12INMsI/tPwBJUSi4YJKLmECtes
	 TM5UDohghrM4x2jKsArUS5J2Jh/ME+ZxorEGi8wdg/Qhbk5gvSSWtSAyI/PAUsy4Le
	 zPfJmpwJpspt5Y9mXygKFmynxFUwMwdwlu93nj0LoEg/bOD7NQ94mwt8hicFAJE+JB
	 WROxkOJm/Xr98WkIyDZQrpXSAOENYiYSOTFinIa11QBYrcNDfZOo/1nUA1Ez3Bu0mX
	 56ptjUZ6gzRiw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499614d3d2so5034557e87.3;
        Tue, 11 Mar 2025 10:28:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyYL5vswrvcs1L4DDawe1qUtvfUpA9efcU/hxYKMaxHaiEufKMygCbnGmgJx6QqX8jlKanJeSW@vger.kernel.org, AJvYcCW/VK+oEQbhrtiUpuMPFCeJYcoOLAdo7oZSFlDm+D/e1AMONu69jGYLo2QSVEFnYIqMKtVM0UhRc4Mf9hM=@vger.kernel.org, AJvYcCWI8v/xSmB6sjFYUTcVsxwzb9I5AYP9k/HRoa3l0fM3cMNrOVyUUOkio+t2vUytrGVAke/t2zDtV3EylSudtdnwZQaL@vger.kernel.org, AJvYcCWo4p6E7PDjcdg3k5QZRiMU8xB+YyTVlvo+PWcMzMh66u2SOJiRW71clnyUaptehnkQSvZYSrEZx5COplvRsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwEuDIkczTfCM4S5/BsZXWkPj5N8xDNRXQaj5KDrdoEdKdy5bm
	sSUXgNoOAP1UrrKzQZIreLdxhH3SB/SMDMMFKDzyi8Da90ffLKd/iYyOCqi9Acq3lBZhiJbMwBe
	hg46MN5X+nxqhFmuL6S5Pf4ydCfk=
X-Google-Smtp-Source: AGHT+IFsHDduF+cR7BKl2mu6ZO3HqQftxmEu5BM2vjBQCDt55EMsQyof7sw3rtliSMsgS7q7uQEOkP4A3gh75uedz9s=
X-Received: by 2002:a05:6512:6cd:b0:545:f9c:a80f with SMTP id
 2adb3069b0e04-54990e2bf27mr5120145e87.1.1741714122784; Tue, 11 Mar 2025
 10:28:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307165335.3110476-1-kris.van.hees@oracle.com>
In-Reply-To: <20250307165335.3110476-1-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Mar 2025 02:28:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQe5ZEd17v=zdP9xNMXFXa=Zjh=YUww2+_4Qerh=CdQOQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jqd8Dw99Dgh75IrGcKerpY-dzmShj5KMqxECut3Sko0l64ED8VLDnizrPM
Message-ID: <CAK7LNAQe5ZEd17v=zdP9xNMXFXa=Zjh=YUww2+_4Qerh=CdQOQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: exclude .rodata.(cst|str)* when building ranges
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>, Daniel Gomez <da.gomez@samsung.com>, stable@vger.kernel.org, 
	Jack Vogel <jack.vogel@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 1:54=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle.=
com> wrote:
>
> The .rodata.(cst|str)* sections are often resized during the final
> linking and since these sections do not cover actual symbols there is
> no need to include them in the modules.builtin.ranges data.
>
> When these sections were included in processing and resizing occurred,
> modules were reported with ranges that extended beyond their true end,
> causing subsequent symbols (in address order) to be associated with
> the wrong module.
>
> Fixes: 5f5e7344322f ("kbuild: generate offset range data for builtin modu=
les")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Jack Vogel <jack.vogel@oracle.com>
> ---

Applied to linux-kbuild. Thanks.

>  scripts/generate_builtin_ranges.awk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_built=
in_ranges.awk
> index b9ec761b3bef..d4bd5c2b998c 100755
> --- a/scripts/generate_builtin_ranges.awk
> +++ b/scripts/generate_builtin_ranges.awk
> @@ -282,6 +282,11 @@ ARGIND =3D=3D 2 && !anchor && NF =3D=3D 2 && $1 ~ /^=
0x/ && $2 !~ /^0x/ {
>  # section.
>  #
>  ARGIND =3D=3D 2 && sect && NF =3D=3D 4 && /^ [^ \*]/ && !($1 in sect_add=
end) {
> +       # There are a few sections with constant data (without symbols) t=
hat
> +       # can get resized during linking, so it is best to ignore them.
> +       if ($1 ~ /^\.rodata\.(cst|str)[0-9]/)
> +               next;
> +
>         if (!($1 in sect_base)) {
>                 sect_base[$1] =3D base;
>
> --
> 2.45.2
>


--=20
Best Regards
Masahiro Yamada

