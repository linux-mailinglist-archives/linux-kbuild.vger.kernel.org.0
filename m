Return-Path: <linux-kbuild+bounces-4691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A7A9CF666
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 21:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6375B2C4C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 20:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B728A1D5CF1;
	Fri, 15 Nov 2024 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODej7s64"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1E613FD72;
	Fri, 15 Nov 2024 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731703734; cv=none; b=lJ8+5H97KceP4tvQ6yTD1F42O/E+eq2HXYaP59x3tn7GA3EjzvLbIMxiQs3HMOAQuefIXAFtzXVm08nFLuZ/qr+wa51dRvASigP+24p2Yw7rqJVuJyiDgKP2FIWrberzSSVz1coPIOWlkp9uk1fCePfierG4p61ehvlWQUDvxuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731703734; c=relaxed/simple;
	bh=Z8zNxafnWqWTW7no9QB1xx1m4RenfvNPuySGb9GCQuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgLsMeHS3fn4EZtpzlXvOkqqK9oUCxwQqEYkymeKhWnJqkGWVqD7yrm9THNdPnay2Ko+BoUzs//lvZ3IIncQWOgjD5mjHXKkzSCNx1RqGVjEm8lDihx3zdpyqYhEAv69ToKnrLlUlB9KkgraOhHqN4Mr6Rm4k7zH8tE4SdKi5SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODej7s64; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CB5C4CECF;
	Fri, 15 Nov 2024 20:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731703734;
	bh=Z8zNxafnWqWTW7no9QB1xx1m4RenfvNPuySGb9GCQuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ODej7s648WutFEvge/KVHASW42X16uSnsKzF+EjD0cvZ0Oisygp9jCm11XTjG916y
	 6xBcSl3xWLLg65XvNpyYvPGNd1gkhdE5pp468kGi8K0DTgle8xBlt48XpEAqC95cWU
	 CfN8uOiPXN7PME51zBzjhMZkIJiF0rm95RWzXHSGhifd9oDKRT2PidzrzpyoNfWlux
	 s3SZwe1E/zDSwr6qGz9IHo2OnRlxSyA4irTxWhcbFErydjuDbvHjSgiTjBcnja80N1
	 HoC8Vko1iCapcs+MJU5oLmWcsSYAYgo/oQlocP84N4A9b9KCQg9IN1u114xIPEjhuV
	 93mnfMfX1ykdg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so23371051fa.2;
        Fri, 15 Nov 2024 12:48:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnp3yQzq5x1NDqdoIJMpRjAR3un27o4OviURTTl4nytM5muPyAjFhQ9QJYznV51Atj5tn1B7OaoDcgLl0=@vger.kernel.org, AJvYcCXKePPifu7/5omVago7AIueCh3XJShRQfRGwIKxL9rTD5MbOtYeUy4L0DXOD9b/6e9coD1xX47r@vger.kernel.org
X-Gm-Message-State: AOJu0YwP+Nqw3RXSkTD7fPVLbcERiFaq06m4FX42HgCAyu72fUPQIPvi
	j+PEI9caIOGVbUAnAbTNyfT5DWAncxeor8Znihm76wcJ5n/ftCU19UEQmWYTQwIb8wnhZgLmpFB
	Kzx9fwf8OvE9ANuZEP4GdKiiy3ms=
X-Google-Smtp-Source: AGHT+IF4edMAe6TYGiGzVOnNe/US2STasLlIx49nz0+LJ/mdMt/MU4zC+rnL1yaqI8uDyrRIK9SzTpbDFY9Rpb0fGXM=
X-Received: by 2002:a2e:be08:0:b0:2f5:11f6:1b24 with SMTP id
 38308e7fff4ca-2ff60931c8amr21166841fa.18.1731703732751; Fri, 15 Nov 2024
 12:48:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
 <20241111-packing-pack-fields-and-ice-implementation-v5-3-80c07349e6b7@intel.com>
 <CAK7LNARAsyOparQ1YxgPh9S4A-uzF04k+91t7Xy1jdTy6uT+Vg@mail.gmail.com> <5a666ac7-4026-4d4f-b2dc-74a124055f21@intel.com>
In-Reply-To: <5a666ac7-4026-4d4f-b2dc-74a124055f21@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 16 Nov 2024 05:48:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhMDEMZFjC1tU5oHefGocxwBC5=Vyy9Q=bx3VvQyssVQ@mail.gmail.com>
Message-ID: <CAK7LNARhMDEMZFjC1tU5oHefGocxwBC5=Vyy9Q=bx3VvQyssVQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/9] lib: packing: add pack_fields() and unpack_fields()
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	netdev <netdev@vger.kernel.org>, linux-kbuild@vger.kernel.org, 
	Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 6:04=E2=80=AFAM Jacob Keller <jacob.e.keller@intel.=
com> wrote:
>
>
>
> On 11/13/2024 12:32 PM, Masahiro Yamada wrote:
> > On Mon, Nov 11, 2024 at 5:08=E2=80=AFPM Jacob Keller <jacob.e.keller@in=
tel.com> wrote:
> >>
> >> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> >>
> >> This is new API which caters to the following requirements:
> >>
> >> - Pack or unpack a large number of fields to/from a buffer with a smal=
l
> >>   code footprint. The current alternative is to open-code a large numb=
er
> >>   of calls to pack() and unpack(), or to use packing() to reduce that
> >>   number to half. But packing() is not const-correct.
> >>
> >> - Use unpacked numbers stored in variables smaller than u64. This
> >>   reduces the rodata footprint of the stored field arrays.
> >>
> >> - Perform error checking at compile time, rather than runtime, and ret=
urn
> >>   void from the API functions. Because the C preprocessor can't genera=
t
> >>   variable length code (loops), we can't easily use macros to implemen=
t the
> >>   overlap checks at compile time.
> >>
> >>   Instead, check for field ordering and overlap in modpost.
> >
> > This is over-engineering.
> >
> > modpost should not be bothered just for a small library like this.
> >
> > Please do sanity checks within lib/packing.c
> >
>
> With the goal of maintaining compile time checks, we end up either
> needing to use generated macros which are O(N^2) if we allow arbitrary
> overlap. If we instead allow only only ascending or descending order,
> this would drop to O(N) which would avoid needing to have 20k lines of
> generated code for the case with 50. I think we could implement them
> without forcing drivers to specifically call the correct macro by using
> something like __builtin_choose_expr(), tho implementing that macro to
> select could be quite long.


WIth Clang, the following check seems to work,
but with GCC, it works only when the array size is small.


#define PACKED_FIELDS_OUT_OF_ORDER(fields) \
({ \
        bool res =3D false; \
        for (unsigned int i =3D 1; i < ARRAY_SIZE(fields); i++) \
                res |=3D fields[i - 1].startbit < fields[i].startbit; \
        res; \
})

#define PACKED_FIELDS_OVERWRAP(fields) \
({ \
        bool res =3D false; \
        for (unsigned int i =3D 1; i < ARRAY_SIZE(fields); i++) \
                res |=3D fields[i - 1].endbit <=3D fields[i].startbit; \
        res; \
})

/*
 * Clang cleverly computes this at compile time.
 * Unfortunately, GCC gives it up when the array size becomes large.
 * Turn on this check only when building the kernel with Clang.
 */
#ifdef CONFIG_CC_IS_CLANG
#define PACKED_FIELDS_SANITY_CHECKS(fields) \
        BUILD_BUG_ON_MSG(PACKED_FIELDS_OUT_OF_ORDER(fields), \
                         #fields ": not sorted decending order"); \
        BUILD_BUG_ON_MSG(PACKED_FIELDS_OVERWRAP(fields), \
                         #fields ": contains overwrap")
#else
#define PACKED_FIELDS_SANITY_CHECKS(fields)
#endif





> Otherwise we can fall back to either module load time checks, or go all
> the way back to only sanity checking at executing of pack_fields or
> unpack_fields.

Is it a big deal?
One solution is a run-time check (for GCC), which is a one-time
for booting or module loading.

Another is to rely on CICD running with Clang to detect overwraps.


It is horrible to include kernel-space structures from user-space
programs that run in a different architecture.

file2alias.c does this because it is only possible at compile-time,
but it is always the source of troubles.
I am search for a way to generate MODULE_ALIAS() without
including mod_devicetable.h from modpost.




--
Best Regards
Masahiro Yamada

