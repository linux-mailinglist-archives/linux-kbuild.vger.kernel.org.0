Return-Path: <linux-kbuild+bounces-6292-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E98A6CB45
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 16:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86F88189AC2C
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 15:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D1E1FA15E;
	Sat, 22 Mar 2025 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jefi2Hly"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD7C4A05;
	Sat, 22 Mar 2025 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742658392; cv=none; b=H5QaaYNFIeuHhUAn1MRMuQdWjiM0/9AVZzGPNeOzXTbd82/uqQT5PkZfXMVMZoNCcEH5JaGNiQKG006TSzJvxyYXSLv5FqF5Y0ln4C9oo+SGCILulAURbmURak4FoCJknRRr/bCZ8ysLxTsUcqc/QB+kln0c//Do6969JUeU1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742658392; c=relaxed/simple;
	bh=XXbDFIx29aMLjfpj/7JWyxtg4oa7yjJE0pcef4MAIFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFP/v+OYD7FZ8SnOMTAJkA+tqg78Ku4Ea/tihebV3bl1bS9G12IAJLwWB+6amW2Ggnefs0a+ZrsCYbiK8w614Sreysl1s1OFZrMBYY6q3mcjIh+XxSbdEB23/AdPUuoGxIrOOe0Uaa9HKR2BLIprx+KAxTSsSNrsN5cLoQ3pfD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jefi2Hly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AA0C4CEDD;
	Sat, 22 Mar 2025 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742658392;
	bh=XXbDFIx29aMLjfpj/7JWyxtg4oa7yjJE0pcef4MAIFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jefi2Hly3SGho9fmr0TTAaVFe5z4i8RNqyWyBYx+qm30ORkfK2lLEqP3Q65fM4pC2
	 hHrrLdNkbaxUj9J9ltyyDKG5eRzAtY39DejFabtFcDpScXcivboeoRhZWoQbL/Lcgl
	 BUoD0jNvE8GcjvNUvPGTM5TF3MxdE3uRorHfXk6zDRP3fJRkEqWSSAI9XQf/FoVuCJ
	 CO0lILjZK1V1nqlHLOowaWA0pX8wzaMkKWIxArUoCNOmOsjQAjrc3vBaKRB6yNaFHi
	 5m3nuzJ7h+kfKPD+noWkKCU6VVN9QXZfzG50/YG1T83C25kbvt+XqYHgY4Vsx1n6qn
	 6rRX9SM2Yp0NA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30beedb99c9so29545351fa.3;
        Sat, 22 Mar 2025 08:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnQ5IJqkhshfx1MS2taQ5Xj/NlBos4syWATwhEUfE+csvvJ2FZ+CxjecW1HUzDWVQqDvHxtTWJiOfWFtRz@vger.kernel.org, AJvYcCW25qzcbFaN/DY4mYsQNmRPxdZEN30B4y6USGrQlgYQhaIWrehg2k0muL28cdMg9+d9oiK3rb48aKYFJC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV6BZpglV17sfAmFj91mS5QkQLtDI5fCpvPPiluVvvpqiAtjwl
	f8IGtbQyC8e90YPO5URZ6KZvDGiM2ejSsoeS4LQYNng7eHI6S23xu8ro9jyX1GYgVMtWb8bU7OJ
	diOD0ckn4qGqfXsDjhcCXI3sgIio=
X-Google-Smtp-Source: AGHT+IG4OpWVkpTPVkIM5P/6i78csCRcHirWW0I4sYThZn2lb6mP6HgI/MUCcqw/j8bpulugWirtQLNT8OFaGeePHmg=
X-Received: by 2002:a05:6512:31c3:b0:549:9044:94ac with SMTP id
 2adb3069b0e04-54ad648ee45mr3060451e87.23.1742658390836; Sat, 22 Mar 2025
 08:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com> <CAK7LNASYFEFFbnqwDuJNf4ngU9uLavJuQqknOimpYeAeHyk1zQ@mail.gmail.com>
In-Reply-To: <CAK7LNASYFEFFbnqwDuJNf4ngU9uLavJuQqknOimpYeAeHyk1zQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 23 Mar 2025 00:45:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARi0gF9dr+bU8nhovBWygsghB7CD_pWUgb3KBH4C1StyQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jro2ostLXtsJURSYO2vWefMV__2XA8fEQYnTYnNEZwzeN5B1j6WacESAyA
Message-ID: <CAK7LNARi0gF9dr+bU8nhovBWygsghB7CD_pWUgb3KBH4C1StyQ@mail.gmail.com>
Subject: Re: [PATCH] script: modpost: require a MODULE_DESCRIPTION()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 9:34=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Mar 12, 2025 at 4:49=E2=80=AFAM Jeff Johnson
> <jeff.johnson@oss.qualcomm.com> wrote:
> >
> > Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> > description is missing"), a module without a MODULE_DESCRIPTION() has
> > resulted in a warning with make W=3D1. Since that time, all known
> > instances of this issue have been fixed. Therefore, now make it an
> > error if a MODULE_DESCRIPTION() is not present.
> >
> > Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> > ---
> > did my treewide cleanup for v6.11, Arnd had a few more stragglers that
> > he was going to fix. I hope that by posting, some of the 0-day bots
> > will pick it up and hopefully provide some feedback.
>
>
> I pushed this patch to a separate branch,
> so that 0day bot can compile-test it.
>
> If there is no error reported, I will move it to
> the for-next branch.

I have not got any build error report.
Moved to for-next.



--=20
Best Regards
Masahiro Yamada

