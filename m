Return-Path: <linux-kbuild+bounces-2943-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B51794EA62
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 12:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C730E28229B
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 10:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163B116E872;
	Mon, 12 Aug 2024 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPuKywQt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8DA166F1E;
	Mon, 12 Aug 2024 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723456873; cv=none; b=esh1lBfN5AWdRWXoqQHDM613fWCvJBUc8/Z5pPZAgKjjAAdpiSS16IvDkNAMiSp7A8ardMKjrszrYlEwsCCsAj/pJCdWR21eGzCs4VvNplZVSGwtDaOgXzoZM+p+Gs1z4EBAHZ5urrybYRRQC2iPaT3lyqvr+n6qbjr03EUbxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723456873; c=relaxed/simple;
	bh=rDovt1jA4FilWh0esLwefbyZJ+MsGHIIGBsUzJKCUO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsafgWM6a49suRFfbboABDa7poSZHzqYPDutLrVym8XaEC8NVvIwQwcg3M+QvFlIlaE1H83GzB7oL6tM6a8gOWIxkrW3YhpOZsz9rxRRjh8gT224MhE2QFYySlvMSuCPkj4OxNiSCdsAnLwfvI4t4IBaunkkU6Tf9iJzyb076TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPuKywQt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E8CC32782;
	Mon, 12 Aug 2024 10:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723456872;
	bh=rDovt1jA4FilWh0esLwefbyZJ+MsGHIIGBsUzJKCUO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CPuKywQtbKeIlxVu2bsFo4iJvYKRZt5Sb76muym6av9s3rYnbwNvBcxYIRDyRoqGr
	 9ICteh+bSA6jO3MnrOQqdvkcPSTLrJqX5xv2Q21YBrPyXU9qYlt7KsnZtDhUqRYEev
	 oK4ftrvjpDEfclgINvskfpaEknYSv7W+mXLyfXhqN3ppyuRzCpgpA8ju66wT8ly0GJ
	 NNbDCwl3OjvPibQFv1VwQ8Vs5uMTvk5kSWkJDWn44I36B9k3WFBR2B7uJLXqwC6iWC
	 5xWRgxh6DSsj1ukuoTtYe/xe7KkXwkm1aIRDWn9Dt297OLzgQjyHAa+LIOT9iCHQJw
	 JlgdHG74TOFnw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso45513581fa.2;
        Mon, 12 Aug 2024 03:01:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaHnXi83EOPECMCX6gWSIpy7IpGEpI5LT+zvzvL296K9P4g9d3Ef3TEyXqX3D0Lnj/1U7nFx7EnB4XI67YxCS7qxl59oX96ZLhxSYQ
X-Gm-Message-State: AOJu0YzKwaLWcqWsVmC3mtd865ZFVYqaA9L7NsVoldWJ3UiOx4F43O0p
	QyFsw9xUhnmmwFa7Yfq7VDWyAoLwFPpKvZqicbX9TCHzhGdnk1AorvGA8txAp/yuZBOOfsBtCRx
	/Jo9lPEByXddSue4UFFwszs1PGaY=
X-Google-Smtp-Source: AGHT+IGxSzqGNABxFzUhSYMHabUWezImLCapDo5soh+NbRONgDMbuGydYt6aQfjoU/4wtltxa5bfmrEy0UOrE9HRFDI=
X-Received: by 2002:a2e:a902:0:b0:2ee:80b2:1e99 with SMTP id
 38308e7fff4ca-2f1a6d6602fmr77279601fa.44.1723456871124; Mon, 12 Aug 2024
 03:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710065255.10338-1-ole0811sch@gmail.com> <20240710065255.10338-7-ole0811sch@gmail.com>
 <CAK7LNAQYfRzH8xh5u18z6upb9kJCMpSONn_nCS-5far9jLXsbg@mail.gmail.com>
In-Reply-To: <CAK7LNAQYfRzH8xh5u18z6upb9kJCMpSONn_nCS-5far9jLXsbg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Aug 2024 19:00:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQwBu90CzjfSpP-sokwZMJMTq20UW-xP31gNQh+N7+GwA@mail.gmail.com>
Message-ID: <CAK7LNAQwBu90CzjfSpP-sokwZMJMTq20UW-xP31gNQh+N7+GwA@mail.gmail.com>
Subject: Re: [PATCH v4 06/12] kconfig: Add files for building constraints
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, thorsten.berger@rub.de, 
	deltaone@debian.org, jan.sollmann@rub.de, mcgrof@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 5:49=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Jul 10, 2024 at 3:54=E2=80=AFPM Ole Schuerks <ole0811sch@gmail.co=
m> wrote:
> >
> > These files translate the Kconfig-model into propositional logic and st=
ore
> > the constraints for each symbol in the corresponding struct.
> >
> > Co-developed-by: Patrick Franz <deltaone@debian.org>
> > Signed-off-by: Patrick Franz <deltaone@debian.org>
> > Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
> > Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> > Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> > Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
> > Suggested-by: Sarah Nadi <nadi@ualberta.ca>
> > Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
> > Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
> > Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
> > ---
> >  scripts/kconfig/cf_constraints.c | 1720 ++++++++++++++++++++++++++++++
> >  scripts/kconfig/cf_constraints.h |   26 +
> >  2 files changed, 1746 insertions(+)
> >  create mode 100644 scripts/kconfig/cf_constraints.c
> >  create mode 100644 scripts/kconfig/cf_constraints.h
> >
> > diff --git a/scripts/kconfig/cf_constraints.c b/scripts/kconfig/cf_cons=
traints.c
> > new file mode 100644
> > index 000000000000..1c02a4b47383
> > --- /dev/null
> > +++ b/scripts/kconfig/cf_constraints.c
> > @@ -0,0 +1,1720 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
> > + */
> > +
> > +#include "cf_defs.h"
> > +#include "expr.h"
> > +#define _GNU_SOURCE
> > +#include <assert.h>
> > +#include <locale.h>
> > +#include <stdarg.h>
> > +#include <stdbool.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <time.h>
> > +#include <unistd.h>
> > +
> > +#include "cf_utils.h"
> > +#include "internal.h"
> > +#include "cf_expr.h"
> > +#include "cf_constraints.h"
> > +
> > +#define KCR_CMP false
> > +#define NPC_OPTIMISATION true
> > +
> > +static void init_constraints(struct cfdata *data);
> > +static void get_constraints_bool(struct cfdata *data);
> > +static void get_constraints_select(struct cfdata *data);
> > +static void get_constraints_nonbool(struct cfdata *data);
> > +
> > +static void build_tristate_constraint_clause(struct symbol *sym,
> > +                                            struct cfdata *data);
> > +
> > +static void add_selects_kcr(struct symbol *sym, struct cfdata *data);
> > +static void add_selects(struct symbol *sym, struct cfdata *data);
> > +
> > +static void add_dependencies_bool(struct symbol *sym, struct cfdata *d=
ata);
> > +static void add_dependencies_bool_kcr(struct symbol *sym, struct cfdat=
a *data);
> > +static void add_dependencies_nonbool(struct symbol *sym, struct cfdata=
 *data);
> > +
> > +static void add_choice_prompt_cond(struct symbol *sym, struct cfdata *=
data);
> > +static void add_choice_dependencies(struct symbol *sym, struct cfdata =
*data);
> > +static void add_choice_constraints(struct symbol *sym, struct cfdata *=
data);
> > +static void add_invisible_constraints(struct symbol *sym, struct cfdat=
a *data);
> > +static void sym_nonbool_at_least_1(struct symbol *sym, struct cfdata *=
data);
> > +static void sym_nonbool_at_most_1(struct symbol *sym, struct cfdata *d=
ata);
> > +static void sym_add_nonbool_values_from_default_range(struct symbol *s=
ym,
> > +                                                     struct cfdata *da=
ta);
> > +static void sym_add_range_constraints(struct symbol *sym, struct cfdat=
a *data);
> > +static void sym_add_nonbool_prompt_constraint(struct symbol *sym,
> > +                                             struct cfdata *data);
> > +
> > +static struct default_map *create_default_map_entry(struct fexpr *val,
> > +                                                   struct pexpr *e);
> > +static struct defm_list *get_defaults(struct symbol *sym, struct cfdat=
a *data);
> > +static struct pexpr *get_default_y(struct defm_list *list, struct cfda=
ta *data);
> > +static struct pexpr *get_default_m(struct defm_list *list, struct cfda=
ta *data);
> > +static struct pexpr *get_default_any(struct symbol *sym, struct cfdata=
 *data);
> > +static long sym_get_range_val(struct symbol *sym, int base);
> > +
> > +/* -------------------------------------- */
> > +
> > +/*
> > + * build the constraints for each symbol
> > + */
> > +void get_constraints(struct cfdata *data)
> > +{
> > +       printd("Building constraints...");
> > +
> > +       init_constraints(data);
> > +       get_constraints_bool(data);
> > +       get_constraints_select(data);
> > +       get_constraints_nonbool(data);
> > +}
> > +
> > +/*
> > + * need to go through the constraints once to find all "known values"
> > + * for the non-Boolean symbols (and add them to sym->nb_vals for the g=
iven
> > + * symbols).
> > + * expr_calculate_pexpr_both and get_defaults have the side effect of =
creating
> > + * known values.
> > + */
> > +static void init_constraints(struct cfdata *data)
> > +{
> > +       struct symbol *sym;
> > +       struct property *p;
> > +
> > +       for_all_symbols(sym) {
> > +               struct property *prompt;
> > +
> > +               if (sym->type =3D=3D S_UNKNOWN)
> > +                       continue;
> > +
> > +               if (sym_is_boolean(sym)) {
> > +                       for_all_properties(sym, p, P_SELECT)
> > +                               pexpr_put(expr_calculate_pexpr_both(p->=
visible.expr,
> > +                                                         data));
> > +
> > +                       for_all_properties(sym, p, P_IMPLY)
> > +                               pexpr_put(expr_calculate_pexpr_both(p->=
visible.expr,
> > +                                                         data));
>
>
>
> Does 'imply' give any constraint?


I take back this comment.

'imply' does give a constraint when the implied symbol has
no prompt.




--=20
Best Regards
Masahiro Yamada

