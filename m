Return-Path: <linux-kbuild+bounces-2762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B93EE943755
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 22:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9D32842EA
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 20:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC1C16C849;
	Wed, 31 Jul 2024 20:46:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2116C437;
	Wed, 31 Jul 2024 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722458784; cv=none; b=J3eeY+kHRnDpPn8oeic4IF4DzNnvJdXN97lZBBMVJ3Ahl9oNgiu+qzBUnTH0QTKl2UUmDj9WWA5yrpxkQgTCYj+5pLY787tHj9Luc0dQlXe9yIgXSv5kaSzSYJ2gKRiWl7kqsmF4T6KMX2KuF/6uwq/L26brPU27E9GwLFtsQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722458784; c=relaxed/simple;
	bh=AeVukmohV3Ul5Z/K/N7ywFHY6KRlSp5fj3lgsbIeS84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+XSax6Md5uAqF+9xXebnuGzvoqrP7E/N3Q/Ey4xQ3vlO/j8JwzzRTzi9f7xoANoSeX9Pt6u+a2Ogg5CZDZngyBLgQwpdleKr6LBhAM83Ex1C+dgt+/Ea+HeKeasSSXB1mnrLe9PfF/O2s7NIIxSZpIeVG+JK+vGMkt1EiMm1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-44fe9aa3bfaso36606111cf.0;
        Wed, 31 Jul 2024 13:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722458781; x=1723063581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/EX/MdkSUl5MjV12TxYf7t+yruPrf+xB5I7T7z+p84=;
        b=myoZw0WcpKgZQiQb9weOCoLzq7mbYJTH4sIoMpyQeVEDotc4W5xOqp9weVIcwcclb2
         6mhlh4/kg3RvcnnwFhJ9j/opjH0HxZZemwydxfT9pHJhgzbBM67YpfRDvDCmP2vy9zbU
         HGPDmnaC9cVO5fpEN9YJKrDupsCjad8dCPZuGJQ32NOWhZVhe2y5PUWzaZ5P1Q9DPTCX
         uE3Z+2wH5xc1UWXzFOCKrcyFqSlYLZZQhFb63R4Ng3WvGc4TBjrWviNZnb9CbcAdf4gR
         cVoHD0koikV8EnEzxu0m6w4mZYnFfUyeqWBxcWoQXVrFJlGueVeXcpoPhzWXowobhXMO
         QJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHjnAjThn+yI2ZXAahR/eurNJLCZ9HvCf1k0oED7mjUYp9ArjI+i29gNPzzEoqJ8/U8x3VTyspPSQX/hw03iby2epbOrLrKMZyluJVV4ktgU3noF+oCr6pVA9WHtSbtZUWHIR0unGwhlTvml0yLw9Vn0ZJCq86hS/apqRYx9ejce3KQ6IlHSJi6n3nGFipnbJuKbHZXdKhlemxEaGXI+yMAFYnhwZdM68i
X-Gm-Message-State: AOJu0YxVAcuvvp+byDGQYIdHNp+k2g6Jse8KveD7/yWaer71CAZ+lVby
	yW+AtPCte+QvW1nR8JmWXR/Uqdson7c6lpMSICLMv4avf1WTRoQe
X-Google-Smtp-Source: AGHT+IEhWj/vQ8WTQj+u43hJfEmFz+FLsoDhgrSx+TsivhnOhOZQAV5+0NUOqpY72YTh3UQU3fOyMA==
X-Received: by 2002:ac8:5d55:0:b0:446:5aac:ca7f with SMTP id d75a77b69052e-451567a382dmr6959181cf.22.1722458781529;
        Wed, 31 Jul 2024 13:46:21 -0700 (PDT)
Received: from skuld-framework.localnet ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe812350bsm63120971cf.9.2024.07.31.13.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 13:46:20 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Asahi Linux <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>,
 Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
Date: Wed, 31 Jul 2024 16:46:18 -0400
Message-ID: <8578805.OV4Wx5bFTl@skuld-framework>
In-Reply-To:
 <CABCJKucj7zjc4=EiFdSnzNDBvQmaWBBt_KJsTq1ybp=Vegp5eQ@mail.gmail.com>
References:
 <20240617175818.58219-17-samitolvanen@google.com>
 <00714a65-953f-4885-9229-1990543c4154@suse.com>
 <CABCJKucj7zjc4=EiFdSnzNDBvQmaWBBt_KJsTq1ybp=Vegp5eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, July 26, 2024 5:05:22=E2=80=AFPM EDT Sami Tolvanen wrote:
> Hi Petr,
>=20
> On Mon, Jul 22, 2024 at 8:20=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> =
wrote:
> > From my perspective, I'm okay if gendwarfksyms doesn't provide
> > functionality to compare a new object file with its reference symtypes
> > file.
> >=20
> > As mentioned, genksyms has this functionality but I actually think the
> > way it works is not ideal. Its design is to operate on one compilation
> > unit at the time. This has the advantage that a comparison of each file
> > is performed in parallel during the build, simply because of the make
> > job system. On the other hand, it has two problems.
> >=20
> > The first one is that genksyms doesn't provide a comparison of the
> > kernel as a whole. This means that the tool gives rather scattered and
> > duplicated output about changed structs in the build log. Ideally, one
> > would like to see a single compact report about what changed at the end
> > of the build.
>=20
> Sure, that makes sense. Android uses STG for this, which might be
> useful to other folks too:
>=20
> https://android.googlesource.com/platform/external/stg/
> https://android.googlesource.com/platform/external/stg/+/refs/heads/main/=
doc
> /stgdiff.md#output-formats
> > A few months ago, I also started working on a tool inspired by this
> > script. The goal is to have similar functionality but hopefully with
> > a much faster implementation. Hence, this tool is written in a compiled
> > language (Rust at the moment) and should also become multi-threaded. I'm
> > hoping to find some time to make progress on it and make the code
> > public. It could later be added to the upstream kernel to replace the
> > comparison functionality implemented by genksyms, if there is interest.
> >=20
> > So as mentioned, I'm fine if gendwarfksyms doesn't have this
> > functionality. However, for distributions that rely on the symtypes
> > format, I'd be interested in having gendwarfksyms output its dump data
> > in this format as well.
>=20
> We can definitely tweak the output format, but I'm not sure if making
> it fully compatible with the genksyms symtypes format is feasible,
> especially for Rust code. I also intentionally decided to use DWARF
> tag names in the output instead of shorthands like s# etc. to make it
> a bit more readable.
>=20
> > For example, instead of producing:
> >=20
> > gendwarfksyms: process_exported_symbols: _some_mangled_func_name (@ XYZ)
> > subprogram(
> >=20
> >    [formal parameters...]
> >=20
> > )
> > -> structure_type core::result::Result<(), core::fmt::Error> {
> >=20
> >    [a description of the structure...]
> >=20
> > };
> >=20
> > .. the output could be something like this:
> >=20
> > S#'core::result::Result<(), core::fmt::Error>' structure_type
> > core::result::Result<(), core::fmt::Error> { [a description of the
> > structure...] } _some_mangled_func_name subprogram
> > _some_mangled_func_name ( [formal parameters...] ) ->
> > S#'core::result::Result<(), core::fmt::Error>'
> This wouldn't be enough to make the output format compatible with
> symtypes though. genksyms basically produces a simple key-value pair
> database while gendwarfksyms currently outputs the fully expanded type
> string for each symbol. If you need the tool to produce a type
> database, it might also be worth discussing if we should use a bit
> less ad hoc format in that case.
>=20
> One more thing to note about the current --debug output is that it
> directly correlates with the debugging information and thus may not
> contain all aliases. For example, the Rust compiler deduplicates
> identical function implementations (e.g. Deref::deref and
> DerefMut::deref_mut etc.), but only one of the symbol names appears in
> DWARF. We use symbol addresses to print out #SYMVERs also for the
> aliases, but they don't show up in the debugging output right now.
>=20
> > > If using unions here is acceptable to everyone, a simple solution
> > > would be to use a known name prefix for the reserved members and teach
> > > gendwarfksyms to only print out the original type for the replaced
> > > ones. For example:
> > >=20
> > > The initial placeholder:
> > >     u8 __kabi_reserved_1[8];
> > >=20
> > > After replacement:
> > >     union {
> > >    =20
> > >             u64 new_member;
> > >             struct {
> > >            =20
> > >                     u8 __kabi_reserved_1[8];
> > >            =20
> > >             };
> > >    =20
> > >     }
> > >=20
> > > Here gendwarfksyms would see the __kabi_reserved prefix and only use
> > > u8 [8] for the CRC calculation. Does this sound reasonable?
> >=20
> > I like this idea. I think it's good that the necessary kABI information
> > about an updated member can be expressed at the source code level in
> > place of the actual change, and it isn't needed to feed additional input
> > to the tool.
>=20
> OK, cool. I agree that being able to specify these details in source
> code is much cleaner. I'll add an implementation for this, and for the
> definition visibility issue Greg mentioned in v2.
>=20

Could you please add myself, Hector, and Janne (along with the Asahi Linux=
=20
mailing list) to the recipients when you send the v2 patch set? We're also=
=20
interested in this. :)

Thanks in advance!


=2D-=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!



