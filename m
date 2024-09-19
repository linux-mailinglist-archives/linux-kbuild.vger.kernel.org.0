Return-Path: <linux-kbuild+bounces-3625-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C55C97CA95
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 15:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1345E1F21857
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 13:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EFB19EEC6;
	Thu, 19 Sep 2024 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/BD329B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24619D8BB;
	Thu, 19 Sep 2024 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726754393; cv=none; b=cvAssE0/AHGOYZ9Sujhu/8hiA934NF0A8BhBUwhnEdKW+Ytszrrf4wvvETuV9DO4K4rm6OtkJcBzkKA9cB84ZVW63LAFqd8N0uADX1qiENfD328zVb8+Y3BiAjU19GA+O0Do4EOubDsPsPYftkY/M9/QzgSqGKDPg9IC8xza8GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726754393; c=relaxed/simple;
	bh=CePZyLigDVF6yDHPAAbBXKiYFarym/OrWA9cBQu4ghA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3ScSRXFX/F82yVemsvWEVKwsiuXUUOnnw4edY/X1w5IhbWRYSrQYH/VLmrUz+UHo8Hkyz9HPiyTtbeytZoMQTd3ckOH7BHn0Ms4qlOynrAXhwZRpFohKCaeUdpeFT64sDITfk1tuALLzQ5o8Dbhv20WZclplczH+pt68IHWYFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/BD329B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD47C4CEC4;
	Thu, 19 Sep 2024 13:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726754392;
	bh=CePZyLigDVF6yDHPAAbBXKiYFarym/OrWA9cBQu4ghA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J/BD329BZWQwimY+QTC03Yv2DqIsRli2jZItPqpe91eYxZ85Blppw/GAY8Jbmhucl
	 a+8nmLcaL1U0bx0Y7dtdqjB/qqLveEkpNg38OAOHNQTEncjS/hBDyaXvQPRgjjGzfA
	 lmEC9lWZOpW24p3ZdyyPiBYz9L73Cf2fbmK/0Zc4ktOxhB41QbZ+wfpVZA8zwTV4mJ
	 2rbP+HiN8DXC4yFERJDnAkn5NoDmE8LLCazbuE0/Nb17/tXJt2CNXb9JqWURLZA1md
	 6Jlg+f2kFG1YPoyTrKgrH05v64aAQfAX0ifUh0156yITQvlIIyU+/BtybnYsAQ7tun
	 /QYSb3fIaZifQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f754d4a6e4so9684791fa.3;
        Thu, 19 Sep 2024 06:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/ZvLi+ay/ABy1NZxKfg/YxdYlweBppqTbRmMhXimUrNFE8lyWDeMMv2P/p2VJwStl4HbW49cbrF7fGtfgSQU=@vger.kernel.org, AJvYcCWHvQXyXh2vKgfNbhikRqZk1FWwjt1M2dkyb9QsktB9AuLp3C2ZFus4/p/ftVUo6/gc7QZJpzskPnY0Ukw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY6Dse09zW3GdCw1Z7PbgMjbqERQFPacNa8cj9SgnlpQxhJexL
	TWEnqT2NhkmrCCrXW+JM4KgdEkI46xyT0ukZnWS8IjeyPFWEpL0Cj6dcf1OHfbz8nkVf+7H6oQk
	tWW58vtuYip5AaSO0PEUFE7cK/c4=
X-Google-Smtp-Source: AGHT+IHhk8Dp9O86HEjI233s+GywkPv0eYie/FG0b1jEU9QzXUp+qIVvljtiBd//Xdk4DPfWcomKwoUyj0aHwliPIqg=
X-Received: by 2002:a2e:b8c4:0:b0:2f7:c76f:3c62 with SMTP id
 38308e7fff4ca-2f7c76f3cfdmr12015431fa.24.1726754391049; Thu, 19 Sep 2024
 06:59:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-9-masahiroy@kernel.org>
 <Zuws_qal2uJs0B2V@l-nschier-nb>
In-Reply-To: <Zuws_qal2uJs0B2V@l-nschier-nb>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 19 Sep 2024 22:59:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATxynY4yrZgtqezt__DNvUt2pjetpuG25K050y=-bUCNQ@mail.gmail.com>
Message-ID: <CAK7LNATxynY4yrZgtqezt__DNvUt2pjetpuG25K050y=-bUCNQ@mail.gmail.com>
Subject: Re: [PATCH 08/23] kbuild: simplify find command for rustfmt
To: Nicolas Schier <n.schier@avm.de>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 10:54=E2=80=AFPM Nicolas Schier <n.schier@avm.de> w=
rote:
>
> On Tue, Sep 17, 2024 at 11:16:36PM +0900, Masahiro Yamada wrote:
> > The current 'find' command does not prune the rust/test directory
> > itself, requiring an additional 'grep -Fv' command to exclude it.
> > This is cumbersome.
> >
> > The correct use of the -prune option can be seen in the 'make clean'
> > rule.
> >
> > [Current command]
> >
> >   $ find . -type f -name '*.rs' -o -path ./rust/test -prune | wc
> >        70      70    1939
> >   $ find . -type f -name '*.rs' -o -path ./rust/test -prune | grep rust=
/test
> >   ./rust/test
> >
> > [Improved command]
> >
> >   $ find . -path ./rust/test -prune -o -type f -name '*.rs' -print | wc
> >        69      69    1927
> >   $ find . -path ./rust/test -prune -o -type f -name '*.rs' -print | gr=
ep rust/test
> >
> > With the improved 'find' command, the grep command is no longer needed.
> >
> > There is also no need to use the absolute path, so $(abs_srctree) can b=
e
> > replaced with $(srctree).
> >
> > The pruned directory rust/test must be prefixed with $(srctree) instead
> > of $(objtree). Otherwise, 'make O=3D... rustfmt' would visit the stale
> > rust/test directory remaining in the source tree.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Makefile | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 5b16e0605a77..4992b2895dd5 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1740,9 +1740,8 @@ PHONY +=3D rustfmt rustfmtcheck
> >  # when matching, which is a problem when e.g. `srctree` is `..`.
> >  # We `grep` afterwards in order to remove the directory entry itself.
> >  rustfmt:
> > -     $(Q)find $(abs_srctree) -type f -name '*.rs' \
> > -             -o -path $(abs_objtree)/rust/test -prune \
> > -             | grep -Fv $(abs_objtree)/rust/test \
> > +     $(Q)find $(srctree) -path $(srctree)/rust/test -prune \
> > +             -o -type f -name '*.rs' -print \
> >               | grep -Fv generated \
>
> Is there a reason for keeping the grep for generated instead of turning
> it also into a find prune argument?


This commit answers your question:

https://github.com/Rust-for-Linux/linux/commit/73243a8a27a67




--=20
Best Regards
Masahiro Yamada

