Return-Path: <linux-kbuild+bounces-3028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73544953B83
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 22:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F12A71F21694
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 20:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757AF149DFC;
	Thu, 15 Aug 2024 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vBWTX8bf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29123F9FB
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754036; cv=none; b=siLfe4H9bWxFYGM9gA73fz3EUOiElRdEB+11dsXEuNDV1C5Xslc9yXLufE5ov8O3FOAhuGsic3cOhwHlTGGD4n2H+h2jfLqmYp9Y4LDcB4MbWNqqHFJLgag1SCTjL7Snx2hKd2dsdjqkneWMoKiwkCUA7rEhL/BJDsibwc8PSjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754036; c=relaxed/simple;
	bh=SR+HJls7rN8EZRV4DdYxnxKWzOEinOl5EQrLPe0+yRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxEOWsHkIz+0Kvr5uSVPPlgDXfyIf9Qi8qgXN6NpzLfI1KCP5jIltfR8isuxCtkqgFgqRupapznFOWbn+Koa8m/cUf6YOSqYp/Ev3hKTmVISGKg2CySndJa9YB40NgKG8uPur8I61VyqBJjItutBrdtVajm7Mysdes2VIViUbqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vBWTX8bf; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4928b5531caso471471137.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 13:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723754034; x=1724358834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUB5DtqEXasUqeTn5ggBGYiSPHH9LQLM5I6fa/JbtdA=;
        b=vBWTX8bfVNwCAXzVCaJZ0CtOCATQMCbLjd5BmgDof51ZSLy2q/iJbYwkT0FnoX6a/o
         BtKd3Fxk0OrNAQcNIA7Fna0xUXnsd8Bpsil9+yt3fSi7z31A9tzEBD8XOxWfOVugH3/V
         BYZlZxCP3mAUwZWY2BnXDnsXG1jJ6+KdSiex8yU0yPqs3DQWiQNQbDCwq4NVKBuwj5hR
         bSdPktJ870ns9ss5pDa87z9KSMOLMu7MsUS0JgHu7ahmZ1SxVfqfjbkW3hPihJRYp3Tf
         ZZUJ+iCZkh7EZA+viThthqlHacztHrCPIWVq66w/+56df5/v+Bnlxeqysm1ENDwguY1g
         tN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723754034; x=1724358834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUB5DtqEXasUqeTn5ggBGYiSPHH9LQLM5I6fa/JbtdA=;
        b=LAKc+v3ULrbZyMKZ1WK8tvhanbq89BkpXFXIQmDkFVKQ9sKTnVV3WD8CWpIDwkiPrR
         hFn8Zo2peoW05cb/kqnFbHk51CbAAcKgfP2hApzzL7Esh+l3k5wizQFMfxWYtIaOiVkZ
         K9BVoeNVB7Dbf0MDXCyCmKyUZWtvMSxq+D3xZLeJ3pjwtOGyUI1jNO7fec4CHcHcPDMw
         eNpehhe4Z151KiGqaG13DtJ1J+RwFgBPR6UUcJPFd1hDqTzfjuX6SwtAnaqPGYzmJZX2
         Qc2mfxPX6OUW7wRIjpp9/D3e0AOxxFQ/Baqc7b1s1iYsxJzYd3D0hgBxoFWn9GBnpeeQ
         3kKw==
X-Forwarded-Encrypted: i=1; AJvYcCUHCUSR/lbhH9BVK7jKCOYSCs8jfDPbBB33nb+wGcOBwBgFHHil6TM7rlysS5qa0GKMuiJ65FMk9rtnG2rrncv9w1uitopPbvVW9xRV
X-Gm-Message-State: AOJu0YwmtQfSBpuC023EQjghbQybulV+Gp4Age+Vb92AC3yG/Mn9hX+H
	Vpu2r0Iv0pO+Qd0ng1ov3QvvUFKQGJYPVcZEs5KKzqF9KIa5WQlZu5hAzNETH7ACWdiFtbDLyiK
	bv41AjImxaeRr4O0y6W5iQuukJ7Q0Uv2LMKNK
X-Google-Smtp-Source: AGHT+IGfmuESjcg91WnDqUqkDtn8UIkv+97xiwN4+ScLJKsVEkWIs/4dVOABxE4IIaU7W5co17m4OAQqJ19lGvWOC8s=
X-Received: by 2002:a05:6102:41aa:b0:493:d41a:1185 with SMTP id
 ada2fe7eead31-497798dc938mr1347334137.17.1723754033614; Thu, 15 Aug 2024
 13:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com> <20240806212106.617164-15-mmaurer@google.com>
In-Reply-To: <20240806212106.617164-15-mmaurer@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 15 Aug 2024 20:33:15 +0000
Message-ID: <CABCJKufJK0WO92wnW09VTLqZk0ODxhuKQG=HbKE-va0urJU1Vg@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] modules: Support extended MODVERSIONS info
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Aug 6, 2024 at 9:25=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
[...]
> +void modversion_ext_start(const struct load_info *info,
> +                         struct modversion_info_ext *start)
> +{
> +       unsigned int crc_idx =3D info->index.vers_ext_crc;
> +       unsigned int name_idx =3D info->index.vers_ext_name;
> +       Elf_Shdr *sechdrs =3D info->sechdrs;
> +
> +       /*
> +        * Both of these fields are needed for this to be useful
> +        * Any future fields should be initialized to NULL if absent.
> +        */
> +       if ((crc_idx =3D=3D 0) || (name_idx =3D=3D 0))

nit: The extra parentheses are not necessary.

> +               start->remaining =3D 0;
> +
> +       start->crc =3D (const s32 *)sechdrs[crc_idx].sh_addr;
> +       start->name =3D (const char *)sechdrs[name_idx].sh_addr;
> +       start->remaining =3D sechdrs[crc_idx].sh_size / sizeof(*start->cr=
c);
> +}

Is this missing an else condition or a return? Why set
start->remaining to zero and then proceed to assign a possibly invalid
value to it anyway?

Sami

