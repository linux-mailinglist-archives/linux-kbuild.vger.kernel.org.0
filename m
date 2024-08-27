Return-Path: <linux-kbuild+bounces-3248-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99746961930
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 23:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC7F21F247D5
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 21:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095501D3629;
	Tue, 27 Aug 2024 21:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aeS5pCiu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A8D19755B
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724794164; cv=none; b=DNql2Xyd94KIFOUAo+BEMuuAvfx8EXF/BUgx9llyYQFmlu25wdGkBPbxc5KRIfRlo0Ut29BrhS51j8nJopwAMbqB7m0J99JGYBGcNJ+oiOkGKIOihVkH6unn4YwI4fsNExgxLRsx8/JRm9giU9em28nyX1umZLybWOIz4jt+EPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724794164; c=relaxed/simple;
	bh=R4HLYZ+UViFtWMxsFQtEArNLC47KC7MUZLfJAYG+8L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rW4SC153e6kE8+C8m0WhiTnuka9c8Wj2wyPmUwefD5uBnFS5u+Wj+QpTAxPUC/j7bEXYd4QOuCQ3kK1oLgrofrxQi1Ofl3ewc4aAxxXG5njBN6NA9+B1KEhRiAqQlBBUbom5+S0fnvZDvh0RNzFkStjcNjx8T+VPwHxUgvWBH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aeS5pCiu; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-45029af1408so34621cf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724794162; x=1725398962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTy0kGwiDI5gZsttd0+HgzSva3UgwhiIE4UArdRmSDM=;
        b=aeS5pCiuowoHxtLK1uLaxQFgn0S9/UUkG4cyjsTu0vFAHjaSxLxZBTI9B0nNoV84/7
         glSfv3Kt4oEk8mvvCA6HlDqlZqXxjxELAWkTr0LvLQM64ScXv0EalOW06F3n1g2YeSAk
         ekwbfbG8ZM364aQ2F4mIxU9E+RS3YhL9fjdkU1QlUYvi6/D6Ljv9cw4zeLlXsGGL9iP6
         cwyJHXwQ3L2/lwySjIy4Qj3NAmCOXJCckw96i/ddgwH83iZojIqqn77hTQ/QgYBBYy0T
         D6/q8DppXHIG4/5VspQ2+/CXbMzTpSdkpDvDqOO821HxyBT2Pwgh8C4tFsbFDEfyi1ob
         6v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724794162; x=1725398962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTy0kGwiDI5gZsttd0+HgzSva3UgwhiIE4UArdRmSDM=;
        b=isKDkzGxhTIAjFXHVJhHba5h6Dfwo4x3E307KqXJesuGpyZ29+7Snf1xdaPWKUg5cu
         JX62O9/XAVReEjkBEhkhIqh09a7HIqGcHq8cAxO0eIFAmPe7XtXd7vVTGOT6ylZMmpWK
         0OF9nZ3LPhWNrW7LyW0P6Thq0/hqdcUBzWJ7ILcwtSjBH0WK1JeuNb6874UGaZHvgrjl
         am4JvYPIh30UcYNYKFNiMD4i0p9e3pb/H2ymRbXhI+dw5xYjAUhhYX2Kq1sdjL/jLSHC
         cxZFlG7ZA7gJxlquVAUKaw5JacQ+qp7fdtnJ4vG0wPLSvuCkq2r0FXbV+12cvkBkWxmm
         n+/g==
X-Forwarded-Encrypted: i=1; AJvYcCUBXxQ9XepygHKLK59g5kpfOdlvxMX88Vi/7cbsVUzPfD6wbfWS+ngV6Cf9uCz1fGDaVO6QyZAm02HZdaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyTurVbTuP0rEY2Qa7qfyjOS2hpFChSQPZvJmX/0mBFmzt2YSd
	gA9pDmMLI/s+dToIcNRdihsr432QTa4VLZloXyOsA4ZFTZqeIbxjI0d0VfuKdb8/iUfhCil9Skj
	0A5Y2cNNhReHnlIaEWZbwws+KppHOinzQ7Zjo
X-Google-Smtp-Source: AGHT+IESYT6ErEPekdnM4JPG1QAmj//Y4YNR4GKOjrbinkZvJAz7qCJ6vDkOQJqXUvV1BbfJh1Ad0J1bwqMfl5vfrVg=
X-Received: by 2002:a05:622a:2cc:b0:44f:9e0f:bc41 with SMTP id
 d75a77b69052e-4566e2c44a8mr191491cf.27.1724794161723; Tue, 27 Aug 2024
 14:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-24-samitolvanen@google.com> <d63ddefe-a6f6-4a5b-9330-11438fca8f9f@suse.com>
In-Reply-To: <d63ddefe-a6f6-4a5b-9330-11438fca8f9f@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 27 Aug 2024 21:28:42 +0000
Message-ID: <CABCJKud2za5o19O4XuE-jxuevwQLZPd+CdoB5tMHCgtG2Q2upQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] gendwarfksyms: Add address matching
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Aug 27, 2024 at 12:40=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > +static inline u32 symbol_addr_hash(const struct symbol_addr *addr)
> > +{
> > +     return jhash(addr, sizeof(struct symbol_addr), 0);
>
> I would be careful and avoid including the padding between
> symbol_addr.section and symbol_addr.address in the hash calculation.

Good catch. I'll fix this in the next version.

> > +static int elf_for_each_symbol(int fd, elf_symbol_callback_t func, voi=
d *arg)
> > +{
> > +     size_t sym_size;
> > +     GElf_Shdr shdr_mem;
> > +     GElf_Shdr *shdr;
> > +     Elf_Data *xndx_data =3D NULL;
> > +     Elf_Scn *scn;
> > +     Elf *elf;
> > +
> > +     if (elf_version(EV_CURRENT) !=3D EV_CURRENT) {
> > +             error("elf_version failed: %s", elf_errmsg(-1));
> > +             return -1;
> > +     }
> > +
> > +     elf =3D elf_begin(fd, ELF_C_READ_MMAP, NULL);
> > +     if (!elf) {
> > +             error("elf_begin failed: %s", elf_errmsg(-1));
> > +             return -1;
> > +     }
> > +
> > +     sym_size =3D gelf_getclass(elf) =3D=3D ELFCLASS32 ? sizeof(Elf32_=
Sym) :
> > +                                                   sizeof(Elf64_Sym);
> > +
> > +     scn =3D elf_nextscn(elf, NULL);
> > +
> > +     while (scn) {
> > +             shdr =3D gelf_getshdr(scn, &shdr_mem);
> > +
> > +             if (shdr && shdr->sh_type =3D=3D SHT_SYMTAB_SHNDX) {
> > +                     xndx_data =3D elf_getdata(scn, NULL);
> > +                     break;
> > +             }
> > +
> > +             scn =3D elf_nextscn(elf, scn);
> > +     }
> > +
> > +     scn =3D elf_nextscn(elf, NULL);
> > +
> > +     while (scn) {
> > +             shdr =3D gelf_getshdr(scn, &shdr_mem);
> > +
> > +             if (shdr && shdr->sh_type =3D=3D SHT_SYMTAB) {
> > +                     Elf_Data *data =3D elf_getdata(scn, NULL);
> > +                     unsigned int nsyms =3D data->d_size / sym_size;
>
> I think strictly speaking this should be:
> size_t nsyms =3D shdr->sh_size / shdr->sh_entsize;
> .. and the code could check that shdr->sh_entsize is same as what
> gelf_fsize(elf, ELF_T_SYM, 1, EV_CURRENT) returns.

Sure, I can change this. I'm not sure if there's a situation where the
current calculation wouldn't result in the exact same result though.

> > +                     unsigned int n;
> > +
> > +                     for (n =3D 0; n < nsyms; ++n) {
>
> The first symbol in the symbol table is always undefined, the loop can
> start from 1.

Ack.

> Alternatively, since elf_for_each_symbol() ends up in the entire series
> being used only with process_symbol() which skips symbols with the local
> binding, the function could be renamed to elf_for_each_global_symbol()
> and start the loop from shdr->sh_info.

Patch 15 ("Add support for declaration-only data structures") actually
also needs to process local symbols, so we can't skip them completely.

Sami

