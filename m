Return-Path: <linux-kbuild+bounces-3364-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAD496C8F3
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 22:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD80BB22831
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 20:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554EE14F9CF;
	Wed,  4 Sep 2024 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cGbPqRQB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC1213B7A3
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Sep 2024 20:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725482967; cv=none; b=Di771Rn/5UixyuVFLnxiN4UsmioCbQx0b7hJ7Dav92ED5TLqkUwQnMyvTxzGk1L1EyvmaT4e/aPYGuVx9ry706JMb71ksK2dkbC1bVNVPdK7ZTDdcd78vGsJB1vOROhGJW8Fj2HTsS23Q8T0ZWFKrkuDaXVFj2AOV8cD/afjK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725482967; c=relaxed/simple;
	bh=Cc8EAH8IE6Yvd2aBPD8rscltUpBUI4dNmp2jXK/tiZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlwkAlKzPtCnSoDHP+9YQ1bu1n6iumxGXkKD2m9dNYzmhq1RcthOC90h4EUV+/xB/VX3c/KhDdL90F6oZgJFKpWwvt+VAkWCsbP7nry0sOqLMW6ORkZrZ6gcNP/4Q2AZh4Yyb6wKr+jT0fXbKbZ+6HhtoT0WgQXtJ5vFME6hBe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cGbPqRQB; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4567fe32141so28501cf.0
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Sep 2024 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725482965; x=1726087765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gx0Hp8KWD3MclVMhWNlTjqLSDptdez0gd8c+TTiyWFY=;
        b=cGbPqRQBlLkzzU32aa/QfYwSFJfSY1GAYflXcNptrlfIdZ5GeA3aFIl0xphI7U/hGB
         wjzNFi+Qee7601B1OBDluKnSYEGgsHqvZygWBlqmF5Up4KD4RKdLfs9DJG0NJAjRep7g
         0neXnVt5BN7BdVqOgIqwlUDVtPuhC1Lo/jiUQfQrxEWn/2qHf4t1dVkGnvH9scLfx376
         t1gma2RFnGNB7F/KdNu+Xv5Cv8K6DQUB4q7MX0zVBf4t1L0k8Kv3PLFbXaHCBrXyeD1Y
         xCJMF8j4IWvEkdmkxhBpVqUkjby7r93Q8zvckrdZtntuB+RZ7SOWIahsgeIJyy+8u19e
         ZGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725482965; x=1726087765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gx0Hp8KWD3MclVMhWNlTjqLSDptdez0gd8c+TTiyWFY=;
        b=ewyhdCbDTallEh5GYEQoYTEk5bxgfHCGtcV/xE11fMD5JwfDW60CDk0SqA5m+GAuJE
         HD8QWBWcVs9RJUYLAtMuOW5COs3c97ghHmGR2PrFBfQG8Fr4wBjhN8rAerc3QsSY7VhK
         CPyUibSDy9/DBRL5yGTO3F5JZZ0asCvqQlH+BsmOPljGUzScKm5LqPxq92pTpZXAvZhL
         wkFpLjlnrwsH/N6vScBkM8uOLa9DEPN8wH5xUGt9D7x+Z8hCjvOeQ0JZRdVDNLMSs3KW
         OJrrz2se5fK1sPb4iyXuobMypF8FKPpBi6pGF0szls7pIyfrTYJXuPWu4sdwjBJ1wvdm
         qKbA==
X-Forwarded-Encrypted: i=1; AJvYcCXAbtk9tj/U35fx+gIwQh94aocV1RaJtYQACwu/2XR5golrfcH0u9/ZJnPDX2DOIkxhF6xqSulh6OagyMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaPPCR7iyAuulpePpM1ACtajTEgszC6WYsY7mKsdpeiI7YlylR
	jclE89uiy/wAmMDp40AG0JQZ3TcLIkMYEeAY/kINU/LM8I7G3p1+DdLmOo/E5gYzsHsL0JsDy9l
	I3h+evQtqiFLDmU6h8BopoPi3ilJc8U7DZpFs
X-Google-Smtp-Source: AGHT+IFd6KrSrGqG+ulcWq9YMSxY7NK7vHFG24Qs6rA2X3nt4MsgAamSOqjNX6oKm6LJdBaxSA3RA8iCSuENhDVVJls=
X-Received: by 2002:a05:622a:2a07:b0:453:58c8:3fd1 with SMTP id
 d75a77b69052e-45801b1f7ccmr1000011cf.0.1725482964482; Wed, 04 Sep 2024
 13:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-24-samitolvanen@google.com> <CAK7LNAQs8E1pKo1Bcn4RUAkGbBFPmUsWRRrQCnUUiB588FB09A@mail.gmail.com>
In-Reply-To: <CAK7LNAQs8E1pKo1Bcn4RUAkGbBFPmUsWRRrQCnUUiB588FB09A@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 4 Sep 2024 20:48:47 +0000
Message-ID: <CABCJKud+c3CdKATGDghCdJ=Tn06es5z9U5T5nDi7gWMBkyRNZw@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] gendwarfksyms: Add address matching
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 1, 2024 at 11:11=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > +static int set_symbol_addr(struct symbol *sym, void *arg)
> > +{
> > +       struct symbol_addr *addr =3D arg;
> > +
> > +       if (sym->addr.section =3D=3D SHN_UNDEF) {
> > +               sym->addr.section =3D addr->section;
> > +               sym->addr.address =3D addr->address;
>
>
> These two lines can be replaced with
>
>                   sym->addr =3D *addr;

Good point, I'll fix this in the next version.

Sami

