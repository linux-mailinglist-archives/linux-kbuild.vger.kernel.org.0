Return-Path: <linux-kbuild+bounces-463-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FD9823E00
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jan 2024 09:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70A751C21564
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jan 2024 08:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E241EA8F;
	Thu,  4 Jan 2024 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dizP+XxL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBD81E539
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jan 2024 08:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCE9C433CB
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jan 2024 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704358687;
	bh=IQGWRa6u6y1rSegPJBJ+iiFyNLIzJT6e1CNOGlG/rqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dizP+XxLAnK+s3VY0cCeYJergxHsRV/AePMJv0UPwt9nYVWkE8IW9Yyttal1OJY1V
	 YRUNIcnlPHIMVD9KwGt2ZYoDOICdUioTCr3CySBGXtTjLhCCv5H7BmKW0WfGdXO4C/
	 X9vHidSfSb9MIgI1+7l7SmsjdvUbxu8OJVeRylYRb5mUbAAOlZYRPokGNuWvOJOpb/
	 eFNiD2DUlL4ldqLgxBFptEiRiMM9vezhZ3q3YY4v+oBYYaweyRyqMAQzUh/GYjEpff
	 ljzbylV/XjqzyOecgDeyERi3AAaxDBGcCC87qytgMWHNnsfD9+CcmgJUphw0zbQiMo
	 LrxSyxGkeKQIQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a28ec136715so16022966b.1
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jan 2024 00:58:06 -0800 (PST)
X-Gm-Message-State: AOJu0Yz7gpFLXjrRt140AK5alWvwyAwYJTuGZPxlN16rAnSNP2qm+DWK
	3zMHtBJrGb7IJizsuVlmn+Qs7Uu8A5hQbPm97x4=
X-Google-Smtp-Source: AGHT+IGIh4Ht1+D3Aya7WNi1Fhs391Y6rvGrQyriU9TK3JFTz52n50cnj7mYo1uM1Q9mnW2pRyWqujFtfThIuCTRmN8=
X-Received: by 2002:a17:906:b752:b0:a26:f2d9:d2b8 with SMTP id
 fx18-20020a170906b75200b00a26f2d9d2b8mr155563ejb.79.1704358685514; Thu, 04
 Jan 2024 00:58:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231227070317.1936234-1-kernel@xen0n.name> <fbefe6e45e23a09e5b63eaac0a07a2fbae4a3845.camel@xry111.site>
In-Reply-To: <fbefe6e45e23a09e5b63eaac0a07a2fbae4a3845.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 4 Jan 2024 16:57:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H44EZpOpnWyZm14QdwTLAPcxM1eNhpoDEsFQbf8=s7-iA@mail.gmail.com>
Message-ID: <CAAhV-H44EZpOpnWyZm14QdwTLAPcxM1eNhpoDEsFQbf8=s7-iA@mail.gmail.com>
Subject: Re: [PATCH] modpost: Ignore relaxation and alignment marker relocs on LoongArch
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, linux-kbuild@vger.kernel.org, 
	WANG Xuerui <git@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Youling Tang <tangyouling@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2023 at 7:06=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Wed, 2023-12-27 at 15:03 +0800, WANG Xuerui wrote:
> > And even though the kernel is built with relaxation disabled, so
> > far a small number of R_LARCH_RELAX marker relocs are still emitted as
> > part of la.* pseudo instructions in assembly.
>
> I'd consider it a toolchain bug...  Is there a reproducer?
Any updates? Should I apply this patch for loongarch-next?

Huacai

>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
>

