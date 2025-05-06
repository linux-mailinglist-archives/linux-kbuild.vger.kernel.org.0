Return-Path: <linux-kbuild+bounces-6964-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39419AABCE2
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 10:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06B565A26F6
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 07:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920A822B5B5;
	Tue,  6 May 2025 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeJ922e2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6757722A1D5;
	Tue,  6 May 2025 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517668; cv=none; b=rF8xP/nLnbmbigkW4segS87YaXDF5V7m/eEhdcxefpEhetLD5R2/1OmcaSayYiAWhRNvN7++PSpIK/xPZdMTjfOLOkrD04i1EZsRoaxCF/LicpAS537dx3MzlExAXXNjvRpMsjycQcQyPWRq5DCpluEhUyzL0O0/X8Gmsh/f4jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517668; c=relaxed/simple;
	bh=byVt9xfRc8s+dXIAdeg+0V4A2ekYEgOY1v3KclMOezI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1/lVnUU7AYPMhqVCKPY9ZWzBtgQ1/t+MtK9tguimVHr1s6PBO0fjs1RdjxMWlcnVW/Qhtoa56D2psk8HBzyDHO7q3/0wPbHrnKixWyTGoWtjr6yYQ0FPJbOUuDv2GOle9UB1XMICMdR2sg14rkIKYhs5N6JbSPWpVcsZcDab38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeJ922e2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9691C4CEE4;
	Tue,  6 May 2025 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746517667;
	bh=byVt9xfRc8s+dXIAdeg+0V4A2ekYEgOY1v3KclMOezI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XeJ922e2sX0yCALZ/jclHMv816QkOvg0sqrO58916MPWoUhnBTUN4vPqOqgbvZdar
	 MSqyV3yyGDK2voEtP0wV3k6elKTw08nndff8pa1iXyn/gCZD5mt4/oN/FmaWhiAtgO
	 WnZeGQFLIPI7WlNmQ5yyOjekHbQMcbYhHKffXGAe5xhpGMoaowwmjTjQCckOvxugy/
	 0H7eU6FgcPKc384N2j9Lpc6g/D0SysOkVzBdQbPyAP43Tiqp5TJADWa/y9vQ5F7OkK
	 UO7qAA+YB7BwHfVkYNu3wpYUKtS5aKCZRAG8BUtxsNmwypZqLJ7V2FDNIusY6XmcrX
	 uLd139p2UH0ng==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso6724144e87.1;
        Tue, 06 May 2025 00:47:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzAuv5To1Xr9bbS02rNr/XqvvMKcQ6+tneiQysMuhy0YPSgtP/BWefm1xeogKcATOKn/7bCdpRVEFR6gp4@vger.kernel.org, AJvYcCXzhgYgiiU/k9nlMChChtZXMWkxg/IyhdoVUnUMsE+2p/1ftei6Z3yU0/WBW0aamxcfOl6Ke1hn/fwtHsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7QL/dIkiG6A4q+kktDb87NVVlpyPyLINzjjs+FP6L49L+th1P
	mAJMNKSCbelXfkFgSft4rs0Hrpq94q2zxkhjsMgqQgEcMFndZKoTH00oW52daRV0cEN1Z6iEzlo
	6E+miMNV3negtkv2zwNPxWVbdV4U=
X-Google-Smtp-Source: AGHT+IGsRriShthUIHUN0lZ1T7kKyMxf6GCaVXjohavEUJNT1M/4Ab5QDBIhpkV7zgomAtQ+iSB2d8myFm8aaeN3Nog=
X-Received: by 2002:a05:6512:689:b0:54c:348d:19b7 with SMTP id
 2adb3069b0e04-54fb4a9788bmr547286e87.46.1746517666599; Tue, 06 May 2025
 00:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com> <D62AECCF56C6EEFC+20250422105402.145635-2-wangyuli@uniontech.com>
In-Reply-To: <D62AECCF56C6EEFC+20250422105402.145635-2-wangyuli@uniontech.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 May 2025 16:47:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQg=WwPXL2BQfTMw_a5ZhtnKRugufgo1_TiCKe514t9uQ@mail.gmail.com>
X-Gm-Features: ATxdqUFRI6PDaZqJ3eM7XHeSrY6wVRjuWtwU7AsOOd3WH0ybiypwb9yA_j-cdmM
Message-ID: <CAK7LNAQg=WwPXL2BQfTMw_a5ZhtnKRugufgo1_TiCKe514t9uQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rpm-pkg: Add (elfutils-devel or
 libdw-devel) to BuildRequires
To: WangYuli <wangyuli@uniontech.com>
Cc: guanwentao@uniontech.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	niecheng1@uniontech.com, petr.pavlu@suse.com, samitolvanen@google.com, 
	zhanjun@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 7:55=E2=80=AFPM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> The dwarf.h header, which is included by
> scripts/gendwarfksyms/gendwarfksyms.h, resides within elfutils-devel
> or libdw-devel package.
>
> This portion of the code is compiled under the condition that
> CONFIG_GENDWARFKSYMS is enabled.
>
> Consequently, add (elfutils-devel or libdw-devel) to BuildRequires to
> prevent unforeseen compilation failures.
>
> Fix follow possible error:
>   In file included from scripts/gendwarfksyms/cache.c:6:
>   scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file=
 not found
>       6 | #include <dwarf.h>
>         |          ^~~~~~~~~
>
> Link: https://lore.kernel.org/all/3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@su=
se.com/
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---

Applied to linux-kbuild.
Thanks.





--=20
Best Regards
Masahiro Yamada

