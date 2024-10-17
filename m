Return-Path: <linux-kbuild+bounces-4168-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D71DC9A2B15
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 19:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 961C8B278EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 17:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFBB15B12F;
	Thu, 17 Oct 2024 17:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJzkGIHj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7161BFE18
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729186549; cv=none; b=XVChccljTWGDgdLZqcrYlahJTXxPp10jrZiC5TRqad5VIyD8Sbvb/SElAhzxSNQsFRAMVHjHk7iHu678MUJHgXIvrp2BBeYz05SZJj/Tzr3I/blq3NaYKS0ti/IcH4ghli7W6gywlAEgvVxGPLgeISppbWRs4Iz5Gw9EX1mTuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729186549; c=relaxed/simple;
	bh=HuLw3XyUw5DMqXb931/MX/8kxOX3NCDGhGfWHIZsYUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTrVPp9YTZmXSzu9RZ/4cl+mL69Z28rwzkiSdYHLb9GRrPIFammfkEuKni68YkcUt8+7A9o2ERbUQQBdSa6incAj42+7MFY554RuQs9ntBcP4fvJXu20uRDuT1f+QTiH/s5YqFnNrbaloU273EMg2zkQU2MKilkN5Mmda9wAZiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJzkGIHj; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4608dddaa35so18541cf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729186543; x=1729791343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dURRoBcg5xdc+sfdygcMDdcNIH61rDVf7UQMeP0ptwg=;
        b=FJzkGIHj80CeJYXMnKUMhfmYg/9wAbXJxmDLj00C2PAhETZZ/U3t2NBwLcNDXlA4JO
         KZ8dmvRgVJgNj+CQq0dzXVcOc2gC1+OF2ztrJO6dBrc3PxXr6QbJGh0h82/jYshRaBBD
         +f5g02XA6cgVr6uTH46VwWtb68CojEZiKfCioVBhO76uU8lyTQELcoKSoRfycOMtlgeZ
         /Y750xp3n4o9YoV3HX+yTQF9t3689goBZmSsG+whOvXNch5W1sksaCKVTEWCQ1F3NT9h
         Q/jdYC/S70Fv2kBIQCalBHu28+RbAbSIokp7ogmZLNWhYoZ4L71SXiRDOmUOTKrrotZe
         DTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729186543; x=1729791343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dURRoBcg5xdc+sfdygcMDdcNIH61rDVf7UQMeP0ptwg=;
        b=eRCogShqBpRZ/jCUioh59yKl9xNfLJlQ8Kozorh4VO17cnJo5YhlFbSU3UFEwVCaMv
         vI2aZztuSfKbThNrQa5GMuwhLgupvtxc6zpOZxF2cxKnksAI9X5NAqQi6ZEYpX2OPj9y
         zEocuTJu4g2MqR4Q1DLOIu26PHqi7K0xyufafs24+JLaAYtlXh4OGsVFbENLLs5P17S+
         bCmgrsJSAF+xuvCLikRmqOgQgYkekTgeXpR8/NuJmkDnn5RhaVL8xl8aBxZ3mILp8hPL
         dlwomGo2uC3OdHc+FMs1RahNTMd2QpWjdKRr1vfup7c17fQlC+qTODM0OxGX3Ur+zjCo
         PNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA4oUDeV7kn8UzXNtllxql4BOnN7x77/pGhOu81TSFXbb0cedEWtb/vLymzQ8BuVfrWHNIxPK4gjxId5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWq/l1mSasP0uG9pkVtth56y347973lLs18/7d0ExZ9pZtCWq
	MEyj8hZ8D6qOQJyrojcfiDTSY7VkHUGc1PfQ/fs5VCob/CA8//Saoq0IYYU3Y3mdIMYwlznX1CS
	26Ab8ABoT9UH8zOMgSmnTrJqoTLLZv0YQp1ME
X-Google-Smtp-Source: AGHT+IEaDSNEXF6UDd2rD0Gd9sSzpU9Rg3eq7jFfKlAmBkK223IeHgDaarxW/TGnC4DSXNdPeOYFY1DS/4zAFx3ebnw=
X-Received: by 2002:a05:622a:a64e:b0:45e:fea6:a3b1 with SMTP id
 d75a77b69052e-4609f69cb5dmr3909251cf.19.1729186543003; Thu, 17 Oct 2024
 10:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-33-samitolvanen@google.com> <13be9260-1799-4255-89d4-65d56358e348@suse.com>
In-Reply-To: <13be9260-1799-4255-89d4-65d56358e348@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 17 Oct 2024 10:35:06 -0700
Message-ID: <CABCJKueKHy9XmpRVG=HkJaJWAQvtN6OvnnW+Aag4Hd1dfif5SA@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] gendwarfksyms: Add symtypes output
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Thu, Oct 17, 2024 at 7:13=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 10/8/24 20:38, Sami Tolvanen wrote:
> > +     if (symtypes_file) {
> > +             symfile =3D fopen(symtypes_file, "w");
> > +
> > +             if (!symfile) {
> > +                     error("fopen failed for '%s': %s", symtypes_file,
> > +                           strerror(errno));
> > +                     return -1;
>
> Nit: The 'return -1;' statement is not needed since error() doesn't
> return.

Ah, missed this one. I'll fix this in v5.

> > @@ -107,7 +108,8 @@ static void get_symbol(struct symbol *sym, void *ar=
g)
> >  {
> >       struct symbol **res =3D arg;
> >
> > -     *res =3D sym;
> > +     if (sym->state =3D=3D SYMBOL_UNPROCESSED)
> > +             *res =3D sym;
> >  }
>
> What is the reason to check that the symbol is in the unprocessed state
> here?

At this point it's mostly a sanity check to avoid extra work in case
we run into more than one DIE that matches a symbol (or its aliases).
This actually happened in earlier versions because we handled symbol
type pointers (patch 17) as soon as we found them, but now that we
just save them for later in case they're needed, this probably isn't
strictly necessary anymore. I don't see any downsides in keeping this
check though.

Sami

