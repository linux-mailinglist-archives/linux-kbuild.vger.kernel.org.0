Return-Path: <linux-kbuild+bounces-3833-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87C98A554
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 15:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806CE283CE3
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 13:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319661922DB;
	Mon, 30 Sep 2024 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xr/sw+JN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A1191494;
	Mon, 30 Sep 2024 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703046; cv=none; b=cmVfvTrn1qvBEIvBl0F8fFLpXoJAeI+g4y3TGMQ/p7o+KdlTRuNiUudkdTLb8nWmfsJbiiMF/ORIvb9x0bKWNmnvJmIQ4iOYzzStN3GAUynF2nU1jNdees+MxQb4Tg93Emn6YgCpVkvDlQHjeyg7k3y/u8GQFlDLEulNOpMn8G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703046; c=relaxed/simple;
	bh=mHCLJZuQDvHuS2wwdMp5CACpzX0Rh9JxHm12ZYCrQlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmDLrRHM521QNeA82RBFOjawx4XoMfCPQ81zyX3sH829YP5lvZOyquQgJQL6MYjbLX2eazHcBk+Jq2V8KVP8NhRbSC1phsmvAU8MkfStvN6CRQQpLx32fxAauRw2DoNw4b3Blnb6a+9IgOd4JR8VkVxwQu4nuTeznZNGjHMSmWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xr/sw+JN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A506DC4CEC7;
	Mon, 30 Sep 2024 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727703045;
	bh=mHCLJZuQDvHuS2wwdMp5CACpzX0Rh9JxHm12ZYCrQlI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xr/sw+JNjEC67WrWc8eXWLm9psV1BcibX/Npv1PIp2qXiG5IpYZqH+Z4iJZaSE8kO
	 UQBR4ZXNnrLzwqXkEM/jSp91n6Q8F9oD84Ww67eW5i3dfoaXNGaZ+GJ7wjuRPi8IrZ
	 65+tGiTncnI2yebQImlVWLG1SG5oBfu6guIYyMxUk70YJqZJJk9Pw3vaFFeh/YRmCI
	 pK4+UW+gXVxnJfGtsKQT7f4V8Wo8HCyP9doSd3UXORnC77DdcNAc8KQZVn3z72fm1f
	 nNPaTm/oeMAgxjmc46Ov8Y1zDLbf9jQ2SQvos/bg5WLw9emYmGEzU13MHVs58oAEn+
	 9q5aXc3pPph/Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fac49b17ebso11482691fa.0;
        Mon, 30 Sep 2024 06:30:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YwS4LcZ6DdNhHzjWolcKJmikOaxeI1+sz8Cpel45pH8OIG9KqEF
	07ttuHrwgJtrsdj+R1o3rou0qNS4krpR5/Ooa6vSL+m6Ze1pOJ6VnBP4cyt3ubX27G6qHgpLOVB
	TBqvxmDtVOsXhQ9P5PqpQ3VceulE=
X-Google-Smtp-Source: AGHT+IEtkBFDQ3qUH/Bv5bPbTBZmeMcaKnEcv0KbRiz1yYwhnPcQNxACDhENh0ZMox9x5+HIiz+n3xV9R5H7OTU+m9o=
X-Received: by 2002:a05:651c:2127:b0:2fa:cdac:8723 with SMTP id
 38308e7fff4ca-2facdac8a5emr18408991fa.29.1727703044291; Mon, 30 Sep 2024
 06:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908124352.1828890-1-masahiroy@kernel.org> <20240908124352.1828890-6-masahiroy@kernel.org>
In-Reply-To: <20240908124352.1828890-6-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Sep 2024 22:30:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNASah++doJCqM=5+Y5YruZ6iUkGOhPFLtQY2VTxkOYNV1A@mail.gmail.com>
Message-ID: <CAK7LNASah++doJCqM=5+Y5YruZ6iUkGOhPFLtQY2VTxkOYNV1A@mail.gmail.com>
Subject: Re: [PATCH 6/6] kconfig: cache expression values
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 8, 2024 at 9:44=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Cache expression values to avoid recalculating them repeatedly.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


I noticed a bunch of "unmet direct dependencies" for xconfig.


I will fix as follows:




diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 78738ef412de..16f92c4a775a 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -47,6 +47,7 @@ static struct expr *expr_lookup(enum expr_type type,
void *l, void *r)
        e->type =3D type;
        e->left._initdata =3D l;
        e->right._initdata =3D r;
+       e->val_is_valid =3D false;

        hash_add(expr_hashtable, &e->node, hash);






--=20
Best Regards
Masahiro Yamada

