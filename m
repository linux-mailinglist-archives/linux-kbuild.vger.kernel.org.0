Return-Path: <linux-kbuild+bounces-7139-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C18FABA8A6
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 09:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D1B4C2693
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 07:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2186199939;
	Sat, 17 May 2025 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwfD6+g9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61E153BED;
	Sat, 17 May 2025 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747466432; cv=none; b=T83L1jKPb2lLAOhp5ppavYiF4IYZ3soyAVgQjB9blky0lyvJ8jqTJAtS3UR8wFZarhIedV9vP/YV2oNG8M8rSTHgo7745tav+JFEisn0i+nhpdNW3X867bJiOk1eEzWEjDV8NRmVheNv1/zHNldc9+nQACyh3wgci1c1BDStvHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747466432; c=relaxed/simple;
	bh=W2PLcg1vGRpvi2GOomUcZRlFzKv+qEoKyoFKhF+ZFok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnhCb+WEdxIm2oSClJJyOWAiHLEy2qLtr2iyhWEnCQ72dzQr43Xo3oufmhal79hABM2jivPc3XhZGtWKyfzXwqD+RxbbGyDcPGQD83MF7vmMCV4G1lOJEHJFTqiLWqz1cSBLSj/Hoq7EkkElwiK41iqo4WtXpEwrow6FEDIfk8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwfD6+g9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D45C4CEE3;
	Sat, 17 May 2025 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747466432;
	bh=W2PLcg1vGRpvi2GOomUcZRlFzKv+qEoKyoFKhF+ZFok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YwfD6+g9e67wnCirDXb8SajIeVy7HhMdPl8zqFBfmKD9hiqeTgaJtpvu/QR7jw+x3
	 F+J2EeoZvZCJpJghKvkSTpIYLkmKD5CWzn5b2le6hLVsgslKQm6/I1jRbQAMX1jz1Q
	 LjJsoo67F3ZQ6aj9LQjBBPBlM8EJ6/SKLj7ILGTw7VVtzbmOghObvH6kte/UcmigLk
	 H7o2gvoEE9aaG1CBAlVkjbp9KyC4UAV2nn5KAHPKEztvPUwrBVW2ch9DQqHbYxzJ5r
	 J3f551mBnl8DAAU8KjvbODDsFChHBs0nY4qdHsSiXWT9lnzed/fxvL3pvOsis593Hr
	 u9T+2XwSogurg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3106217268dso24466031fa.1;
        Sat, 17 May 2025 00:20:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjDhAsuVEriANMZY5AJ/grFZunXYvbiiJILn5q4bOmzEHe69VwyWfv+6Vw3qKdCMgvhnM0KMdZQ8QYCM+o@vger.kernel.org, AJvYcCUuVazN74swCmUPOO6A7QQRjDolIaLBbXRWzwYzcamvH78brW9tPZpRVdcsLUmU1LTTaLFzge30Vr/2BB7xwg==@vger.kernel.org, AJvYcCXdoARzIxASAydv3aGXUz0tqF3Jc/h7Wg1IL4L76OTsDmAykk6z4ZLiEc+G6mi3ZVcw9IRmt13dHAAI/MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+clfqAKhPX4Ymwgam4zCtpYgrpzth3nKNYjhwkZvHOx63aVpA
	Mdpa6PXy1zuSh4sLsEsIonOmF5skW/EuC7Y2CR1NBfPst/IKuDAcyvINhEs9e1V5SnOqX2gqB+b
	uzk2sjNFBZL2P4x2RB7sG0Iy3Xfz/Wv0=
X-Google-Smtp-Source: AGHT+IFUuWdsTraDJELf71df9j5xvyn42k4I7CItPQ+o52QXSlM7G4xMSf8ylM/oDG948LIVulXfSlIZeUQ7qb8q8F8=
X-Received: by 2002:a2e:b8ce:0:b0:30d:e104:9ad4 with SMTP id
 38308e7fff4ca-328077cd2b8mr19250451fa.41.1747466430716; Sat, 17 May 2025
 00:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502141204.500293812@infradead.org> <20250502141844.046738270@infradead.org>
In-Reply-To: <20250502141844.046738270@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 17 May 2025 16:19:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARNbu7vxwW5YvpnUxTAcdFfvakDbeTarp06+e3q1uJWxg@mail.gmail.com>
X-Gm-Features: AX0GCFvLeacID33z4VSOZfE9B-F6uSgHxOLgp3OBCGzPghxQxdSNjG8bMCmPDwY
Message-ID: <CAK7LNARNbu7vxwW5YvpnUxTAcdFfvakDbeTarp06+e3q1uJWxg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] module: Add module specific symbol namespace support
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:26=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Designate the "module:${modname}" symbol namespace to mean: 'only
> export to the named module'.
>
> Notably, explicit imports of anything in the "module:" space is
> forbidden.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---


>  static void check_exports(struct module *mod)
>  {
>         struct symbol *s, *exp;
> @@ -1709,7 +1717,8 @@ static void check_exports(struct module
>
>                 basename =3D get_basename(mod->name);
>
> -               if (!contains_namespace(&mod->imported_namespaces, exp->n=
amespace)) {
> +               if (!verify_module_namespace(exp->namespace, basename) &&
> +                   !contains_namespace(&mod->imported_namespaces, exp->n=
amespace)) {
>                         modpost_log(!allow_missing_ns_imports,
>                                     "module %s uses symbol %s from namesp=
ace %s, but does not import it.\n",
>                                     basename, exp->name, exp->namespace);
>
>


I believe this code is wrong because "make nsdeps" would
incorrectly add MOULDE_IMPORT_NS().


When MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=3Dy,
EXPORT_SYMBOL_NS(foo, "module:bar") can be used by
any module or not.
That is not what we have decided yet.

At least, MODULE_IMPORT_NS("module:bar");
does not solve the issue at all.







--
Best Regards
Masahiro Yamada

