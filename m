Return-Path: <linux-kbuild+bounces-2941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFD94E8DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 10:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A51B01C216CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 08:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D8C15572D;
	Mon, 12 Aug 2024 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgIbf73B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5522115217F;
	Mon, 12 Aug 2024 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723452618; cv=none; b=FPMSEvlSvfJTwhtRKAdawD1Sxm1Lqx8Kfo2+DVLFXHZ3cm/isJ/KOTEItbodqRcI4Z3gxpb26kDqUVtxLpZvcf81NJUR3RnV/RJj8JOjE5B+aeWuUiOtD05M0B//xSlKctfPmIGIDSc7d6S/oYVsaN7zw2PjeGvuRd75hD4t1wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723452618; c=relaxed/simple;
	bh=aNur46yGEecyaSry6T8eXLC0DK2BAJhQAJwweczARUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNaen840oKMOWGAWUM3hht4DlZOMTqnP1mZ4AK0+4GZ494osySquqlF9mDePfHst9jAxMYEeqNKCVT4BJdp48JiIFWXusX0NT+yf9hO+smW4QapFM/Qemv2GiaPaKMOr63LjeKZGBm8dsxOCOk7Su6DAAL/yAsjesqX0oOWuv8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgIbf73B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99743C4AF10;
	Mon, 12 Aug 2024 08:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723452618;
	bh=aNur46yGEecyaSry6T8eXLC0DK2BAJhQAJwweczARUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IgIbf73B7aEtviGXJZ7VuddlDrFY1INo8iklvQGNjhRKcrvGiwNyLk8/N+yWVOjuE
	 I4N7MMbbHad/zaKNg6vpMFwvXJWGvG24Oj8BoIpI1DivecB66N6eq6cfYHKyU+CkWM
	 Z4YY9PyjY6BRYoZLFtj/nSmroJcyYJsbwYCFT+9rJ18xM+OiisG1dS/MKW/65MXrcN
	 vAl/hBqPP+81ijyPoOfEZ14B8199Eygy8DjpvpTMr6AGekqA3LfuFDCy44vHZG2Kiu
	 S6ROUdJ4tjX5Vx9D3F0jjUTE86ppgysOlgVcFzLiSZsGtoioHeFjvKiPCC31DPUniJ
	 c1mj+9/hCUL/A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-530e2235688so4415709e87.3;
        Mon, 12 Aug 2024 01:50:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPUVt+lD4cuM2DTXua0gDVhiobnguW/PXFp5c2JR+i2iOzs99qbk9xDHZEnoQZaY2AXAlG15FAEjCsdfcb+Evn1XVtnwEP5fAy5h5P
X-Gm-Message-State: AOJu0Yz1QNR3U+1yAbwSBJGinTIkTNeoLBgOl1zvWArBOd8bWxVoCAMb
	isn7Cd5NMxqeRUxs/YamjPqd/iW+azgpIStPezBheNR5MK13rUootATGTZn5zA0/A6pjpUY/Fvw
	Fk/bm2m47ZwDo77Dx+i2H6HIFSjw=
X-Google-Smtp-Source: AGHT+IEeP67c9k0bGj5DqyF3V0OVMtvbG0mcg5KxTZ5bfszPm6V/kFR8XE9BUaiqrcTf0LfwrMZlHEhBfVoy26EcAVQ=
X-Received: by 2002:a05:6512:2346:b0:52e:767a:ada3 with SMTP id
 2adb3069b0e04-530eea2eb56mr5267340e87.47.1723452615829; Mon, 12 Aug 2024
 01:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710065255.10338-1-ole0811sch@gmail.com> <20240710065255.10338-7-ole0811sch@gmail.com>
In-Reply-To: <20240710065255.10338-7-ole0811sch@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Aug 2024 17:49:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQYfRzH8xh5u18z6upb9kJCMpSONn_nCS-5far9jLXsbg@mail.gmail.com>
Message-ID: <CAK7LNAQYfRzH8xh5u18z6upb9kJCMpSONn_nCS-5far9jLXsbg@mail.gmail.com>
Subject: Re: [PATCH v4 06/12] kconfig: Add files for building constraints
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, thorsten.berger@rub.de, 
	deltaone@debian.org, jan.sollmann@rub.de, mcgrof@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 3:54=E2=80=AFPM Ole Schuerks <ole0811sch@gmail.com>=
 wrote:
>
> These files translate the Kconfig-model into propositional logic and stor=
e
> the constraints for each symbol in the corresponding struct.
>
> Co-developed-by: Patrick Franz <deltaone@debian.org>
> Signed-off-by: Patrick Franz <deltaone@debian.org>
> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
> ---
>  scripts/kconfig/cf_constraints.c | 1720 ++++++++++++++++++++++++++++++
>  scripts/kconfig/cf_constraints.h |   26 +
>  2 files changed, 1746 insertions(+)
>  create mode 100644 scripts/kconfig/cf_constraints.c
>  create mode 100644 scripts/kconfig/cf_constraints.h
>
> diff --git a/scripts/kconfig/cf_constraints.c b/scripts/kconfig/cf_constr=
aints.c
> new file mode 100644
> index 000000000000..1c02a4b47383
> --- /dev/null
> +++ b/scripts/kconfig/cf_constraints.c
> @@ -0,0 +1,1720 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
> + */
> +
> +#include "cf_defs.h"
> +#include "expr.h"
> +#define _GNU_SOURCE
> +#include <assert.h>
> +#include <locale.h>
> +#include <stdarg.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "cf_utils.h"
> +#include "internal.h"
> +#include "cf_expr.h"
> +#include "cf_constraints.h"
> +
> +#define KCR_CMP false
> +#define NPC_OPTIMISATION true
> +
> +static void init_constraints(struct cfdata *data);
> +static void get_constraints_bool(struct cfdata *data);
> +static void get_constraints_select(struct cfdata *data);
> +static void get_constraints_nonbool(struct cfdata *data);
> +
> +static void build_tristate_constraint_clause(struct symbol *sym,
> +                                            struct cfdata *data);
> +
> +static void add_selects_kcr(struct symbol *sym, struct cfdata *data);
> +static void add_selects(struct symbol *sym, struct cfdata *data);
> +
> +static void add_dependencies_bool(struct symbol *sym, struct cfdata *dat=
a);
> +static void add_dependencies_bool_kcr(struct symbol *sym, struct cfdata =
*data);
> +static void add_dependencies_nonbool(struct symbol *sym, struct cfdata *=
data);
> +
> +static void add_choice_prompt_cond(struct symbol *sym, struct cfdata *da=
ta);
> +static void add_choice_dependencies(struct symbol *sym, struct cfdata *d=
ata);
> +static void add_choice_constraints(struct symbol *sym, struct cfdata *da=
ta);
> +static void add_invisible_constraints(struct symbol *sym, struct cfdata =
*data);
> +static void sym_nonbool_at_least_1(struct symbol *sym, struct cfdata *da=
ta);
> +static void sym_nonbool_at_most_1(struct symbol *sym, struct cfdata *dat=
a);
> +static void sym_add_nonbool_values_from_default_range(struct symbol *sym=
,
> +                                                     struct cfdata *data=
);
> +static void sym_add_range_constraints(struct symbol *sym, struct cfdata =
*data);
> +static void sym_add_nonbool_prompt_constraint(struct symbol *sym,
> +                                             struct cfdata *data);
> +
> +static struct default_map *create_default_map_entry(struct fexpr *val,
> +                                                   struct pexpr *e);
> +static struct defm_list *get_defaults(struct symbol *sym, struct cfdata =
*data);
> +static struct pexpr *get_default_y(struct defm_list *list, struct cfdata=
 *data);
> +static struct pexpr *get_default_m(struct defm_list *list, struct cfdata=
 *data);
> +static struct pexpr *get_default_any(struct symbol *sym, struct cfdata *=
data);
> +static long sym_get_range_val(struct symbol *sym, int base);
> +
> +/* -------------------------------------- */
> +
> +/*
> + * build the constraints for each symbol
> + */
> +void get_constraints(struct cfdata *data)
> +{
> +       printd("Building constraints...");
> +
> +       init_constraints(data);
> +       get_constraints_bool(data);
> +       get_constraints_select(data);
> +       get_constraints_nonbool(data);
> +}
> +
> +/*
> + * need to go through the constraints once to find all "known values"
> + * for the non-Boolean symbols (and add them to sym->nb_vals for the giv=
en
> + * symbols).
> + * expr_calculate_pexpr_both and get_defaults have the side effect of cr=
eating
> + * known values.
> + */
> +static void init_constraints(struct cfdata *data)
> +{
> +       struct symbol *sym;
> +       struct property *p;
> +
> +       for_all_symbols(sym) {
> +               struct property *prompt;
> +
> +               if (sym->type =3D=3D S_UNKNOWN)
> +                       continue;
> +
> +               if (sym_is_boolean(sym)) {
> +                       for_all_properties(sym, p, P_SELECT)
> +                               pexpr_put(expr_calculate_pexpr_both(p->vi=
sible.expr,
> +                                                         data));
> +
> +                       for_all_properties(sym, p, P_IMPLY)
> +                               pexpr_put(expr_calculate_pexpr_both(p->vi=
sible.expr,
> +                                                         data));



Does 'imply' give any constraint?








> +               }
> +
> +               if (sym->dir_dep.expr)
> +                       pexpr_put(expr_calculate_pexpr_both(sym->dir_dep.=
expr, data));
> +
> +               prompt =3D sym_get_prompt(sym);
> +               if (prompt !=3D NULL && prompt->visible.expr) {
> +                       pexpr_put(expr_calculate_pexpr_both(prompt->visib=
le.expr, data));
> +                       defm_list_destruct(get_defaults(sym, data));
> +               }
> +
> +               if (sym_is_nonboolean(sym)) {
> +                       const char *curr;
> +
> +                       for_all_defaults(sym, p) {
> +                               if (p =3D=3D NULL)
> +                                       continue;
> +
> +                               sym_create_nonbool_fexpr(
> +                                       sym, p->expr->left.sym->name, dat=
a);
> +                       }
> +                       for_all_properties(sym, p, P_RANGE) {
> +                               if (p =3D=3D NULL)
> +                                       continue;
> +
> +                               sym_create_nonbool_fexpr(
> +                                       sym, p->expr->left.sym->name, dat=
a);
> +                               sym_create_nonbool_fexpr(
> +                                       sym, p->expr->right.sym->name, da=
ta);
> +                       }
> +                       curr =3D sym_get_string_value(sym);
> +                       if (strcmp(curr, "") !=3D 0)
> +                               sym_create_nonbool_fexpr(sym, (char *)cur=
r,
> +                                                        data);
> +               }
> +
> +               if (sym->type =3D=3D S_HEX || sym->type =3D=3D S_INT)
> +                       sym_add_nonbool_values_from_default_range(sym, da=
ta);
> +       }
> +}
> +
> +/*
> + *  build constraints for boolean symbols
> + */
> +static void get_constraints_bool(struct cfdata *data)
> +{
> +       struct symbol *sym;
> +
> +       for_all_symbols(sym) {
> +               if (!sym_is_boolean(sym))
> +                       continue;
> +
> +               /* build tristate constraints */
> +               if (sym->type =3D=3D S_TRISTATE)
> +                       build_tristate_constraint_clause(sym, data);
> +
> +               /* build constraints for select statements
> +                * need to treat choice symbols separately
> +                */
> +               if (!KCR_CMP) {
> +                       add_selects(sym, data);
> +               } else {
> +                       if (sym->rev_dep.expr && !sym_is_choice(sym) &&
> +                           !sym_is_choice_value(sym))
> +                               add_selects_kcr(sym, data);
> +               }
> +
> +               /* build constraints for dependencies for booleans */
> +               if (sym->dir_dep.expr && !sym_is_choice(sym) &&
> +                   !sym_is_choice_value(sym)) {
> +                       if (!KCR_CMP)
> +                               add_dependencies_bool(sym, data);
> +                       else
> +                               add_dependencies_bool_kcr(sym, data);
> +               }
> +
> +               /* build constraints for choice prompts */
> +               if (sym_is_choice(sym))
> +                       add_choice_prompt_cond(sym, data);
> +
> +               /* build constraints for dependencies (choice symbols and=
 options) */
> +               if (sym_is_choice(sym) || sym_is_choice_value(sym))
> +                       add_choice_dependencies(sym, data);
> +
> +               /* build constraints for the choice groups */
> +               if (sym_is_choice(sym))
> +                       add_choice_constraints(sym, data);
> +
> +               /* build invisible constraints */
> +               add_invisible_constraints(sym, data);
> +       }
> +}
> +
> +/*
> + * build the constraints for select-variables
> + * skip non-Booleans, choice symbols/options och symbols without rev_dir
> + */
> +static void get_constraints_select(struct cfdata *data)
> +{
> +       struct symbol *sym;
> +
> +       for_all_symbols(sym) {
> +               struct pexpr *sel_y, *sel_m;
> +               struct pexpr *c1, *c2;
> +
> +               if (KCR_CMP)
> +                       continue;
> +
> +               if (!sym_is_boolean(sym))
> +                       continue;
> +
> +               if (sym_is_choice(sym) || sym_is_choice_value(sym))
> +                       continue;
> +
> +               if (!sym->rev_dep.expr)
> +                       continue;
> +
> +               if (sym->list_sel_y =3D=3D NULL)
> +                       continue;
> +
> +               sel_y =3D pexpr_implies(pexf(sym->fexpr_sel_y),
> +                                          pexf(sym->fexpr_y), data,
> +                                          PEXPR_ARGX);
> +               sym_add_constraint(sym, sel_y, data);
> +
> +               c1 =3D pexpr_implies(pexf(sym->fexpr_sel_y), sym->list_se=
l_y,
> +                                       data, PEXPR_ARG1);
> +               sym_add_constraint(sym, c1, data);
> +
> +               /* only continue for tristates */
> +               if (sym->type =3D=3D S_BOOLEAN)
> +                       continue;
> +
> +               sel_m =3D pexpr_implies(pexf(sym->fexpr_sel_m),
> +                                          sym_get_fexpr_both(sym, data),=
 data,
> +                                          PEXPR_ARGX);
> +               sym_add_constraint(sym, sel_m, data);
> +
> +               c2 =3D pexpr_implies(pexf(sym->fexpr_sel_m), sym->list_se=
l_m,
> +                                       data, PEXPR_ARG1);
> +               sym_add_constraint(sym, c2, data);
> +               PEXPR_PUT(sel_y, sel_m, c1, c2);
> +       }
> +}
> +
> +/*
> + * build constraints for non-booleans
> + */
> +static void get_constraints_nonbool(struct cfdata *data)
> +{
> +       struct symbol *sym;
> +
> +       for_all_symbols(sym) {
> +               if (!sym_is_nonboolean(sym))
> +                       continue;
> +
> +               /* the symbol must have a value, if there is a prompt */
> +               if (sym_has_prompt(sym))
> +                       sym_add_nonbool_prompt_constraint(sym, data);
> +
> +               /* build the range constraints for int/hex */
> +               if (sym->type =3D=3D S_HEX || sym->type =3D=3D S_INT)
> +                       sym_add_range_constraints(sym, data);
> +
> +               /* build constraints for dependencies for non-booleans */
> +               if (sym->dir_dep.expr)
> +                       add_dependencies_nonbool(sym, data);
> +
> +               /* build invisible constraints */
> +               add_invisible_constraints(sym, data);
> +
> +               /* exactly one of the symbols must be true */
> +               sym_nonbool_at_least_1(sym, data);
> +               sym_nonbool_at_most_1(sym, data);
> +       }
> +}
> +
> +/*
> + * enforce tristate constraints
> + */
> +static void build_tristate_constraint_clause(struct symbol *sym,
> +                                            struct cfdata *data)
> +{
> +       struct pexpr *X, *X_m, *modules, *c;
> +
> +       if (sym->type !=3D S_TRISTATE)
> +               return;
> +
> +       X =3D pexf(sym->fexpr_y);
> +       X_m =3D pexf(sym->fexpr_m);
> +       modules =3D pexf(modules_sym->fexpr_y);
> +
> +       /* -X v -X_m */
> +       c =3D pexpr_or(pexpr_not_share(X, data), pexpr_not_share(X_m, dat=
a),
> +                         data, PEXPR_ARGX);
> +       sym_add_constraint(sym, c, data);
> +
> +       /* X_m -> MODULES */
> +       if (modules_sym->fexpr_y !=3D NULL) {
> +               struct pexpr *c2 =3D pexpr_implies_share(X_m, modules, da=
ta);
> +
> +               sym_add_constraint(sym, c2, data);
> +               PEXPR_PUT(c2);
> +       }
> +       PEXPR_PUT(X, X_m, modules, c);
> +}
> +
> +/*
> + * build the select constraints
> + * - RDep(X) implies X
> + */
> +static void add_selects_kcr(struct symbol *sym, struct cfdata *data)
> +{
> +       struct pexpr *rdep_y =3D expr_calculate_pexpr_y(sym->rev_dep.expr=
, data);
> +       struct pexpr *c1 =3D pexpr_implies(rdep_y, pexf(sym->fexpr_y), da=
ta,
> +                                             PEXPR_ARG2);
> +
> +       struct pexpr *rdep_both =3D
> +               expr_calculate_pexpr_both(sym->rev_dep.expr, data);
> +       struct pexpr *c2 =3D pexpr_implies(
> +               rdep_both, sym_get_fexpr_both(sym, data), data, PEXPR_ARG=
2);
> +
> +       sym_add_constraint(sym, c1, data);
> +       sym_add_constraint(sym, c2, data);
> +       PEXPR_PUT(rdep_y, c1, rdep_both, c2);
> +}
> +
> +/*
> + * build the select constraints simplified
> + * - RDep(X) implies X
> + */
> +static void add_selects(struct symbol *sym, struct cfdata *data)
> +{
> +       struct property *p;
> +
> +       if (!sym_is_boolean(sym))
> +               return;
> +
> +       for_all_properties(sym, p, P_SELECT) {
> +               struct symbol *selected =3D p->expr->left.sym;
> +               struct pexpr *cond_y, *cond_both;
> +
> +               if (selected->type =3D=3D S_UNKNOWN)
> +                       continue;
> +
> +               if (!selected->rev_dep.expr)
> +                       continue;
> +
> +               if (p->visible.expr) {
> +                       cond_y =3D expr_calculate_pexpr_y(p->visible.expr=
, data);
> +                       cond_both =3D expr_calculate_pexpr_both(p->visibl=
e.expr,
> +                                                             data);
> +               } else {
> +                       cond_y =3D pexf(data->constants->const_true);
> +                       cond_both =3D pexf(data->constants->const_true);
> +               }
> +
> +               if (selected->type =3D=3D S_BOOLEAN) {
> +                       /* imply that symbol is selected to y */
> +                       struct pexpr *e1 =3D pexpr_and(
> +                               cond_both, sym_get_fexpr_both(sym, data),=
 data,
> +                               PEXPR_ARG2);
> +                       struct pexpr *c1 =3D pexpr_implies(
> +                               e1, pexf(selected->fexpr_sel_y), data,
> +                               PEXPR_ARG2);
> +
> +                       sym_add_constraint(selected, c1, data);
> +
> +                       if (selected->list_sel_y =3D=3D NULL)
> +                               selected->list_sel_y =3D pexpr_get(e1);
> +                       else
> +                               selected->list_sel_y =3D
> +                                       pexpr_or(selected->list_sel_y, e1=
, data,
> +                                                PEXPR_ARG1);
> +                       PEXPR_PUT(e1, c1);
> +               }
> +
> +               if (selected->type =3D=3D S_TRISTATE) {
> +                       struct pexpr *e2, *e3, *c2, *c3;
> +
> +                       /* imply that symbol is selected to y */
> +                       e2 =3D pexpr_and(cond_y, pexf(sym->fexpr_y), data=
,
> +                                           PEXPR_ARG2);
> +                       c2 =3D pexpr_implies(e2, pexf(selected->fexpr_sel=
_y),
> +                                               data, PEXPR_ARG2);
> +                       sym_add_constraint(selected, c2, data);
> +
> +                       if (selected->list_sel_y =3D=3D NULL)
> +                               selected->list_sel_y =3D pexpr_get(e2);
> +                       else
> +                               selected->list_sel_y =3D
> +                                       pexpr_or(selected->list_sel_y, e2=
,
> +                                                     data, PEXPR_ARG1);
> +
> +                       /* imply that symbol is selected to m */
> +                       e3 =3D pexpr_and(cond_both,
> +                                           sym_get_fexpr_both(sym, data)=
, data,
> +                                           PEXPR_ARG2);
> +                       c3 =3D pexpr_implies(e3, pexf(selected->fexpr_sel=
_m),
> +                                               data, PEXPR_ARG2);
> +                       sym_add_constraint(selected, c3, data);
> +
> +                       if (selected->list_sel_m =3D=3D NULL)
> +                               selected->list_sel_m =3D pexpr_get(e3);
> +                       else
> +                               selected->list_sel_m =3D
> +                                       pexpr_or(selected->list_sel_m, e3=
,
> +                                                     data, PEXPR_ARG1);
> +                       PEXPR_PUT(e2, c2, e3, c3);
> +               }
> +               PEXPR_PUT(cond_y, cond_both);
> +       }
> +}
> +
> +/*
> + * build the dependency constraints for booleans
> + *  - X implies Dep(X) or RDep(X)
> + */
> +static void add_dependencies_bool(struct symbol *sym, struct cfdata *dat=
a)
> +{
> +       struct pexpr *dep_both;
> +       struct pexpr *visible_m;
> +       struct pexpr *visible_y;
> +       struct pexpr *visible_both;
> +       struct property *prompt;
> +       struct pexpr *has_prompt;
> +       struct pexpr *sel_y;
> +
> +       if (!sym_is_boolean(sym) || !sym->dir_dep.expr)
> +               return;
> +
> +       prompt =3D sym_get_prompt(sym);
> +       if (!prompt) {
> +               visible_m =3D pexf(data->constants->const_false);
> +               visible_y =3D pexpr_get(visible_m);
> +               visible_both =3D pexpr_get(visible_m);
> +       } else if (prompt->expr =3D=3D NULL) {
> +               visible_m =3D pexf(data->constants->const_true);
> +               visible_y =3D pexpr_get(visible_m);
> +               visible_both =3D pexpr_get(visible_m);
> +       } else {
> +               visible_m =3D expr_calculate_pexpr_m(prompt->expr, data);
> +               visible_y =3D expr_calculate_pexpr_y(prompt->expr, data);
> +               visible_both =3D pexpr_or_share(visible_y, visible_m, dat=
a);
> +       }
> +
> +       dep_both =3D expr_calculate_pexpr_both(sym->dir_dep.expr, data);
> +
> +       sel_y =3D sym->rev_dep.expr ? pexf(sym->fexpr_sel_y) :
> +                                   pexf(data->constants->const_false);
> +       has_prompt =3D pexpr_get(visible_both);
> +       has_prompt =3D pexpr_and(
> +                       has_prompt,
> +                       pexpr_not(pexpr_and_share(sel_y, visible_m, data)=
,
> +                               data),
> +                       data, PEXPR_ARGX);
> +
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               struct pexpr *c1;
> +               struct pexpr *c2;
> +               struct pexpr *dep_y =3D
> +                       expr_calculate_pexpr_y(sym->dir_dep.expr, data);
> +               struct pexpr *sel_both =3D sym_get_fexpr_sel_both(sym, da=
ta);
> +               struct pexpr *cond_y1;
> +               struct pexpr *cond_y2;
> +               struct pexpr *cond_y;
> +               struct pexpr *cond_m1;
> +               struct pexpr *cond_m2;
> +               struct pexpr *cond_m;
> +
> +               cond_y1 =3D pexpr_implies(pexpr_not_share(has_prompt, dat=
a),
> +                                      pexpr_or_share(dep_y, sel_y, data)=
, data,
> +                                      PEXPR_ARGX);
> +               cond_y2 =3D pexpr_implies_share(has_prompt, visible_y, da=
ta);
> +               cond_y =3D pexpr_and_share(cond_y1, cond_y2, data);
> +               cond_m1 =3D
> +                       pexpr_implies(pexpr_not_share(has_prompt, data),
> +                                     pexpr_or_share(dep_both, sel_both, =
data),
> +                                     data, PEXPR_ARGX);
> +               cond_m2 =3D pexpr_implies(has_prompt,
> +                                       pexpr_not_share(sel_y, data), dat=
a,
> +                                       PEXPR_ARG2);
> +               cond_m =3D pexpr_and_share(cond_m1, cond_m2, data);
> +               c1 =3D pexpr_implies(pexf(sym->fexpr_y), cond_y, data,
> +                                  PEXPR_ARG1);
> +               c2 =3D pexpr_implies(pexf(sym->fexpr_m), cond_m, data,
> +                                  PEXPR_ARG1);
> +
> +               sym_add_constraint(sym, c1, data);
> +               sym_add_constraint(sym, c2, data);
> +               PEXPR_PUT(c1, c2, dep_y, sel_both, cond_y1,
> +                         cond_y2, cond_y, cond_m1, cond_m2, cond_m);
> +       } else if (sym->type =3D=3D S_BOOLEAN) {
> +               struct pexpr *cond1;
> +               struct pexpr *cond2;
> +               struct pexpr *c;
> +
> +               cond1 =3D pexpr_implies(pexpr_not_share(has_prompt, data)=
,
> +                                     pexpr_or(dep_both, pexf(sym->fexpr_=
m),
> +                                              data, PEXPR_ARG2),
> +                                     data, PEXPR_ARGX);
> +               cond2 =3D pexpr_implies_share(has_prompt, visible_y, data=
);
> +               c =3D pexpr_implies(pexf(sym->fexpr_y),
> +                                 pexpr_and_share(cond1, cond2, data), da=
ta,
> +                                 PEXPR_ARGX);
> +
> +               sym_add_constraint(sym, c, data);
> +               PEXPR_PUT(c, cond1, cond2);
> +       }
> +       PEXPR_PUT(dep_both, has_prompt, sel_y, visible_y, visible_m, visi=
ble_both);
> +}
> +
> +/*
> + * build the dependency constraints for booleans (KCR)
> + *  - X implies Dep(X) or RDep(X)
> + */
> +static void add_dependencies_bool_kcr(struct symbol *sym, struct cfdata =
*data)
> +{
> +       struct pexpr *dep_both, *sel_both;
> +
> +       if (!sym_is_boolean(sym) || !sym->dir_dep.expr)
> +               return;
> +
> +       dep_both =3D expr_calculate_pexpr_both(sym->dir_dep.expr, data);
> +
> +       sel_both =3D sym->rev_dep.expr ?
> +                          expr_calculate_pexpr_both(sym->rev_dep.expr, d=
ata) :
> +                          pexf(data->constants->const_false);
> +
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               struct pexpr *c1;
> +               struct pexpr *c2;
> +               {
> +                       struct pexpr *dep_y =3D
> +                               expr_calculate_pexpr_y(sym->dir_dep.expr,=
 data);
> +                       struct pexpr *sel_y =3D
> +                               sym->rev_dep.expr ?
> +                                       expr_calculate_pexpr_y(
> +                                               sym->rev_dep.expr, data) =
:
> +                                       pexf(data->constants->const_false=
);
> +                       c1 =3D pexpr_implies(pexf(sym->fexpr_y),
> +                                               pexpr_or(dep_y, sel_y,
> +                                                             data, PEXPR=
_ARGX),
> +                                               data, PEXPR_ARGX);
> +               }
> +               c2 =3D pexpr_implies(pexf(sym->fexpr_m),
> +                                       pexpr_or_share(dep_both, sel_both=
,
> +                                                      data),
> +                                       data, PEXPR_ARGX);
> +
> +               sym_add_constraint(sym, c1, data);
> +               sym_add_constraint(sym, c2, data);
> +               PEXPR_PUT(c1, c2);
> +       } else if (sym->type =3D=3D S_BOOLEAN) {
> +               struct pexpr *c =3D pexpr_implies(
> +                       pexf(sym->fexpr_y),
> +                       pexpr_or_share(dep_both, sel_both, data), data,
> +                       PEXPR_ARGX);
> +
> +               sym_add_constraint(sym, c, data);
> +               PEXPR_PUT(c);
> +       }
> +
> +       PEXPR_PUT(dep_both, sel_both);
> +}
> +
> +/*
> + * build the dependency constraints for non-booleans
> + *
> + * sym is not 'n' implies `sym->dir_dep`
> + */
> +static void add_dependencies_nonbool(struct symbol *sym, struct cfdata *=
data)
> +{
> +       struct pexpr *dep_both;
> +       struct pexpr *nb_vals; // "sym is set to some value" / "sym is no=
t 'n'"
> +       struct fexpr_node *node;
> +       struct pexpr *c;
> +
> +       if (!sym_is_nonboolean(sym) || !sym->dir_dep.expr || sym->rev_dep=
.expr)
> +               return;
> +
> +       dep_both =3D expr_calculate_pexpr_both(sym->dir_dep.expr, data);
> +
> +       nb_vals =3D pexf(data->constants->const_false);
> +       /* can skip the first non-boolean value, since this is 'n' */
> +       fexpr_list_for_each(node, sym->nb_vals) {
> +               if (node->prev =3D=3D NULL)
> +                       continue;
> +
> +               nb_vals =3D pexpr_or(nb_vals, pexf(node->elem), data,
> +                                       PEXPR_ARGX);
> +       }
> +
> +       c =3D pexpr_implies(nb_vals, dep_both, data, PEXPR_ARGX);
> +       sym_add_constraint(sym, c, data);
> +       pexpr_put(c);
> +}
> +
> +/*
> + * build the constraints for the choice prompt
> + */
> +static void add_choice_prompt_cond(struct symbol *sym, struct cfdata *da=
ta)
> +{
> +       struct property *prompt;
> +       struct pexpr *promptCondition;
> +       struct pexpr *fe_both;
> +       struct pexpr *pr_cond;
> +       struct pexpr *req_cond;
> +
> +       if (!sym_is_boolean(sym))
> +               return;
> +
> +       prompt =3D sym_get_prompt(sym);
> +       if (prompt =3D=3D NULL)
> +               return;
> +
> +       promptCondition =3D
> +               prompt->visible.expr ?
> +                       expr_calculate_pexpr_both(prompt->visible.expr, d=
ata) :
> +                       pexf(data->constants->const_true);
> +       fe_both =3D sym_get_fexpr_both(sym, data);
> +       req_cond =3D pexpr_implies_share(promptCondition, fe_both, data);
> +       sym_add_constraint(sym, req_cond, data);
> +       pr_cond =3D pexpr_implies_share(fe_both, promptCondition, data);
> +       sym_add_constraint(sym, pr_cond, data);
> +       PEXPR_PUT(promptCondition, fe_both, req_cond, pr_cond);
> +}
> +
> +/*
> + * build constraints for dependencies (choice symbols and options)
> + */
> +static void add_choice_dependencies(struct symbol *sym, struct cfdata *d=
ata)
> +{
> +       struct property *prompt;
> +       struct expr *to_parse;
> +       struct pexpr *dep_both;
> +
> +       if (!sym_is_choice(sym) || !sym_is_choice_value(sym))
> +               return;
> +
> +       prompt =3D sym_get_prompt(sym);
> +       if (prompt =3D=3D NULL)
> +               return;
> +
> +       if (sym_is_choice(sym)) {
> +               if (!prompt->visible.expr)
> +                       return;
> +               to_parse =3D prompt->visible.expr;
> +       } else {
> +               if (!sym->dir_dep.expr)
> +                       return;
> +               to_parse =3D sym->dir_dep.expr;
> +       }
> +
> +       dep_both =3D expr_calculate_pexpr_both(to_parse, data);
> +
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               struct pexpr *dep_y =3D expr_calculate_pexpr_y(to_parse, =
data);
> +               struct pexpr *c1 =3D pexpr_implies(pexf(sym->fexpr_y), de=
p_y,
> +                                                     data, PEXPR_ARG1);
> +               struct pexpr *c2 =3D pexpr_implies(
> +                       pexf(sym->fexpr_m), dep_both, data, PEXPR_ARG1);
> +
> +               sym_add_constraint_eq(sym, c1, data);
> +               sym_add_constraint_eq(sym, c2, data);
> +               PEXPR_PUT(dep_y, c1, c2);
> +       } else if (sym->type =3D=3D S_BOOLEAN) {
> +               struct pexpr *c =3D pexpr_implies(
> +                       pexf(sym->fexpr_y), dep_both, data, PEXPR_ARG1);
> +
> +               sym_add_constraint_eq(sym, c, data);
> +               pexpr_put(c);
> +       }
> +       pexpr_put(dep_both);
> +}
> +
> +/*
> + * build constraints for the choice groups
> + */
> +static void add_choice_constraints(struct symbol *sym, struct cfdata *da=
ta)
> +{
> +       struct property *prompt;
> +       struct symbol *choice, *choice2;
> +       struct sym_node *node, *node2;
> +       struct sym_list *items, *promptItems;
> +       struct pexpr *c1;
> +       struct menu *menu_ptr, *choiceval_menu;
> +
> +       if (!sym_is_boolean(sym))
> +               return;
> +
> +       prompt =3D sym_get_prompt(sym);
> +       if (prompt =3D=3D NULL)
> +               return;
> +
> +       /* create list of all choice options */
> +       items =3D sym_list_init();
> +       /* create list of choice options with a prompt */
> +       promptItems =3D sym_list_init();
> +
> +       for_all_choices(sym, choiceval_menu, menu_ptr) {
> +               choice =3D choiceval_menu->sym;
> +
> +               sym_list_add(items, choice);
> +               if (sym_get_prompt(choice) !=3D NULL)
> +                       sym_list_add(promptItems, choice);
> +       }
> +
> +       /* if the choice is set to yes, at least one child must be set to=
 yes */
> +       c1 =3D NULL;
> +       sym_list_for_each(node, promptItems) {
> +               choice =3D node->elem;
> +               c1 =3D node->prev =3D=3D NULL ?
> +                            pexf(choice->fexpr_y) :
> +                            pexpr_or(c1, pexf(choice->fexpr_y), data,
> +                                          PEXPR_ARGX);
> +       }
> +       if (c1 !=3D NULL) {
> +               struct pexpr *c2 =3D pexpr_implies(pexf(sym->fexpr_y), c1=
,
> +                                                     data, PEXPR_ARG1);
> +
> +               sym_add_constraint(sym, c2, data);
> +               PEXPR_PUT(c1, c2);
> +       }
> +
> +       /* every choice option (even those without a prompt) implies the =
choice */
> +       sym_list_for_each(node, items) {
> +               choice =3D node->elem;
> +               c1 =3D pexpr_implies(sym_get_fexpr_both(choice, data),
> +                                       sym_get_fexpr_both(sym, data), da=
ta,
> +                                       PEXPR_ARGX);
> +               sym_add_constraint(sym, c1, data);
> +               pexpr_put(c1);
> +       }
> +
> +       /* choice options can only select mod, if the entire choice is mo=
d */
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               sym_list_for_each(node, items) {
> +                       choice =3D node->elem;
> +                       if (choice->type =3D=3D S_TRISTATE) {
> +                               c1 =3D pexpr_implies(pexf(choice->fexpr_m=
),
> +                                                       pexf(sym->fexpr_m=
),
> +                                                       data, PEXPR_ARGX)=
;
> +                               sym_add_constraint(sym, c1, data);
> +                               pexpr_put(c1);
> +                       }
> +               }
> +       }
> +
> +       /* tristate options cannot be m, if the choice symbol is boolean =
*/
> +       if (sym->type =3D=3D S_BOOLEAN) {
> +               sym_list_for_each(node, items) {
> +                       choice =3D node->elem;
> +                       if (choice->type =3D=3D S_TRISTATE) {
> +                               struct pexpr *e =3D pexpr_not(pexf(choice=
->fexpr_m),
> +                                                      data);
> +                               sym_add_constraint(sym, e, data);
> +                               pexpr_put(e);
> +                       }
> +               }
> +       }
> +
> +       /* all choice options are mutually exclusive for yes */
> +       sym_list_for_each(node, promptItems) {
> +               choice =3D node->elem;
> +               for (struct sym_node *node2 =3D node->next; node2 !=3D NU=
LL;
> +                    node2 =3D node2->next) {
> +                       choice2 =3D node2->elem;
> +                       c1 =3D pexpr_or(
> +                               pexpr_not(pexf(choice->fexpr_y), data),
> +                               pexpr_not(pexf(choice2->fexpr_y), data),
> +                               data, PEXPR_ARGX);
> +                       sym_add_constraint(sym, c1, data);
> +                       pexpr_put(c1);
> +               }
> +       }
> +
> +       /* if one choice option with a prompt is set to yes,
> +        * then no other option may be set to mod
> +        */
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               sym_list_for_each(node, promptItems) {
> +                       struct sym_list *tmp;
> +
> +                       choice =3D node->elem;
> +
> +                       tmp =3D sym_list_init();
> +                       for (struct sym_node *node2 =3D node->next; node2=
 !=3D NULL;
> +                            node2 =3D node2->next) {
> +                               choice2 =3D node2->elem;
> +                               if (choice2->type =3D=3D S_TRISTATE)
> +                                       sym_list_add(tmp, choice2);
> +                       }
> +                       if (tmp->size =3D=3D 0)
> +                               continue;
> +
> +                       sym_list_for_each(node2, tmp) {
> +                               choice2 =3D node2->elem;
> +                               if (node2->prev =3D=3D NULL)
> +                                       c1 =3D pexpr_not(
> +                                               pexf(choice2->fexpr_m), d=
ata);
> +                               else
> +                                       c1 =3D pexpr_and(
> +                                               c1,
> +                                               pexpr_not(
> +                                                       pexf(choice2->fex=
pr_m),
> +                                                       data),
> +                                               data, PEXPR_ARGX);
> +                       }
> +                       c1 =3D pexpr_implies(pexf(choice->fexpr_y), c1, d=
ata,
> +                                               PEXPR_ARGX);
> +                       sym_add_constraint(sym, c1, data);
> +                       pexpr_put(c1);
> +               }
> +       }
> +       sym_list_free(promptItems);
> +       sym_list_free(items);
> +}
> +
> +/*
> + * build the constraints for invisible options such as defaults
> + */
> +static void add_invisible_constraints(struct symbol *sym, struct cfdata =
*data)
> +{
> +       struct property *prompt =3D sym_get_prompt(sym);
> +       struct pexpr *promptCondition_both, *promptCondition_yes, *noProm=
ptCond;
> +       struct pexpr *npc;
> +       struct defm_list *defaults;
> +       struct pexpr *default_y, *default_m, *default_both;
> +
> +       /* no constraints for the prompt, nothing to do here */
> +       if (prompt !=3D NULL && !prompt->visible.expr)
> +               return;
> +
> +       if (prompt =3D=3D NULL) {
> +               promptCondition_both =3D pexf(data->constants->const_fals=
e);
> +               promptCondition_yes =3D pexf(data->constants->const_false=
);
> +               noPromptCond =3D pexf(data->constants->const_true);
> +       } else {
> +               struct property *p;
> +
> +               promptCondition_both =3D pexf(data->constants->const_fals=
e);
> +               promptCondition_yes =3D pexf(data->constants->const_false=
);
> +
> +               /* some symbols have multiple prompts */
> +               for_all_prompts(sym, p) {
> +                       promptCondition_both =3D
> +                               pexpr_or(promptCondition_both,
> +                                             expr_calculate_pexpr_both(
> +                                                     p->visible.expr, da=
ta),
> +                                             data, PEXPR_ARGX);
> +                       promptCondition_yes =3D pexpr_or(
> +                               promptCondition_yes,
> +                               expr_calculate_pexpr_y(p->visible.expr, d=
ata),
> +                               data, PEXPR_ARGX);
> +               }
> +               noPromptCond =3D pexpr_not_share(promptCondition_both, da=
ta);
> +       }
> +
> +       if (NPC_OPTIMISATION) {
> +               struct fexpr *npc_fe =3D
> +                       fexpr_create(data->sat_variable_nr++, FE_NPC, "")=
;
> +
> +               if (sym_is_choice(sym))
> +                       str_append(&npc_fe->name, "Choice_");
> +
> +               str_append(&npc_fe->name, sym_get_name(sym));
> +               str_append(&npc_fe->name, "_NPC");
> +               sym->noPromptCond =3D npc_fe;
> +               fexpr_add_to_satmap(npc_fe, data);
> +
> +               npc =3D pexf(npc_fe);
> +
> +               if (!sym_is_choice_value(sym) && !sym_is_choice(sym)) {
> +                       struct pexpr *c =3D
> +                               pexpr_implies_share(noPromptCond, npc, da=
ta);
> +                       sym_add_constraint(sym, c, data);
> +                       pexpr_put(c);
> +               }
> +       } else {
> +               npc =3D pexpr_get(noPromptCond);
> +       }
> +
> +       defaults =3D get_defaults(sym, data);
> +       default_y =3D get_default_y(defaults, data);
> +       default_m =3D get_default_m(defaults, data);
> +       default_both =3D pexpr_or_share(default_y, default_m, data);
> +
> +       /* tristate elements are only selectable as yes, if they are visi=
ble as yes */
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               struct pexpr *e1 =3D pexpr_implies(
> +                       promptCondition_both,
> +                       pexpr_implies(pexf(sym->fexpr_y),
> +                                          promptCondition_yes, data,
> +                                          PEXPR_ARG1),
> +                       data, PEXPR_ARG2);
> +
> +               sym_add_constraint(sym, e1, data);
> +               pexpr_put(e1);
> +       }
> +
> +       /* if invisible and off by default, then a symbol can only be dea=
ctivated by its reverse
> +        * dependencies
> +        */
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               struct pexpr *sel_y, *sel_m, *sel_both;
> +               struct pexpr *c1, *c2, *c3;
> +               struct pexpr *d1, *d2, *d3;
> +               struct pexpr *e1, *e2, *e3;
> +
> +               if (sym->fexpr_sel_y !=3D NULL) {
> +                       sel_y =3D pexpr_implies(pexf(sym->fexpr_y),
> +                                                  pexf(sym->fexpr_sel_y)=
, data,
> +                                                  PEXPR_ARGX);
> +                       sel_m =3D pexpr_implies(pexf(sym->fexpr_m),
> +                                                  pexf(sym->fexpr_sel_m)=
, data,
> +                                                  PEXPR_ARGX);
> +                       sel_both =3D pexpr_implies(
> +                               pexf(sym->fexpr_y),
> +                               pexpr_or(pexf(sym->fexpr_sel_m),
> +                                             pexf(sym->fexpr_sel_y), dat=
a,
> +                                             PEXPR_ARGX),
> +                               data, PEXPR_ARGX);
> +               } else {
> +                       sel_y =3D pexpr_not(pexf(sym->fexpr_y), data);
> +                       sel_m =3D pexpr_not(pexf(sym->fexpr_m), data);
> +                       sel_both =3D pexpr_get(sel_y);
> +               }
> +
> +               c1 =3D pexpr_implies(pexpr_not_share(default_y, data), se=
l_y,
> +                                       data, PEXPR_ARG1);
> +               c2 =3D pexpr_implies(pexf(modules_sym->fexpr_y), c1, data=
,
> +                                       PEXPR_ARG1);
> +               c3 =3D pexpr_implies_share(npc, c2, data);
> +               sym_add_constraint(sym, c3, data);
> +
> +               d1 =3D pexpr_implies(pexpr_not_share(default_m, data), se=
l_m,
> +                                       data, PEXPR_ARG1);
> +               d2 =3D pexpr_implies(pexf(modules_sym->fexpr_y), d1, data=
,
> +                                       PEXPR_ARG1);
> +               d3 =3D pexpr_implies_share(npc, d2, data);
> +               sym_add_constraint(sym, d3, data);
> +
> +               e1 =3D pexpr_implies(pexpr_not_share(default_both, data),
> +                                       sel_both, data, PEXPR_ARG1);
> +               e2 =3D pexpr_implies(
> +                       pexpr_not(pexf(modules_sym->fexpr_y), data), e1,
> +                       data, PEXPR_ARG1);
> +               e3 =3D pexpr_implies_share(npc, e2, data);
> +               sym_add_constraint(sym, e3, data);
> +               PEXPR_PUT(sel_y, sel_m, sel_both, c1, c2, c3, d1, d2, d3,=
 e1,
> +                         e2, e3);
> +       } else if (sym->type =3D=3D S_BOOLEAN) {
> +               struct pexpr *sel_y;
> +               struct pexpr *e1, *e2;
> +
> +               if (sym->fexpr_sel_y !=3D NULL)
> +                       sel_y =3D pexpr_implies(pexf(sym->fexpr_y),
> +                                                  pexf(sym->fexpr_sel_y)=
, data,
> +                                                  PEXPR_ARGX);
> +               else
> +                       sel_y =3D pexpr_not(pexf(sym->fexpr_y), data);
> +
> +               e1 =3D pexpr_implies(pexpr_not_share(default_both, data),
> +                                       sel_y, data, PEXPR_ARG1);
> +               e2 =3D pexpr_implies_share(npc, e1, data);
> +
> +               sym_add_constraint_eq(sym, e2, data);
> +               PEXPR_PUT(sel_y, e1, e2);
> +       } else {
> +               /* if non-boolean is invisible and no default's condition=
 is
> +                * fulfilled, then the symbol is not set
> +                */
> +               struct pexpr *default_any =3D get_default_any(sym, data);
> +               struct pexpr *e1 =3D pexf(data->constants->const_true);
> +               struct pexpr *e2, *e3;
> +
> +               /* e1 =3D "sym is not set" */
> +               for (struct fexpr_node *node =3D sym->nb_vals->head->next=
;
> +                    node !=3D NULL; node =3D node->next)
> +                       e1 =3D pexpr_and(
> +                               e1, pexpr_not(pexf(node->elem), data),
> +                               data, PEXPR_ARGX);
> +
> +               e2 =3D pexpr_implies(pexpr_not_share(default_any, data), =
e1,
> +                                       data, PEXPR_ARG1);
> +               e3 =3D pexpr_implies_share(npc, e2, data);
> +
> +               sym_add_constraint(sym, e3, data);
> +               PEXPR_PUT(default_any, e1, e2, e3);
> +       }
> +
> +       /* if invisible and on by default, then a symbol can only be deac=
tivated by its
> +        * dependencies
> +        */
> +       if (defaults->size =3D=3D 0) {
> +               // nothing to do
> +       } else if (sym->type =3D=3D S_TRISTATE) {
> +               struct pexpr *e1;
> +               struct pexpr *e2;
> +
> +               e1 =3D pexpr_implies(npc,
> +                                       pexpr_implies(default_y,
> +                                                          pexf(sym->fexp=
r_y),
> +                                                          data, PEXPR_AR=
G2),
> +                                       data, PEXPR_ARG2);
> +               sym_add_constraint(sym, e1, data);
> +
> +               e2 =3D pexpr_implies(
> +                       npc,
> +                       pexpr_implies(default_m,
> +                                          sym_get_fexpr_both(sym, data),
> +                                          data, PEXPR_ARG2),
> +                       data, PEXPR_ARG2);
> +               sym_add_constraint(sym, e2, data);
> +               PEXPR_PUT(e1, e2);
> +       } else if (sym->type =3D=3D S_BOOLEAN) {
> +               struct pexpr *c;
> +               struct pexpr *c2;
> +
> +               c =3D pexpr_implies(default_both, pexf(sym->fexpr_y), dat=
a,
> +                                      PEXPR_ARG2);
> +
> +               // TODO tristate choice hack
> +
> +               c2 =3D pexpr_implies_share(npc, c, data);
> +               sym_add_constraint(sym, c2, data);
> +               PEXPR_PUT(c, c2);
> +       } else {
> +               /* if non-boolean invisible, then it assumes the correct
> +                * default (if any).
> +                */
> +               struct defm_node *node;
> +               struct pexpr *cond, *c;
> +               struct fexpr *f;
> +
> +               defm_list_for_each(node, defaults) {
> +                       f =3D node->elem->val;
> +                       cond =3D node->elem->e;
> +                       c =3D pexpr_implies(npc,
> +                                              pexpr_implies(cond, pexf(f=
), data, PEXPR_ARG2),
> +                                              data, PEXPR_ARG2);
> +                       sym_add_constraint(sym, c, data);
> +                       pexpr_put(c);
> +               }
> +       }
> +
> +       PEXPR_PUT(promptCondition_yes, promptCondition_both, noPromptCond=
, npc,
> +                 default_y, default_m, default_both);
> +       defm_list_destruct(defaults);
> +}
> +
> +/*
> + * add the known values from the default and range properties
> + */
> +static void sym_add_nonbool_values_from_default_range(struct symbol *sym=
,
> +                                                     struct cfdata *data=
)
> +{
> +       struct property *p;
> +
> +       for_all_defaults(sym, p) {
> +               if (p =3D=3D NULL)
> +                       continue;
> +
> +               /* add the value to known values, if it doesn't exist yet=
 */
> +               sym_create_nonbool_fexpr(sym, p->expr->left.sym->name, da=
ta);
> +       }
> +
> +       for_all_properties(sym, p, P_RANGE) {
> +               if (p =3D=3D NULL)
> +                       continue;
> +
> +               /* add the values to known values, if they don't exist ye=
t */
> +               sym_create_nonbool_fexpr(sym, p->expr->left.sym->name, da=
ta);
> +               sym_create_nonbool_fexpr(sym, p->expr->right.sym->name, d=
ata);
> +       }
> +}
> +
> +/*
> + * build the range constraints for int/hex:
> + * For each range and each value in `sym->nb_vals` that's not in the ran=
ge:
> + *     If the range's condition is fulfilled, then sym can't have this v=
alue.
> + */
> +static void sym_add_range_constraints(struct symbol *sym, struct cfdata =
*data)
> +{
> +       struct property *prop;
> +       struct pexpr *prevs;
> +       struct pexpr *propCond;
> +       struct pexpr_list *prevCond; // list of all conditions of the ran=
ges
> +               // from the previous iterations
> +       prevCond =3D pexpr_list_init();
> +
> +       for_all_properties(sym, prop, P_RANGE) {
> +               int base;
> +               long long range_min, range_max, tmp;
> +               struct fexpr_node *node;
> +
> +               if (prop =3D=3D NULL)
> +                       continue;
> +
> +               prevs =3D pexf(data->constants->const_true);
> +               propCond =3D prop_get_condition(prop, data);
> +
> +               // construct prevs as "none of the previous ranges' condi=
tions
> +               // were fulfilled but this range's condition is"
> +               if (prevCond->size =3D=3D 0) {
> +                       pexpr_put(prevs);
> +                       prevs =3D pexpr_get(propCond);
> +;
> +               } else {
> +                       struct pexpr_node *node;
> +
> +                       pexpr_list_for_each(node, prevCond)
> +                               prevs =3D pexpr_and(pexpr_not_share(node-=
>elem,
> +                                                                 data),
> +                                                 prevs, data, PEXPR_ARGX=
);
> +
> +                       prevs =3D pexpr_and(propCond, prevs, data,
> +                                              PEXPR_ARG2);
> +               }
> +               pexpr_list_add(prevCond, pexpr_get(propCond));
> +
> +               switch (sym->type) {
> +               case S_INT:
> +                       base =3D 10;
> +                       break;
> +               case S_HEX:
> +                       base =3D 16;
> +                       break;
> +               default:
> +                       return;
> +               }
> +
> +               range_min =3D sym_get_range_val(prop->expr->left.sym, bas=
e);
> +               range_max =3D sym_get_range_val(prop->expr->right.sym, ba=
se);
> +
> +               /* can skip the first non-boolean value, since this is 'n=
' */
> +               fexpr_list_for_each(node, sym->nb_vals) {
> +                       struct pexpr *not_nb_val;
> +                       struct pexpr *c;
> +
> +                       if (node->prev =3D=3D NULL)
> +                               continue;
> +
> +                       tmp =3D strtoll(str_get(&node->elem->nb_val), NUL=
L, base);
> +
> +                       /* known value is in range, nothing to do here */
> +                       if (tmp >=3D range_min && tmp <=3D range_max)
> +                               continue;
> +
> +                       not_nb_val =3D pexpr_not(pexf(node->elem), data);
> +                       c =3D pexpr_implies_share(prevs, not_nb_val, data=
);
> +                       sym_add_constraint(sym, c, data);
> +                       PEXPR_PUT(not_nb_val, c);
> +               }
> +               PEXPR_PUT(prevs, propCond);
> +       }
> +
> +       pexpr_list_free_put(prevCond);
> +
> +}
> +
> +/*
> + * at least 1 of the known values for a non-boolean symbol must be true
> + */
> +static void sym_nonbool_at_least_1(struct symbol *sym, struct cfdata *da=
ta)
> +{
> +       struct pexpr *e =3D NULL;
> +       struct fexpr_node *node;
> +
> +       if (!sym_is_nonboolean(sym))
> +               return;
> +
> +       fexpr_list_for_each(node, sym->nb_vals) {
> +               if (node->prev =3D=3D NULL)
> +                       e =3D pexf(node->elem);
> +               else
> +                       e =3D pexpr_or(e, pexf(node->elem), data, PEXPR_A=
RGX);
> +       }
> +       sym_add_constraint(sym, e, data);
> +       pexpr_put(e);
> +}
> +
> +/*
> + * at most 1 of the known values for a non-boolean symbol can be true
> + */
> +static void sym_nonbool_at_most_1(struct symbol *sym, struct cfdata *dat=
a)
> +{
> +       struct fexpr_node *node1;
> +
> +       if (!sym_is_nonboolean(sym))
> +               return;
> +
> +       /* iterate over all subsets of sym->nb_vals of size 2 */
> +       fexpr_list_for_each(node1, sym->nb_vals) {
> +               struct pexpr *e1 =3D pexf(node1->elem);
> +
> +               for (struct fexpr_node *node2 =3D node1->next; node2 !=3D=
 NULL;
> +                    node2 =3D node2->next) {
> +                       struct pexpr *e2 =3D pexf(node2->elem);
> +                       struct pexpr *e =3D pexpr_or(pexpr_not_share(e1, =
data),
> +                                                  pexpr_not_share(e2, da=
ta),
> +                                                  data, PEXPR_ARGX);
> +
> +                       sym_add_constraint(sym, e, data);
> +                       PEXPR_PUT(e, e2);
> +               }
> +               pexpr_put(e1);
> +       }
> +}
> +
> +/*
> + * a visible prompt for a non-boolean implies a value for the symbol
> + */
> +static void sym_add_nonbool_prompt_constraint(struct symbol *sym,
> +                                             struct cfdata *data)
> +{
> +       struct property *prompt;
> +       struct pexpr *promptCondition;
> +       struct pexpr *n;
> +       struct pexpr *c =3D NULL;
> +
> +       prompt =3D sym_get_prompt(sym);
> +       if (prompt =3D=3D NULL)
> +               return;
> +
> +       promptCondition =3D prop_get_condition(prompt, data);
> +       n =3D pexf(sym_get_nonbool_fexpr(sym, "n"));
> +
> +       if (n->type !=3D PE_SYMBOL || n->left.fexpr =3D=3D NULL)
> +               goto cleanup;
> +
> +       c =3D pexpr_implies(promptCondition, pexpr_not_share(n, data), da=
ta,
> +                         PEXPR_ARG2);
> +
> +       sym_add_constraint(sym, c, data);
> +
> +cleanup:
> +       PEXPR_PUT(n, promptCondition, c);
> +}
> +
> +static struct default_map *create_default_map_entry(struct fexpr *val,
> +                                                   struct pexpr *e)
> +{
> +       struct default_map *map =3D malloc(sizeof(struct default_map));
> +
> +       pexpr_get(e);
> +       map->val =3D val;
> +       map->e =3D e;
> +
> +       return map;
> +}
> +
> +/**
> + * findDefaultEntry()
> + * @val: Value that the entry must have
> + * @defaults: List of defaults to search in
> + * @constants: To get ``constants->const_false`` from
> + *
> + * Finds an entry in @defaults whose &default_map.val attribute is the s=
ame
> + * pointer as the @val argument.
> + *
> + * Return: The condition &default_map.e of the found entry, or
> + * ``pexf(constants->const_false)`` if none was found. To be pexpr_put()=
 by the
> + * caller.
> + */
> +static struct pexpr *findDefaultEntry(struct fexpr *val,
> +                                     struct defm_list *defaults,
> +                                     struct constants *constants)
> +{
> +       struct defm_node *node;
> +
> +       defm_list_for_each(node, defaults) {
> +               if (val =3D=3D node->elem->val) {
> +                       pexpr_get(node->elem->e);
> +                       return node->elem->e;
> +               }
> +       }
> +
> +       return pexf(constants->const_false);
> +}
> +
> +/*
> + * accumulated during execution of add_defaults(), a disjunction of the
> + * conditions for all default props of a symbol
> + */
> +static struct pexpr *covered;
> +
> +static bool is_tri_as_num(struct symbol *sym)
> +{
> +       if (!sym->name)
> +               return false;
> +
> +       return !strcmp(sym->name, "0")
> +               || !strcmp(sym->name, "1")
> +               || !strcmp(sym->name, "2");
> +}
> +
> +/**
> + * add_to_default_map() - Add to or update an entry in a default list
> + * @entry: Will be consumed by this function, i.e. the caller should and=
 need
> + * only access @entry via @defaults.
> + */
> +static void add_to_default_map(struct defm_list *defaults,
> +                              struct default_map *entry, struct symbol *=
sym)
> +{
> +       /* as this is a map, the entry must be replaced if it already exi=
sts */
> +       if (sym_is_boolean(sym)) {
> +               struct default_map *map;
> +               struct defm_node *node;
> +
> +               defm_list_for_each(node, defaults) {
> +                       map =3D node->elem;
> +                       if (map->val->sym =3D=3D entry->val->sym) {
> +                               pexpr_put(map->e);
> +                               map->e =3D entry->e;
> +                               free(entry);
> +                               return;
> +                       }
> +               }
> +               defm_list_add(defaults, entry);
> +       } else {
> +               struct default_map *map;
> +               struct defm_node *node;
> +
> +               defm_list_for_each(node, defaults) {
> +                       map =3D node->elem;
> +                       if (map->val->satval =3D=3D entry->val->satval) {
> +                               pexpr_put(map->e);
> +                               map->e =3D entry->e;
> +                               free(entry);
> +                               return;
> +                       }
> +               }
> +               defm_list_add(defaults, entry);
> +       }
> +}
> +
> +/**
> + * updateDefaultList() - Update a default list with a new value-conditio=
n pair
> + * @val: The value whose condition will be updated
> + * @newCond: The condition of the default prop. Does not include the con=
dition
> + * that the earlier default's conditions are not fulfilled.
> + * @result: the default list
> + * @sym: the symbol that the defaults belong to
> + *
> + * Update the condition that @val will be used for @sym by considering t=
he next
> + * default property, whose condition is given by @newCond.
> + */
> +static void updateDefaultList(struct fexpr *val, struct pexpr *newCond,
> +                             struct defm_list *result, struct symbol *sy=
m,
> +                             struct cfdata *data)
> +{
> +       // The current condition of @val deduced from the previous defaul=
t props
> +       struct pexpr *prevCond =3D findDefaultEntry(val, result, data->co=
nstants);
> +       // New combined condition for @val
> +       struct pexpr *condUseVal =3D
> +               pexpr_or(prevCond,
> +                        pexpr_and(newCond, pexpr_not_share(covered, data=
),
> +                                  data, PEXPR_ARG2),
> +                        data, PEXPR_ARG2);
> +       add_to_default_map(result, create_default_map_entry(val, condUseV=
al),
> +                          sym);
> +       covered =3D pexpr_or(covered, newCond, data, PEXPR_ARG1);
> +       PEXPR_PUT(prevCond, condUseVal);
> +}
> +
> +/**
> + * add_defaults() - Generate list of default values and their conditions
> + * @defaults: List of the default properties
> + * @ctx: Additional condition that needs to be fulfilled for any default=
. May be
> + * NULL.
> + * @result: List that will be filled
> + * @sym: Symbol that the defaults belong to
> + *
> + * Creates a map from values that @sym can assume to the conditions unde=
r which
> + * they will be assumed. Without @ctx, this will only consider the condi=
tions
> + * directly associated with the defaults, e.g. sym->dir_dep would not be
> + * considered.
> + *
> + * As a side effect, the &symbol->nb_vals of @sym will be added for
> + * all default values (as well as the @symbol->nb_vals of other symbols =
@sym has
> + * as default (recursively)).
> + */
> +static void add_defaults(struct prop_list *defaults, struct expr *ctx,
> +                        struct defm_list *result, struct symbol *sym,
> +                        struct cfdata *data)
> +{
> +       struct prop_node *node;
> +       struct property *p;
> +       struct expr *expr;
> +
> +       prop_list_for_each(node, defaults) {
> +               p =3D node->elem;
> +               /* calculate expr as whether the default's condition (and=
 the
> +                * one inherited from ctx) is fulfilled
> +                */
> +               if (p->visible.expr) {
> +                       if (ctx =3D=3D NULL)
> +                               expr =3D expr_copy(p->visible.expr);
> +                       else
> +                               expr =3D expr_alloc_and(
> +                                       expr_copy(p->visible.expr),
> +                                       expr_copy(ctx));
> +               } else {
> +                       if (ctx =3D=3D NULL)
> +                               expr =3D expr_alloc_symbol(&symbol_yes);
> +                       else
> +                               expr =3D expr_alloc_and(
> +                                       expr_alloc_symbol(&symbol_yes),
> +                                       expr_copy(ctx));
> +               }
> +
> +               /* if tristate and def.value =3D y */
> +               if (p->expr->type =3D=3D E_SYMBOL && sym->type =3D=3D S_T=
RISTATE &&
> +                   p->expr->left.sym =3D=3D &symbol_yes) {
> +                       struct pexpr *expr_y =3D
> +                               expr_calculate_pexpr_y(expr, data);
> +                       struct pexpr *expr_m =3D
> +                               expr_calculate_pexpr_m(expr, data);
> +
> +                       updateDefaultList(data->constants->symbol_yes_fex=
pr,
> +                                         expr_y, result, sym, data);
> +                       updateDefaultList(data->constants->symbol_mod_fex=
pr,
> +                                         expr_m, result, sym, data);
> +                       PEXPR_PUT(expr_y, expr_m);
> +               }
> +               /* if def.value =3D n/m/y */
> +               else if (p->expr->type =3D=3D E_SYMBOL &&
> +                        sym_is_tristate_constant(p->expr->left.sym) &&
> +                        sym_is_boolean(sym)) {
> +                       struct fexpr *s;
> +                       struct pexpr *expr_both =3D
> +                               expr_calculate_pexpr_both(expr, data);
> +
> +                       if (p->expr->left.sym =3D=3D &symbol_yes)
> +                               s =3D data->constants->symbol_yes_fexpr;
> +                       else if (p->expr->left.sym =3D=3D &symbol_mod)
> +                               s =3D data->constants->symbol_mod_fexpr;
> +                       else
> +                               s =3D data->constants->symbol_no_fexpr;
> +
> +                       updateDefaultList(s, expr_both, result, sym, data=
);
> +                       pexpr_put(expr_both);
> +               }
> +               /* if def.value =3D n/m/y, but written as 0/1/2 for a boo=
lean */
> +               else if (sym_is_boolean(sym) && p->expr->type =3D=3D E_SY=
MBOL &&
> +                        p->expr->left.sym->type =3D=3D S_UNKNOWN &&
> +                        is_tri_as_num(p->expr->left.sym)) {
> +                       struct fexpr *s;
> +                       struct pexpr *expr_both =3D
> +                               expr_calculate_pexpr_both(expr, data);
> +
> +                       if (!strcmp(p->expr->left.sym->name, "0"))
> +                               s =3D data->constants->symbol_no_fexpr;
> +                       else if (!strcmp(p->expr->left.sym->name, "1"))
> +                               s =3D data->constants->symbol_mod_fexpr;
> +                       else
> +                               s =3D data->constants->symbol_yes_fexpr;
> +
> +                       updateDefaultList(s, expr_both, result, sym, data=
);
> +                       pexpr_put(expr_both);
> +               }
> +               /* if def.value =3D non-boolean constant */
> +               else if (expr_is_nonbool_constant(p->expr)) {
> +                       struct fexpr *s =3D sym_get_or_create_nonbool_fex=
pr(
> +                               sym, p->expr->left.sym->name, data);
> +                       struct pexpr *expr_both =3D
> +                               expr_calculate_pexpr_both(expr, data);
> +
> +                       updateDefaultList(s, expr_both, result, sym, data=
);
> +                       pexpr_put(expr_both);
> +               }
> +               /* any expression which evaluates to n/m/y for a tristate=
 */
> +               else if (sym->type =3D=3D S_TRISTATE) {
> +                       struct expr *e_tmp =3D expr_alloc_and(expr_copy(p=
->expr),
> +                                                           expr_copy(exp=
r));
> +                       struct pexpr *expr_y =3D
> +                               expr_calculate_pexpr_y(e_tmp, data);
> +                       struct pexpr *expr_m =3D
> +                               expr_calculate_pexpr_m(e_tmp, data);
> +
> +                       updateDefaultList(data->constants->symbol_yes_fex=
pr,
> +                                         expr_y, result, sym, data);
> +                       updateDefaultList(data->constants->symbol_mod_fex=
pr,
> +                                         expr_m, result, sym, data);
> +                       PEXPR_PUT(expr_y, expr_m);
> +                       expr_free(e_tmp);
> +               }
> +               /* if non-boolean && def.value =3D non-boolean symbol */
> +               else if (p->expr->type =3D=3D E_SYMBOL && sym_is_nonboole=
an(sym) &&
> +                        sym_is_nonboolean(p->expr->left.sym)) {
> +                       struct prop_list *nb_sym_defaults =3D prop_list_i=
nit();
> +                       struct property *p_tmp;
> +
> +                       /* Add defaults of other symbol as possible defau=
lts for
> +                        * this symbol
> +                        */
> +                       for_all_defaults(p->expr->left.sym, p_tmp)
> +                               prop_list_add(nb_sym_defaults, p_tmp);
> +
> +                       add_defaults(nb_sym_defaults, expr, result, sym, =
data);
> +                       prop_list_free(nb_sym_defaults);
> +               }
> +               /* any expression which evaluates to n/m/y */
> +               else {
> +                       struct expr *e_tmp =3D expr_alloc_and(expr_copy(p=
->expr),
> +                                                           expr_copy(exp=
r));
> +                       struct pexpr *expr_both =3D
> +                               expr_calculate_pexpr_both(e_tmp, data);
> +
> +                       updateDefaultList(data->constants->symbol_yes_fex=
pr,
> +                                         expr_both, result, sym, data);
> +
> +                       pexpr_put(expr_both);
> +                       expr_free(e_tmp);
> +               }
> +               expr_free(expr);
> +       }
> +}
> +
> +/**
> + * get_defaults() - Generate list of default values and their conditions
> + * @sym: Symbol whose defaults we want to look at
> + *
> + * Creates a map from values that @sym can assume to the conditions unde=
r which
> + * they will be assumed. This will only consider the conditions
> + * directly associated with the defaults, e.g. sym->dir_dep would not be
> + * considered.
> + *
> + * As a side effect, the &symbol->nb_vals of @sym will be added for
> + * all default values (as well as the @symbol->nb_vals of other symbols =
@sym has
> + * as default (recursively)).
> + */
> +static struct defm_list *get_defaults(struct symbol *sym, struct cfdata =
*data)
> +{
> +       struct defm_list *result =3D defm_list_init();
> +       struct prop_list *defaults; /* list of default props of sym */
> +       struct property *p;
> +
> +       covered =3D pexf(data->constants->const_false);
> +
> +       defaults =3D prop_list_init();
> +       for_all_defaults(sym, p)
> +               prop_list_add(defaults, p);
> +
> +       add_defaults(defaults, NULL, result, sym, data);
> +       prop_list_free(defaults);
> +       pexpr_put(covered);
> +
> +       return result;
> +}
> +
> +/*
> + * return the condition for "y", False if it doesn't exist
> + */
> +static struct pexpr *get_default_y(struct defm_list *list, struct cfdata=
 *data)
> +{
> +       struct default_map *entry;
> +       struct defm_node *node;
> +
> +       defm_list_for_each(node, list) {
> +               entry =3D node->elem;
> +               if (entry->val->type =3D=3D FE_SYMBOL &&
> +                   entry->val->sym =3D=3D &symbol_yes) {
> +                       pexpr_get(entry->e);
> +                       return entry->e;
> +               }
> +       }
> +
> +       return pexf(data->constants->const_false);
> +}
> +
> +/*
> + * return the condition for "m", False if it doesn't exist
> + */
> +static struct pexpr *get_default_m(struct defm_list *list, struct cfdata=
 *data)
> +{
> +       struct default_map *entry;
> +       struct defm_node *node;
> +
> +       defm_list_for_each(node, list) {
> +               entry =3D node->elem;
> +               if (entry->val->type =3D=3D FE_SYMBOL &&
> +                   entry->val->sym =3D=3D &symbol_mod) {
> +                       pexpr_get(entry->e);
> +                       return entry->e;
> +               }
> +       }
> +
> +       return pexf(data->constants->const_false);
> +}
> +
> +/*
> + * return the constraint when _some_ default value will be applied
> + */
> +static struct pexpr *get_default_any(struct symbol *sym, struct cfdata *=
data)
> +{
> +       struct property *prop;
> +       struct expr *e;
> +       struct pexpr *p;
> +
> +       if (!sym_is_nonboolean(sym))
> +               return NULL;
> +
> +       p =3D pexf(data->constants->const_false);
> +       for_all_defaults(sym, prop) {
> +               if (prop->visible.expr)
> +                       e =3D expr_copy(prop->visible.expr);
> +               else
> +                       e =3D expr_alloc_symbol(&symbol_yes);
> +
> +               if (expr_can_evaluate_to_mod(e))
> +                       p =3D pexpr_or(p, expr_calculate_pexpr_both(e, da=
ta),
> +                                    data, PEXPR_ARGX);
> +
> +               p =3D pexpr_or(p, expr_calculate_pexpr_y(e, data), data,
> +                            PEXPR_ARGX);
> +
> +               expr_free(e);
> +       }
> +
> +       return p;
> +}
> +
> +/*
> + * get the value for the range
> + */
> +static long sym_get_range_val(struct symbol *sym, int base)
> +{
> +       sym_calc_value(sym);
> +       switch (sym->type) {
> +       case S_INT:
> +               base =3D 10;
> +               break;
> +       case S_HEX:
> +               base =3D 16;
> +               break;
> +       default:
> +               break;
> +       }
> +       return strtol(sym->curr.val, NULL, base);
> +}
> +
> +/*
> + * count the number of all constraints
> + */
> +unsigned int count_counstraints(void)
> +{
> +       unsigned int c =3D 0;
> +       struct symbol *sym;
> +
> +       for_all_symbols(sym) {
> +               if (sym->type =3D=3D S_UNKNOWN)
> +                       continue;
> +
> +               c +=3D sym->constraints->size;
> +       }
> +
> +       return c;
> +}
> +
> +/*
> + * add a constraint for a symbol
> + */
> +void sym_add_constraint(struct symbol *sym, struct pexpr *constraint,
> +                       struct cfdata *data)
> +{
> +       if (!constraint)
> +               return;
> +
> +       /* no need to add that */
> +       if (constraint->type =3D=3D PE_SYMBOL &&
> +           constraint->left.fexpr =3D=3D data->constants->const_true)
> +               return;
> +
> +       /* this should never happen */
> +       if (constraint->type =3D=3D PE_SYMBOL &&
> +           constraint->left.fexpr =3D=3D data->constants->const_false)
> +               perror("Adding const_false.");
> +
> +       pexpr_list_add(sym->constraints, pexpr_get(constraint));
> +
> +       if (!pexpr_is_nnf(constraint))
> +               pexpr_print("Not NNF:", constraint, -1);
> +}
> +
> +/*
> + * add a constraint for a symbol, but check for duplicate constraints
> + */
> +void sym_add_constraint_eq(struct symbol *sym, struct pexpr *constraint,
> +                          struct cfdata *data)
> +{
> +       struct pexpr_node *node;
> +
> +       if (!constraint)
> +               return;
> +
> +       /* no need to add that */
> +       if (constraint->type =3D=3D PE_SYMBOL &&
> +           constraint->left.fexpr =3D=3D data->constants->const_true)
> +               return;
> +
> +       /* this should never happen */
> +       if (constraint->type =3D=3D PE_SYMBOL &&
> +           constraint->left.fexpr =3D=3D data->constants->const_false)
> +               perror("Adding const_false.");
> +
> +       /* check the constraints for the same symbol */
> +       pexpr_list_for_each(node, sym->constraints)
> +               if (pexpr_eq(constraint, node->elem, data))
> +                       return;
> +
> +       pexpr_list_add(sym->constraints, pexpr_get(constraint));
> +
> +       if (!pexpr_is_nnf(constraint))
> +               pexpr_print("Not NNF:", constraint, -1);
> +}
> diff --git a/scripts/kconfig/cf_constraints.h b/scripts/kconfig/cf_constr=
aints.h
> new file mode 100644
> index 000000000000..97a18eaf11ca
> --- /dev/null
> +++ b/scripts/kconfig/cf_constraints.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
> + */
> +
> +#ifndef CF_CONSTRAINTS_H
> +#define CF_CONSTRAINTS_H
> +
> +#include "cf_defs.h"
> +#include "expr.h"
> +
> +/* build the constraints for each symbol */
> +void get_constraints(struct cfdata *data);
> +
> +/* count the number of all constraints */
> +unsigned int count_counstraints(void);
> +
> +/* add a constraint for a symbol */
> +void sym_add_constraint(struct symbol *sym, struct pexpr *constraint, st=
ruct cfdata *data);
> +
> +void sym_add_constraint_fexpr(struct symbol *sym, struct fexpr *constrai=
nt);
> +
> +/* add a constraint for a symbol, but check for duplicate constraints */
> +void sym_add_constraint_eq(struct symbol *sym, struct pexpr *constraint,=
 struct cfdata *data);
> +
> +#endif
> --
> 2.39.2
>


--
Best Regards

Masahiro Yamada

