Return-Path: <linux-kbuild+bounces-3267-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A82962F95
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 20:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D3E91C237E3
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 18:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B4714AD24;
	Wed, 28 Aug 2024 18:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EadeC2G5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D7A2747B;
	Wed, 28 Aug 2024 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724868940; cv=none; b=EnZJnSlvKTSPwgNrrrItUAqHU86vcCWkgbZ6GuqVxQMj5c3Y5DV24cuv3E4o1KgCBRCBQiWmpj9T74Z0DfLOC3I5IEm3l1Up8Rx1Pp1BvSWFB0vSxMArEFksiGINZAsJS34qypQy4q4WqWSkQELKozeYDbbgwOjqWvR5+rPlwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724868940; c=relaxed/simple;
	bh=FveA6ivn7jNuVVJwt3ZVsWXWe3VU5PK0bqzTdYvMwNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqtLzXnczvOTShN1VfLaw5cTbIFKYwTXASiHP/mcCJI1koAxYZ/UdFY/Px2I+OWyG5VLkFQGQUcVMW5/2GYYiNhM/fv4PmBzKeuYs6D5ya54yHc2I5IUEZUpZ6REwy560wBlZTOlqzodCn1W2NC4SQHDygsIdj5hjuh+oRetOLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EadeC2G5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46E6C4CEC3;
	Wed, 28 Aug 2024 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724868939;
	bh=FveA6ivn7jNuVVJwt3ZVsWXWe3VU5PK0bqzTdYvMwNE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EadeC2G5/c1OO3GBWW8sYLNVlSbhUacvcdVwKY0jRzfddZi1t7HJ8/fsSzoH+3JRC
	 J0LKRmnRgedjLZNQ2c9w+ALCX6a0iPCaejEuyG00t/uvjIMDPr+DlRhKaUTdBTtuLh
	 0IBCUzeLx3lRTHMKtMY9HoKs1WvyILtzA6KRhQO5czQ/a03dvktee4MhrMiCIFikVq
	 pU3gtAGq6cM/JPlK8mOYQWWSFoKdZv635VvekJOrk2XoogZYhJvYtIxosei722hZ+O
	 azMuOef5YszfO3fiI96P8hkfbwaJru15Po7JcGvpptO5vfF20LhkuJlfEaLxzW5z/J
	 i/FK2wb7WOEsQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-533488ffaf7so9680588e87.0;
        Wed, 28 Aug 2024 11:15:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDVfqqaeYskwunGlOJ7KjFJfvuank/jPvc+9yipR1fbpF2IDd14+vARJJW8NcqKNFZcc48abaqCWIFegCd@vger.kernel.org, AJvYcCUXf3f+RJ5ARwqbxZQtj4qqBykXa3gBifp6c0akLN1PlGjfqBOHRLliIfwPtRQb5a7dDHrhflxlt8U0t6x3+w==@vger.kernel.org, AJvYcCV8XRmTQ6XPkgDAGaetTQIO9BoIzGWvT0aaacEoWv7llR1w1pq3jZ43vnYgtpcY5eZLfkIPiw6XKSrF0mg=@vger.kernel.org, AJvYcCVAIiJR7IIoQh3G8bX3Q6lwJwdUljwbf5XG20yXhv7IeyX19s8IxJzs3biydi0FmriMyrR1yZn3R8BlZ5rWTso=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf3RvqaPAQr8q3QXMjlMEgyMTzxzBsLA3KmW3z1/2FELuY/SKB
	IWqegYynNVpUxNLCyXKaL/BPugXpLT22z5tj7NqBtQ3GyqxW8QMXIKg6+2voAVrP5S0mP4FJLG2
	zX5n2gKFRtzE1inSJG2Jbe5qFzBg=
X-Google-Smtp-Source: AGHT+IF/63jL53P75A8iee8qUEGbkNUdjDngWZczENu3dFzHOlQ0gMsu6LTAAnvPf8fF3Lg63689rhWEBKtJDKSCfY8=
X-Received: by 2002:a05:6512:e92:b0:533:97b:e272 with SMTP id
 2adb3069b0e04-5353e5aae0emr99002e87.41.1724868938342; Wed, 28 Aug 2024
 11:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-27-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-27-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 29 Aug 2024 03:15:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNARQncjxxqbjiMHXdAnakpo8QYo-5kYnN=KaD2xDe0uXPA@mail.gmail.com>
Message-ID: <CAK7LNARQncjxxqbjiMHXdAnakpo8QYo-5kYnN=KaD2xDe0uXPA@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] gendwarfksyms: Add a cache for processed DIEs
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

On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Basic types in DWARF repeat frequently and traversing the DIEs using
> libdw is relatively slow. Add a simple hashtable based cache for the
> processed DIEs.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/Makefile        |   1 +
>  scripts/gendwarfksyms/die.c           | 170 +++++++++++++++++++++++
>  scripts/gendwarfksyms/dwarf.c         | 192 ++++++++++++++++++++------
>  scripts/gendwarfksyms/gendwarfksyms.c |   6 +
>  scripts/gendwarfksyms/gendwarfksyms.h |  58 +++++++-
>  5 files changed, 382 insertions(+), 45 deletions(-)
>  create mode 100644 scripts/gendwarfksyms/die.c
>
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makef=
ile
> index 623f8fc975ea..fcbac52ca00a 100644
> --- a/scripts/gendwarfksyms/Makefile
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -1,6 +1,7 @@
>  hostprogs-always-y +=3D gendwarfksyms
>
>  gendwarfksyms-objs +=3D gendwarfksyms.o
> +gendwarfksyms-objs +=3D die.o
>  gendwarfksyms-objs +=3D dwarf.o
>  gendwarfksyms-objs +=3D symbols.o
>
> diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
> new file mode 100644
> index 000000000000..ad6ba435d9dd
> --- /dev/null
> +++ b/scripts/gendwarfksyms/die.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include <string.h>
> +#include "gendwarfksyms.h"
> +
> +#define DIE_HASH_BITS 20
> +
> +/* uintptr_t die->addr -> struct die * */
> +static DEFINE_HASHTABLE(die_map, DIE_HASH_BITS);
> +
> +static unsigned int map_hits;
> +static unsigned int map_misses;
> +
> +static int create_die(Dwarf_Die *die, struct die **res)
> +{
> +       struct die *cd;
> +
> +       cd =3D malloc(sizeof(struct die));
> +       if (!cd) {
> +               error("malloc failed");
> +               return -1;
> +       }
> +
> +       cd->state =3D INCOMPLETE;
> +       cd->mapped =3D false;
> +       cd->fqn =3D NULL;
> +       cd->tag =3D -1;
> +       cd->addr =3D (uintptr_t)die->addr;
> +       cd->list =3D NULL;
> +
> +       hash_add(die_map, &cd->hash, addr_hash(cd->addr));
> +       *res =3D cd;
> +       return 0;
> +}
> +
> +int __die_map_get(uintptr_t addr, enum die_state state, struct die **res=
)
> +{
> +       struct die *cd;
> +
> +       hash_for_each_possible(die_map, cd, hash, addr_hash(addr)) {
> +               if (cd->addr =3D=3D addr && cd->state =3D=3D state) {
> +                       *res =3D cd;
> +                       return 0;
> +               }
> +       }
> +
> +       return -1;
> +}
> +
> +int die_map_get(Dwarf_Die *die, enum die_state state, struct die **res)
> +{
> +       if (__die_map_get((uintptr_t)die->addr, state, res) =3D=3D 0) {
> +               map_hits++;
> +               return 0;
> +       }
> +
> +       map_misses++;
> +       return check(create_die(die, res));
> +}
> +
> +static void reset_die(struct die *cd)
> +{
> +       struct die_fragment *tmp;
> +       struct die_fragment *df =3D cd->list;
> +
> +       while (df) {
> +               if (df->type =3D=3D STRING)
> +                       free(df->data.str);
> +
> +               tmp =3D df->next;
> +               free(df);
> +               df =3D tmp;
> +       }
> +
> +       cd->state =3D INCOMPLETE;
> +       cd->mapped =3D false;
> +       if (cd->fqn)
> +               free(cd->fqn);
> +       cd->fqn =3D NULL;
> +       cd->tag =3D -1;
> +       cd->addr =3D 0;
> +       cd->list =3D NULL;
> +}
> +
> +void die_map_free(void)
> +{
> +       struct hlist_node *tmp;
> +       unsigned int stats[LAST + 1];
> +       struct die *cd;
> +       int i;
> +
> +       memset(stats, 0, sizeof(stats));
> +
> +       hash_for_each_safe(die_map, i, tmp, cd, hash) {
> +               stats[cd->state]++;
> +               reset_die(cd);
> +               free(cd);
> +       }
> +       hash_init(die_map);
> +
> +       if ((map_hits + map_misses > 0))
> +               debug("hits %u, misses %u (hit rate %.02f%%)", map_hits,
> +                     map_misses,
> +                     (100.0f * map_hits) / (map_hits + map_misses));
> +
> +       for (i =3D 0; i <=3D LAST; i++)
> +               debug("%s: %u entries", die_state_name(i), stats[i]);
> +}
> +
> +static int append_item(struct die *cd, struct die_fragment **res)
> +{
> +       struct die_fragment *prev;
> +       struct die_fragment *df;
> +
> +       df =3D malloc(sizeof(struct die_fragment));
> +       if (!df) {
> +               error("malloc failed");
> +               return -1;
> +       }
> +
> +       df->type =3D EMPTY;
> +       df->next =3D NULL;
> +
> +       prev =3D cd->list;
> +       while (prev && prev->next)
> +               prev =3D prev->next;



So, this entirely traverses the singly-linked list
every time a new item is appended to the tail.


In my analysis, this while loop iterates for thousands
of times in total for emitting each export symbol.


Why isn't this list_add_tail()?








--
Best Regards
Masahiro Yamada

