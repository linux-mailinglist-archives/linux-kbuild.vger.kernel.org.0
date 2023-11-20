Return-Path: <linux-kbuild+bounces-82-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E77F0B56
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Nov 2023 05:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F40A01F213B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Nov 2023 04:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0F82114;
	Mon, 20 Nov 2023 04:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/2HIGaI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13E20F9
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Nov 2023 04:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94046C433CC;
	Mon, 20 Nov 2023 04:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700453934;
	bh=eJc3t+vjty0J6ATUE4Rsu1fv8yiYA2QdwTT2oLeeNpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G/2HIGaIq7151RXjukRJmEbQbVLRf20uMRs4ARHzoBejz0WoIhuw34AJGl7dDmlGQ
	 FT0Lzt+sDylZNbyTpXPvH/ipyE8oa7wyIAmNJvWA08d0hle+bUNW2lv1L8ta1gu/dz
	 VbTqckmIC1eZpHNdxPwebpe1oNTRuS6dMIN7TOs2BgnvvqClE5ffP2UNx9JSTqCRle
	 qNpp9USlyq9Xx35DMG4rngRY/V6iIB2WpwOj/f8hJklD+pOffb73KO5sijsW++Wb0G
	 qZicqxiQWpPnuCgWs2x1Sv7NeLYzPdhIb3/s3Uf3fX7/7LArr10uKbvGTWQyNSdBcx
	 Ck1KGLdk6f7Kg==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1ef36a04931so2500035fac.2;
        Sun, 19 Nov 2023 20:18:54 -0800 (PST)
X-Gm-Message-State: AOJu0YxvF/RqVfDFADUOMVRs3Z08xFsZEip+YJNvzqp+JklNCeR6jOKy
	m7hmI1r5WlzCnRP7H5DItIDNiu5vHauQQmlelhc=
X-Google-Smtp-Source: AGHT+IFjUvCUwL9dlENvgBWSAvBVxN2mi2cDv4rqkgfxU4VoW6wZ29EQ2LekMKBcBn1C8Sq7Y6MIhJJPQ/V/mcv6WHM=
X-Received: by 2002:a05:6870:f69e:b0:1e9:a3e1:c388 with SMTP id
 el30-20020a056870f69e00b001e9a3e1c388mr6972167oab.41.1700453933986; Sun, 19
 Nov 2023 20:18:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231118081334.1308242-1-masahiroy@kernel.org> <ZVp26K9b8Apuy3FD@fjasle.eu>
In-Reply-To: <ZVp26K9b8Apuy3FD@fjasle.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 Nov 2023 13:18:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATj65c0beTb5oXMDskiaFnxp1hoMOF0yG15pGv7cujNEg@mail.gmail.com>
Message-ID: <CAK7LNATj65c0beTb5oXMDskiaFnxp1hoMOF0yG15pGv7cujNEg@mail.gmail.com>
Subject: Re: [PATCH] scripts: clean up IA-64 code
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 5:58=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> On Sat, Nov 18, 2023 at 05:13:34PM +0900 Masahiro Yamada wrote:
> > A little more janitorial work after commit cf8e8658100d ("arch: Remove
> > Itanium (IA-64) architecture").
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/checkstack.pl        |  3 ---
> >  scripts/gdb/linux/tasks.py   | 15 +++------------
> >  scripts/head-object-list.txt |  1 -
> >  scripts/kconfig/mconf.c      |  2 +-
> >  scripts/kconfig/nconf.c      |  2 +-
> >  scripts/package/kernel.spec  |  6 ------
> >  scripts/package/mkdebian     |  2 +-
> >  scripts/recordmcount.pl      |  7 -------
> >  scripts/xz_wrap.sh           |  1 -
> >  9 files changed, 6 insertions(+), 33 deletions(-)
> >
>
> Thanks, looks good to me.  Might you want to also remove replace the last
> references in the kbuild files?
>
> scripts/recordmcount.c  uses cpp symbol EM_IA_64

Thanks, I will remove it too.

> Makefile                contains two comments with examples naming IA64


Which line?  I could not spot them.


> scripts/checkstack.pl   still holds credits for its (now removed) IA64 po=
rt,
>                         but that might have been left by intention


I hesitate to touch the credit. So, this is intentional.




>
> Nevertheless:
>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
>
> Kind regards,
> Nicolas



--=20
Best Regards
Masahiro Yamada

