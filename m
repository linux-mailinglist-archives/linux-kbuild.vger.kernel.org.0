Return-Path: <linux-kbuild+bounces-5306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060DBA00083
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 22:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7D763A2B0F
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 21:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB7C1B87C7;
	Thu,  2 Jan 2025 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wzqCA1Jf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934971B85D2
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Jan 2025 21:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735852849; cv=none; b=RluuICIEDXIge8XAxRtEp4pLCDHjlUNHhEpuWDRvZ/HNNa+5iZoSYeyUehgAQsUGSvKfBdlnFhTi4U9u+iTrMLsac4oAeB4jtUvbZw0c6VdTpzB/orfI9vqmXOtjc3crxS3HgD6dosBiDsnnFeBQTeYRG5/UHxE3Iu799z4g3XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735852849; c=relaxed/simple;
	bh=vTo1ZqsPUMCCaQufaEwYjzzgT7pASANYmiKJQF8QkVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPucDldPw1PVoNms02lPbbSXdMZS9AUFOktClRlkCZCnlpgkFCpd+f6UsP+fgZutnRGvw6SljxoGmmZaw8SnhOJ8DNu/ohLZrPc/gv2+r6TLbMzd1qWx+SzkaavmwqZa2eJTdWmA0hHvgcgiqnxgg2I5wXc/x4/ItWQag6e8aQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wzqCA1Jf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3e638e1b4so386a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Jan 2025 13:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735852846; x=1736457646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9vFdZ7IDOzdE65bXGsMPSe6IPVaerxNKtrCtifyzwQ=;
        b=wzqCA1JfFUy3DHAmtzOcruJUdCbI50aFmZaDBV1Kq9ASXmx0Ev/oL7Qz96otNkIzQh
         sUVpWt1mwpacGEjdVBnU/MU/lkILA5/Rhy2IK8oHwiGrfbZ1D/qYODxRWxGADoINXtnH
         GilBlNTbZdjq/wxTQQhvkIUyNjqkollmOJ2dTC+ZXmRtqdDFxEXSNIhFTsffKIkPqqtS
         KcD7EvkonLnVOAjNSNTKEgQfNAze55qCXl5zPPEzy5Ay0FvmsRLpeaTYpnt7KeKG6geo
         uZ7f9csmWII/7Oxxl2a8rfBBmQ2E23wyS+KlYTLivINwulUci9+11HOfqvJZ7h8FnmL1
         3bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735852846; x=1736457646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9vFdZ7IDOzdE65bXGsMPSe6IPVaerxNKtrCtifyzwQ=;
        b=s2/Xt8GgpjYkLSCHb5WAuVRiexUr8VSO0Stho4vNV+yl/s+B8Q9AZXqKeYkJFuKto+
         LJXGwgWqziGloQpwCXW+ITYmT9qxCNLir0wYOmXOfNVP9L/VjX3XYj+NDHpV+KLG+Wkf
         VVgMprPgoS43Jfz6au8kvKONREXcdv/jHf7rW/EPuxYVDkPX6RUZ3peRz4VnqAstRiL6
         UxZ+v7Nk67RnmypBpOvnfc292sifpEVawmAYHfalDfQbvG+2LZwIEdUQxOPyhHUXVG/s
         JIoK8DoCbx/0BUwEA6+uajpO61p45n6+vbQbl2Lc2en0tKP54gSoHaUBBd0POM/aYOBj
         I5Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXYYxuxzCB1xJ5I76j15rCVi0Uo4vd0oQqZlkwq3mT5+7+26kGrJ/Sqf4D54zokFg0IJNR+mi14MF371rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFG3FyA74gR+xpVu73ls9lq5+rng2KaRgdcmBTX35YNZnR0uNb
	wZNPKR9YKFuhlugZd/9RAJKaqz9+m2xg6D18r8FqM48hYZIbjp/PpO0QwCwMzKDA64NpshTsKqG
	sUdy5j8U2RnCbl8fipBYrP1E8IbJ70odX2ZNX
X-Gm-Gg: ASbGncuRt1kH8IGqamoPwXj5iQYf4rV/qNJqBuIkqAdgumsXUNgk1zXSEltpeEImWoL
	sqeIU/mzcyApZ0vjIORBAHLq6uA4W3vnmZVzYkT+q8CMq7MBp+p0g8CK672EkJgzIAw==
X-Google-Smtp-Source: AGHT+IH9SygaaxBqUPclTbHe3MzYjU7Sn3gBDwj+5VIodQhhpoIxsAYg0gsp2U2WhePi8dcPSYF5grOygMRJ+YBwyjY=
X-Received: by 2002:a05:6402:538b:b0:5d0:d7ca:7bf4 with SMTP id
 4fb4d7f45d1cf-5d9156e2c80mr23976a12.0.1735852845570; Thu, 02 Jan 2025
 13:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
 <20241219210736.2990838-22-samitolvanen@google.com> <CAK7LNAR=kBi_LN7UkO_qzUQh8fMd1BMf=ZZMQMPph5smZRzSSQ@mail.gmail.com>
In-Reply-To: <CAK7LNAR=kBi_LN7UkO_qzUQh8fMd1BMf=ZZMQMPph5smZRzSSQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 2 Jan 2025 21:20:08 +0000
X-Gm-Features: AbW1kvaNjKx0eH_u3SVWBJidzerXL7V3SCKDxDD6r1mwb7-uASHbuJoLBzWifzg
Message-ID: <CABCJKud7qojuvkcGtOKsXjd_g5A7aS0AT611GVMGtsw5SHyJ5A@mail.gmail.com>
Subject: Re: [PATCH v7 02/18] gendwarfksyms: Add address matching
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 28, 2024 at 4:29=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Dec 20, 2024 at 6:07=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/sy=
mbols.c
> > index 7adf2ed9b89b..98febb524dd5 100644
> > --- a/scripts/gendwarfksyms/symbols.c
> > +++ b/scripts/gendwarfksyms/symbols.c
> > @@ -6,8 +6,39 @@
> >  #include "gendwarfksyms.h"
> >
> >  #define SYMBOL_HASH_BITS 12
> > +
> > +/* struct symbol_addr -> struct symbol */
> > +static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
> > +/* name -> struct symbol */
>
> I think this comment addition should belong to 01/18 instead of 02/18.

Yeah, agreed. I'll send out v8 with these comments addressed.

Sami

