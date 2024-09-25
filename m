Return-Path: <linux-kbuild+bounces-3804-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A579869E8
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E22C2812CF
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C97A1A3BA6;
	Wed, 25 Sep 2024 23:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E2DB/sBO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51D1A3BD9
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307765; cv=none; b=QFO3cd4IGRwv/aehjNe7I5En1mICKQ6odFdzBuOuBaxldUM0o4j91CkHHfmdReohVkjCSI/5yfZ0Gy3u8PBGVA8eixM3IUVKOD1bYQ3viGpNH5exv3NRP31uDyBkxhPcnlZj1RrFsYN/9M7KbxdHjOTU61SO62rsD2zmFEU87Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307765; c=relaxed/simple;
	bh=cwCCg7cjlmVJH30GDf9Cwg6fhR2bbuS17MaqIuOSV0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHLBnq3J7sc6UQ/o1FWVaQa/jBOkS/nsKj+XoigniCmrZw+gU+vGG5S8j0HTZPyE7RRsO93s+25IK4zAFSNoUp8ccpEGL9YZirKbFgQY+0Nqep7FvQSsr6RSJv4n91/iONj0KAJLX0i94flvW/9VjHX3Rxl+Bh7KPFRnzMPbsUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E2DB/sBO; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c2460e885dso9897a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307762; x=1727912562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek54duFW07igKvK9AQGJRlqEiTdehADtLtBpPhw2agE=;
        b=E2DB/sBOLvarg2yLjBPzCZclNsJO7hUZ6G7JWzC4pwy0KSxVSEd4lwuegmPYuVSQE4
         prcHVOg7GAh69d/EyX0HEVwPNO7OoxLLT1XW9/QLTBTpHNoaawRjhV6Izc8NyK6G7J8g
         yWT+LFnEPZTweXSqF0Az63SGuO4uGNkcw9+B+7ZDCh1lPcuAEmiGtGkKT7vA+yauVohF
         3I/GitalJG7xgdUdG+J/pJVjqu/LMTaS6qysbWg7BKBSXex1Mmr8VhbGOaHL7P8+MlDu
         17kRZ9XoPDATpxO0EUSiqUqOlSRZ5lMf95dG/4z3py4hD1ZCDkd3CV/2P3UQBIVojm1S
         /P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307762; x=1727912562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek54duFW07igKvK9AQGJRlqEiTdehADtLtBpPhw2agE=;
        b=fzScJ5IkGhlArbYw8kuxwjzb2Vtk12NuEncxXObm7bUY9dVExHGYMWLUf7wBCMNd0t
         dDcL0MQ8xwUy9Ii03V0kEQVyhir3pLiWqwLzUjH0PnFos6KyyS/ZRsJ9+0z4V22eiJN2
         CTWcWr1CNvlTpY5OndXwbDHrPBuCf8+c73yFSLIiCZ225YKBGGD9biIhwzLUj/65hq1p
         //HC57QDHyBY9g3rBM44m8jog2h4Tx419HdcuoLIYZpU3abl3bYeLrPCvn6j0hfA0exv
         qRdiOOPMk8TjPA0CZ8TcwQkwxytlh+yAOLUTcNbnH4rPGaDCZXqfhrSymCP/YjYvzuf8
         y+jw==
X-Forwarded-Encrypted: i=1; AJvYcCWAT6dAh9NP+7o8/NSnEwdzZqPf4s1reEgSYOFTUJ88WMafKHxvmiI3PxK+tua4XecNWpkLROaUO0Zpg+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs2is8j2je9pskaPhoB1CIc/CUQYyTiZDfcgcyJaxvSPgWZlio
	38vKfoFjcZ0RwIc2HfaXoOVNZhQPSgA5/zRyI4gicCpN9VpvMmZz7gd/F2FSWrAsrPYXtSugz5i
	n7TMC7lRfBkNK0JDQmQ/XA/YsXH4SNGj8oLOK
X-Google-Smtp-Source: AGHT+IEQLkFnBxCVmc+hBCfJCN9xgnB4wVQcVoqAWlHhf+GqjN1sdjtOkK/z88OGPV3GGtu/6kc0Wj3d2hT0sVNu66g=
X-Received: by 2002:a05:6402:524d:b0:5c2:5251:ba5c with SMTP id
 4fb4d7f45d1cf-5c8783c7d8fmr251259a12.0.1727307761901; Wed, 25 Sep 2024
 16:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com> <20240924212024.540574-15-mmaurer@google.com>
 <20240925230000.GA3176650@google.com>
In-Reply-To: <20240925230000.GA3176650@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 25 Sep 2024 16:42:30 -0700
Message-ID: <CAGSQo00OqOJ+s3xULXvojXMSCR8y-TQOHAwWqpS2VDxWaDxxQA@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] modules: Support extended MODVERSIONS info
To: Sami Tolvanen <samitolvanen@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the catch. I've sent up v5 to include that fix. I've also
added a changelog and made sure the patches make it to linux-modules@
as Daniel suggested.


On Wed, Sep 25, 2024 at 4:00=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi Matt,
>
> On Tue, Sep 24, 2024 at 09:19:56PM +0000, Matthew Maurer wrote:
> > +static void dedotify_ext_version_names(char *str_seq, unsigned long si=
ze)
> > +{
> > +     unsigned long out =3D 0;
> > +     unsigned long in;
> > +     char last =3D '\0';
> > +
> > +     for (in =3D 0; in < size; in++) {
> > +             if (last =3D=3D '\0')
> > +                     /* Skip one leading dot */
> > +                     if (str_seq[in] =3D=3D '.')
> > +                             in++;
>
> Thanks for addressing Michael's comment, this looks correct to me.
>
> Nit: might be cleaner in a single if statement though:
>
>         /* Skip one leading dot */
>         if (last =3D=3D '\0' && str_seq[in] =3D=3D '.')
>                 in++;
>
> > +void modversion_ext_start(const struct load_info *info,
> > +                       struct modversion_info_ext *start)
> > +{
> > +     unsigned int crc_idx =3D info->index.vers_ext_crc;
> > +     unsigned int name_idx =3D info->index.vers_ext_name;
> > +     Elf_Shdr *sechdrs =3D info->sechdrs;
> > +
> > +     /*
> > +      * Both of these fields are needed for this to be useful
> > +      * Any future fields should be initialized to NULL if absent.
> > +      */
> > +     if ((crc_idx =3D=3D 0) || (name_idx =3D=3D 0))
> > +             start->remaining =3D 0;
> > +
> > +     start->crc =3D (const s32 *)sechdrs[crc_idx].sh_addr;
> > +     start->name =3D (const char *)sechdrs[name_idx].sh_addr;
> > +     start->remaining =3D sechdrs[crc_idx].sh_size / sizeof(*start->cr=
c);
> > +}
>
> This looks unchanged from v3, so I think my comment from there
> still applies:
>
> https://lore.kernel.org/lkml/CABCJKufJK0WO92wnW09VTLqZk0ODxhuKQG=3DHbKE-v=
a0urJU1Vg@mail.gmail.com/
>
> Sami

