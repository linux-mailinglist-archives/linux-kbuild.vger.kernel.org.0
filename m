Return-Path: <linux-kbuild+bounces-2678-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ABC93DA14
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 23:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B5451C22FB8
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 21:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B8013B5A0;
	Fri, 26 Jul 2024 21:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sBUqpHNy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E321381DF
	for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2024 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722027962; cv=none; b=OTBvOFBRrwpIgoqJZG2n8n4z44haJiSUUd3AnVGPlvAcHcS2Q4K7U64JI+8zTEGx/TvaGMLa/jsa+c0AZJj0u2ogPEtGO1LvdJYqhhXMRqxK5Va9omxQwCqBTValVJKlpF+GPldlwiSiaCbufkux/x00wL+4n1PFjxwOHZ/lTWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722027962; c=relaxed/simple;
	bh=7m1g6Y9PmgQZrshJ6w1fDE+ejH8mNXDvgc4AnljHtLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6/XDyXxY0uLMOHjMdEfgLDvysm2yWY3rh/Bo4gy8cRND/M0Dgp82Cn98Mgd1IwlR4WrtGSujxgHWGpyU4Yk7KrZp8sKa9sdRioQGnFYgG3LIvXxlYiu1n+d0NjtgpW8QS1a0cHNTNO0pZgO4fJF5CH3OQbNk/p8OMNz0CfK4Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sBUqpHNy; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5d5c7f24382so611094eaf.2
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2024 14:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722027960; x=1722632760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4dFsz1ZUiiVPLP2/oVmM76j2Zw+Q0kRIKFNpgfUvZ8=;
        b=sBUqpHNyagTcb/pWt5M9eLZiQmj47YN26k30tn3ooi9tRBN/TNjLLf0p2vqgM0qpDN
         Pihb3UZk1afagApVgqw1o4SUqMdWHxuguxrzA5IGb5WpE2FbFs28DbPZGwBtZLmwnOKI
         rzpcZdk54sJQjCsa9JTIE3s0mObLj4t6F14c5s9K2B3XR4sIx3iY/bT3BCCf5AMjdRsG
         B9axh4+lpASCZHQopUGvazAQucA211t7a4GNjUwu+YuAVEiTAHUstawOhLlDt000EJen
         91k6WeRmvNNS5+zpTPMF4/nSachn48Ut4QBMVFxfIucBC08nyM0QFzrHByeAfBHAxIzw
         ++XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722027960; x=1722632760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4dFsz1ZUiiVPLP2/oVmM76j2Zw+Q0kRIKFNpgfUvZ8=;
        b=FyQVIXGsvqtQB3V8yrwXTnCP40C2WYKtNC9+OuCI/JIkm8vTs7Qb7bktuSrxyHK179
         McEsS3/edK4EIbVVpaNcm2alRA8yPkqKeoncsXmdQVjaGsw7xfazEkYg0E0YwGLBGguG
         p1kRtp5kn6aRtCQdeXBaZ79E5s7ygz3/KzIA7AGTXRrST9Pk7AAGZGXlcBCVjv6xvoxH
         KW/+VIiOs2E3EiSKQV5WGHmK+YktZhoUo+DqO7oGVe9SjjmXLnBl3ytzYT1F6f/d2U9W
         elLj9i+JYaVmAf21SnQyMloaHofRkV00JJCFkafTq7nLQKL9Yu8QEEw62feSLJ8iuU33
         WxTA==
X-Forwarded-Encrypted: i=1; AJvYcCU3xPndttcLElMMvXiV3yjQi/QEqZxYfuqCFDqI6j5CQEQk05VQpUtbSSYxFyqUFJ6c1D21wAEVTGSNtk3sAWK2lcEAu+U/ot82sS1B
X-Gm-Message-State: AOJu0YyftJkUsn1actZGHo3wnpSiNbcEeVu8ip06BbiY8UK2/QaC5Esw
	gwRmgIySaqsWiQzBZRmFKOpCkeU9B5SHRjQve02atMH0+MZYtPD3FIfAwyAV6k562D2ZvtfzQdJ
	Gkfdbbbg3LwClGtfu8D6T1p41WXi2Albio9m/
X-Google-Smtp-Source: AGHT+IG1GLCWxWGHnjyRbfSvDoWYCQGDNo4SQoda4isgd4Dc8NBikla8Kh6LKbsjYVUmp44NQu2vB1l6jw1VOSKTmeE=
X-Received: by 2002:a05:6358:52c7:b0:1a6:b009:503a with SMTP id
 e5c5f4694b2df-1adc0695563mr115620755d.4.1722027959728; Fri, 26 Jul 2024
 14:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
 <0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com> <CABCJKueGRBdFfGW-cvOvqxc-a85GpxtwPmLdE_1RiAkNLrEg+g@mail.gmail.com>
 <00714a65-953f-4885-9229-1990543c4154@suse.com>
In-Reply-To: <00714a65-953f-4885-9229-1990543c4154@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 26 Jul 2024 21:05:22 +0000
Message-ID: <CABCJKucj7zjc4=EiFdSnzNDBvQmaWBBt_KJsTq1ybp=Vegp5eQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Mon, Jul 22, 2024 at 8:20=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> From my perspective, I'm okay if gendwarfksyms doesn't provide
> functionality to compare a new object file with its reference symtypes
> file.
>
> As mentioned, genksyms has this functionality but I actually think the
> way it works is not ideal. Its design is to operate on one compilation
> unit at the time. This has the advantage that a comparison of each file
> is performed in parallel during the build, simply because of the make
> job system. On the other hand, it has two problems.
>
> The first one is that genksyms doesn't provide a comparison of the
> kernel as a whole. This means that the tool gives rather scattered and
> duplicated output about changed structs in the build log. Ideally, one
> would like to see a single compact report about what changed at the end
> of the build.

Sure, that makes sense. Android uses STG for this, which might be
useful to other folks too:

https://android.googlesource.com/platform/external/stg/
https://android.googlesource.com/platform/external/stg/+/refs/heads/main/do=
c/stgdiff.md#output-formats

> A few months ago, I also started working on a tool inspired by this
> script. The goal is to have similar functionality but hopefully with
> a much faster implementation. Hence, this tool is written in a compiled
> language (Rust at the moment) and should also become multi-threaded. I'm
> hoping to find some time to make progress on it and make the code
> public. It could later be added to the upstream kernel to replace the
> comparison functionality implemented by genksyms, if there is interest.
>
> So as mentioned, I'm fine if gendwarfksyms doesn't have this
> functionality. However, for distributions that rely on the symtypes
> format, I'd be interested in having gendwarfksyms output its dump data
> in this format as well.

We can definitely tweak the output format, but I'm not sure if making
it fully compatible with the genksyms symtypes format is feasible,
especially for Rust code. I also intentionally decided to use DWARF
tag names in the output instead of shorthands like s# etc. to make it
a bit more readable.

> For example, instead of producing:
>
> gendwarfksyms: process_exported_symbols: _some_mangled_func_name (@ XYZ)
> subprogram(
>    [formal parameters...]
> )
> -> structure_type core::result::Result<(), core::fmt::Error> {
>    [a description of the structure...]
> };
>
> .. the output could be something like this:
>
> S#'core::result::Result<(), core::fmt::Error>' structure_type core::resul=
t::Result<(), core::fmt::Error> { [a description of the structure...] }
> _some_mangled_func_name subprogram _some_mangled_func_name ( [formal para=
meters...] ) -> S#'core::result::Result<(), core::fmt::Error>'

This wouldn't be enough to make the output format compatible with
symtypes though. genksyms basically produces a simple key-value pair
database while gendwarfksyms currently outputs the fully expanded type
string for each symbol. If you need the tool to produce a type
database, it might also be worth discussing if we should use a bit
less ad hoc format in that case.

One more thing to note about the current --debug output is that it
directly correlates with the debugging information and thus may not
contain all aliases. For example, the Rust compiler deduplicates
identical function implementations (e.g. Deref::deref and
DerefMut::deref_mut etc.), but only one of the symbol names appears in
DWARF. We use symbol addresses to print out #SYMVERs also for the
aliases, but they don't show up in the debugging output right now.

> > If using unions here is acceptable to everyone, a simple solution
> > would be to use a known name prefix for the reserved members and teach
> > gendwarfksyms to only print out the original type for the replaced
> > ones. For example:
> >
> > The initial placeholder:
> >
> >     u8 __kabi_reserved_1[8];
> >
> > After replacement:
> >
> >     union {
> >             u64 new_member;
> >             struct {
> >                     u8 __kabi_reserved_1[8];
> >             };
> >     }
> >
> > Here gendwarfksyms would see the __kabi_reserved prefix and only use
> > u8 [8] for the CRC calculation. Does this sound reasonable?
>
> I like this idea. I think it's good that the necessary kABI information
> about an updated member can be expressed at the source code level in
> place of the actual change, and it isn't needed to feed additional input
> to the tool.

OK, cool. I agree that being able to specify these details in source
code is much cleaner. I'll add an implementation for this, and for the
definition visibility issue Greg mentioned in v2.

Sami

