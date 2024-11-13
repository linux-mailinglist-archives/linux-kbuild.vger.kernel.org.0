Return-Path: <linux-kbuild+bounces-4665-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 507609C7A3E
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 18:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15714283FF3
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 17:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC312022F2;
	Wed, 13 Nov 2024 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q5agB2me"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C304C2022CD
	for <linux-kbuild@vger.kernel.org>; Wed, 13 Nov 2024 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520134; cv=none; b=sIElrK+cXiQWsOyK1f550Hn06HRMtNnwHpHYKQmNB3J2lExaoTUfekX3PWqrdA8b9bpJVZT6AbdKhkkUEQ/K65971Km6dZzlwR224tOLSa1bnZGUjEolLqKrmhM8YpNp7/OsK+dZbx/25RVHjnihO7mgx3Z2ismhz8iknBoYum4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520134; c=relaxed/simple;
	bh=2vvecHebovoeGzhdxA64vP0FIVcZsrzn6/S2UuTdzUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEMWnNsZV6gB76EgqqMzlwxS+IBsV/3YyP76q1qFgDVGkbHiI5tDQTAYHk0zw8Bk+Q49gRbleYzdBNxCxxO3xAiPTqwnWxs1DXvchXhaCXQyPrMHfVP2Mk9DyZm8v/byu1lw8ilzlJCvivRWbNR1PjjOneppqfndvG3E0DI4MFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q5agB2me; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c93e9e701fso7057a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Nov 2024 09:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731520131; x=1732124931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut09l0p4ejZD65rK22Do5DdJADgIGvLTdDvLpb35Lpg=;
        b=q5agB2mexx2fJ5p1z3Xx8YR2q/Zt3BQwdxy3HYl87xBtWPT1NCrsUcJwV6KeCrgi82
         WmYboHZe532UOtuz5eBh3dBn7+H62L9QIzWHI4ugSiHfSY/Cp4JfVBTEzpMdo6VBc0OJ
         nokiwrPS/IYH2YvLIe2RLaINnfd9xlryIEZi4OEEEHZOmmHIvrGY+4gIlj9vS49nQHdO
         7RrXs/TA3AeBBd9p0iNXut3YiDw6reUo5V41UaqgTPgnm0YPZoWox3Zm7N2USLs9B42M
         fZgUNn0qA1J0AgtmWtf9UD/hhLfAqbq2jTNX6NFMzM2LgmE3au5sZc16sLkg6VXvJ9KW
         uG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520131; x=1732124931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut09l0p4ejZD65rK22Do5DdJADgIGvLTdDvLpb35Lpg=;
        b=ailpuXc8L20FThNin/OxEe8iR8JAEVToMHA+AKmSNh3EsVah1ajw11HF0hRXVr/xwB
         hRURN4xEitVhGaE7zQ7enZxAWte8t4Jb4EzWp7lbb5stc7LL7dd+0rWeVRZTXdwfEtuH
         Z6C6YdN8tZpr4QCITVm1wiHG3atdx4qPrwTVW72p/X8BUPAjG243cm8J6aa7+lq1JR4p
         FQ+K4YBuCy1s3Xfx6UKzAH02ByuiFy/IwNbH2avL1RYjPPNYhEHRpXzaqzbdruClfanQ
         Sxh50/0o3pSYhwcumDSymSt1j1jkwvQpff/HfXa1g4znYwD8gEtZvMDpKKlLEgvEobWm
         ImmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd1C/H3ZkLohR56rLozYfZCNYi30P9Z7B32s2pyBliqliuBxipBp2QjWK/eQpq7lFEL64JBqSPhCzdavA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCyvrfVRxqONh3BmSJXzlN2cvsYSWwnIgtnBJTLVSwhu+Uce+H
	ZpS+YkFxKnEitxopSFRpQjX3gZjLM+zLWgixnwWxA6TWby+/DybEv1tXnV8AEZ6xYB602mS3caB
	RTtI428QEhcwLj/jq0yoehJz2FG9+MWEbGGGV
X-Gm-Gg: ASbGncu73cQ6VCEjQ2jij7AjxLfoXM4FVR80nkPUeYtJv3mIJKyvRT88Xupn/IcXvM+
	uVzhRe8/fRHZgDRz5o3MgeG+V05Dz
X-Google-Smtp-Source: AGHT+IF+3cQN9o21cQiIysZAB4NJwFjVHmftEWZ1JWnUJZdbBdxTB+kUQux093XqXmTqkJPQ2rghtkSNf6aJlDPPoDk=
X-Received: by 2002:a05:6402:886:b0:5cf:7145:be96 with SMTP id
 4fb4d7f45d1cf-5cf7145bfa8mr145258a12.2.1731520130908; Wed, 13 Nov 2024
 09:48:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-39-samitolvanen@google.com> <CAK7LNAR9c+EEsOvPPn4qSq3gAFskYOXVd=dg8O+bKeeC-HMifw@mail.gmail.com>
In-Reply-To: <CAK7LNAR9c+EEsOvPPn4qSq3gAFskYOXVd=dg8O+bKeeC-HMifw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 13 Nov 2024 09:48:13 -0800
Message-ID: <CABCJKudWUBE2ZboktcBEykBReor4T1Cf8dfRCWJYEryoT81OEQ@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] kbuild: Add gendwarfksyms as an alternative to genksyms
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

Hi Masahiro,

On Mon, Nov 11, 2024 at 8:09=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> >  # These mirror gensymtypes_c and co above, keep them in synch.
> > -cmd_gensymtypes_S =3D                                                 =
        \
> > -   { echo "\#include <linux/kernel.h>" ;                              =
      \
> > -     echo "\#include <asm/asm-prototypes.h>" ;                        =
      \
> > -     $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/EXPORT_SYMBOL(\1);=
/p' ; } | \
> > -    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
> > +getasmexports =3D                                                     =
           \
> > +   { echo "\#include <linux/kernel.h>" ;                              =
 \
> > +     echo "\#include <linux/string.h>" ;                              =
 \
> > +     echo "\#include <asm/asm-prototypes.h>" ;                        =
 \
> > +     $(call getexportsymbols,$(2:.symtypes=3D.o),EXPORT_SYMBOL(\1);) ;=
 }
> > +
> > +ifdef CONFIG_GENDWARFKSYMS
> > +cmd_gensymtypes_S =3D                                                 =
   \
> > +       $(getasmexports) |                                             =
 \
> > +       $(CC) $(c_flags) -c -o $(2:.symtypes=3D.gendwarfksyms.o) -xc -;=
   \
> > +       $(call getexportsymbols,$(2:.symtypes=3D.o),\1) |              =
   \
> > +       $(gendwarfksyms) $(2:.symtypes=3D.gendwarfksyms.o)
>
>
> I do not want to see crazy suffix replacements like this.

Yeah, I agree. It does get a bit ugly.

> I decided to delete this.
> https://lore.kernel.org/linux-kbuild/20241111171753.2917697-2-masahiroy@k=
ernel.org/T/#u

Cool, thanks! I'll rebase v6 on top of your patch.

Sami

