Return-Path: <linux-kbuild+bounces-5567-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00083A22708
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 00:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 187513A4083
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jan 2025 23:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3CC1D88DB;
	Wed, 29 Jan 2025 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCjlRBbR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E601A2398;
	Wed, 29 Jan 2025 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738194818; cv=none; b=TfQ0TIF3FUL2qcL5tINRuap4welKecY8nQuzRgfd8CGkqY9/tsK8uYBXtClraOdtsv1yHw69H/CXRhu48CMBhk/BaxjmQe2gA2/MENzIR1vlg44k+s6YRRQ4hFe6RIeaU96LZ7cvzQ/8s26lgtzvfGF5KZ+zSgFHkcvBp59x6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738194818; c=relaxed/simple;
	bh=W3PelArJwq1fwjy5hDtUm5rIO2zw2EZOKtjB8JR0kpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNJR2OLW06P2SoSsAv04I/6LeTFc0UruiRYuQZNQpojuA72SnDkm6ZvTejNpWgHiIFIBhGD3JRggkTgKsYoNVYikiwS8bAD+n12im6koJrgYaYwwyr++pLmRY/gRzD0p+qAIvUt7xg3mKxJaa3YBx2JMVex+8esTX6Xz13K+fTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCjlRBbR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617A2C4CEDF;
	Wed, 29 Jan 2025 23:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738194817;
	bh=W3PelArJwq1fwjy5hDtUm5rIO2zw2EZOKtjB8JR0kpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eCjlRBbRNFq96gsvYzWoVlB8syzuqg8pt0aUWrsOaA54b4Xtzi2gCgfsfrAt3l4F9
	 ma3ImZkPvGZ/O3n+PIpYzBIS5gVM8i3f1x0NFBBRuLhqzJdcqEriCHZ7i77Div2r58
	 3d8n7NdQX6WsLUn/EfC/3A6984zAet0iIYMrivXz2eXkgmvDvPJ1W415z/E3TywZWO
	 alSBgkBk3QryKS7LOULHbSFfzLQfxHvK0qQigAD22ez+wPW+aO6Zq3KW4/n74GENLj
	 wVVkRxdyicsj/1cARcleZHiNQ3pCXE+dCdrnY+4/g0Eh2qBRaz5QnjCQhnooeyhqhK
	 /l969YuCuOJuA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso298311a12.1;
        Wed, 29 Jan 2025 15:53:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVK9SJNR80d43+qLTfswD8eVGJpsBagygM0SG9z8dtZveb01WD6E4U80H26tp0+AkH3Un4OOckM2zKhp+2w@vger.kernel.org, AJvYcCVrpWylV/rDMd3igSUxWL+OU7mXp7DLM1O24LMs0ByB9AZC7vuySQT7l1Y0gPLUYemOgcCQJ6vdKksmmuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaIG5qWvau4GOjwfYnwRSTsnjTldcigE7DgHv3K2iKoMQBUark
	9v8uxJ15UvH7Cr2AwFKlv+Ycwc3aoAYYAnYT86mb+FplJS3JD9t8M9V9TRhZz/GFfUnQhkXdIgx
	2uLOOMUV8Bbi+GSTlLlj+6FoRQ5U=
X-Google-Smtp-Source: AGHT+IF8sUXurQ+pZxlLY0wRuMVnLPTDljcE9nfm8HYJGANobLvH4QKtgwzK3u/2X4lCO2DT08QK+CXpDDLa0i8iTvE=
X-Received: by 2002:a05:6402:34c2:b0:5d9:f0d8:22d5 with SMTP id
 4fb4d7f45d1cf-5dc6f606260mr1046098a12.13.1738194816283; Wed, 29 Jan 2025
 15:53:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com> <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
In-Reply-To: <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 30 Jan 2025 08:52:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrCVWSHobzF+FXKuD=fERBG7gmA7MfkRnnuDg55sTY2w@mail.gmail.com>
X-Gm-Features: AWEUYZmSQjKW1lanlKGWxaJ9x16sU2tAtAIHzhvuOM0bwunSKJghx-Ry-EiJGx0
Message-ID: <CAK7LNARrCVWSHobzF+FXKuD=fERBG7gmA7MfkRnnuDg55sTY2w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add missing $(objtree) prefix to powerpc
 crtsavres.o artifact
To: Kienan Stewart <kstewart@efficios.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Nicolas Schier <nicolas@fjasle.org>, 
	Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 12:53=E2=80=AFAM Kienan Stewart <kstewart@efficios.=
com> wrote:
>
> Hi,
>
> I missed a few CCs, looping them in now. Apologies for the extra noise.
>
> thanks,
> kienan
>
> On 1/27/25 1:47 PM, Kienan Stewart wrote:
> > In the upstream commit 214c0eea43b2ea66bcd6467ea57e47ce8874191b
> > ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
> > artifacts required for building out-of-tree kernel modules had
> > $(objtree) prepended to them to prepare for building in other
> > directories.
> >
> > When building external modules for powerpc,
> > arch/powerpc/lib/crtsavres.o is required for certain
> > configurations. This artifact is missing the prepended $(objtree).
> >
> > External modules may work around this omission for v6.13 by setting MO=
=3D$KDIR.
> >
> > Signed-off-by: Kienan Stewart <kstewart@efficios.com>

Good catch, this actually got broken by 13b25489b6f8.



Fixes: 13b25489b6f8 ("kbuild: change working directory to external
module directory with M=3D")
Acked-by: Masahiro Yamada <masahiroy@kernel.org>





> > ---
> >   arch/powerpc/Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index f3804103c56ccfdb16289468397ccaea71bf721e..9933b98df69d7f7b9aaf33d=
36155cc61ab4460c7 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -58,7 +58,7 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
> >   # There is a corresponding test in arch/powerpc/lib/Makefile
> >   KBUILD_LDFLAGS_MODULE +=3D --save-restore-funcs
> >   else
> > -KBUILD_LDFLAGS_MODULE +=3D arch/powerpc/lib/crtsavres.o
> > +KBUILD_LDFLAGS_MODULE +=3D $(objtree)/arch/powerpc/lib/crtsavres.o
> >   endif
> >
> >   ifdef CONFIG_CPU_LITTLE_ENDIAN
> >
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250127-buildfix-extmod-powerpc-a744e1331f83
> >
> > Best regards,
>
>


--=20
Best Regards
Masahiro Yamada

