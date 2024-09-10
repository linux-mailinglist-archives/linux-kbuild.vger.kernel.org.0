Return-Path: <linux-kbuild+bounces-3493-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF8972EAC
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 11:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 585D7B22C61
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 09:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8B118B487;
	Tue, 10 Sep 2024 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0JpD3e7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E5E18A6B9;
	Tue, 10 Sep 2024 09:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725961455; cv=none; b=gIFAGXIOPF0NVQGkd31vSElNXJHorOSDUoUvbEwUr5moa1qDNqxRKa+HEJIDZOj9nY2lRKoR8TA3zumsxXiDg4FRH5nKFIsgrJGqqkMVOk/y9OzWiYBmWh4dv4KT+ZIyupd4lt3HDca5DPAeaGfn3xJWexRQlBH4TAGq+6n8zsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725961455; c=relaxed/simple;
	bh=D3N04FmIzvqggt9C4bVYVfpcu/iBmJ0tG8QKUZ/Wex4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y21Cv+LYEVxByj7AUUO8O5g2rY3H42Y2c46mEPXLNyKgwQlorWpGWa/MbE0xWNtaTmKks37kVlNL+m8eP8tGxLoBPLVf+FdJD61WanquqjJp5WVAA4DMvm6JD6a9MOK5JKzjzOTTXDV6gVKVhhSHQdafTE7bZ9jjiK4JauwXDX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0JpD3e7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C6FC4CECC;
	Tue, 10 Sep 2024 09:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725961454;
	bh=D3N04FmIzvqggt9C4bVYVfpcu/iBmJ0tG8QKUZ/Wex4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V0JpD3e7sKruPeep6Cxyq2dpx6qjdL0MIrRHp5Yy29lynGweoxEznoPIH4IkTuXjZ
	 p6YtutpNth7tSupJtqjbJ5I55XrfUiAn+/Ou6IAaYynWlmub14PpBZynEnOQ4VpSrU
	 8x7WrCqIIRZIsecKpg5WILTWBtyowS6vulX3djzTkkF7KMCY0qqytTGQHwIGioYbAY
	 ZnQ0tjEcEQYZm7eYeXkrTtSIhmLiOiukzLA+ou9YHVkOJBQEewhhJLw9C2LhqojNxY
	 ttiZW1TvZZVf7EvQIbAHAYhvhZ3ySIZdPfcQ4XrlGYyPyr8OwcGMiS0Fuk+GdHx3p+
	 lQdhAqe53HHMg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f6580c2bbfso53433041fa.1;
        Tue, 10 Sep 2024 02:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5Rae+h2LeHvTrk+v9CnT6V/3ie3Rr3WJz2muI+qHWOs+jbUPWUQhnOVvoEknzDFkIv4Yg0k74rntoMozK@vger.kernel.org, AJvYcCVcbpzoDp0lAZY5sjtL8rzLn/b7NvQ+XuAXof956CNdIzcnsOZg0AQkt03m/+6VNwn1O3J2yq7D3fdz+aOv6sI=@vger.kernel.org, AJvYcCW9Yk0ySK7ovmbKmwAs5m/idN+nYXmBV06i3rrGyfpdEM5PIREmJVuO8ym6iFl0Zaws7HQcIO+kQNxkxsKvYg==@vger.kernel.org, AJvYcCWvEsBojM/dkcf5n9643/4MI/PxL7lU8Yp32JaYJ9JkW9kZ22M8oJzSmlhDrkpqmpsAxMkgV9I0M7YH5jk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ2fHgzMYSCSBSgfnthvjgKfI/MWXTuIsjrzGMsvL//3EZur07
	aVcuWriWRN0LGIhrAiycWil5awupod5AOIvhfz8nsfTRJtQGGCF1ywRWCy/pI0YMY3QQM1ogJyX
	yVhNY47fV0qlDfBfzSqy7gRfka6I=
X-Google-Smtp-Source: AGHT+IHdShnxBBjUPptQ41/ldZfk223s5R8ozEYJtzbMZjFzw1UM2NBN4Nfeh9oGsEZBQBVytVHnTCzwafdOaAGxUc8=
X-Received: by 2002:a2e:bea5:0:b0:2f7:54fb:e68c with SMTP id
 38308e7fff4ca-2f772603a20mr9852201fa.4.1725961453356; Tue, 10 Sep 2024
 02:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
 <CABCJKucott2g8mZyJ0uaG+PdPTMsniR7eNCR9GwHpT_kQ+GFvg@mail.gmail.com>
In-Reply-To: <CABCJKucott2g8mZyJ0uaG+PdPTMsniR7eNCR9GwHpT_kQ+GFvg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Sep 2024 18:43:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATyv+zfSwyykKQrSjxR84ST0xTyEarnAudF2VuLPVxqnQ@mail.gmail.com>
Message-ID: <CAK7LNATyv+zfSwyykKQrSjxR84ST0xTyEarnAudF2VuLPVxqnQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 5:53=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Hi,
>
> On Thu, Sep 5, 2024 at 2:30=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@goo=
gle.com> wrote:
> > >
> > > +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> > > @@ -0,0 +1,78 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > +/*
> > > + * Copyright (C) 2024 Google LLC
> > > + */
> > > +
> > > +#include <dwarf.h>
> > > +#include <elfutils/libdw.h>
> > > +#include <elfutils/libdwfl.h>
> > > +#include <linux/hashtable.h>
> > > +#include <inttypes.h>
> > > +#include <stdlib.h>
> > > +#include <stdio.h>
> >
> >
> > Could you include external headers first,
> > then in-tree headers?
> > (and one blank line in-between).
>
> Sure, I'll reorder this.
>
> > Also, please consider using scripts/include/hashtable.h
> >
> >
> >
> > How about this?
> >
> >
> > #include <dwarf.h>
> > #include <elfutils/libdw.h>
> > #include <elfutils/libdwfl.h>
> > #include <inttypes.h>
> > #include <stdlib.h>
> > #include <stdio.h>
> >
> > #include <hashtable.h>
> >
> >
> >
> >
> >
> >
> > If necessary, you can use this patch too:
> > https://lore.kernel.org/linux-kbuild/20240904235500.700432-1-masahiroy@=
kernel.org/T/#u
>
> Thanks for the patch! I think this would otherwise work, but I also
> need jhash (or a similar hash function), and I can't combine the
> tools/include version with this, because it ends up pulling in a
> duplicate definition of struct list_head. Would you consider adding a
> hash function as well?


I did it as a part of my kconfig works.

Check scripts/include/hash.h added by the following patches.

https://lore.kernel.org/linux-kbuild/20240908124352.1828890-1-masahiroy@ker=
nel.org/T/#mea41ff4c5b6c77aaaae1ed9dac6723bc2f705107
https://lore.kernel.org/linux-kbuild/20240908124352.1828890-1-masahiroy@ker=
nel.org/T/#m9050a270fedb7df9a54e843674bc9ad8fd068f57


I think simple helpers are enough for name_hash and addr_hash,
but please let me know if you encounter a problem.



--=20
Best Regards
Masahiro Yamada

