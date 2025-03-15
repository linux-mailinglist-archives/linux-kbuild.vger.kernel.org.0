Return-Path: <linux-kbuild+bounces-6160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFBCA62ACA
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 11:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0428317BABC
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 10:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CEF1A0B15;
	Sat, 15 Mar 2025 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spwd3FeY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E04A29
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742033785; cv=none; b=ObRHUxwdoj9VU99wykqDK0AE+jO6TQUaLSHiPSem5y3Ez3S8Zo56j4rXeDDMhplx3fAeWm+ncXbB+OXo+b1CM4t7xFGXAiFGVIXhmw1o835l5fMXKV1JtqRN4Oa/MerSrg4c8Pauz4SUXUjoceZ8RFnK+TT01rzVjEgpbGjMb2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742033785; c=relaxed/simple;
	bh=3p1zDiW6KHFze+OyLtk2jkwXHgxqqqBOaU1eJhCGyYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slTXd1a/9MHuGjZjgK0woplywEM2JFjAheUTtfWGO46EuNgvXYDQ4Cqt2TM3BdDTy51x8D/DI4NLBus1le1Zd/kxsw627UBYEXaI8jhvEYiE3EiuHahIaja+hKlzdkOna9P0DS4PgQl5D62bp5HULKgYDmA5jANYLK6/FEdzfSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spwd3FeY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16943C4CEE5
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742033785;
	bh=3p1zDiW6KHFze+OyLtk2jkwXHgxqqqBOaU1eJhCGyYI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=spwd3FeY0k4xB+aZRQjOKbG2HMAf1xv1cAV7W0YtuIRqV7nDrw5Hp2soKRyNcaaVt
	 wcpW9c8PZsBRJPY+1DOiBxWmgHWCjRWJ9ap3c8BHrhTcSR02cQdfx5APBfoBlnQPIz
	 xG/kAdZmiJINbNFK7ND5Tz/4Ff33fcgmqdU0KamG7MG4VR8/eHXMAT5u/wybG61WCE
	 qwZc4opY+BaQPXi6MOFbAfaAIiGu31kH+3im4dyOIyA65MyhQwdxVW4Y7WZqcyspM4
	 QYqg4xO+GC5+PKZC4pZabxA2zUvRoEPYb0jgaAtlZmNNAaE/tuL424ePfS67tBylg/
	 cG7YF6SIZwYBg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so3001806e87.2
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 03:16:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVi36N8vdkX3R/Xpdnfo2861tnGbBvpvGpvWdeSDilTag+fO9wFCwkjVj6flwe89yOt6guQrAG/p/B7lCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwncsRppIpSB2qFhyuX64RRp3arpGg3GmKSozWZRxpN+QBRGHcO
	TykTdwzZSgku4FO8w/NzbjvFcxPNwzZK3FNFzHssoJWwyXZv/95KaUyHLJ58Ph3bJdCmnFnZ4ho
	gjE8irNO5C8D+afBou5s9cdck3no=
X-Google-Smtp-Source: AGHT+IEu3S2Mtxjxcibm98Iml9DVuTG4bdAGzwpSmvDCmQ27tYrRlJ22n3qHFNHj9wH5rG5yjBIf647ClePD4bBSQwU=
X-Received: by 2002:a05:6512:3f27:b0:548:de7f:b3be with SMTP id
 2adb3069b0e04-549c39119afmr1794010e87.21.1742033783708; Sat, 15 Mar 2025
 03:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z9IsEPOnC+MGSAEA@rli9-mobl> <CAK7LNAQpbQCzKha63SnJG2TpyXCFB4Vu8Q9xua9G8ht=Fbk_kA@mail.gmail.com>
 <CANiq72md8yWAHdZeJFWAQFxb_9ftTFMiQciK+ZGf+3Lp_Jxa8g@mail.gmail.com>
In-Reply-To: <CANiq72md8yWAHdZeJFWAQFxb_9ftTFMiQciK+ZGf+3Lp_Jxa8g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Mar 2025 19:15:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASrBdCRVoELc-C0JGgdNJsi5WArsqTkaYEm1CgTsjTC9g@mail.gmail.com>
X-Gm-Features: AQ5f1JosDYCDMfr73PZ87Bxwlk2526x2znZACH8UywylidWSL1Gf62FgtqsiGZA
Message-ID: <CAK7LNASrBdCRVoELc-C0JGgdNJsi5WArsqTkaYEm1CgTsjTC9g@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 15/20] error: Unrecognized option: 'remap-path-prefix'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 5:39=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Mar 15, 2025 at 8:45=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > Do you see this?
> >
> > I tried to reproduce it on commit
> > 6b5747d07138f8109b1a150830f1d138de146ac2,
> > but I did not observe the reported error.
>
> This is probably:
>
>     https://lore.kernel.org/rust-for-linux/CANiq72ntZj10H1DBqRyX=3DuLertM=
w59e=3DPM7ESVJ0zWfu_ECnnA@mail.gmail.com/
>     https://lore.kernel.org/rust-for-linux/20250314213333.2230670-1-ojeda=
@kernel.org/

This patch addresses an issue of "make rustdoc", correct?


> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250313/202503130111.NH87la6s-lkp@intel.com/reproduce)

The 0day bot provides the reproducer, which only executes
"make olddefconfig" && "make prepare".



--=20
Best Regards
Masahiro Yamada

