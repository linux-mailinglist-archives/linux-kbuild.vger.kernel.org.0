Return-Path: <linux-kbuild+bounces-4535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE009BFD76
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 05:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CB26B2182D
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 04:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F3418C34B;
	Thu,  7 Nov 2024 04:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="LfCWsxJa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9BD1422AB;
	Thu,  7 Nov 2024 04:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730955563; cv=none; b=FhcZg7O2ypLLUKhWdArgkXiX5fFhPkqrO8uLFI7VFKkMNgc3vRShqsNbM/JaCAr8Y3OCoVgdrlH6nzx5zDhwh8a1/5at8dNS7ovL9JfdK7tEghYQ7DceHXK6mjq45ydQcnO7hdsKeGrQ0WP0+eNAdGYotwnF+tD0rOJFYsyau4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730955563; c=relaxed/simple;
	bh=G7Gxwsmv0+3x5lOyM08ljVWb/XbhyZ2QrdlGiuqIGGQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYH+lFevKpZAjpIplAt7RbyNj3P37rUi948uwTjiWxPRRbM07hmBBL5zIiv1vOi6K/rm/k2RTina1OpGPZw7dVqJBsxgmYaeqbCx6YR9wFgiCLh2YWMXMwPzw/i0fv39OVs1qiEFwA/+WThrw45C7/PmlYOM6q5hOqysuPH/a4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=LfCWsxJa; arc=none smtp.client-ip=185.70.40.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730955559; x=1731214759;
	bh=G7Gxwsmv0+3x5lOyM08ljVWb/XbhyZ2QrdlGiuqIGGQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=LfCWsxJaELfUNy4MWW7my9jM6f9EGW5SzXgj4lvlgrHZbENCgfTkxOIyqATjVaRdT
	 GKGl6h4HcgB1OKQBkiQQbzQFojSmdQik+S7MwUKkkcEsbDcxp2qS0JuyWvb9s2RFBk
	 GY1/3KUCwYG21nEW/ilWyrZY751vxxbxex4nE5afMhAaDb9jHQ/s/3Dc+s18i5oPec
	 kfAv/yw30LGy7nR6gc4+/PUXnGJ/mEC7TYIM0enEvFUEi8oq7g1dBX0JWvEGYRhZ5l
	 hyOpg50ZBFl1EyPhjOW+zGxOSMSivkH/epFHDT5RWGpMmvUbM4c0pw6cwqDZ5hPPPu
	 go1q3MOq1VpLA==
Date: Thu, 07 Nov 2024 04:59:14 +0000
To: Nathan Chancellor <nathan@kernel.org>
From: Koakuma <koachan@protonmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] sparc/build: Put usage of -fcall-used* flags behind cc-option
Message-ID: <rYw6ZTCE58uNrfyK1pJXSaAnn3kXRYBiLf-TYQI8tnJSU3ECWG01RkUahjZC_rkJomCiROTUUvg6Jf1u5VfyBfIalrSF2jHtGqI94MGK8zg=@protonmail.com>
In-Reply-To: <20241029222421.GA2632697@thelio-3990X>
References: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com> <20241029-sparc-cflags-v3-1-b28745a6bd71@protonmail.com> <20241029222421.GA2632697@thelio-3990X>
Feedback-ID: 6608610:user:proton
X-Pm-Message-ID: 0a66f026db29138ca89fc00dcc0965591dc038fd
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Nathan Chancellor <nathan@kernel.org> wrote:
>=20
> Clang builds now succeed with this series and builds with GCC 14.2.0
> continue to pass and boot successfully.
>=20
> Reviewed-by: Nathan Chancellor nathan@kernel.org
>=20
> Tested-by: Nathan Chancellor nathan@kernel.org
>=20
> One comment below, please carry these tags forward if there are future
> revisions without substantial technical changes.

Forgive me for still being unfamiliar with the term, but does this mean tha=
t
when I send a v4 I should paste the Reviewed-by and Tested-by lines into th=
e
commit message of the patch?

> > -KBUILD_CFLAGS +=3D -m32 -mcpu=3Dv8 -pipe -mno-fpu -fcall-used-g5 -fcal=
l-used-g7
> > +KBUILD_CFLAGS +=3D -m32 -mcpu=3Dv8 -pipe -mno-fpu $(call cc-option,-fc=
all-used-g5) $(call cc-option,-fcall-used-g7)
>=20
>=20
> Small nit, this (and the one in the vdso) could probably be one
> cc-option call? Is it likely that one flag would be implemented in the
> compiler without the other?
>=20
> $(call cc-option,-fcall-used-g5 -fcall-used-g7)

Ah, didn't know it's possible to do that, the other uses of it I see seem
to use one flag per call. I'll test and send a new revision, thanks.

