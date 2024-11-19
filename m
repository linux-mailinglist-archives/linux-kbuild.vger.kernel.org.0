Return-Path: <linux-kbuild+bounces-4710-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C299D1C1D
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 01:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6EA91F21F04
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 00:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F6B211C;
	Tue, 19 Nov 2024 00:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hWPkwO9I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A11A139B
	for <linux-kbuild@vger.kernel.org>; Tue, 19 Nov 2024 00:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731974988; cv=none; b=Sgh0AVOM4mQZYCEK61rfeVJ6zXBY2N6virUzQ31oQPyU2SMHFdW9F1O9mhP3CPMbuj4gUIFwsYa29pN9qjAONLW9sVJC9Jmxll3PvZ61YrhcfQVlt5PF8mAt3VdwGkTlRbFmW2+aE882D+GTai/Xk8aTCm/A32jhOMEuf1xxcwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731974988; c=relaxed/simple;
	bh=2joQyxA/A/Ix50bwDrphRLZe1ZN4vLdUciNkknx5Y1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZhrE4m1R284+nhWcEb9SZlqGl8njm1cXZELB4FkLn+u+RyWjuOTajMmAARDlAe2/NAyMXs4PyKFEOm4baOspJsiXaEApXc3eCq+pi+u2I/a8ndWE3P9EkrW3TZMM/TNCZZvQAeifliT69ol2ekHwKdLXB0wrGZblyxuVLlG+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hWPkwO9I; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so4093a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2024 16:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731974985; x=1732579785; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2joQyxA/A/Ix50bwDrphRLZe1ZN4vLdUciNkknx5Y1w=;
        b=hWPkwO9IKE0mcDw1guYidN9euwszrsIhtf2WghLE+tEDyvcK7DKzBMO3S1NVvjn9/E
         drM88icJqpN39XLRsTkOuncXv+icSxP5fc3IDTd3TUNYlfdJwnJ69FDBXAn2UdUnXIPA
         j5e4ta4N9s4fv+uVwngsQwG3xAVVsqPsbfD1ndYbxMtbO3+kHvj5tfBZ0r/X9WU6SBZP
         MjRmep7ay09tA3lq/qME7f7CLU+c5RV/aVinc7lCAatlXoUp93m6Ze3NXTaLFIKRZ4gs
         gQiH8inZ1YRGWt6bqj8kWgyahUNyJ0knUkOzUrkk1AplHgQ7ReW1YLvULF163tP6tvUo
         gDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731974985; x=1732579785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2joQyxA/A/Ix50bwDrphRLZe1ZN4vLdUciNkknx5Y1w=;
        b=Jmtj3gnbeiF8RpAYPDYXX/mXn9VihnBbq2NDgo2I9lshieK+cxitHjfONFufYiafFW
         BWmxGVQ0akkdW+xy/qSIpSt84T+iIQCegu6h5FOns83kv2GrtcUIiCCV+icKfcHEjhyL
         OfpISO8SSw2QIqnX7ubfkdsKbJX06oVDGB8/h2pxlQdSTxMLQU46anuC4vJCeaNPB2kH
         6hFPfP3xOK90hVKqXthTbz6+XjNxHHBKi6FInJIG2kMuMKNF2yffCq7txtr+5bI6LmJH
         hKgH9415tWVjHD9mPf6M3o1B6uQwc1sZ0UiLLVTKAtC1J+/cVdnmTo3K9wT1xs5mI+fS
         av7A==
X-Forwarded-Encrypted: i=1; AJvYcCX47t/QbNSoDUSmO9C0mmtEL4CZlVt6byjJ+mDnDYGyu3GrLpXr1g2GeFYRu3Nx7TwIoXtKRK09aTdhogc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9BRcbBQ9Pu6Bq8gNCebfV1GQBV/5fRPacLTbzyKo30IkI5epl
	GnuiW9mK5Yuvs+e1IV/3Ra+kUVWwMgKi0+zUud1mfHl0z4v4TQObpbqEiYo/jzMpYOFOMpBbRFK
	v8sGEme1lvH8vPpCBdhZ9MlS+E0Mbtkvlp4A0
X-Gm-Gg: ASbGnctAgurZEWuNB1yn9noYCvqTdbOBCLPZLBLLRm91goitHVU6oQcBhpaQQeeM3GF
	XVwfK0Rl2td5okw0jQHwkP4cQiF3pWr1RNTgKAQFRPjgVfaOYujeey+YAiu6r1g==
X-Google-Smtp-Source: AGHT+IGFkoWOhwex/vXz0phxng/cuRxB+IRiCctA7Y89o5ijfhkRJftBIN3eR6qiPieo/jVpc0lu+QpSWPIlthCtl3k=
X-Received: by 2002:a05:6402:1351:b0:5cf:bd9a:41ec with SMTP id
 4fb4d7f45d1cf-5cfdec244d3mr31183a12.2.1731974985273; Mon, 18 Nov 2024
 16:09:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org> <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org> <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org> <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
 <Zy1BVXgnT72Jt_HE@bombadil.infradead.org> <Zzu-wfGqbuAm24yg@bombadil.infradead.org>
In-Reply-To: <Zzu-wfGqbuAm24yg@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 18 Nov 2024 16:09:34 -0800
Message-ID: <CAGSQo033fha6tj7sU8se4kbNfYD_rm5sx6-hpF9s8SfcgWH3Tg@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Thinking about this some more, if we're going down enabling a new
> option, it seems to beg the question if the old *two* ksymtab sections
> could just be folded into the a new one where the "gpl only" thing
> becomes just one "column" as you call it. Reasons I ask, it seems like
> we're duplicating symbol names on ksymtab and for modeversions. Could
> you review this a bit?

 Short answer: We could do this, but I don't necessarily think it's a good idea.

ksymtab and modversions aren't duplicating names even with this patch
series - We have two different formats, one for importing symbols, and
one for exporting them. `__ksymtab`, `__ksymtab_gpl`, and
`__ksymtab_strings` are used to export symbols. `__versions` or the
new `__version_ext_names` and `__version_ext_crcs` are used to import
them. For this reason, in any given compilation unit, a string should
only appear either in the ksymtab (providing it), or in versions
(consuming it).

There also isn't as much immediate technical need for that kind of
rework of the ksymtab format - ksymtab uses a string table for their
names, so the "long name support" that extended modversions provides
to modversions is already present in ksymtab.

Combined, this means that there would be few technical benefits to
this - the primary potential benefit I could see to something like
this would be code complexity reduction, which is a bit of a matter of
personal taste, and mine might not match others'.

However, we could do some things similar to what's going on here:
A. We could try to unify versions and ksymtab (this seems most viable,
but the change in meaning of this data structure has me wary)
B. We could make ksymtab use columnar storage for more things - it
already does so for CRCs, we could theoretically make any or all of
licensing, namespaces, or symbol values columnar.

With the caveat that I am not convinced this restructuring is worth
the churn, the way I would do A would be:

1. Add a field to the `kernel_symbol` that indicates whether the
symbol is import/export (or possibly re-use `value` with a 0 value
after linker resolution to mean "import" instead of export).
2. Generate `kernel_symbol` entries for imported symbols, not just
exported ones.
3. Read `kcrctab` for import symbols to figure out what the expected
crc value is when importing, rather than using versions.
4. Stop generating/reading any of `__versions`, `__version_ext_names`,
`__versions_ext_crcs`, etc.

There are two downsides I can see to this:
1. You cannot make this backwards compatible with existing `kmod`.
(This was the argument given against just enlarging MODVERSIONS symbol
names.)
2. It's hard to be certain that we know about all users of `ksymtab`
in order to ensure they all know the new convention around imported vs
exported symbols.

I think that B would actually make things worse because symbols always
today always have a value, a namespace, a name, and a license. The
only thing that's optional is the CRC, and that's already columnar.
Making the other ones columnar would hurt locality. We'd still need
the strtab sections, or we'd end up with many copies of each
namespace, where today that should get deduped down by the linker.
Columns are good for things that are extensions, optional, or variable
length.

If there are other reasons *for* doing this that I'm not aware of,
what I'd do would be:
1. Use the name as the primary index, same as modversions.
2. Split each other piece into its own column, with a joint iterator.
3. Convert license into a column, with an enum value (currently only
fully exported or GPL).
4. Replace places in the coe where a `struct kernel_symbol *` is used
today with an iterator over the joint columns.

Again, to reiterate, I *do not* think that B is a good idea. A might
be, but the improvement seems sufficiently marginal to me that I don't
know if it's worth the churn.

