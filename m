Return-Path: <linux-kbuild+bounces-2940-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D738994E8D9
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 10:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9680D282670
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 08:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10B915217F;
	Mon, 12 Aug 2024 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKq+9DI2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7572415572D;
	Mon, 12 Aug 2024 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723452574; cv=none; b=XGUHTIxtAuNTScUvg8QhWnAXhWaU0r5tIVV0Bi2iTSyfEMBtHrEOQoIwQLBWf4GEFJRsSMaq3h8kmN4o87zwTGs3v+x22bKkjbRMMlbz0cQGQkjie6arw/I9iCrRgaekdu8PzYwBlbPUuOWLjGZ+3UW2UWR3oGjoLkG8IAeT/f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723452574; c=relaxed/simple;
	bh=5uPRPN5eheGNqixwz13eCeIergYusE//EuMJ8tqGM+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryoY+q6jiKIHkA8ufND6SyYfJve8i/v0/ZQelR5F0b/cZlgfCDzKXXyvUT6r+ZhPekZjbkYWh7byqeWUQ6/AC1cl8whVbPQpzRrjUXotE3TIUZGaZX+SUVODGO3oJWCbM4dUHHlpa0+PYZ3wWkr5erFy9Hp0/OPMWSAYSSsShBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKq+9DI2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DF8C4AF10;
	Mon, 12 Aug 2024 08:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723452573;
	bh=5uPRPN5eheGNqixwz13eCeIergYusE//EuMJ8tqGM+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OKq+9DI22iO1gY+rAMSeXKMk3IXjj4LRTk9vFfBdJK+YCvwXj44pYWGnWPixAQF4Q
	 FG1Tb/Mz99X3mCEJH/2PL8Czmfjt1Et2Oz98WUWX8hr1btq6cNkA5vd0EXGtfmN/Ed
	 2A7u6yNJ2sZprMQCZevFfg77juz1CNWSrbRrSXuaP4EnmkgsDhPfsFO71Gtsq6p28K
	 1CQfkrcS+Dp0nUxB1fkScSnqAs74QwnaHpgoaqjLHAkSv5xLE+Aqa+16J1aKTFjY3C
	 RE4fsW6js4C9VzQcHNPTTHhL2K4HPWAVvVARZUm1QwCU9KSyh0W7ikkZRwNw+a/D7F
	 bwYX91oKZqYcA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f1798eaee6so38773271fa.0;
        Mon, 12 Aug 2024 01:49:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWERMqbjW7nvD3srFS9H1Fl8XijPWl7w8LQeiExVTyLUtGWsvAGxuMmzf5kTA458jAY5iY7i1eCnkIdglLTxuQYUST9fKcB8nsnd9m
X-Gm-Message-State: AOJu0Yw6h2tTZ/hy95KGvttWMSkWayePGS8ulpmTPSs7BYGc//qqib+e
	tDrNHRjsZogtbOMX4oFlSes0Gu3KJbO0iKVfKMyw7YzSi4B8qWmfMFEEpDH+8TfRuia++PLoYER
	htVmyT9U4Jz72kvRRlM5kTbM4VTE=
X-Google-Smtp-Source: AGHT+IEu1I/euXckkb0M1wKhTAggZvIuXmpoYeEt2oHvrt45hAFQfW3epouCbnnBLzG+Krmv3XTtQ67iq3plycmuEQs=
X-Received: by 2002:a2e:be9d:0:b0:2ef:2dfd:15e3 with SMTP id
 38308e7fff4ca-2f1a6cf2727mr75760691fa.19.1723452572139; Mon, 12 Aug 2024
 01:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710065255.10338-1-ole0811sch@gmail.com> <20240710065255.10338-10-ole0811sch@gmail.com>
In-Reply-To: <20240710065255.10338-10-ole0811sch@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Aug 2024 17:48:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQca===4A_nzYw7o-BkbRwg9G0YBDmBMJPkvpqt9-eQCg@mail.gmail.com>
Message-ID: <CAK7LNAQca===4A_nzYw7o-BkbRwg9G0YBDmBMJPkvpqt9-eQCg@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] kconfig: Add files with utility functions
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, thorsten.berger@rub.de, 
	deltaone@debian.org, jan.sollmann@rub.de, mcgrof@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 3:54=E2=80=AFPM Ole Schuerks <ole0811sch@gmail.com>=
 wrote:
>
> This commit contains various helper functions used in the project.
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
>  scripts/kconfig/cf_utils.c | 1031 ++++++++++++++++++++++++++++++++++++
>  scripts/kconfig/cf_utils.h |  115 ++++
>  2 files changed, 1146 insertions(+)
>  create mode 100644 scripts/kconfig/cf_utils.c
>  create mode 100644 scripts/kconfig/cf_utils.h
>
> diff --git a/scripts/kconfig/cf_utils.c b/scripts/kconfig/cf_utils.c
> new file mode 100644
> index 000000000000..bcffd0a4fc1b
> --- /dev/null
> +++ b/scripts/kconfig/cf_utils.c
> @@ -0,0 +1,1031 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
> + */
> +
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
> +#include <ctype.h>
> +
> +#include "configfix.h"
> +#include "internal.h"
> +
> +#define SATMAP_INIT_SIZE 2
> +
> +static PicoSAT *pico;
> +
> +static void unfold_cnf_clause(struct pexpr *e);
> +static void build_cnf_tseytin(struct pexpr *e, struct cfdata *data);
> +
> +static void build_cnf_tseytin_top_and(struct pexpr *e, struct cfdata *da=
ta);
> +static void build_cnf_tseytin_top_or(struct pexpr *e, struct cfdata *dat=
a);
> +
> +static void build_cnf_tseytin_tmp(struct pexpr *e, struct fexpr *t, stru=
ct cfdata *data);
> +static void build_cnf_tseytin_and(struct pexpr *e, struct fexpr *t, stru=
ct cfdata *data);
> +static void build_cnf_tseytin_or(struct pexpr *e, struct fexpr *t, struc=
t cfdata *data);
> +static int pexpr_satval(struct pexpr *e);
> +
> +/*
> + * parse Kconfig-file and read .config
> + */
> +void init_config(const char *Kconfig_file)
> +{
> +       conf_parse(Kconfig_file);
> +       conf_read(NULL);
> +}
> +
> +/*
> + * initialize satmap
> + */
> +void init_data(struct cfdata *data)
> +{
> +       /* create hashtable with all fexpr */
> +       data->satmap =3D xcalloc(SATMAP_INIT_SIZE, sizeof(**data->satmap)=
);
> +       data->satmap_size =3D SATMAP_INIT_SIZE;


This is a bug.

xcalloc() allocated much bigger memory than used.




> +       printd("done.\n");
> +}
> +
> +/*
> + * create SAT-variables for all fexpr
> + */
> +void create_sat_variables(struct cfdata *data)
> +{
> +       struct symbol *sym;
> +
> +       printd("Creating SAT-variables...");
> +
> +       for_all_symbols(sym) {
> +               sym->constraints =3D pexpr_list_init();
> +               sym_create_fexpr(sym, data);
> +       }
> +
> +       printd("done.\n");
> +}
> +
> +/*
> + * create various constants
> + */
> +void create_constants(struct cfdata *data)
> +{
> +       printd("Creating constants...");
> +
> +       /* create TRUE and FALSE constants */
> +       data->constants->const_false =3D fexpr_create(data->sat_variable_=
nr++, FE_FALSE, "False");
> +       // const_false =3D fexpr_create(sat_variable_nr++, FE_FALSE, "Fal=
se");
> +       fexpr_add_to_satmap(data->constants->const_false, data);
> +
> +       data->constants->const_true =3D fexpr_create(data->sat_variable_n=
r++, FE_TRUE, "True");
> +       fexpr_add_to_satmap(data->constants->const_true, data);
> +
> +       /* add fexpr of constants to tristate constants */
> +       symbol_yes.fexpr_y =3D data->constants->const_true;
> +       symbol_yes.fexpr_m =3D data->constants->const_false;
> +
> +       symbol_mod.fexpr_y =3D data->constants->const_false;
> +       symbol_mod.fexpr_m =3D data->constants->const_true;
> +
> +       symbol_no.fexpr_y =3D data->constants->const_false;
> +       symbol_no.fexpr_m =3D data->constants->const_false;
> +
> +       /* create symbols yes/mod/no as fexpr */
> +       data->constants->symbol_yes_fexpr =3D fexpr_create(0, FE_SYMBOL, =
"y");
> +       data->constants->symbol_yes_fexpr->sym =3D &symbol_yes;
> +       data->constants->symbol_yes_fexpr->tri =3D yes;
> +
> +       data->constants->symbol_mod_fexpr =3D fexpr_create(0, FE_SYMBOL, =
"m");
> +       data->constants->symbol_mod_fexpr->sym =3D &symbol_mod;
> +       data->constants->symbol_mod_fexpr->tri =3D mod;
> +
> +       data->constants->symbol_no_fexpr =3D fexpr_create(0, FE_SYMBOL, "=
n");
> +       data->constants->symbol_no_fexpr->sym =3D &symbol_no;
> +       data->constants->symbol_no_fexpr->tri =3D no;
> +
> +       printd("done.\n");
> +}
> +
> +/*
> + * create a temporary SAT-variable
> + */
> +struct fexpr *create_tmpsatvar(struct cfdata *data)
> +{
> +       char *name =3D get_tmp_var_as_char(data->tmp_variable_nr);
> +       struct fexpr *t =3D fexpr_create(data->sat_variable_nr++, FE_TMPS=
ATVAR, name);
> +
> +       ++data->tmp_variable_nr;
> +       fexpr_add_to_satmap(t, data);
> +
> +       free(name);
> +       return t;
> +}
> +
> +/*
> + * return a temporary SAT variable as string
> + */
> +char *get_tmp_var_as_char(int i)
> +{
> +       char *val =3D malloc(sizeof(char) * 18);
> +
> +       snprintf(val, 18, "T_%d", i);
> +       return val;
> +}
> +
> +/*
> + * return a tristate value as a char *
> + */
> +char *tristate_get_char(tristate val)
> +{
> +       switch (val) {
> +       case yes:
> +               return "yes";
> +       case mod:
> +               return "mod";
> +       case no:
> +               return "no";
> +       default:
> +               return "";
> +       }
> +}
> +
> +/*
> + *check whether an expr can evaluate to mod
> + */
> +bool expr_can_evaluate_to_mod(struct expr *e)
> +{
> +       if (!e)
> +               return false;
> +
> +       switch (e->type) {
> +       case E_SYMBOL:
> +               return e->left.sym =3D=3D &symbol_mod || e->left.sym->typ=
e =3D=3D S_TRISTATE ? true : false;
> +       case E_AND:
> +       case E_OR:
> +               return expr_can_evaluate_to_mod(e->left.expr) ||
> +                      expr_can_evaluate_to_mod(e->right.expr);
> +       case E_NOT:
> +               return expr_can_evaluate_to_mod(e->left.expr);
> +       default:
> +               return false;
> +       }
> +}
> +
> +/*
> + * check whether an expr is a non-Boolean constant
> + */
> +bool expr_is_nonbool_constant(struct expr *e)
> +{
> +       if (e->type !=3D E_SYMBOL)
> +               return false;
> +       if (e->left.sym->type !=3D S_UNKNOWN)
> +               return false;
> +
> +       if (e->left.sym->flags & SYMBOL_CONST)
> +               return true;
> +
> +       return string_is_number(e->left.sym->name) || string_is_hex(e->le=
ft.sym->name);
> +}
> +
> +/*
> + * check whether a symbol is a non-Boolean constant
> + */
> +bool sym_is_nonbool_constant(struct symbol *sym)
> +{
> +       if (sym->type !=3D S_UNKNOWN)
> +               return false;
> +
> +       if (sym->flags & SYMBOL_CONST)
> +               return true;
> +
> +       return string_is_number(sym->name) || string_is_hex(sym->name);
> +}
> +
> +/*
> + * print an expr
> + */
> +static void print_expr_util(struct expr *e, int prevtoken)
> +{
> +       if (!e)
> +               return;
> +
> +       switch (e->type) {
> +       case E_SYMBOL:
> +               if (sym_get_name(e->left.sym) !=3D NULL)
> +                       printf("%s", sym_get_name(e->left.sym));
> +               else
> +                       printf("left was null\n");
> +               break;
> +       case E_NOT:
> +               printf("!");
> +               print_expr_util(e->left.expr, E_NOT);
> +               break;
> +       case E_AND:
> +               if (prevtoken !=3D E_AND && prevtoken !=3D 0)
> +                       printf("(");
> +               print_expr_util(e->left.expr, E_AND);
> +               printf(" && ");
> +               print_expr_util(e->right.expr, E_AND);
> +               if (prevtoken !=3D E_AND && prevtoken !=3D 0)
> +                       printf(")");
> +               break;
> +       case E_OR:
> +               if (prevtoken !=3D E_OR && prevtoken !=3D 0)
> +                       printf("(");
> +               print_expr_util(e->left.expr, E_OR);
> +               printf(" || ");
> +               print_expr_util(e->right.expr, E_OR);
> +               if (prevtoken !=3D E_OR && prevtoken !=3D 0)
> +                       printf(")");
> +               break;
> +       case E_EQUAL:
> +       case E_UNEQUAL:
> +               if (e->left.sym->name)
> +                       printf("%s", e->left.sym->name);
> +               else
> +                       printf("left was null\n");
> +               printf("%s", e->type =3D=3D E_EQUAL ? "=3D" : "!=3D");
> +               printf("%s", e->right.sym->name);
> +               break;
> +       case E_LEQ:
> +       case E_LTH:
> +               if (e->left.sym->name)
> +                       printf("%s", e->left.sym->name);
> +               else
> +                       printf("left was null\n");
> +               printf("%s", e->type =3D=3D E_LEQ ? "<=3D" : "<");
> +               printf("%s", e->right.sym->name);
> +               break;
> +       case E_GEQ:
> +       case E_GTH:
> +               if (e->left.sym->name)
> +                       printf("%s", e->left.sym->name);
> +               else
> +                       printf("left was null\n");
> +               printf("%s", e->type =3D=3D E_GEQ ? ">=3D" : ">");
> +               printf("%s", e->right.sym->name);
> +               break;
> +       case E_RANGE:
> +               printf("[");
> +               printf("%s", e->left.sym->name);
> +               printf(" ");
> +               printf("%s", e->right.sym->name);
> +               printf("]");
> +               break;
> +       default:
> +               break;
> +       }
> +}
> +void print_expr(char *tag, struct expr *e, int prevtoken)
> +{
> +       printf("%s ", tag);
> +       print_expr_util(e, prevtoken);
> +       printf("\n");
> +}
> +


This is the same as the existing expr_fprint() except that
it prints the 'tag'.


If you need this, presumably you need to do code refactoring.







> +/*
> + * check, if the symbol is a tristate-constant
> + */
> +bool sym_is_tristate_constant(struct symbol *sym)
> +{
> +       return sym =3D=3D &symbol_yes || sym =3D=3D &symbol_mod || sym =
=3D=3D &symbol_no;
> +}
> +
> +/*
> + * check, if a symbol is of type boolean or tristate
> + */
> +bool sym_is_boolean(struct symbol *sym)
> +{
> +       return sym->type =3D=3D S_BOOLEAN || sym->type =3D=3D S_TRISTATE;
> +}
> +
> +/*
> + * check, if a symbol is a boolean/tristate or a tristate constant
> + */
> +bool sym_is_bool_or_triconst(struct symbol *sym)
> +{
> +       return sym_is_tristate_constant(sym) || sym_is_boolean(sym);
> +}
> +
> +/*
> + * check, if a symbol is of type int, hex, or string
> + */
> +bool sym_is_nonboolean(struct symbol *sym)
> +{
> +       return sym->type =3D=3D S_INT || sym->type =3D=3D S_HEX || sym->t=
ype =3D=3D S_STRING;
> +}
> +
> +/*
> + * check, if a symbol has a prompt
> + */
> +bool sym_has_prompt(struct symbol *sym)
> +{
> +       struct property *prop;
> +
> +       for_all_prompts(sym, prop)
> +               return true;
> +
> +       return false;
> +}
> +
> +/*
> + * return the prompt of the symbol if there is one, NULL otherwise
> + */
> +struct property *sym_get_prompt(struct symbol *sym)
> +{
> +       struct property *prop;
> +
> +       for_all_prompts(sym, prop)
> +               return prop;
> +
> +       return NULL;
> +}
> +
> +/*
> + * return the condition for the property, NULL if there is none. To be p=
expr_put
> + * by caller.
> + */
> +struct pexpr *prop_get_condition(struct property *prop, struct cfdata *d=
ata)
> +{
> +       if (prop =3D=3D NULL)
> +               return NULL;
> +
> +       /* if there is no condition, return True */
> +       if (!prop->visible.expr)
> +               return pexf(data->constants->const_true);
> +
> +       return expr_calculate_pexpr_both(prop->visible.expr, data);
> +}
> +
> +/*
> + * return the default property, NULL if none exists or can be satisfied
> + */
> +struct property *sym_get_default_prop(struct symbol *sym)
> +{
> +       struct property *prop;
> +
> +       for_all_defaults(sym, prop) {
> +               prop->visible.tri =3D expr_calc_value(prop->visible.expr)=
;
> +               if (prop->visible.tri !=3D no)
> +                       return prop;
> +       }
> +       return NULL;
> +}
> +
> +/*
> + * check whether a non-boolean symbol has a value set
> + */
> +bool sym_nonbool_has_value_set(struct symbol *sym)
> +{
> +       /*
> +        * The built constraints make the following constraints:
> +        *
> +        * visible -> not 'n'
> +        * sym->dir_dep not fulfilled -> 'n'
> +        * invisible -> (no default's condition is fulfilled <-> 'n')
> +        */
> +       struct property *prompt;
> +       struct property *p;
> +
> +       if (!sym_is_nonboolean(sym))
> +               return false;
> +
> +       /* cannot have a value with unmet dependencies */
> +       if (sym->dir_dep.expr && sym->dir_dep.tri =3D=3D no)
> +               return false;
> +
> +       /* visible prompt =3D> value set */
> +       prompt =3D sym_get_prompt(sym);
> +       if (prompt !=3D NULL && prompt->visible.tri !=3D no)
> +               return true;
> +
> +       /* invisible prompt =3D> must get value from default value */
> +       p =3D sym_get_default_prop(sym);
> +       return p !=3D NULL;
> +}
> +
> +/*
> + * return pointer to the name of the symbol or the current prompt-text, =
if it
> + * is a choice symbol
> + */
> +const char *sym_get_name(struct symbol *sym)
> +{
> +       if (sym_is_choice(sym)) {
> +               struct property *prompt =3D sym_get_prompt(sym);
> +
> +               if (prompt =3D=3D NULL)
> +                       return "";
> +
> +               return prompt->text;
> +       } else {
> +               return sym->name;
> +       }
> +}
> +
> +/*
> + * check whether symbol is to be changed
> + */
> +bool sym_is_sdv(struct sdv_list *list, struct symbol *sym)
> +{
> +       struct sdv_node *node;
> +
> +       sdv_list_for_each(node, list)
> +               if (sym =3D=3D node->elem->sym)
> +                       return true;
> +
> +       return false;
> +}
> +
> +/*
> + * print a symbol's name
> + */
> +void print_sym_name(struct symbol *sym)
> +{
> +       printf("Symbol: ");
> +       if (sym_is_choice(sym)) {
> +               struct property *prompt =3D sym_get_prompt(sym);
> +
> +               printf("(Choice) %s", prompt->text);
> +       } else  {
> +               printf("%s", sym->name);
> +       }
> +       printf("\n");
> +}
> +
> +/*
> + * print all constraints for a symbol
> + */
> +void print_sym_constraint(struct symbol *sym)
> +{
> +       struct pexpr_node *node;
> +
> +       pexpr_list_for_each(node, sym->constraints)
> +               pexpr_print("::", node->elem, -1);
> +}
> +
> +/*
> + * print a default map
> + */
> +void print_default_map(struct defm_list *map)
> +{
> +       struct default_map *entry;
> +       struct defm_node *node;
> +
> +       defm_list_for_each(node, map) {
> +               struct gstr s =3D str_new();
> +
> +               entry =3D node->elem;
> +
> +               str_append(&s, "\t");
> +               str_append(&s, str_get(&entry->val->name));
> +               str_append(&s, " ->");
> +               pexpr_print(strdup(str_get(&s)), entry->e, -1);
> +               str_free(&s);
> +       }
> +}
> +
> +/*
> + * check whether a string is a number
> + */
> +bool string_is_number(char *s)
> +{
> +       int len =3D strlen(s);
> +       int i =3D 0;
> +
> +       while (i < len) {
> +               if (!isdigit(s[i]))
> +                       return false;
> +               i++;
> +       }
> +
> +       return true;
> +}
> +
> +/*
> + * check whether a string is a hexadecimal number
> + */
> +bool string_is_hex(char *s)
> +{
> +       int len =3D strlen(s);
> +       int i =3D 2;
> +
> +       if (len >=3D 3 && s[0] =3D=3D '0' && s[1] =3D=3D 'x') {
> +               while (i < len) {
> +                       if (!isxdigit(s[i]))
> +                               return false;
> +                       i++;
> +               }
> +               return true;
> +       } else {
> +               return false;
> +       }
> +}
> +
> +/*
> + * initialize PicoSAT
> + */
> +PicoSAT *initialize_picosat(void)
> +{
> +       PicoSAT *pico;
> +
> +       printd("\nInitializing PicoSAT...");
> +       pico =3D picosat_init();
> +       picosat_enable_trace_generation(pico);
> +       printd("done.\n");
> +
> +       return pico;
> +}
> +
> +/*
> + * construct the CNF-clauses from the constraints
> + */
> +void construct_cnf_clauses(PicoSAT *p, struct cfdata *data)
> +{
> +       struct symbol *sym;
> +
> +       pico =3D p;
> +
> +       /* adding unit-clauses for constants */
> +       sat_add_clause(2, pico, -(data->constants->const_false->satval));
> +       sat_add_clause(2, pico, data->constants->const_true->satval);
> +
> +       for_all_symbols(sym) {
> +               struct pexpr_node *node;
> +
> +               if (sym->type =3D=3D S_UNKNOWN)
> +                       continue;
> +
> +               pexpr_list_for_each(node, sym->constraints) {
> +                       if (pexpr_is_cnf(node->elem)) {
> +                               unfold_cnf_clause(node->elem);
> +                               picosat_add(pico, 0);
> +                       } else {
> +                               build_cnf_tseytin(node->elem, data);
> +                       }
> +
> +               }
> +       }
> +}
> +
> +/*
> + * helper function to add an expression to a CNF-clause
> + */
> +static void unfold_cnf_clause(struct pexpr *e)
> +{
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               picosat_add(pico, e->left.fexpr->satval);
> +               break;
> +       case PE_OR:
> +               unfold_cnf_clause(e->left.pexpr);
> +               unfold_cnf_clause(e->right.pexpr);
> +               break;
> +       case PE_NOT:
> +               picosat_add(pico, -(e->left.pexpr->left.fexpr->satval));
> +               break;
> +       default:
> +               perror("Not in CNF, FE_EQUALS.");
> +       }
> +}
> +
> +/*
> + * build CNF-clauses for a pexpr not in CNF
> + */
> +static void build_cnf_tseytin(struct pexpr *e, struct cfdata *data)
> +{
> +       switch (e->type) {
> +       case PE_AND:
> +               build_cnf_tseytin_top_and(e, data);
> +               break;
> +       case PE_OR:
> +               build_cnf_tseytin_top_or(e, data);
> +               break;
> +       default:
> +               perror("Expression not a propositional logic formula. roo=
t.");
> +       }
> +}
> +
> +/*
> + * split up a pexpr of type AND as both sides must be satisfied
> + */
> +static void build_cnf_tseytin_top_and(struct pexpr *e, struct cfdata *da=
ta)
> +{
> +       if (pexpr_is_cnf(e->left.pexpr))
> +               unfold_cnf_clause(e->left.pexpr);
> +       else
> +               build_cnf_tseytin(e->left.pexpr, data);
> +
> +       if (pexpr_is_cnf(e->right.pexpr))
> +               unfold_cnf_clause(e->right.pexpr);
> +       else
> +               build_cnf_tseytin(e->right.pexpr, data);
> +
> +}
> +
> +static void build_cnf_tseytin_top_or(struct pexpr *e, struct cfdata *dat=
a)
> +{
> +       struct fexpr *t1 =3D NULL, *t2 =3D NULL;
> +       int a, b;
> +
> +       /* set left side */
> +       if (pexpr_is_symbol(e->left.pexpr)) {
> +               a =3D pexpr_satval(e->left.pexpr);
> +       } else {
> +               t1 =3D create_tmpsatvar(data);
> +               a =3D t1->satval;
> +       }
> +
> +       /* set right side */
> +       if (pexpr_is_symbol(e->right.pexpr)) {
> +               b =3D pexpr_satval(e->right.pexpr);
> +       } else {
> +               t2 =3D create_tmpsatvar(data);
> +               b =3D t2->satval;
> +       }
> +
> +       /* A v B */
> +       sat_add_clause(3, pico, a, b);
> +
> +       /* traverse down the tree to build more constraints if needed */
> +       if (!pexpr_is_symbol(e->left.pexpr)) {
> +               if (t1 =3D=3D NULL)
> +                       perror("t1 is NULL.");
> +
> +               build_cnf_tseytin_tmp(e->left.pexpr, t1, data);
> +       }
> +
> +       if (!pexpr_is_symbol(e->right.pexpr)) {
> +               if (t2 =3D=3D NULL)
> +                       perror("t2 is NULL.");
> +
> +               build_cnf_tseytin_tmp(e->right.pexpr, t2, data);
> +       }
> +}
> +
> +/*
> + * build the sub-expressions
> + */
> +static void build_cnf_tseytin_tmp(struct pexpr *e, struct fexpr *t, stru=
ct cfdata *data)
> +{
> +       switch (e->type) {
> +       case PE_AND:
> +               build_cnf_tseytin_and(e, t, data);
> +               break;
> +       case PE_OR:
> +               build_cnf_tseytin_or(e, t, data);
> +               break;
> +       default:
> +               perror("Expression not a propositional logic formula. roo=
t.");
> +       }
> +}
> +
> +/*
> + * build the Tseytin sub-expressions for a pexpr of type AND
> + */
> +static void build_cnf_tseytin_and(struct pexpr *e, struct fexpr *t, stru=
ct cfdata *data)
> +{
> +       struct fexpr *t1 =3D NULL, *t2 =3D NULL;
> +       int a, b, c;
> +
> +       assert(t !=3D NULL);
> +
> +       /* set left side */
> +       if (pexpr_is_symbol(e->left.pexpr)) {
> +               a =3D pexpr_satval(e->left.pexpr);
> +       } else {
> +               t1 =3D create_tmpsatvar(data);
> +               a =3D t1->satval;
> +       }
> +
> +       /* set right side */
> +       if (pexpr_is_symbol(e->right.pexpr)) {
> +               b =3D pexpr_satval(e->right.pexpr);
> +       } else {
> +               t2 =3D create_tmpsatvar(data);
> +               b =3D t2->satval;
> +       }
> +
> +       c =3D t->satval;
> +
> +       /* -A v -B v C */
> +       sat_add_clause(4, pico, -a, -b, c);
> +       /* A v -C */
> +       sat_add_clause(3, pico, a, -c);
> +       /* B v -C */
> +       sat_add_clause(3, pico, b, -c);
> +
> +       /* traverse down the tree to build more constraints if needed */
> +       if (!pexpr_is_symbol(e->left.pexpr)) {
> +               if (t1 =3D=3D NULL)
> +                       perror("t1 is NULL.");
> +
> +               build_cnf_tseytin_tmp(e->left.pexpr, t1, data);
> +       }
> +       if (!pexpr_is_symbol(e->right.pexpr)) {
> +               if (t2 =3D=3D NULL)
> +                       perror("t2 is NULL.");
> +
> +               build_cnf_tseytin_tmp(e->right.pexpr, t2, data);
> +       }
> +}
> +
> +/*
> + * build the Tseytin sub-expressions for a pexpr of type
> + */
> +static void build_cnf_tseytin_or(struct pexpr *e, struct fexpr *t, struc=
t cfdata *data)
> +{
> +       struct fexpr *t1 =3D NULL, *t2 =3D NULL;
> +       int a, b, c;
> +
> +       assert(t !=3D NULL);
> +
> +       /* set left side */
> +       if (pexpr_is_symbol(e->left.pexpr)) {
> +               a =3D pexpr_satval(e->left.pexpr);
> +       } else {
> +               t1 =3D create_tmpsatvar(data);
> +               a =3D t1->satval;
> +       }
> +
> +       /* set right side */
> +       if (pexpr_is_symbol(e->right.pexpr)) {
> +               b =3D pexpr_satval(e->right.pexpr);
> +       } else {
> +               t2 =3D create_tmpsatvar(data);
> +               b =3D t2->satval;
> +       }
> +
> +       c =3D t->satval;
> +
> +       /* A v B v -C */
> +       sat_add_clause(4, pico, a, b, -c);
> +       /* -A v C */;
> +       sat_add_clause(3, pico, -a, c);
> +       /* -B v C */
> +       sat_add_clause(3, pico, -b, c);
> +
> +       /* traverse down the tree to build more constraints if needed */
> +       if (!pexpr_is_symbol(e->left.pexpr)) {
> +               if (t1 =3D=3D NULL)
> +                       perror("t1 is NULL.");
> +
> +               build_cnf_tseytin_tmp(e->left.pexpr, t1, data);
> +       }
> +       if (!pexpr_is_symbol(e->right.pexpr)) {
> +               if (t2 =3D=3D NULL)
> +                       perror("t2 is NULL.");
> +
> +               build_cnf_tseytin_tmp(e->right.pexpr, t2, data);
> +       }
> +}
> +
> +/*
> + * add a clause to PicoSAT
> + * First argument must be the SAT solver
> + */
> +void sat_add_clause(int num, ...)
> +{
> +       va_list valist;
> +       int lit;
> +       PicoSAT *pico;
> +
> +       if (num <=3D 1)
> +               return;
> +
> +       va_start(valist, num);
> +
> +       pico =3D va_arg(valist, PicoSAT *);
> +
> +       /* access all the arguments assigned to valist */
> +       for (int i =3D 1; i < num; i++) {
> +               lit =3D va_arg(valist, int);
> +               picosat_add(pico, lit);
> +       }
> +       picosat_add(pico, 0);
> +
> +       va_end(valist);
> +}
> +
> +/*
> + * return the SAT-variable for a pexpr that is a symbol
> + */
> +static int pexpr_satval(struct pexpr *e)
> +{
> +       if (!pexpr_is_symbol(e)) {
> +               perror("pexpr is not a symbol.");
> +               return -1;
> +       }
> +
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               return e->left.fexpr->satval;
> +       case PE_NOT:
> +               return -(e->left.pexpr->left.fexpr->satval);
> +       default:
> +               perror("Not a symbol.");
> +       }
> +
> +       return -1;
> +}
> +
> +/*
> + * start PicoSAT
> + */
> +void picosat_solve(PicoSAT *pico, struct cfdata *data)
> +{
> +       clock_t start, end;
> +       double time;
> +       int res;
> +
> +       printd("Solving SAT-problem...");
> +
> +       start =3D clock();
> +       res =3D picosat_sat(pico, -1);
> +       end =3D clock();
> +
> +       time =3D ((double) (end - start)) / CLOCKS_PER_SEC;
> +       printd("done. (%.6f secs.)\n\n", time);
> +
> +       if (res =3D=3D PICOSAT_SATISFIABLE) {
> +               printd("=3D=3D=3D> PROBLEM IS SATISFIABLE <=3D=3D=3D\n");
> +
> +       } else if (res =3D=3D PICOSAT_UNSATISFIABLE) {
> +               struct fexpr *e;
> +               int lit;
> +               const int *i;
> +
> +               printd("=3D=3D=3D> PROBLEM IS UNSATISFIABLE <=3D=3D=3D\n"=
);
> +
> +               /* print unsat core */
> +               printd("\nPrinting unsatisfiable core:\n");
> +
> +               i =3D picosat_failed_assumptions(pico);
> +               lit =3D abs(*i++);
> +
> +               while (lit !=3D 0) {
> +                       e =3D data->satmap[lit];
> +
> +                       printd("(%d) %s <%d>\n", lit, str_get(&e->name), =
e->assumption);
> +                       lit =3D abs(*i++);
> +               }
> +       } else {
> +               printd("Unknown if satisfiable.\n");
> +       }
> +}
> +
> +/*
> + * add assumption for a symbol to the SAT-solver
> + */
> +void sym_add_assumption(PicoSAT *pico, struct symbol *sym)
> +{
> +       if (sym_is_boolean(sym)) {
> +               int tri_val =3D sym_get_tristate_value(sym);
> +
> +               sym_add_assumption_tri(pico, sym, tri_val);
> +               return;
> +       }
> +
> +       if (sym_is_nonboolean(sym)) {
> +               struct fexpr *e =3D sym->nb_vals->head->elem;
> +               struct fexpr_node *node;
> +
> +               const char *string_val =3D sym_get_string_value(sym);
> +
> +               if (sym->type =3D=3D S_STRING && !strcmp(string_val, ""))
> +                       return;
> +
> +               /* symbol does not have a value */
> +               if (!sym_nonbool_has_value_set(sym)) {
> +                       /* set value for sym=3Dn */
> +                       picosat_assume(pico, e->satval);
> +                       e->assumption =3D true;
> +
> +                       for (node =3D sym->nb_vals->head->next; node !=3D=
 NULL; node =3D node->next) {
> +                               picosat_assume(pico, -(node->elem->satval=
));
> +                               node->elem->assumption =3D false;
> +                       }
> +
> +                       return;
> +               }
> +
> +               /* symbol does have a value set */
> +
> +               /* set value for sym=3Dn */
> +               picosat_assume(pico, -(e->satval));
> +               e->assumption =3D false;
> +
> +               /* set value for all other fexpr */
> +               fexpr_list_for_each(node, sym->nb_vals) {
> +                       if (node->prev =3D=3D NULL)
> +                               continue;
> +
> +                       if (strcmp(str_get(&node->elem->nb_val), string_v=
al) =3D=3D 0) {
> +                               picosat_assume(pico, node->elem->satval);
> +                               node->elem->assumption =3D true;
> +                       } else {
> +                               picosat_assume(pico, -(node->elem->satval=
));
> +                               node->elem->assumption =3D false;
> +                       }
> +               }
> +       }
> +}
> +
> +/*
> + * add assumption for a boolean symbol to the SAT-solver
> + */
> +void sym_add_assumption_tri(PicoSAT *pico, struct symbol *sym, tristate =
tri_val)
> +{
> +       if (sym->type =3D=3D S_BOOLEAN) {
> +               int a =3D sym->fexpr_y->satval;
> +
> +               switch (tri_val) {
> +               case no:
> +                       picosat_assume(pico, -a);
> +                       sym->fexpr_y->assumption =3D false;
> +                       break;
> +               case mod:
> +                       perror("Should not happen. Boolean symbol is set =
to mod.\n");
> +                       break;
> +               case yes:
> +
> +                       picosat_assume(pico, a);
> +                       sym->fexpr_y->assumption =3D true;
> +                       break;
> +               }
> +       }
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               int a =3D sym->fexpr_y->satval;
> +               int a_m =3D sym->fexpr_m->satval;
> +
> +               switch (tri_val) {
> +               case no:
> +                       picosat_assume(pico, -a);
> +                       picosat_assume(pico, -a_m);
> +                       sym->fexpr_y->assumption =3D false;
> +                       sym->fexpr_m->assumption =3D false;
> +                       break;
> +               case mod:
> +                       picosat_assume(pico, -a);
> +                       picosat_assume(pico, a_m);
> +                       sym->fexpr_y->assumption =3D false;
> +                       sym->fexpr_m->assumption =3D true;
> +                       break;
> +               case yes:
> +                       picosat_assume(pico, a);
> +                       picosat_assume(pico, -a_m);
> +                       sym->fexpr_y->assumption =3D true;
> +                       sym->fexpr_m->assumption =3D false;
> +                       break;
> +               }
> +       }
> +}
> +
> +/*
> + * add assumptions for the symbols to be changed to the SAT solver
> + */
> +void sym_add_assumption_sdv(PicoSAT *pico, struct sdv_list *list)
> +{
> +       struct symbol_dvalue *sdv;
> +       struct sdv_node *node;
> +       int lit_y, lit_m;
> +
> +       sdv_list_for_each(node, list) {
> +               sdv =3D node->elem;
> +               lit_y =3D sdv->sym->fexpr_y->satval;
> +
> +               if (sdv->sym->type =3D=3D S_BOOLEAN) {
> +                       switch (sdv->tri) {
> +                       case yes:
> +                               picosat_assume(pico, lit_y);
> +                               break;
> +                       case no:
> +                               picosat_assume(pico, -lit_y);
> +                               break;
> +                       case mod:
> +                               perror("Should not happen.\n");
> +                       }
> +               } else if (sdv->sym->type =3D=3D S_TRISTATE) {
> +                       lit_m =3D sdv->sym->fexpr_m->satval;
> +
> +                       switch (sdv->tri) {
> +                       case yes:
> +                               picosat_assume(pico, lit_y);
> +                               picosat_assume(pico, -lit_m);
> +                               break;
> +                       case mod:
> +                               picosat_assume(pico, -lit_y);
> +                               picosat_assume(pico, lit_m);
> +                               break;
> +                       case no:
> +                               picosat_assume(pico, -lit_y);
> +                               picosat_assume(pico, -lit_m);
> +                       }
> +               }
> +       }
> +}
> diff --git a/scripts/kconfig/cf_utils.h b/scripts/kconfig/cf_utils.h
> new file mode 100644
> index 000000000000..b71c8731a8ff
> --- /dev/null
> +++ b/scripts/kconfig/cf_utils.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
> + */
> +
> +#ifndef CF_UTILS_H
> +#define CF_UTILS_H
> +
> +#include "expr.h"
> +#include "cf_defs.h"
> +#include "picosat.h"
> +
> +/* parse Kconfig-file and read .config */
> +void init_config(const char *Kconfig_file);
> +
> +/* initialize satmap and cnf_clauses */
> +void init_data(struct cfdata *data);
> +
> +/* assign SAT-variables to all fexpr and create the sat_map */
> +void create_sat_variables(struct cfdata *data);
> +
> +/* create True/False constants */
> +void create_constants(struct cfdata *data);
> +
> +/* create a temporary SAT-variable */
> +struct fexpr *create_tmpsatvar(struct cfdata *data);
> +
> +/* return a temporary SAT variable as string */
> +char *get_tmp_var_as_char(int i);
> +
> +/* return a tristate value as a char * */
> +char *tristate_get_char(tristate val);
> +
> +/* check whether an expr can evaluate to mod */
> +bool expr_can_evaluate_to_mod(struct expr *e);
> +
> +/* check whether an expr is a non-Boolean constant */
> +bool expr_is_nonbool_constant(struct expr *e);
> +
> +/* check whether a symbol is a non-Boolean constant */
> +bool sym_is_nonbool_constant(struct symbol *sym);
> +
> +/* print an expr */
> +void print_expr(char *tag, struct expr *e, int prevtoken);
> +
> +/* check, if the symbol is a tristate-constant */
> +bool sym_is_tristate_constant(struct symbol *sym);
> +
> +/* check, if a symbol is of type boolean or tristate */
> +bool sym_is_boolean(struct symbol *sym);
> +
> +/* check, if a symbol is a boolean/tristate or a tristate constant */
> +bool sym_is_bool_or_triconst(struct symbol *sym);
> +
> +/* check, if a symbol is of type int, hex, or string */
> +bool sym_is_nonboolean(struct symbol *sym);
> +
> +/* check, if a symbol has a prompt */
> +bool sym_has_prompt(struct symbol *sym);
> +
> +/* return the prompt of the symbol, if there is one */
> +struct property *sym_get_prompt(struct symbol *sym);
> +
> +/* return the condition for the property, True if there is none */
> +struct pexpr *prop_get_condition(struct property *prop, struct cfdata *d=
ata);
> +
> +/* return the default property, NULL if none exists or can be satisfied =
*/
> +struct property *sym_get_default_prop(struct symbol *sym);
> +
> +/* check whether a non-boolean symbol has a value set */
> +bool sym_nonbool_has_value_set(struct symbol *sym);
> +
> +/* return the name of the symbol */
> +const char *sym_get_name(struct symbol *sym);
> +
> +/* check whether symbol is to be changed */
> +bool sym_is_sdv(struct sdv_list *list, struct symbol *sym);
> +
> +/* print a symbol's name */
> +void print_sym_name(struct symbol *sym);
> +
> +/* print all constraints for a symbol */
> +void print_sym_constraint(struct symbol *sym);
> +
> +/* print a default map */
> +void print_default_map(struct defm_list *map);
> +
> +/* check whether a string is a number */
> +bool string_is_number(char *s);
> +
> +/* check whether a string is a hexadecimal number */
> +bool string_is_hex(char *s);
> +
> +/* initialize PicoSAT */
> +PicoSAT *initialize_picosat(void);
> +
> +/* construct the CNF-clauses from the constraints */
> +void construct_cnf_clauses(PicoSAT *pico, struct cfdata *data);
> +
> +/* add a clause to PicoSAT */
> +void sat_add_clause(int num, ...);
> +
> +/* start PicoSAT */
> +void picosat_solve(PicoSAT *pico, struct cfdata *data);
> +
> +/* add assumption for a symbol to the SAT-solver */
> +void sym_add_assumption(PicoSAT *pico, struct symbol *sym);
> +
> +/* add assumption for a boolean symbol to the SAT-solver */
> +void sym_add_assumption_tri(PicoSAT *pico, struct symbol *sym, tristate =
tri_val);
> +
> +/* add assumptions for the symbols to be changed to the SAT solver */
> +void sym_add_assumption_sdv(PicoSAT *pico, struct sdv_list *list);
> +
> +#endif
> --
> 2.39.2
>


--
Best Regards

Masahiro Yamada

