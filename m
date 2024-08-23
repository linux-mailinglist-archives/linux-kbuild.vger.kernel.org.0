Return-Path: <linux-kbuild+bounces-3181-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8E95D43C
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 19:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AD72284B97
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 17:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC2C18E059;
	Fri, 23 Aug 2024 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pgqvsnv2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71EA18E03F
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Aug 2024 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724433868; cv=none; b=SLsg1EdAe06PWfV4gM6dUMDaIUroxXJSZTfeaTgjHt3OJ9RwBKJa+fo7vcNfAnVdO0N8Gl0Ct7rWHaTJUG32rwNOIkmRisLm8rx6aXtdx5r5Wgw8c+Fi2WvjUINqom1ahPAEccbu4MQw1y4JoLHBoPO/TdAquyZcsgcaHAZpO8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724433868; c=relaxed/simple;
	bh=hlpyCsii63CCZanLxKd9QdiB9opQud7SMka1/NIVYOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjBM92oPwUaUjLCWXwF17q+c7g9tu60VpJriQZcp6yaVZ8lcyC3ND5yjDQhpBkTN7LsaLhb/aD0xrYb6bw3Zij4Q4O+UP8mzaLCG8OuBUoHexE74ATdRdgbeDdJas1DoBHCGKAn/dvzXIDuqFEURSMx/TsfqjOYO8ksDWdPAWIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pgqvsnv2; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4518d9fa2f4so17501cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Aug 2024 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724433866; x=1725038666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Jk8OKtpUXmY5SARUdzYD1Ba6FDSGinZzury3zL2zI=;
        b=Pgqvsnv2KcbjsgIB+2gRlIZDDtuMB6FxkxM8ZH68dfrLIZa5C5nFG5vbSS2OBUwkvV
         tGkaKNC+Hwf78sbWQ20hFpuxfoJMu4u+2pYVJ+EGEGjpoWWZC8YhCeExdIsVT1G08EMb
         Am+FrY1YwtH1+um28FsdsWHNAofHNbpracH80aOvPuRA/p41D1rvkqwMu2NJaiU/qwvN
         OYTgPOhLLvTRuuWFRabm6Sp//ZSZ3UsMQ2KcFNjjv8n5FX1BEfY/0z8UNquKe9mTBL68
         WO7Z07P2BZZyqqvSX9kj2VhLAnSsLRj3B+ijoYV01YgSU+McY+kcuoGNOXjdYbcZyC7K
         VtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433866; x=1725038666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4Jk8OKtpUXmY5SARUdzYD1Ba6FDSGinZzury3zL2zI=;
        b=vdmfmgBZim5ugP1vXxf+7WrbhBmgC13L3f3g7nfsUFlC1a81/bqbRJYBiFx8/mEtw1
         wdzPqBMnUmI9uN5AO/a79d5buMTh+ixJZubegmyVLyvsuMxwnJFM8V1feFQQq9BPiZ4a
         S1Dw7pMvLrpxTPNh+Xebq+BcfyP8HW/y+nXzuxY9a2+LG4MuFwQOAEE1I7B3Ps/u6XHg
         pKoEr+X58BVtqXDs4cD4+xj7Z25EZ2BibG77Fc9TIS9UJgDSpdzGfAvjPLihO3ZVD7Ob
         c4Ybj8m2BlWuR2iYrcVlZdEWkd6Y9g4bVXhORrUQ0Xcv43Ddj6L3oKVPi9kI+Nw9OEsA
         dlBA==
X-Forwarded-Encrypted: i=1; AJvYcCUD3s+WU35SCnH7RV+9ShOx3AyjEfr6ROBE1dNJWVYtu7QaejSGs11j6DY9KJS5XBtefWsuixKzR4963iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP9i8A05c2uEQhkdjNbtd62xEvrKnynJPepAYH2rLpIWvWzj13
	ttHzf9U6P//Uirj+PQyMq4LOIZ/RzWENcEz+s2au4rIdvwqpjX8QJdsjTeBv100NBDFGXFA4na4
	Mjub8mb6zQSXyNEPgS6ST98kmrSjal5pQDhBd
X-Google-Smtp-Source: AGHT+IF1MJZKSS5KiL5OUVj9UrHhgKvH3Nv8eQHNU+DBTHPuRp7TFVZzROXfEEHtpuETvRKEgEs0JEF6XE2R6Yavjco=
X-Received: by 2002:a05:622a:1443:b0:447:d7ff:961d with SMTP id
 d75a77b69052e-45509e77b0emr3216311cf.9.1724433865508; Fri, 23 Aug 2024
 10:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-1-kris.van.hees@oracle.com> <20240822181942.2626536-3-kris.van.hees@oracle.com>
 <20240823165329.GA3911831@google.com> <ZsjBfjAuC5t/2Cex@oracle.com>
In-Reply-To: <ZsjBfjAuC5t/2Cex@oracle.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 23 Aug 2024 10:23:46 -0700
Message-ID: <CABCJKucamgTpEhU5E=dL3tNc84yzwzFh7uNW-arhN-qDm-3nMw@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] kbuild: generate offset range data for builtin modules
To: Kris Van Hees <kris.van.hees@oracle.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 10:06=E2=80=AFAM Kris Van Hees <kris.van.hees@oracl=
e.com> wrote:
>
> On Fri, Aug 23, 2024 at 04:53:29PM +0000, Sami Tolvanen wrote:
> > Hi Kris,
> >
> > On Thu, Aug 22, 2024 at 02:19:39PM -0400, Kris Van Hees wrote:
> > > diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_b=
uiltin_ranges.awk
> > > new file mode 100755
> > > index 000000000000..68df05fd3036
> > > --- /dev/null
> > > +++ b/scripts/generate_builtin_ranges.awk
> > > @@ -0,0 +1,505 @@
> > > +#!/usr/bin/gawk -f
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# generate_builtin_ranges.awk: Generate address range data for built=
in modules
> > > +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> > > +#
> > > +# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
> > > +#          vmlinux.o.map > modules.builtin.ranges
> > > +#
> > > +
> > > +# Return the module name(s) (if any) associated with the given objec=
t.
> > > +#
> > > +# If we have seen this object before, return information from the ca=
che.
> > > +# Otherwise, retrieve it from the corresponding .cmd file.
> > > +#
> > > +function get_module_info(fn, mod, obj, s) {
> > > +   if (fn in omod)
> > > +           return omod[fn];
> > > +
> > > +   if (match(fn, /\/[^/]+$/) =3D=3D 0)
> > > +           return "";
> > > +
> > > +   obj =3D fn;
> > > +   mod =3D "";
> > > +   fn =3D substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> > > +   if (getline s <fn =3D=3D 1) {
> > > +           if (match(s, /DKBUILD_MODFILE=3D['"]+[^'"]+/) > 0) {
> > > +                   mod =3D substr(s, RSTART + 16, RLENGTH - 16);
> > > +                   gsub(/['"]/, "", mod);
> > > +           }
> > > +   }
> >
> > This doesn't work with built-in Rust modules because there's no
> > -DKBUILD_MODFILE flag passed to the compiler. The .cmd files do have
> > RUST_MODFILE set though, so presumably you could match that too?
>
> Thanks for looking at the patch series.  I'll look into this.
>
> Is there a reason why Rust modules are using RUST_MODFILE rather than als=
o
> using KBUILD_MODFILE as the macro to pass information about what module(s=
)
> the object belongs to?

I assume they wanted to avoid conflicts between Rust-specific
environment variables and existing Kbuild variables. Note that
KBUILD_MODFILE is also double quoted for the C preprocessor, which
isn't needed for Rust. Miguel, do you remember if there's another
reason for the different variable name?

Sami

