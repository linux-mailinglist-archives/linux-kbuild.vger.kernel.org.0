Return-Path: <linux-kbuild+bounces-2939-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F27DF94E8D0
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 10:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FAD11F22493
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 08:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285CF152E17;
	Mon, 12 Aug 2024 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmN/llG+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE89614EC40;
	Mon, 12 Aug 2024 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723452427; cv=none; b=pHs20IHNWWxv1akjEZZi1GwuD4r0HQUedCK9wb+mpMz1p3q2pbq3x99EA9puOOlwotKWrFAIQn1kjPkGrCeiic91mvxp5qUUdgWgaAnJyEXh3Ew4efXTpiXHy0TqmMlvpocECkL/bCVYVay7X98U9uhAnRJnw4CEvqIU6ore+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723452427; c=relaxed/simple;
	bh=E9Geghu9lzVeBV2UAXrWZB24cJWW4+LGNxgC6LnL9Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMWRbfa8v14uoBWLZkRkIpwsrDY7FPXigVG0AiJknxRDLj0wAW1qG/s7xhd5X0PRaxu+97j6yXZAYf3pAoyX0/RdamnwihExmTMdYzOr1KP24e2Lt3r39M/QFdH5CBpwv/6oup6jwEVw9HxGTL4Cl3YRD7xw7KWMDwrNE/oNddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmN/llG+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB1FC4AF12;
	Mon, 12 Aug 2024 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723452426;
	bh=E9Geghu9lzVeBV2UAXrWZB24cJWW4+LGNxgC6LnL9Zk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZmN/llG+JrsZfbdRh/dH1UMGprricDigE6lB6uFGN41qUJF6+qmydH5FtEcpwDZDO
	 VShFLQjqG7mxY9LEkvXT8gaVydP/kZWsKyBGMNFkaAlRCSpPUw8pgM5EIA8+FxNiOn
	 pVN1WirZYH/48EdQi7/j1PrjOp2YvFgftApobGQ2Ym74228ejexXEtkegewlijkcX+
	 COoghykd6T7+bNpsnxkLhVoLyKCVz0poFJdm/oCt/1Onr9W2cfct/GPaqwqg+1ru8e
	 0O3uiNyX2lI60ik/TP90dt0AV15aj5pc37tUTC0dLQiq5gZMVqX5rfrBaO5MFoyIsh
	 b34mBUAcSRaEg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so8162329e87.0;
        Mon, 12 Aug 2024 01:47:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjYIo3ok1U7W6Y2BhIwU96ml3ZP6fHLjGNS/CKixVXhKH4tFwWHZU77W9t8Q0B6Aq/T4km+ryYfN52guLdbRSOdwsAj7yr+R+vDTzf
X-Gm-Message-State: AOJu0YxGoKc4pLSclm4JD+KZJye6W8z4cFI5ltMLTSI85J1lmCR0zoIm
	5IkBn9BTYGXZy85TDWqUUARmXMurTyVjr6Z78J/eBtDoxd3scAcNUNJvG077Ra1LhxFXv+Q42Sz
	Tse9S+WMMmKNovmvSeEp1iLuk7Fg=
X-Google-Smtp-Source: AGHT+IGWbKy+LkaDMReXNgmUafrgOopBv504MpXRtpfIodVZgU4UU+/BqxG5Vxma9u/O/3xtD7a/WvVA6/9YoxJepO8=
X-Received: by 2002:a05:6512:31c4:b0:52c:df8e:a367 with SMTP id
 2adb3069b0e04-530eea129b6mr8007928e87.53.1723452424143; Mon, 12 Aug 2024
 01:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710065255.10338-1-ole0811sch@gmail.com> <20240710065255.10338-8-ole0811sch@gmail.com>
In-Reply-To: <20240710065255.10338-8-ole0811sch@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Aug 2024 17:46:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARA2W41X2n97O-=TXYPrmTsGqL-aMczPHsB2T_Y3QOGrA@mail.gmail.com>
Message-ID: <CAK7LNARA2W41X2n97O-=TXYPrmTsGqL-aMczPHsB2T_Y3QOGrA@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] kconfig: Add files for handling expressions
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, thorsten.berger@rub.de, 
	deltaone@debian.org, jan.sollmann@rub.de, mcgrof@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 3:54=E2=80=AFPM Ole Schuerks <ole0811sch@gmail.com>=
 wrote:
>
> To translate the Kconfig-model into propositional logic and resolve
> conflicts, we need to handle propostional formulas.
> These files contain many functions and macros to deal with
> propositional formulas.
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
>  scripts/kconfig/cf_expr.c | 2594 +++++++++++++++++++++++++++++++++++++
>  scripts/kconfig/cf_expr.h |  296 +++++
>  2 files changed, 2890 insertions(+)
>  create mode 100644 scripts/kconfig/cf_expr.c
>  create mode 100644 scripts/kconfig/cf_expr.h
>
> diff --git a/scripts/kconfig/cf_expr.c b/scripts/kconfig/cf_expr.c
> new file mode 100644
> index 000000000000..f015f91ec8c6
> --- /dev/null
> +++ b/scripts/kconfig/cf_expr.c
> @@ -0,0 +1,2594 @@
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
> +
> +#include "cf_expr.h"
> +#include "cf_defs.h"
> +#include "cf_utils.h"
> +
> +static void create_fexpr_bool(struct symbol *sym, struct cfdata *data);
> +static void create_fexpr_nonbool(struct symbol *sym, struct cfdata *data=
);
> +static void create_fexpr_unknown(struct symbol *sym, struct cfdata *data=
);
> +static void create_fexpr_choice(struct symbol *sym, struct cfdata *data)=
;
> +
> +static void pexpr_print_util(struct pexpr *e, int prevtoken);
> +static void pexpr_shallow_copy(struct pexpr *dest, struct pexpr *org, un=
signed int ref_count);
> +
> +static struct pexpr *pexpr_move_wrapper(
> +       struct pexpr *a, struct pexpr *b, struct cfdata *data,
> +       enum pexpr_move move,
> +       struct pexpr *(*func)(struct pexpr *, struct pexpr *, struct cfda=
ta *));
> +
> +static int trans_count;
> +
> +
> +/*
> + *  create a fexpr
> + */
> +struct fexpr *fexpr_create(int satval, enum fexpr_type type, char *name)
> +{
> +       struct fexpr *e =3D xcalloc(1, sizeof(*e));


Why xcalloc() instead of xmalloc()?

(same for all other places)



> +
> +       e->satval =3D satval;
> +       e->type =3D type;
> +       e->name =3D str_new();
> +       e->assumption =3D false;
> +       str_append(&e->name, name);
> +
> +       return e;
> +}
> +
> +/*
> + * create the fexpr for a symbol
> + */
> +void sym_create_fexpr(struct symbol *sym, struct cfdata *data)
> +{
> +       if (sym_is_choice(sym))
> +               create_fexpr_choice(sym, data);
> +       else if (sym_is_boolean(sym))
> +               create_fexpr_bool(sym, data);
> +       else if (sym_is_nonboolean(sym))
> +               create_fexpr_nonbool(sym, data);
> +       else
> +               create_fexpr_unknown(sym, data);
> +}
> +
> +/*
> + * create the fexpr for symbols with reverse dependencies
> + */
> +static void create_fexpr_selected(struct symbol *sym, struct cfdata *dat=
a)
> +{
> +       struct fexpr *fexpr_sel_y;
> +       struct fexpr *fexpr_sel_m;
> +
> +       /* fexpr_sel_y */
> +       fexpr_sel_y =3D fexpr_create(data->sat_variable_nr++, FE_SELECT, =
sym->name);
> +       str_append(&fexpr_sel_y->name, "_sel_y");
> +       fexpr_sel_y->sym =3D sym;
> +       fexpr_add_to_satmap(fexpr_sel_y, data);
> +
> +       sym->fexpr_sel_y =3D fexpr_sel_y;
> +
> +       /* fexpr_sel_m */
> +       if (sym->type =3D=3D S_BOOLEAN)
> +               return;
> +
> +       fexpr_sel_m =3D fexpr_create(data->sat_variable_nr++, FE_SELECT, =
sym->name);
> +       str_append(&fexpr_sel_m->name, "_sel_m");
> +       fexpr_sel_m->sym =3D sym;
> +       fexpr_add_to_satmap(fexpr_sel_m, data);
> +
> +       sym->fexpr_sel_m =3D fexpr_sel_m;
> +}
> +
> +/*
> + * create the fexpr for a boolean/tristate symbol
> + */
> +static void create_fexpr_bool(struct symbol *sym, struct cfdata *data)
> +{
> +       struct fexpr *fexpr_y;
> +       struct fexpr *fexpr_m;
> +
> +       fexpr_y =3D fexpr_create(data->sat_variable_nr++, FE_SYMBOL, sym-=
>name);
> +       fexpr_y->sym =3D sym;
> +       fexpr_y->tri =3D yes;
> +       fexpr_add_to_satmap(fexpr_y, data);
> +
> +       sym->fexpr_y =3D fexpr_y;
> +
> +
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               fexpr_m =3D fexpr_create(data->sat_variable_nr++, FE_SYMB=
OL, sym->name);
> +               str_append(&fexpr_m->name, "_MODULE");
> +               fexpr_m->sym =3D sym;
> +               fexpr_m->tri =3D mod;
> +               fexpr_add_to_satmap(fexpr_m, data);
> +       } else {
> +               fexpr_m =3D data->constants->const_false;
> +       }
> +
> +       sym->fexpr_m =3D fexpr_m;
> +
> +       if (sym->rev_dep.expr)
> +               create_fexpr_selected(sym, data);
> +}
> +
> +/*
> + * create the fexpr for a non-boolean symbol
> + */
> +static void create_fexpr_nonbool(struct symbol *sym, struct cfdata *data=
)
> +{
> +       /* default values */
> +       char int_values[][2] =3D {"n", "0", "1"};
> +       char hex_values[][4] =3D {"n", "0x0", "0x1"};
> +       char string_values[][9] =3D {"n", "", "nonempty"};
> +
> +       sym->fexpr_y =3D data->constants->const_false;
> +       sym->fexpr_m =3D data->constants->const_false;
> +       sym->nb_vals =3D fexpr_list_init();
> +
> +       for (int i =3D 0; i < 3; i++) {
> +               struct fexpr *e =3D fexpr_create(data->sat_variable_nr++,=
 FE_NONBOOL, sym->name);
> +
> +               e->sym =3D sym;
> +               str_append(&e->name, "=3D");
> +               e->nb_val =3D str_new();
> +
> +               switch (sym->type) {
> +               case S_INT:
> +                       str_append(&e->name, int_values[i]);
> +                       str_append(&e->nb_val, int_values[i]);
> +                       break;
> +               case S_HEX:
> +                       str_append(&e->name, hex_values[i]);
> +                       str_append(&e->nb_val, hex_values[i]);
> +                       break;
> +               case S_STRING:
> +                       str_append(&e->name, string_values[i]);
> +                       str_append(&e->nb_val, string_values[i]);
> +                       break;
> +               default:
> +                       break;
> +               }
> +
> +               fexpr_list_add(sym->nb_vals, e);
> +               fexpr_add_to_satmap(e, data);
> +       }
> +}
> +
> +/*
> + * set fexpr_y and fexpr_m simply to False
> + */
> +static void create_fexpr_unknown(struct symbol *sym, struct cfdata *data=
)
> +{
> +       sym->fexpr_y =3D data->constants->const_false;
> +       sym->fexpr_m =3D data->constants->const_false;
> +}
> +
> +/*
> + * create the fexpr for a choice symbol
> + */
> +static void create_fexpr_choice(struct symbol *sym, struct cfdata *data)
> +{
> +       struct property *prompt;
> +       char *name, *write, *read;
> +       struct fexpr *fexpr_y;
> +       struct fexpr *fexpr_m;
> +
> +       if (!sym_is_boolean(sym))
> +               return;
> +
> +       prompt =3D sym_get_prompt(sym);
> +       if (prompt =3D=3D NULL) {
> +               perror("Choice symbol should have a prompt.");
> +               return;
> +       }
> +
> +       name =3D strdup(prompt->text);
> +
> +       /* remove spaces */
> +       write =3D name;
> +       read =3D name;
> +       do {
> +               if (*read !=3D ' ')
> +                       *write++ =3D *read;
> +       } while (*read++);
> +
> +       fexpr_y =3D fexpr_create(data->sat_variable_nr++, FE_CHOICE, "Cho=
ice_");
> +       str_append(&fexpr_y->name, name);
> +       fexpr_y->sym =3D sym;
> +       fexpr_y->tri =3D yes;
> +       fexpr_add_to_satmap(fexpr_y, data);
> +
> +       sym->fexpr_y =3D fexpr_y;
> +
> +       if (sym->type =3D=3D S_TRISTATE) {
> +               fexpr_m =3D fexpr_create(data->sat_variable_nr++, FE_CHOI=
CE, "Choice_");
> +               str_append(&fexpr_m->name, name);
> +               str_append(&fexpr_m->name, "_MODULE");
> +               fexpr_m->sym =3D sym;
> +               fexpr_m->tri =3D mod;
> +               fexpr_add_to_satmap(fexpr_m, data);
> +       } else {
> +               fexpr_m =3D data->constants->const_false;
> +       }
> +       sym->fexpr_m =3D fexpr_m;
> +       free(name);
> +}
> +
> +/*
> + * evaluate an unequality between a non-Boolean symbol and a constant
> + */
> +static struct pexpr *expr_eval_unequal_nonbool_const(struct symbol *sym,=
 struct symbol *compval,
> +                                                    enum expr_type type,=
 struct cfdata *data)
> +{
> +       int base;
> +       struct pexpr *c;
> +       long val;
> +       struct fexpr_node *node;
> +       struct fexpr *fe;
> +
> +       if (!sym || !compval)
> +               return pexf(data->constants->const_false);
> +
> +       base =3D 0;
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
> +
> +       c =3D pexf(data->constants->const_false);
> +       val =3D strtol(compval->name, NULL, base);
> +       for (node =3D sym->nb_vals->head->next; node !=3D NULL; node =3D =
node->next) {
> +               long symval;
> +
> +               fe =3D node->elem;
> +               symval =3D strtol(str_get(&fe->nb_val), NULL, base);
> +
> +               switch (type) {
> +               case E_LTH:
> +                       if (symval < val)
> +                               c =3D pexpr_or(c, pexf(fe), data, PEXPR_A=
RGX);
> +                       break;
> +               case E_LEQ:
> +                       if (symval <=3D val)
> +                               c =3D pexpr_or(c, pexf(fe), data, PEXPR_A=
RGX);
> +                       break;
> +               case E_GTH:
> +                       if (symval > val)
> +                               c =3D pexpr_or(c, pexf(fe), data, PEXPR_A=
RGX);
> +                       break;
> +               case E_GEQ:
> +                       if (symval >=3D val)
> +                               c =3D pexpr_or(c, pexf(fe), data, PEXPR_A=
RGX);
> +                       break;
> +               default:
> +                       perror("Illegal unequal.");
> +               }
> +       }
> +
> +       return c;
> +}
> +
> +/*
> + * evaluate an unequality between 2 Boolean symbols
> + */
> +static struct pexpr *expr_eval_unequal_bool(struct symbol *left, struct =
symbol *right,
> +                                           enum expr_type type, struct c=
fdata *data)
> +{
> +       struct pexpr *c;
> +
> +       if (!left || !right)
> +               return pexf(data->constants->const_false);
> +
> +       if (!sym_is_boolean(left) || !sym_is_boolean(right)) {
> +               perror("Comparing 2 symbols that should be boolean.");
> +               return pexf(data->constants->const_false);
> +       }
> +
> +       switch (type) {
> +       case E_LTH:
> +               c =3D pexpr_and(pexpr_not(sym_get_fexpr_both(left, data),=
 data),
> +                             sym_get_fexpr_both(right, data), data,
> +                             PEXPR_ARGX);
> +               if (left->type =3D=3D S_TRISTATE)
> +                       c =3D pexpr_or(c,
> +                                    pexpr_and(pexf(left->fexpr_m),
> +                                              pexf(right->fexpr_y), data=
,
> +                                              PEXPR_ARGX),
> +                                    data, PEXPR_ARGX);
> +               break;
> +       case E_LEQ:
> +               c =3D pexpr_and(pexf(left->fexpr_y), pexf(right->fexpr_y)=
, data,
> +                             PEXPR_ARGX);
> +               if (left->type =3D=3D S_TRISTATE)
> +                       c =3D pexpr_or(c,
> +                                    pexpr_and(pexf(left->fexpr_m),
> +                                              sym_get_fexpr_both(right, =
data),
> +                                              data, PEXPR_ARGX),
> +                                    data, PEXPR_ARGX);
> +               c =3D pexpr_or(c, pexpr_not(sym_get_fexpr_both(left, data=
), data),
> +                            data, PEXPR_ARGX);
> +               break;
> +       case E_GTH:
> +               c =3D pexpr_and(sym_get_fexpr_both(left, data),
> +                             pexpr_not(sym_get_fexpr_both(right, data), =
data),
> +                             data, PEXPR_ARGX);
> +               if (right->type =3D=3D S_TRISTATE)
> +                       c =3D pexpr_or(c,
> +                                    pexpr_and(pexf(left->fexpr_y),
> +                                              pexf(right->fexpr_m), data=
,
> +                                              PEXPR_ARGX),
> +                                    data, PEXPR_ARGX);
> +               break;
> +       case E_GEQ:
> +               c =3D pexpr_and(pexf(left->fexpr_y), pexf(right->fexpr_y)=
, data,
> +                             PEXPR_ARGX);
> +               if (right->type =3D=3D S_TRISTATE)
> +                       c =3D pexpr_or(c,
> +                                    pexpr_and(sym_get_fexpr_both(left, d=
ata),
> +                                              pexf(right->fexpr_m), data=
,
> +                                              PEXPR_ARGX),
> +                                    data, PEXPR_ARGX);
> +               c =3D pexpr_or(c,
> +                            pexpr_not(sym_get_fexpr_both(right, data), d=
ata),
> +                            data, PEXPR_ARGX);
> +               break;
> +       default:
> +               fprintf(stderr, "Wrong type - %s", __func__);
> +               c =3D pexf(data->constants->const_false);
> +       }
> +
> +       return c;
> +}
> +/*
> + * calculate, when expr will evaluate to yes or mod
> + */
> +struct pexpr *expr_calculate_pexpr_both(struct expr *e, struct cfdata *d=
ata)
> +{
> +       if (!e)
> +               return pexf(data->constants->const_false);
> +
> +       if (!expr_can_evaluate_to_mod(e))
> +               return expr_calculate_pexpr_y(e, data);
> +
> +       switch (e->type) {
> +       case E_SYMBOL:
> +               return pexpr_or(expr_calculate_pexpr_m(e, data), expr_cal=
culate_pexpr_y(e, data),
> +                               data, PEXPR_ARGX);
> +       case E_AND:
> +               return expr_calculate_pexpr_both_and(e->left.expr, e->rig=
ht.expr, data);
> +       case E_OR:
> +               return expr_calculate_pexpr_both_or(e->left.expr, e->righ=
t.expr, data);
> +       case E_NOT:
> +               return pexpr_or(expr_calculate_pexpr_m(e, data), expr_cal=
culate_pexpr_y(e, data),
> +                               data, PEXPR_ARGX);
> +       case E_EQUAL:
> +               return expr_calculate_pexpr_y_equals(e, data);
> +       case E_UNEQUAL:
> +               return expr_calculate_pexpr_y_unequals(e, data);
> +       case E_LTH:
> +       case E_LEQ:
> +       case E_GTH:
> +       case E_GEQ:
> +               return expr_calculate_pexpr_y_comp(e, data);
> +       default:
> +               // TODO
> +               fprintf(stderr, "Unhandled type - %s", __func__);
> +               return NULL;
> +       }
> +}
> +
> +/*
> + * calculate, when expr will evaluate to yes
> + */
> +struct pexpr *expr_calculate_pexpr_y(struct expr *e, struct cfdata *data=
)
> +{
> +       if (!e)
> +               return NULL;
> +
> +       switch (e->type) {
> +       case E_SYMBOL:
> +               return pexf(e->left.sym->fexpr_y);
> +       case E_AND:
> +               return expr_calculate_pexpr_y_and(e->left.expr, e->right.=
expr, data);
> +       case E_OR:
> +               return expr_calculate_pexpr_y_or(e->left.expr, e->right.e=
xpr, data);
> +       case E_NOT:
> +               return expr_calculate_pexpr_y_not(e->left.expr, data);
> +       case E_EQUAL:
> +               return expr_calculate_pexpr_y_equals(e, data);
> +       case E_UNEQUAL:
> +               return expr_calculate_pexpr_y_unequals(e, data);
> +       case E_LTH:
> +       case E_LEQ:
> +       case E_GTH:
> +       case E_GEQ:
> +               return expr_calculate_pexpr_y_comp(e, data);
> +       default:
> +               fprintf(stderr, "Unhandled type - %s", __func__);
> +               return NULL;
> +       }
> +}
> +
> +/*
> + * calculate, when expr will evaluate to mod
> + */
> +struct pexpr *expr_calculate_pexpr_m(struct expr *e, struct cfdata *data=
)
> +{
> +       if (!e)
> +               return NULL;
> +
> +       if (!expr_can_evaluate_to_mod(e))
> +               return pexf(data->constants->const_false);
> +
> +       switch (e->type) {
> +       case E_SYMBOL:
> +               return pexf(e->left.sym->fexpr_m);
> +       case E_AND:
> +               return expr_calculate_pexpr_m_and(e->left.expr, e->right.=
expr, data);
> +       case E_OR:
> +               return expr_calculate_pexpr_m_or(e->left.expr, e->right.e=
xpr, data);
> +       case E_NOT:
> +               return expr_calculate_pexpr_m_not(e->left.expr, data);
> +       default:
> +               perror("Trying to evaluate to mod.");
> +               return NULL;
> +       }
> +}
> +
> +/*
> + * calculate, when expr of type AND will evaluate to yes
> + * A && B
> + */
> +struct pexpr *expr_calculate_pexpr_y_and(struct expr *a, struct expr *b,=
 struct cfdata *data)
> +{
> +       return pexpr_and(expr_calculate_pexpr_y(a, data),
> +                             expr_calculate_pexpr_y(b, data), data,
> +                             PEXPR_ARGX);
> +}
> +
> +/*
> + * calculate, when expr of type AND will evaluate to mod
> + * (A || A_m) && (B || B_m) && !(A && B)
> + */
> +struct pexpr *expr_calculate_pexpr_m_and(struct expr *a, struct expr *b,
> +                                        struct cfdata *data)
> +{
> +       struct pexpr *topright =3D
> +               pexpr_not(pexpr_and(expr_calculate_pexpr_y(a, data),
> +                                             expr_calculate_pexpr_y(b, d=
ata),
> +                                             data, PEXPR_ARGX),
> +                              data);
> +       struct pexpr *ll_left =3D pexpr_or(expr_calculate_pexpr_y(a, data=
),
> +                                        expr_calculate_pexpr_m(a, data),=
 data,
> +                                        PEXPR_ARGX);
> +       struct pexpr *ll_right =3D pexpr_or(expr_calculate_pexpr_y(b, dat=
a),
> +                                         expr_calculate_pexpr_m(b, data)=
, data,
> +                                         PEXPR_ARGX);
> +       struct pexpr *topleft =3D pexpr_and(ll_left, ll_right, data, PEXP=
R_ARGX);
> +
> +       return pexpr_and(topleft, topright, data, PEXPR_ARGX);
> +}
> +
> +/*
> + * calculate, when expr of type AND will evaluate to mod or yes
> + * (A || A_m) && (B || B_m)
> + */
> +struct pexpr *expr_calculate_pexpr_both_and(struct expr *a, struct expr =
*b,
> +                                           struct cfdata *data)
> +{
> +       struct pexpr *left =3D pexpr_or(expr_calculate_pexpr_y(a, data),
> +                                     expr_calculate_pexpr_m(a, data), da=
ta,
> +                                     PEXPR_ARGX);
> +       struct pexpr *right =3D pexpr_or(expr_calculate_pexpr_y(b, data),
> +                                      expr_calculate_pexpr_m(b, data), d=
ata,
> +                                      PEXPR_ARGX);
> +
> +       return pexpr_and(left, right, data, PEXPR_ARGX);
> +}
> +
> +/*
> + * calculate, when expr of type OR will evaluate to yes
> + * A || B
> + */
> +struct pexpr *expr_calculate_pexpr_y_or(struct expr *a, struct expr *b,
> +                                       struct cfdata *data)
> +{
> +       return pexpr_or(expr_calculate_pexpr_y(a, data),
> +                            expr_calculate_pexpr_y(b, data), data, PEXPR=
_ARGX);
> +}
> +
> +/*
> + * calculate, when expr of type OR will evaluate to mod
> + * (A_m || B_m) && !A && !B
> + */
> +struct pexpr *expr_calculate_pexpr_m_or(struct expr *a, struct expr *b,
> +                                       struct cfdata *data)
> +{
> +       struct pexpr *topright =3D
> +               pexpr_not(expr_calculate_pexpr_y(b, data), data);
> +       struct pexpr *lowerleft =3D pexpr_or(expr_calculate_pexpr_m(a, da=
ta),
> +                                               expr_calculate_pexpr_m(b,=
 data),
> +                                               data, PEXPR_ARGX);
> +       struct pexpr *topleft =3D pexpr_and(
> +               lowerleft,
> +               pexpr_not(expr_calculate_pexpr_y(a, data), data), data,
> +               PEXPR_ARGX);
> +
> +       return pexpr_and(topleft, topright, data, PEXPR_ARGX);
> +}
> +
> +/*
> + * calculate, when expr of type OR will evaluate to mod or yes
> + * (A_m || A || B_m || B)
> + */
> +struct pexpr *expr_calculate_pexpr_both_or(struct expr *a, struct expr *=
b,
> +                                          struct cfdata *data)
> +{
> +       struct pexpr *left =3D pexpr_or(expr_calculate_pexpr_y(a, data),
> +                                     expr_calculate_pexpr_m(a, data), da=
ta,
> +                                     PEXPR_ARGX);
> +       struct pexpr *right =3D pexpr_or(expr_calculate_pexpr_y(b, data),
> +                                      expr_calculate_pexpr_m(b, data), d=
ata,
> +                                      PEXPR_ARGX);
> +
> +       return pexpr_or(left, right, data, PEXPR_ARGX);
> +}
> +
> +/*
> + * calculate, when expr of type NOT will evaluate to yes
> + * !(A || A_m)
> + */
> +struct pexpr *expr_calculate_pexpr_y_not(struct expr *e, struct cfdata *=
data)
> +{
> +       return pexpr_not(pexpr_or(expr_calculate_pexpr_y(e, data),
> +                                           expr_calculate_pexpr_m(e, dat=
a),
> +                                           data, PEXPR_ARGX),
> +                             data);
> +}
> +
> +/*
> + * calculate, when expr of type NOT will evaluate to mod
> + * A_m
> + */
> +struct pexpr *expr_calculate_pexpr_m_not(struct expr *e, struct cfdata *=
data)
> +{
> +       return expr_calculate_pexpr_m(e, data);
> +}
> +
> +static struct pexpr *equiv_pexpr_share(struct pexpr *a, struct pexpr *b,
> +                                      struct cfdata *data)
> +{
> +       struct pexpr *yes =3D pexpr_and_share(a, b, data);
> +       struct pexpr *not =3D pexpr_and(pexpr_not_share(a, data),
> +                                          pexpr_not_share(b, data), data=
,
> +                                          PEXPR_ARGX);
> +
> +       return pexpr_or(yes, not, data, PEXPR_ARGX);
> +}
> +
> +static struct pexpr *equiv_pexpr_move(struct pexpr *a, struct pexpr *b,
> +                                      struct cfdata *data,
> +                                      enum pexpr_move move)
> +{
> +       return pexpr_move_wrapper(a, b, data, move, equiv_pexpr_share);
> +}
> +
> +/*
> + * create the fexpr of a non-boolean symbol for a specific value
> + */
> +struct fexpr *sym_create_nonbool_fexpr(struct symbol *sym, char *value,
> +                                      struct cfdata *data)
> +{
> +       struct fexpr *e;
> +       char *s;
> +
> +       if (!strcmp(value, "")) {
> +               if (sym->type =3D=3D S_STRING)
> +                       return sym->nb_vals->head->next->elem;
> +               else
> +                       return sym->nb_vals->head->elem;
> +       }
> +
> +       e =3D sym_get_nonbool_fexpr(sym, value);
> +
> +       /* fexpr already exists */
> +       if (e !=3D NULL)
> +               return e;
> +
> +       s =3D value;
> +       if (sym->type =3D=3D S_INT && !string_is_number(value)) {
> +               struct symbol *tmp =3D sym_find(value);
> +
> +               if (tmp !=3D NULL)
> +                       s =3D (char *) tmp->curr.val;
> +       } else if (sym->type =3D=3D S_HEX && !string_is_hex(value)) {
> +               struct symbol *tmp =3D sym_find(value);
> +
> +               if (tmp !=3D NULL)
> +                       s =3D (char *) tmp->curr.val;
> +       } else if (sym->type =3D=3D S_STRING) {
> +               struct symbol *tmp =3D sym_find(value);
> +
> +               if (tmp !=3D NULL)
> +                       s =3D (char *) tmp->curr.val;
> +       }
> +
> +       if (!strcmp(s, "")) {
> +               if (sym->type =3D=3D S_STRING)
> +                       return sym->nb_vals->head->next->elem;
> +               else
> +                       return sym->nb_vals->head->elem;
> +       }
> +
> +       e =3D sym_get_nonbool_fexpr(sym, s);
> +       if (e !=3D NULL)
> +               return e;
> +
> +       e =3D fexpr_create(data->sat_variable_nr++, FE_NONBOOL, sym->name=
);
> +       e->sym =3D sym;
> +       str_append(&e->name, "=3D");
> +       str_append(&e->name, s);
> +       e->nb_val =3D str_new();
> +       str_append(&e->nb_val, s);
> +
> +       fexpr_list_add(sym->nb_vals, e);
> +       fexpr_add_to_satmap(e, data);
> +
> +       return e;
> +}
> +
> +/*
> + * return the fexpr of a non-boolean symbol for a specific value, NULL i=
f
> + * non-existent
> + */
> +struct fexpr *sym_get_nonbool_fexpr(struct symbol *sym, char *value)
> +{
> +       struct fexpr_node *e;
> +
> +       fexpr_list_for_each(e, sym->nb_vals) {
> +               if (strcmp(str_get(&e->elem->nb_val), value) =3D=3D 0)
> +                       return e->elem;
> +       }
> +
> +       return NULL;
> +}
> +
> +/*
> + * return the fexpr of a non-boolean symbol for a specific value, if it =
exists
> + * otherwise create it
> + */
> +struct fexpr *sym_get_or_create_nonbool_fexpr(struct symbol *sym, char *=
value,
> +                                             struct cfdata *data)
> +{
> +       struct fexpr *e =3D sym_get_nonbool_fexpr(sym, value);
> +
> +       if (e !=3D NULL)
> +               return e;
> +       else
> +               return sym_create_nonbool_fexpr(sym, value, data);
> +}
> +
> +/*
> + * calculate, when expr of type EQUAL will evaluate to yes
> + * Side effect: May create certain values in e->{left,right}.sym.nb_vals
> + */
> +struct pexpr *expr_calculate_pexpr_y_equals(struct expr *e, struct cfdat=
a *data)
> +{
> +       /* comparing 2 tristate constants */
> +       if (sym_is_tristate_constant(e->left.sym) &&
> +           sym_is_tristate_constant(e->right.sym))
> +               return e->left.sym =3D=3D e->right.sym ?
> +                              pexf(data->constants->const_true) :
> +                              pexf(data->constants->const_false);
> +
> +       /* comparing 2 nonboolean constants */
> +       if (sym_is_nonbool_constant(e->left.sym) &&
> +           sym_is_nonbool_constant(e->right.sym))
> +               return strcmp(e->left.sym->name, e->right.sym->name) =3D=
=3D 0 ?
> +                              pexf(data->constants->const_true) :
> +                              pexf(data->constants->const_false);
> +
> +       /* comparing 2 boolean/tristate incl. yes/mod/no constants */
> +       if (sym_is_bool_or_triconst(e->left.sym) &&
> +           sym_is_bool_or_triconst(e->right.sym)) {
> +               struct pexpr *yes =3D equiv_pexpr_move(
> +                       pexf(e->left.sym->fexpr_y), pexf(e->right.sym->fe=
xpr_y),
> +                       data, PEXPR_ARGX);
> +               struct pexpr *mod =3D equiv_pexpr_move(
> +                       pexf(e->left.sym->fexpr_m), pexf(e->right.sym->fe=
xpr_m),
> +                       data, PEXPR_ARGX);
> +
> +               return pexpr_and(yes, mod, data, PEXPR_ARGX);
> +       }
> +
> +       /* comparing nonboolean with a constant */
> +       if (sym_is_nonboolean(e->left.sym) &&
> +           sym_is_nonbool_constant(e->right.sym))
> +               return pexf(sym_get_or_create_nonbool_fexpr(
> +                       e->left.sym, e->right.sym->name, data));
> +
> +       if (sym_is_nonbool_constant(e->left.sym) &&
> +           sym_is_nonboolean(e->right.sym))
> +               return pexf(sym_get_or_create_nonbool_fexpr(
> +                       e->right.sym, e->left.sym->name, data));
> +
> +       /* comparing nonboolean with tristate constant, will never be tru=
e */
> +       if (sym_is_nonboolean(e->left.sym) &&
> +           sym_is_tristate_constant(e->right.sym))
> +               return pexf(data->constants->const_false);
> +       if (sym_is_tristate_constant(e->left.sym) &&
> +           sym_is_nonboolean(e->right.sym))
> +               return pexf(data->constants->const_false);
> +
> +       /* comparing 2 nonboolean symbols */
> +       if (sym_is_nonboolean(e->left.sym) && sym_is_nonboolean(e->right.=
sym)) {
> +               struct pexpr *c =3D pexf(data->constants->const_false);
> +               struct fexpr *e1, *e2;
> +
> +               for (struct fexpr_node *node1 =3D
> +                            e->left.sym->nb_vals->head->next;
> +                    node1 !=3D NULL; node1 =3D node1->next) {
> +                       e1 =3D node1->elem;
> +                       for (struct fexpr_node *node2 =3D
> +                                    e->right.sym->nb_vals->head->next;
> +                            node2 !=3D NULL; node2 =3D node2->next) {
> +                               e2 =3D node2->elem;
> +                               if (!strcmp(str_get(&e1->nb_val),
> +                                           str_get(&e2->nb_val))) {
> +                                       c =3D pexpr_or(
> +                                               c,
> +                                               pexpr_and(pexf(e1),
> +                                                              pexf(e2), =
data,
> +                                                              PEXPR_ARGX=
),
> +                                               data, PEXPR_ARGX);
> +                                       break;
> +                               }
> +                       }
> +               }
> +               return c;
> +       }
> +
> +       /* comparing boolean item with nonboolean constant, will never be=
 true */
> +       if (sym_is_tristate_constant(e->left.sym) &&
> +           sym_is_nonbool_constant(e->right.sym))
> +               return pexf(data->constants->const_false);
> +       if (sym_is_nonbool_constant(e->left.sym) &&
> +           sym_is_tristate_constant(e->right.sym))
> +               return pexf(data->constants->const_false);
> +
> +       /* comparing symbol of type unknown with tristate constant */
> +       if (e->left.sym->type =3D=3D S_UNKNOWN &&
> +           sym_is_tristate_constant(e->right.sym))
> +               return pexf(data->constants->const_false);
> +       if (sym_is_tristate_constant(e->left.sym) &&
> +           e->right.sym->type =3D=3D S_UNKNOWN)
> +               return pexf(data->constants->const_false);
> +
> +       /* any other comparison is not supported and should not be execut=
ed */
> +       fprintf(stderr, "Unsupported equality.");
> +       print_expr(":", e, 0);
> +
> +       return pexf(data->constants->const_false);
> +}
> +
> +/*
> + * transform an UNEQUAL into a Not(EQUAL)
> + */
> +struct pexpr *expr_calculate_pexpr_y_unequals(struct expr *e, struct cfd=
ata *data)
> +{
> +       return pexpr_not(expr_calculate_pexpr_y_equals(e, data), data);
> +}
> +
> +struct pexpr *expr_calculate_pexpr_y_comp(struct expr *e, struct cfdata =
*data)
> +{
> +       if (!e)
> +               return NULL;
> +
> +       switch (e->type) {
> +       case E_LTH:
> +       case E_LEQ:
> +       case E_GTH:
> +       case E_GEQ:
> +               /* compare non-Boolean symbol with constant */
> +               if (sym_is_nonboolean(e->left.sym) &&
> +                       e->right.sym->type =3D=3D S_UNKNOWN &&
> +                       string_is_number(e->right.sym->name)
> +               ) {
> +                       return expr_eval_unequal_nonbool_const(e->left.sy=
m, e->right.sym, e->type,
> +                                                              data);
> +               }
> +               if (sym_is_nonboolean(e->right.sym) &&
> +                       e->left.sym->type =3D=3D S_UNKNOWN &&
> +                       string_is_number(e->left.sym->name)
> +               ) {
> +                       return expr_eval_unequal_nonbool_const(e->right.s=
ym, e->left.sym, e->type,
> +                                                              data);
> +               }
> +
> +               /* compare 2 Boolean symbols */
> +               if (sym_is_boolean(e->left.sym) && sym_is_boolean(e->righ=
t.sym))
> +                       return expr_eval_unequal_bool(e->left.sym, e->rig=
ht.sym, e->type, data);
> +
> +               return pexf(data->constants->const_false);
> +       default:
> +               fprintf(stderr, "Unhandled type - %s", __func__);
> +               return NULL;
> +       }
> +}
> +
> +static struct pexpr *pexpr_move_wrapper(
> +       struct pexpr *a, struct pexpr *b, struct cfdata *data,
> +       enum pexpr_move move,
> +       struct pexpr *(*func)(struct pexpr *, struct pexpr *, struct cfda=
ta *))
> +{
> +       struct pexpr *retval =3D func(a, b, data);
> +
> +       switch (move) {
> +       case PEXPR_ARG1:
> +               pexpr_put(a);
> +               break;
> +       case PEXPR_ARG2:
> +               pexpr_put(b);
> +               break;
> +       case PEXPR_ARGX:
> +               pexpr_put(a);
> +               pexpr_put(b);
> +               break;
> +       default:
> +               fprintf(stderr, "%s: invalid value for @move - %d\n", __f=
unc__,
> +                       move);
> +       }
> +       return retval;
> +}
> +
> +struct pexpr *pexpr_and(struct pexpr *a, struct pexpr *b, struct cfdata =
*data, enum pexpr_move move)
> +{
> +       return pexpr_move_wrapper(a, b, data, move, pexpr_and_share);
> +}
> +
> +/*
> + * macro to create a pexpr of type AND
> + */
> +struct pexpr *pexpr_and_share(struct pexpr *a, struct pexpr *b, struct c=
fdata *data)
> +{
> +       struct pexpr *e;
> +
> +       /* A && A -> A */
> +       if (a =3D=3D b || pexpr_eq(a, b, data)) {
> +               pexpr_get(a);
> +               return a;
> +       }
> +
> +       /* simplifications:
> +        * expr && False -> False
> +        * expr && True  -> expr
> +        */
> +       if ((a->type =3D=3D PE_SYMBOL &&
> +            a->left.fexpr =3D=3D data->constants->const_false) ||
> +           (b->type =3D=3D PE_SYMBOL &&
> +            b->left.fexpr =3D=3D data->constants->const_true)) {
> +               pexpr_get(a);
> +               return a;
> +       }
> +
> +       if ((b->type =3D=3D PE_SYMBOL &&
> +            b->left.fexpr =3D=3D data->constants->const_false) ||
> +           (a->type =3D=3D PE_SYMBOL &&
> +            a->left.fexpr =3D=3D data->constants->const_true)) {
> +               pexpr_get(b);
> +               return b;
> +       }
> +
> +       /* (A && B) && C -> A && B if B =3D=3D C */
> +       if (a->type =3D=3D PE_AND && pexpr_eq(a->right.pexpr, b, data)) {
> +               pexpr_get(a);
> +               return a;
> +       }
> +
> +       /* A && (B && C) -> B && C if A =3D=3D B */
> +       if (b->type =3D=3D PE_AND && pexpr_eq(a, b->left.pexpr, data)) {
> +               pexpr_get(b);
> +               return b;
> +       }
> +
> +       if (a->type =3D=3D PE_OR && b->type =3D=3D PE_OR) {
> +               e =3D NULL;
> +               /* (A || B) && (C || D) -> A || (B && D) if A =3D=3D C */
> +               if (pexpr_eq(a->left.pexpr, b->left.pexpr, data)) {
> +                       e =3D pexpr_or(a->left.pexpr,
> +                                         pexpr_and_share(a->right.pexpr,
> +                                                         b->right.pexpr,=
 data),
> +                                         data, PEXPR_ARG2);
> +               }
> +               /* (A || B) && (C || D) -> B || (A && C) if B =3D=3D D */
> +               else if (pexpr_eq(a->right.pexpr, b->right.pexpr, data)) =
{
> +                       e =3D pexpr_or(a->right.pexpr,
> +                                         pexpr_and_share(a->left.pexpr,
> +                                                         b->left.pexpr, =
data),
> +                                         data, PEXPR_ARG2);
> +               }
> +               /* (A || B) && (C || D) -> A || (B && C) if A =3D=3D D */
> +               else if (pexpr_eq(a->left.pexpr, b->right.pexpr, data)) {
> +                       e =3D pexpr_or(a->left.pexpr,
> +                                         pexpr_and_share(a->right.pexpr,
> +                                                         b->left.pexpr, =
data),
> +                                         data, PEXPR_ARG2);
> +               }
> +               /* (A || B) && (C || D) -> B || (A && D) if B =3D=3D C */
> +               else if (pexpr_eq(a->right.pexpr, b->left.pexpr, data)) {
> +                       e =3D pexpr_or(a->right.pexpr,
> +                                         pexpr_and_share(a->left.pexpr,
> +                                                         b->right.pexpr,=
 data),
> +                                         data, PEXPR_ARG2);
> +               }
> +               if (e)
> +                       return e;
> +       }
> +
> +       /* general case */
> +       e =3D xcalloc(1, sizeof(*e));
> +       pexpr_get(a);
> +       pexpr_get(b);
> +       pexpr_construct_and(e, a, b, 1);
> +       return e;
> +}
> +
> +struct pexpr *pexpr_or(struct pexpr *a, struct pexpr *b, struct cfdata *=
data, enum pexpr_move move)
> +{
> +       return pexpr_move_wrapper(a, b, data, move, pexpr_or_share);
> +}
> +
> +/*
> + * macro to create a pexpr of type OR
> + */
> +struct pexpr *pexpr_or_share(struct pexpr *a, struct pexpr *b, struct cf=
data *data)
> +{
> +       struct pexpr *e;
> +       bool cond1, cond2;
> +
> +       /* A || A  -> A */
> +       if (a =3D=3D b || pexpr_eq(a, b, data)) {
> +               pexpr_get(a);
> +               return a;
> +       }
> +
> +       /* simplifications:
> +        * A || False -> A
> +        * A || True  -> True
> +        */
> +       cond1 =3D a->type =3D=3D PE_SYMBOL && a->left.fexpr =3D=3D data->=
constants->const_false;
> +       cond2 =3D b->type =3D=3D PE_SYMBOL && b->left.fexpr =3D=3D data->=
constants->const_true;
> +       if (cond1 || cond2) {
> +               pexpr_get(b);
> +               return b;
> +       }
> +       cond1 =3D b->type =3D=3D PE_SYMBOL && b->left.fexpr =3D=3D data->=
constants->const_false;
> +       cond2 =3D a->type =3D=3D PE_SYMBOL && a->left.fexpr =3D=3D data->=
constants->const_true;
> +       if (cond1 || cond2) {
> +               pexpr_get(a);
> +               return a;
> +       }
> +
> +       /* A || (B && C) -> A if (A =3D=3D B || A =3D=3D C) */
> +       if (b->type =3D=3D PE_AND && (
> +               pexpr_eq(a, b->left.pexpr, data) || pexpr_eq(a, b->right.=
pexpr, data)
> +       )) {
> +               pexpr_get(a);
> +               return a;
> +       }
> +       /* (A && B) || C -> C if (A =3D=3D C || B =3D=3D C) */
> +       if (a->type =3D=3D PE_AND && (
> +               pexpr_eq(a->left.pexpr, b, data) || pexpr_eq(a->right.pex=
pr, b, data)
> +       )) {
> +               pexpr_get(b);
> +               return b;
> +       }
> +
> +       /* -A || B -> True if A =3D=3D B
> +        * A || -B -> True if A =3D=3D B
> +        */
> +       cond1 =3D a->type =3D=3D PE_NOT && pexpr_eq(a->left.pexpr, b, dat=
a);
> +       cond2 =3D b->type =3D=3D PE_NOT && pexpr_eq(a, b->left.pexpr, dat=
a);
> +       if (cond1 || cond2)
> +               return pexf(data->constants->const_true);
> +
> +       if (a->type =3D=3D PE_AND && b->type =3D=3D PE_AND) {
> +               e =3D NULL;
> +               /* (A && B) || (C && D) -> A && (B || D) if (A =3D=3D C) =
*/
> +               if (pexpr_eq(a->left.pexpr, b->left.pexpr, data)) {
> +                       e =3D pexpr_and(a->left.pexpr,
> +                                     pexpr_or_share(a->right.pexpr, b->r=
ight.pexpr, data), data,
> +                                     PEXPR_ARG2);
> +               }
> +               /* (A && B) || (C && D) -> B && (A || C) if (B =3D=3D D) =
*/
> +               if (pexpr_eq(a->right.pexpr, b->right.pexpr, data)) {
> +                       e =3D pexpr_and(a->right.pexpr,
> +                                     pexpr_or_share(a->left.pexpr, b->le=
ft.pexpr, data), data,
> +                                     PEXPR_ARG2);
> +               }
> +               /* (A && B) || (C && D) -> A && (B || C) if (A =3D=3D D) =
*/
> +               if (pexpr_eq(a->left.pexpr, b->right.pexpr, data)) {
> +                       e =3D pexpr_and(a->left.pexpr,
> +                                     pexpr_or_share(a->right.pexpr, b->l=
eft.pexpr, data), data,
> +                                     PEXPR_ARG2);
> +               }
> +               /* (A && B) || (C && D) -> B && (A || D) if (B =3D=3D C) =
*/
> +               if (pexpr_eq(a->right.pexpr, b->left.pexpr, data)) {
> +                       e =3D pexpr_and(a->right.pexpr,
> +                                     pexpr_or_share(a->left.pexpr, b->ri=
ght.pexpr, data), data,
> +                                     PEXPR_ARG2);
> +               }
> +               if (e)
> +                       return e;
> +       }
> +
> +       /* (A && B) || (C || D) -> C || D if
> +        * A =3D=3D C || A =3D=3D D || B =3D=3D C || B =3D=3D D
> +        */
> +       if (a->type =3D=3D PE_AND && b->type =3D=3D PE_OR && (
> +               pexpr_eq(a->left.pexpr, b->left.pexpr, data) ||
> +               pexpr_eq(a->left.pexpr, b->right.pexpr, data) ||
> +               pexpr_eq(a->right.pexpr, b->left.pexpr, data) ||
> +               pexpr_eq(a->right.pexpr, b->right.pexpr, data)
> +       )) {
> +               pexpr_get(b);
> +               return b;
> +       }
> +       /* (C || D) || (A && B) -> C || D if
> +        * A =3D=3D C || A =3D=3D D || B =3D=3D C || B =3D=3D D
> +        */
> +       if (a->type =3D=3D PE_OR && b->type =3D=3D PE_AND && (
> +               pexpr_eq(a->left.pexpr, b->left.pexpr, data) ||
> +               pexpr_eq(a->left.pexpr, b->right.pexpr, data) ||
> +               pexpr_eq(a->right.pexpr, b->left.pexpr, data) ||
> +               pexpr_eq(a->right.pexpr, b->right.pexpr, data)
> +       )) {
> +               pexpr_get(a);
> +               return a;
> +       }
> +
> +       /* general case */
> +       e =3D xcalloc(1, sizeof(*e));
> +       pexpr_get(a);
> +       pexpr_get(b);
> +       pexpr_construct_or(e, a, b, 1);
> +
> +       return e;
> +}
> +
> +struct pexpr *pexpr_not(struct pexpr *a, struct cfdata *data)
> +{
> +       struct pexpr *retval =3D pexpr_not_share(a, data);
> +
> +       pexpr_put(a);
> +       return retval;
> +}
> +
> +/*
> + * Builds NOT(@a)
> + */
> +struct pexpr *pexpr_not_share(struct pexpr *a, struct cfdata *data)
> +{
> +       struct pexpr *ret_val;
> +
> +       if (a->type =3D=3D PE_SYMBOL &&
> +           a->left.fexpr =3D=3D data->constants->const_false)
> +               ret_val =3D pexf(data->constants->const_true);
> +       else if (a->type =3D=3D PE_SYMBOL &&
> +           a->left.fexpr =3D=3D data->constants->const_true)
> +               ret_val =3D pexf(data->constants->const_false);
> +       /* eliminate double negation */
> +       else if (a->type =3D=3D PE_NOT) {
> +               ret_val =3D a->left.pexpr;
> +               pexpr_get(ret_val);
> +       }
> +       /* De Morgan */
> +       else if (a->type =3D=3D PE_AND) {
> +               ret_val =3D xmalloc(sizeof(*ret_val));
> +               pexpr_construct_or(ret_val,
> +                                  pexpr_not_share(a->left.pexpr, data),
> +                                  pexpr_not_share(a->right.pexpr, data),=
 1);
> +       } else if (a->type =3D=3D PE_OR) {
> +               ret_val =3D xmalloc(sizeof(*ret_val));
> +               pexpr_construct_and(ret_val,
> +                                   pexpr_not_share(a->left.pexpr, data),
> +                                   pexpr_not_share(a->right.pexpr, data)=
, 1);
> +       } else {
> +               ret_val =3D xmalloc(sizeof(*ret_val));
> +               pexpr_get(a);
> +               pexpr_construct_not(ret_val, a, 1);
> +       }
> +
> +       return ret_val;
> +}
> +
> +struct pexpr *pexpr_implies(struct pexpr *a, struct pexpr *b, struct cfd=
ata *data,
> +                           enum pexpr_move move)
> +{
> +       return pexpr_move_wrapper(a, b, data, move, pexpr_implies_share);
> +}
> +
> +/*
> + * macro to construct a pexpr for "A implies B"
> + */
> +struct pexpr *pexpr_implies_share(struct pexpr *a, struct pexpr *b, stru=
ct cfdata *data)
> +{
> +       /* A =3D> B -> True if A =3D=3D B */
> +       if (a =3D=3D b || pexpr_eq(a, b, data))
> +               return pexf(data->constants->const_true);
> +
> +       /* (A =3D> B && C) -> (A =3D> C) if A =3D=3D B */
> +       if (b->type =3D=3D PE_AND && pexpr_eq(a, b->left.pexpr, data))
> +               return pexpr_implies_share(a, b->right.pexpr, data);
> +       /* (A =3D> B && C) -> (A =3D> B) if A =3D=3D C */
> +       if (b->type =3D=3D PE_AND && pexpr_eq(a, b->right.pexpr, data))
> +               return pexpr_implies_share(a, b->left.pexpr, data);
> +
> +       /* (A =3D> B || C) -> True if (A =3D=3D B || A =3D=3D C) */
> +       if (b->type =3D=3D PE_OR && (
> +               pexpr_eq(a, b->left.pexpr, data) || pexpr_eq(a, b->right.=
pexpr, data)
> +       ))
> +               return pexf(data->constants->const_true);
> +
> +       /* (A && B =3D> C) -> True if (A =3D=3D C || B =3D=3D C) */
> +       if (a->type =3D=3D PE_AND && (
> +               pexpr_eq(a->left.pexpr, b, data) || pexpr_eq(a->right.pex=
pr, b, data)
> +       ))
> +               return pexf(data->constants->const_true);
> +
> +       return pexpr_or(pexpr_not_share(a, data), b, data, PEXPR_ARG1);
> +}
> +
> +/*
> + * check whether a pexpr is in CNF
> + */
> +bool pexpr_is_cnf(struct pexpr *e)
> +{
> +       if (!e)
> +               return false;
> +
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               return true;
> +       case PE_AND:
> +               return false;
> +       case PE_OR:
> +               return pexpr_is_cnf(e->left.pexpr) &&
> +                      pexpr_is_cnf(e->right.pexpr);
> +       case PE_NOT:
> +               return e->left.pexpr->type =3D=3D PE_SYMBOL;
> +       }
> +
> +       return false;
> +}
> +
> +/*
> + * check whether a pexpr is in NNF
> + */
> +bool pexpr_is_nnf(struct pexpr *e)
> +{
> +       if (!e)
> +               return false;
> +
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               return true;
> +       case PE_AND:
> +       case PE_OR:
> +               return pexpr_is_nnf(e->left.pexpr) && pexpr_is_nnf(e->rig=
ht.pexpr);
> +       case PE_NOT:
> +               return e->left.pexpr->type =3D=3D PE_SYMBOL;
> +       }
> +
> +       return false;
> +}
> +
> +/*
> + * return fexpr_both for a symbol
> + */
> +struct pexpr *sym_get_fexpr_both(struct symbol *sym, struct cfdata *data=
)
> +{
> +       return sym->type =3D=3D S_TRISTATE ?
> +                      pexpr_or(pexf(sym->fexpr_m), pexf(sym->fexpr_y),
> +                                    data, PEXPR_ARGX) :
> +                      pexf(sym->fexpr_y);
> +}
> +
> +/*
> + * return fexpr_sel_both for a symbol
> + */
> +struct pexpr *sym_get_fexpr_sel_both(struct symbol *sym, struct cfdata *=
data)
> +{
> +       if (!sym->rev_dep.expr)
> +               return pexf(data->constants->const_false);
> +
> +       return sym->type =3D=3D S_TRISTATE ?
> +                      pexpr_or(pexf(sym->fexpr_sel_m),
> +                                    pexf(sym->fexpr_sel_y), data, PEXPR_=
ARGX) :
> +                      pexf(sym->fexpr_sel_y);
> +}
> +
> +/*
> + * check, if the fexpr is a symbol, a True/False-constant, a literal sym=
bolizing a non-boolean or
> + * a choice symbol
> + */
> +bool fexpr_is_symbol(struct fexpr *e)
> +{
> +       return e->type =3D=3D FE_SYMBOL || e->type =3D=3D FE_FALSE || e->=
type =3D=3D FE_TRUE ||
> +              e->type =3D=3D FE_NONBOOL || e->type =3D=3D FE_CHOICE || e=
->type =3D=3D FE_SELECT ||
> +              e->type =3D=3D FE_NPC;
> +}
> +
> +/*
> + * check whether a pexpr is a symbol or a negated symbol
> + */
> +bool pexpr_is_symbol(struct pexpr *e)
> +{
> +       return e->type =3D=3D PE_SYMBOL || (e->type =3D=3D PE_NOT && e->l=
eft.pexpr->type =3D=3D PE_SYMBOL);
> +}
> +
> +/*
> + * check whether the fexpr is a constant (true/false)
> + */
> +bool fexpr_is_constant(struct fexpr *e, struct cfdata *data)
> +{
> +       return e =3D=3D data->constants->const_true || e =3D=3D data->con=
stants->const_false;
> +}
> +
> +/*
> + * add a fexpr to the satmap
> + */
> +void fexpr_add_to_satmap(struct fexpr *e, struct cfdata *data)
> +{
> +       if (e->satval >=3D data->satmap_size) {
> +               data->satmap =3D
> +                       xrealloc(data->satmap, data->satmap_size * 2 * si=
zeof(**data->satmap));
> +               data->satmap_size *=3D 2;
> +       }
> +
> +       data->satmap[e->satval] =3D e;



I see a bug here.

Size mismatch for memory allocation.
(much bigger than used)









> +}
> +
> +/*
> + * print a fexpr
> + */
> +void fexpr_print(char *tag, struct fexpr *e)
> +{
> +       if (!e)
> +               return;
> +
> +       printf("%s: %s\n", tag, str_get(&e->name));
> +}
> +
> +/*
> + * write an fexpr into a string (format needed for testing)
> + */
> +void fexpr_as_char(struct fexpr *e, struct gstr *s)
> +{
> +       if (!e)
> +               return;
> +
> +       switch (e->type) {
> +       case FE_SYMBOL:
> +       case FE_CHOICE:
> +       case FE_SELECT:
> +       case FE_NPC:
> +       case FE_NONBOOL:
> +               str_append(s, "definedEx(");
> +               str_append(s, str_get(&e->name));
> +               str_append(s, ")");
> +               return;
> +       case FE_FALSE:
> +               str_append(s, "0");
> +               return;
> +       case FE_TRUE:
> +               str_append(s, "1");
> +               return;
> +       default:
> +               return;
> +       }
> +}
> +
> +/*
> + * write a pexpr into a string
> + */
> +void pexpr_as_char(struct pexpr *e, struct gstr *s, int parent, struct c=
fdata *data)
> +{
> +       if (!e)
> +               return;
> +
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               if (e->left.fexpr =3D=3D data->constants->const_false) {
> +                       str_append(s, "0");
> +                       return;
> +               }
> +               if (e->left.fexpr =3D=3D data->constants->const_true) {
> +                       str_append(s, "1");
> +                       return;
> +               }
> +               str_append(s, "definedEx(");
> +               str_append(s, str_get(&e->left.fexpr->name));
> +               str_append(s, ")");
> +               return;
> +       case PE_AND:
> +               if (parent !=3D PE_AND)
> +                       str_append(s, "(");
> +               pexpr_as_char(e->left.pexpr, s, PE_AND, data);
> +               str_append(s, " && ");
> +               pexpr_as_char(e->right.pexpr, s, PE_AND, data);
> +               if (parent !=3D PE_AND)
> +                       str_append(s, ")");
> +               return;
> +       case PE_OR:
> +               if (parent !=3D PE_OR)
> +                       str_append(s, "(");
> +               pexpr_as_char(e->left.pexpr, s, PE_OR, data);
> +               str_append(s, " || ");
> +               pexpr_as_char(e->right.pexpr, s, PE_OR, data);
> +               if (parent !=3D PE_OR)
> +                       str_append(s, ")");
> +               return;
> +       case PE_NOT:
> +               str_append(s, "!");
> +               pexpr_as_char(e->left.pexpr, s, PE_NOT, data);
> +               return;
> +       }
> +}
> +
> +/*
> + * write a pexpr into a string
> + */
> +void pexpr_as_char_short(struct pexpr *e, struct gstr *s, int parent)
> +{
> +       if (!e)
> +               return;
> +
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               str_append(s, str_get(&e->left.fexpr->name));
> +               return;
> +       case PE_AND:
> +               if (parent !=3D PE_AND)
> +                       str_append(s, "(");
> +               pexpr_as_char_short(e->left.pexpr, s, PE_AND);
> +               str_append(s, " && ");
> +               pexpr_as_char_short(e->right.pexpr, s, PE_AND);
> +               if (parent !=3D PE_AND)
> +                       str_append(s, ")");
> +               return;
> +       case PE_OR:
> +               if (parent !=3D PE_OR)
> +                       str_append(s, "(");
> +               pexpr_as_char_short(e->left.pexpr, s, PE_OR);
> +               str_append(s, " || ");
> +               pexpr_as_char_short(e->right.pexpr, s, PE_OR);
> +               if (parent !=3D PE_OR)
> +                       str_append(s, ")");
> +               return;
> +       case PE_NOT:
> +               str_append(s, "!");
> +               pexpr_as_char_short(e->left.pexpr, s, PE_NOT);
> +               return;
> +       }
> +}
> +
> +/*
> + * check whether a pexpr contains a specific fexpr
> + */
> +bool pexpr_contains_fexpr(struct pexpr *e, struct fexpr *fe)
> +{
> +       if (!e)
> +               return false;
> +
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               return e->left.fexpr->satval =3D=3D fe->satval;
> +       case PE_AND:
> +       case PE_OR:
> +               return pexpr_contains_fexpr(e->left.pexpr, fe) ||
> +                       pexpr_contains_fexpr(e->right.pexpr, fe);
> +       case PE_NOT:
> +               return e->left.pexpr->left.fexpr->satval =3D=3D fe->satva=
l;
> +       }
> +
> +       return false;
> +}
> +
> +/*
> + * init list of fexpr
> + */
> +struct fexpr_list *fexpr_list_init(void)
> +{
> +       struct fexpr_list *list =3D xcalloc(1, sizeof(*list));
> +
> +       list->head =3D NULL;
> +       list->tail =3D NULL;
> +       list->size =3D 0;
> +
> +       return list;
> +}
> +
> +/*
> + * init list of fexpr_list
> + */
> +struct fexl_list *fexl_list_init(void)
> +{
> +       struct fexl_list *list =3D xcalloc(1, sizeof(*list));
> +
> +       list->head =3D NULL;
> +       list->tail =3D NULL;
> +       list->size =3D 0;
> +
> +       return list;
> +}
> +
> +/*
> + * init list of pexpr
> + */
> +struct pexpr_list *pexpr_list_init(void)
> +{
> +       struct pexpr_list *list =3D xcalloc(1, sizeof(*list));
> +
> +       list->head =3D NULL;
> +       list->tail =3D NULL;
> +       list->size =3D 0;
> +
> +       return list;
> +}
> +
> +/*
> + * init list of symbol_fix
> + */
> +struct sfix_list *sfix_list_init(void)
> +{
> +       struct sfix_list *list =3D xcalloc(1, sizeof(*list));
> +
> +       list->head =3D NULL;
> +       list->tail =3D NULL;
> +       list->size =3D 0;
> +
> +       return list;
> +}
> +
> +/*
> + * init list of symbol_fix
> + */
> +struct sfl_list *sfl_list_init(void)
> +{
> +       struct sfl_list *list =3D xcalloc(1, sizeof(*list));
> +
> +       list->head =3D NULL;
> +       list->tail =3D NULL;
> +       list->size =3D 0;
> +
> +       return list;
> +}
> +
> +/*
> + * init list of symbol_dvalue
> + */
> +struct sdv_list *sdv_list_init(void)
> +{
> +       struct sdv_list *list =3D xcalloc(1, sizeof(*list));
> +
> +       list->head =3D NULL;
> +       list->tail =3D NULL;
> +       list->size =3D 0;
> +
> +       return list;
> +}
> +
> +/*
> + * init list of symbols
> + */
> +struct sym_list *sym_list_init(void)
> +{
> +       struct sym_list *list =3D xcalloc(1, sizeof(*list));
> +
> +       list->head =3D NULL;
> +       list->tail =3D NULL;
> +       list->size =3D 0;
> +
> +       return list;
> +}
> +
> +/*
> + * init list of default_maps
> + */
> +struct defm_list *defm_list_init(void)
> +{
> +       struct defm_list *list =3D xcalloc(1, sizeof(*list));
> +
> +       list->head =3D NULL;
> +       list->tail =3D NULL;
> +       list->size =3D 0;
> +
> +       return list;
> +}
> +
> +/*
> + * init list of properties
> + */
> +struct prop_list *prop_list_init(void)
> +{
> +       struct prop_list *list =3D xcalloc(1, sizeof(*list));
> +
> +       list->head =3D NULL;
> +       list->tail =3D NULL;
> +       list->size =3D 0;
> +
> +       return list;
> +}



A bunch of similar *_list_init() functions.
Do not do this.

Kconfig uses the similar liss.h to the kernel space.


Remove all the duplications.




> +/*
> + * add element to tail of a fexpr_list
> + */
> +void fexpr_list_add(struct fexpr_list *list, struct fexpr *fe)
> +{
> +       struct fexpr_node *node =3D xcalloc(1, sizeof(*node));
> +
> +       node->elem =3D fe;
> +
> +       if (list->size =3D=3D 0) {
> +               list->head =3D node;
> +               list->tail =3D node;
> +       } else {
> +               node->prev =3D list->tail;
> +               list->tail =3D node;
> +               node->prev->next =3D node;
> +       }
> +
> +       list->size++;
> +}
> +
> +/*
> + * add element to tail of a fexl_list
> + */
> +void fexl_list_add(struct fexl_list *list, struct fexpr_list *elem)
> +{
> +       struct fexl_node *node =3D xcalloc(1, sizeof(*node));
> +
> +       node->elem =3D elem;
> +
> +       if (list->size =3D=3D 0) {
> +               list->head =3D node;
> +               list->tail =3D node;
> +       } else {
> +               node->prev =3D list->tail;
> +               list->tail =3D node;
> +               node->prev->next =3D node;
> +       }
> +
> +       list->size++;
> +}
> +
> +/*
> + * add element to tail of a pexpr_list
> + */
> +void pexpr_list_add(struct pexpr_list *list, struct pexpr *e)
> +{
> +       struct pexpr_node *node =3D xcalloc(1, sizeof(*node));
> +
> +       node->elem =3D e;
> +
> +       if (list->size =3D=3D 0) {
> +               list->head =3D node;
> +               list->tail =3D node;
> +       } else {
> +               node->prev =3D list->tail;
> +               list->tail =3D node;
> +               node->prev->next =3D node;
> +       }
> +
> +       list->size++;
> +}
> +
> +/*
> + * add element to tail of a sfix_list
> + */
> +void sfix_list_add(struct sfix_list *list, struct symbol_fix *fix)
> +{
> +       struct sfix_node *node =3D xcalloc(1, sizeof(*node));
> +
> +       node->elem =3D fix;
> +
> +       if (list->size =3D=3D 0) {
> +               list->head =3D node;
> +               list->tail =3D node;
> +       } else {
> +               node->prev =3D list->tail;
> +               list->tail =3D node;
> +               node->prev->next =3D node;
> +       }
> +
> +       list->size++;
> +}
> +
> +/*
> + * add element to tail of a sfl_list
> + */
> +void sfl_list_add(struct sfl_list *list, struct sfix_list *elem)
> +{
> +       struct sfl_node *node =3D xcalloc(1, sizeof(*node));
> +
> +       node->elem =3D elem;
> +
> +       if (list->size =3D=3D 0) {
> +               list->head =3D node;
> +               list->tail =3D node;
> +       } else {
> +               node->prev =3D list->tail;
> +               list->tail =3D node;
> +               node->prev->next =3D node;
> +       }
> +
> +       list->size++;
> +}
> +
> +/*
> + * add element to tail of a sdv_list
> + */
> +void sdv_list_add(struct sdv_list *list, struct symbol_dvalue *sdv)
> +{
> +       struct sdv_node *node =3D xcalloc(1, sizeof(*node));
> +
> +       node->elem =3D sdv;
> +
> +       if (list->size =3D=3D 0) {
> +               list->head =3D node;
> +               list->tail =3D node;
> +       } else {
> +               node->prev =3D list->tail;
> +               list->tail =3D node;
> +               node->prev->next =3D node;
> +       }
> +
> +       list->size++;
> +}
> +
> +/*
> + * add element to tail of a sym_list
> + */
> +void sym_list_add(struct sym_list *list, struct symbol *sym)
> +{
> +       struct sym_node *node =3D xcalloc(1, sizeof(*node));
> +
> +       node->elem =3D sym;
> +
> +       if (list->size =3D=3D 0) {
> +               list->head =3D node;
> +               list->tail =3D node;
> +       } else {
> +               node->prev =3D list->tail;
> +               list->tail =3D node;
> +               node->prev->next =3D node;
> +       }
> +
> +       list->size++;
> +}
> +
> +/*
> + * add element to tail of a defm_list
> + */
> +void defm_list_add(struct defm_list *list, struct default_map *map)
> +{
> +       struct defm_node *node =3D xcalloc(1, sizeof(*node));
> +
> +       node->elem =3D map;
> +
> +       if (list->size =3D=3D 0) {
> +               list->head =3D node;
> +               list->tail =3D node;
> +       } else {
> +               node->prev =3D list->tail;
> +               list->tail =3D node;
> +               node->prev->next =3D node;
> +       }
> +
> +       list->size++;
> +}
> +
> +/*
> + * add element to tail of a prop_list
> + */
> +void prop_list_add(struct prop_list *list, struct property *prop)
> +{
> +       struct prop_node *node =3D xcalloc(1, sizeof(*node));
> +
> +       node->elem =3D prop;
> +
> +       if (list->size =3D=3D 0) {
> +               list->head =3D node;
> +               list->tail =3D node;
> +       } else {
> +               node->prev =3D list->tail;
> +               list->tail =3D node;
> +               node->prev->next =3D node;
> +       }
> +
> +       list->size++;
> +}



Again. A bunch of *_list_add().



> +/*
> + * delete an element from a fexpr_list
> + */
> +void fexpr_list_delete(struct fexpr_list *list, struct fexpr_node *node)
> +{
> +       if (list->size =3D=3D 0 || node =3D=3D NULL)
> +               return;
> +
> +       if (node =3D=3D list->head)
> +               list->head =3D node->next;
> +       else
> +               node->prev->next =3D node->next;
> +
> +       if (node =3D=3D list->tail)
> +               list->tail =3D node->prev;
> +       else
> +               node->next->prev =3D node->prev;
> +
> +       list->size--;
> +       free(node);
> +}
> +
> +/*
> + * delete an element from a fexpr_list
> + */
> +void sfix_list_delete(struct sfix_list *list, struct sfix_node *node)
> +{
> +       if (list->size =3D=3D 0 || node =3D=3D NULL)
> +               return;
> +
> +       if (node =3D=3D list->head)
> +               list->head =3D node->next;
> +       else
> +               node->prev->next =3D node->next;
> +
> +       if (node =3D=3D list->tail)
> +               list->tail =3D node->prev;
> +       else
> +               node->next->prev =3D node->prev;
> +
> +       list->size--;
> +       free(node);
> +}
> +
> +/*
> + * delete an element from a fexpr_list
> + */
> +void pexpr_list_delete(struct pexpr_list *list, struct pexpr_node *node)
> +{
> +       if (list->size =3D=3D 0 || node =3D=3D NULL)
> +               return;
> +
> +       if (node =3D=3D list->head)
> +               list->head =3D node->next;
> +       else
> +               node->prev->next =3D node->next;
> +
> +       if (node =3D=3D list->tail)
> +               list->tail =3D node->prev;
> +       else
> +               node->next->prev =3D node->prev;
> +
> +       list->size--;
> +       free(node);
> +}
> +
> +/*
> + * delete an element from a fexl_list
> + */
> +void fexl_list_delete(struct fexl_list *list, struct fexl_node *node)
> +{
> +       if (list->size =3D=3D 0 || node =3D=3D NULL)
> +               return;
> +
> +       if (node =3D=3D list->head)
> +               list->head =3D node->next;
> +       else
> +               node->prev->next =3D node->next;
> +
> +       if (node =3D=3D list->tail)
> +               list->tail =3D node->prev;
> +       else
> +               node->next->prev =3D node->prev;
> +
> +       list->size--;
> +       free(node);
> +}
> +
> +/*
> + * delete the first occurrence of elem in an fexl_list
> + */
> +void fexl_list_delete_elem(struct fexl_list *list, struct fexpr_list *el=
em)
> +{
> +       struct fexl_node *node, *to_delete =3D NULL;
> +
> +       fexl_list_for_each(node, list) {
> +               if (node->elem =3D=3D elem) {
> +                       to_delete =3D node;
> +                       break;
> +               }
> +       }
> +
> +       if (to_delete !=3D NULL)
> +               fexl_list_delete(list, to_delete);
> +}
> +
> +/*
> + * make a shallow copy of a fexpr_list
> + */
> +struct fexpr_list *fexpr_list_copy(struct fexpr_list *list)
> +{
> +       struct fexpr_list *ret =3D fexpr_list_init();
> +       struct fexpr_node *node;
> +
> +       fexpr_list_for_each(node, list)
> +               fexpr_list_add(ret, node->elem);
> +
> +       return ret;
> +}
> +
> +/*
> + * make a shallow copy of a fexl_list
> + */
> +struct fexl_list *fexl_list_copy(struct fexl_list *list)
> +{
> +       struct fexl_list *ret =3D fexl_list_init();
> +       struct fexl_node *node;
> +
> +       fexl_list_for_each(node, list)
> +               fexl_list_add(ret, node->elem);
> +
> +       return ret;
> +}
> +
> +/*
> + * make a shallow copy of a sdv_list
> + */
> +struct sdv_list *sdv_list_copy(struct sdv_list *list)
> +{
> +       struct sdv_list *ret =3D sdv_list_init();
> +       struct sdv_node *node;
> +
> +       sdv_list_for_each(node, list)
> +               sdv_list_add(ret, node->elem);
> +
> +
> +       return ret;
> +}
> +
> +/*
> + * make a shallow copy of a sfix_list
> + */
> +struct sfix_list *sfix_list_copy(struct sfix_list *list)
> +{
> +       struct sfix_list *ret =3D sfix_list_init();
> +       struct sfix_node *node;
> +
> +       sfix_list_for_each(node, list)
> +               sfix_list_add(ret, node->elem);
> +
> +       return ret;
> +}
> +
> +/*
> + * print a fexpr_list
> + */
> +void fexpr_list_print(char *title, struct fexpr_list *list)
> +{
> +       struct fexpr_node *node;
> +
> +       printf("%s: [", title);
> +
> +       fexpr_list_for_each(node, list) {
> +               printf("%s", str_get(&node->elem->name));
> +               if (node->next !=3D NULL)
> +                       printf(", ");
> +       }
> +
> +       printf("]\n");
> +}
> +
> +/*
> + * print a fexl_list
> + */
> +void fexl_list_print(char *title, struct fexl_list *list)
> +{
> +       struct fexl_node *node;
> +
> +       printf("%s:\n", title);
> +
> +       fexl_list_for_each(node, list)
> +               fexpr_list_print(":", node->elem);
> +}
> +
> +/*
> + * print a pexpr_list
> + */
> +void pexpr_list_print(char *title, struct pexpr_list *list)
> +{
> +       struct pexpr_node *node;
> +
> +       printf("%s: [", title);
> +
> +       pexpr_list_for_each(node, list) {
> +               pexpr_print_util(node->elem, -1);
> +               if (node->next !=3D NULL)
> +                       printf(", ");
> +       }
> +
> +       printf("]\n");
> +}
> +
> +/*
> + * free an fexpr_list
> + */
> +void fexpr_list_free(struct fexpr_list *list)
> +{
> +       struct fexpr_node *node =3D list->head, *tmp;
> +
> +       while (node !=3D NULL) {
> +               tmp =3D node->next;
> +               free(node);
> +               node =3D tmp;
> +       }
> +
> +       free(list);
> +}
> +
> +/*
> + * free an defm_list (and pexpr_put the conditions of the maps and free =
the
> + * node->element's)
> + */
> +void defm_list_destruct(struct defm_list *list)
> +{
> +       struct defm_node *node =3D list->head, *tmp;
> +
> +       while (node !=3D NULL) {
> +               tmp =3D node->next;
> +               pexpr_put(node->elem->e);
> +               free(node->elem);
> +               free(node);
> +               node =3D tmp;
> +       }
> +
> +       free(list);
> +}
> +
> +/*
> + * free an fexl_list
> + */
> +void fexl_list_free(struct fexl_list *list)
> +{
> +       struct fexl_node *node =3D list->head, *tmp;
> +
> +       while (node !=3D NULL) {
> +               tmp =3D node->next;
> +               free(node);
> +               node =3D tmp;
> +       }
> +
> +       free(list);
> +}
> +
> +/*
> + * free a sdv_list
> + */
> +void sdv_list_free(struct sdv_list *list)
> +{
> +       struct sdv_node *node =3D list->head, *tmp;
> +
> +       while (node !=3D NULL) {
> +               tmp =3D node->next;
> +               free(node);
> +               node =3D tmp;
> +       }
> +
> +       free(list);
> +}
> +
> +/*
> + * free a pexpr_list (and pexpr_put the elements)
> + */
> +void pexpr_list_free_put(struct pexpr_list *list)
> +{
> +       struct pexpr_node *node =3D list->head, *tmp;
> +
> +       while (node !=3D NULL) {
> +               tmp =3D node->next;
> +               pexpr_put(node->elem);
> +               free(node);
> +               node =3D tmp;
> +       }
> +
> +       free(list);
> +}
> +
> +/*
> + * free a prop_list
> + */
> +void prop_list_free(struct prop_list *list)
> +{
> +       struct prop_node *node =3D list->head, *tmp;
> +
> +       while (node !=3D NULL) {
> +               tmp =3D node->next;
> +               free(node);
> +               node =3D tmp;
> +       }
> +
> +       free(list);
> +}
> +
> +/*
> + * free a sym_list
> + */
> +void sym_list_free(struct sym_list *list)
> +{
> +       struct sym_node *node =3D list->head, *tmp;
> +
> +       while (node !=3D NULL) {
> +               tmp =3D node->next;
> +               free(node);
> +               node =3D tmp;
> +       }
> +
> +       free(list);
> +}
> +
> +/*
> + * simplify a pexpr in-place
> + *     pexpr && False -> False
> + *     pexpr && True  -> pexpr
> + *     pexpr || False -> pexpr
> + *     pexpr || True  -> True
> + */
> +static void pexpr_eliminate_yn(struct pexpr *e, struct cfdata *data)
> +{
> +       struct pexpr *tmp;
> +       unsigned int ref_count;
> +
> +       if (!e)
> +               return;
> +
> +       switch (e->type) {
> +       case PE_AND:
> +               pexpr_eliminate_yn(e->left.pexpr, data);
> +               pexpr_eliminate_yn(e->right.pexpr, data);
> +               if (e->left.pexpr->type =3D=3D PE_SYMBOL) {
> +                       if (e->left.pexpr->left.fexpr =3D=3D data->consta=
nts->const_false) {
> +                               pexpr_put(e->left.pexpr);
> +                               pexpr_put(e->right.pexpr);
> +                               ref_count =3D e->ref_count;
> +                               pexpr_construct_sym(
> +                                       e, data->constants->const_false,
> +                                       ref_count);
> +                               return;
> +                       } else if (e->left.pexpr->left.fexpr =3D=3D data-=
>constants->const_true) {
> +                               pexpr_put(e->left.pexpr);
> +                               tmp =3D e->right.pexpr;
> +                               ref_count =3D e->ref_count;
> +                               pexpr_shallow_copy(e, tmp, ref_count);
> +                               pexpr_put(tmp);
> +                               return;
> +                       }
> +               }
> +               if (e->right.pexpr->type =3D=3D PE_SYMBOL) {
> +                       if (e->right.pexpr->left.fexpr =3D=3D data->const=
ants->const_false) {
> +                               pexpr_put(e->left.pexpr);
> +                               pexpr_put(e->right.pexpr);
> +                               ref_count =3D e->ref_count;
> +                               pexpr_construct_sym(
> +                                       e, data->constants->const_false,
> +                                       ref_count);
> +                               return;
> +                       } else if (e->right.pexpr->left.fexpr =3D=3D data=
->constants->const_true) {
> +                               pexpr_put(e->right.pexpr);
> +                               tmp =3D e->left.pexpr;
> +                               ref_count =3D e->ref_count;
> +                               pexpr_shallow_copy(e, tmp, ref_count);
> +                               pexpr_put(tmp);
> +                               return;
> +                       }
> +               }
> +               break;
> +       case PE_OR:
> +               pexpr_eliminate_yn(e->left.pexpr, data);
> +               pexpr_eliminate_yn(e->right.pexpr, data);
> +               if (e->left.pexpr->type =3D=3D PE_SYMBOL) {
> +                       if (e->left.pexpr->left.fexpr =3D=3D data->consta=
nts->const_false) {
> +                               pexpr_put(e->left.pexpr);
> +                               tmp =3D e->right.pexpr;
> +                               ref_count =3D e->ref_count;
> +                               pexpr_shallow_copy(e, tmp, ref_count);
> +                               pexpr_put(tmp);
> +                               return;
> +                       } else if (e->left.pexpr->left.fexpr =3D=3D data-=
>constants->const_true) {
> +                               pexpr_put(e->left.pexpr);
> +                               pexpr_put(e->right.pexpr);
> +                               ref_count =3D e->ref_count;
> +                               pexpr_construct_sym(
> +                                       e, data->constants->const_true,
> +                                       ref_count);
> +                               return;
> +                       }
> +               }
> +               if (e->right.pexpr->type =3D=3D PE_SYMBOL) {
> +                       if (e->right.pexpr->left.fexpr =3D=3D data->const=
ants->const_false) {
> +                               pexpr_put(e->right.pexpr);
> +                               tmp =3D e->left.pexpr;
> +                               ref_count =3D e->ref_count;
> +                               pexpr_shallow_copy(e, tmp, ref_count);
> +                               pexpr_put(tmp);
> +                               return;
> +                       } else if (e->right.pexpr->left.fexpr =3D=3D data=
->constants->const_true) {
> +                               pexpr_put(e->left.pexpr);
> +                               pexpr_put(e->right.pexpr);
> +                               ref_count =3D e->ref_count;
> +                               pexpr_construct_sym(e,
> +                                                   data->constants->cons=
t_true,
> +                                                   ref_count);
> +                               return;
> +                       }
> +               }
> +       default:
> +               break;
> +       }
> +}
> +
> +static void pexpr_shallow_copy(struct pexpr *dest, struct pexpr *org, un=
signed int ref_count)
> +{
> +       struct pexpr inter;
> +
> +       inter.type =3D org->type;
> +       inter.left =3D org->left;
> +       inter.right =3D org->right;
> +       if (org->type =3D=3D PE_OR || org->type =3D=3D PE_AND) {
> +               pexpr_get(org->left.pexpr);
> +               pexpr_get(org->right.pexpr);
> +       } else if (org->type =3D=3D PE_NOT) {
> +               pexpr_get(org->left.pexpr);
> +       }
> +       inter.ref_count =3D ref_count;
> +       *dest =3D inter;
> +}
> +
> +/*
> + * copy a pexpr
> + */
> +struct pexpr *pexpr_deep_copy(const struct pexpr *org)
> +{
> +       struct pexpr *e;
> +
> +       if (!org)
> +               return NULL;
> +
> +       e =3D xmalloc(sizeof(*org));
> +       memcpy(e, org, sizeof(*org));
> +       e->ref_count =3D 1;
> +       switch (org->type) {
> +       case PE_SYMBOL:
> +               e->left =3D org->left;
> +               break;
> +       case PE_AND:
> +       case PE_OR:
> +               e->left.pexpr =3D pexpr_deep_copy(org->left.pexpr);
> +               e->right.pexpr =3D pexpr_deep_copy(org->right.pexpr);
> +               break;
> +       case PE_NOT:
> +               e->left.pexpr =3D pexpr_deep_copy(org->left.pexpr);
> +               break;
> +       }
> +
> +       return e;
> +}
> +
> +/*
> + * free a pexpr
> + */
> +void pexpr_free_depr(struct pexpr *e)
> +{
> +       if (!e)
> +               return;
> +
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               break;
> +       case PE_AND:
> +       case PE_OR:
> +               pexpr_free_depr(e->left.pexpr);
> +               pexpr_free_depr(e->right.pexpr);
> +               break;
> +       case PE_NOT:
> +               pexpr_free_depr(e->left.pexpr);
> +               break;
> +       }
> +
> +       free(e);
> +}
> +
> +/*
> + * Increments ref_count and returns @e
> + */
> +struct pexpr *pexpr_get(struct pexpr *e)
> +{
> +       ++e->ref_count;
> +       return e;
> +}
> +
> +/*
> + * Decrements ref_count and if it becomes 0, it recursively puts the ref=
erences
> + * to its children and calls ``free(e)``. If @e =3D=3D NULL, it does not=
hing.
> + */
> +void pexpr_put(struct pexpr *e)
> +{
> +       if (!e)
> +               return;
> +
> +       if (e->ref_count =3D=3D 0) {
> +               printd("Invalid call to %s - ref_count is zero\n", __func=
__);
> +               return;
> +       }
> +
> +       --e->ref_count;
> +       if (e->ref_count > 0)
> +               return;
> +
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               break;
> +       case PE_AND:
> +       case PE_OR:
> +               pexpr_put(e->left.pexpr);
> +               pexpr_put(e->right.pexpr);
> +               break;
> +       case PE_NOT:
> +               pexpr_put(e->left.pexpr);
> +               break;
> +       }
> +
> +       free(e);
> +}
> +
> +/*
> + * calls pexpr_put for a NULL-terminated array of struct pexpr *
> + */
> +void _pexpr_put_list(struct pexpr **es)
> +{
> +       for (; *es !=3D NULL; es++)
> +               pexpr_put(*es);
> +}
> +
> +#define e1 (*ep1)
> +#define e2 (*ep2)
> +/*
> + * pexpr_eliminate_eq() helper
> + */
> +static void __pexpr_eliminate_eq(enum pexpr_type type, struct pexpr **ep=
1, struct pexpr **ep2,
> +                                struct cfdata *data)
> +{
> +       /* recurse down to the leaves */
> +       if (e1->type =3D=3D type) {
> +               __pexpr_eliminate_eq(type, &e1->left.pexpr, &e2, data);
> +               __pexpr_eliminate_eq(type, &e1->right.pexpr, &e2, data);
> +               return;
> +       }
> +       if (e2->type =3D=3D type) {
> +               __pexpr_eliminate_eq(type, &e1, &e2->left.pexpr, data);
> +               __pexpr_eliminate_eq(type, &e1, &e2->right.pexpr, data);
> +               return;
> +       }
> +
> +       /* e1 and e2 are leaves. Compare them. */
> +       if (e1->type =3D=3D PE_SYMBOL && e2->type =3D=3D PE_SYMBOL &&
> +           e1->left.fexpr->satval =3D=3D e2->left.fexpr->satval &&
> +           (e1->left.fexpr =3D=3D data->constants->const_true ||
> +            e2->left.fexpr =3D=3D data->constants->const_false))
> +               return;
> +       if (!pexpr_eq(e1, e2, data))
> +               return;
> +
> +       /* e1 and e2 are equal leaves. Prepare them for elimination. */
> +       trans_count++;
> +       pexpr_put(e1);
> +       pexpr_put(e2);
> +       switch (type) {
> +       case PE_AND:
> +               e1 =3D pexf(data->constants->const_true);
> +               e2 =3D pexf(data->constants->const_true);
> +               break;
> +       case PE_OR:
> +               e1 =3D pexf(data->constants->const_false);
> +               e2 =3D pexf(data->constants->const_false);
> +               break;
> +       default:
> +               break;
> +       }
> +}
> +
> +/*
> + * rewrite pexpr ep1 and ep2 to remove operands common to both
> + */
> +static void pexpr_eliminate_eq(struct pexpr **ep1, struct pexpr **ep2, s=
truct cfdata *data)
> +{
> +       if (!e1 || !e2)
> +               return;
> +
> +       switch (e1->type) {
> +       case PE_AND:
> +       case PE_OR:
> +               __pexpr_eliminate_eq(e1->type, ep1, ep2, data);
> +       default:
> +               break;
> +       }
> +       if (e1->type !=3D e2->type)
> +               switch (e2->type) {
> +               case PE_AND:
> +               case PE_OR:
> +                       __pexpr_eliminate_eq(e2->type, ep1, ep2, data);
> +               default:
> +                       break;
> +               }
> +       pexpr_eliminate_yn(e1, data);
> +       pexpr_eliminate_yn(e2, data);
> +}
> +#undef e1
> +#undef e2
> +
> +/*
> + * check whether 2 pexpr are equal
> + */
> +bool pexpr_eq(struct pexpr *e1, struct pexpr *e2, struct cfdata *data)
> +{
> +       bool res;
> +       int old_count;
> +
> +       if (!e1 || !e2)
> +               return false;
> +
> +       if (e1->type !=3D e2->type)
> +               return false;
> +
> +       switch (e1->type) {
> +       case PE_SYMBOL:
> +               return e1->left.fexpr->satval =3D=3D e2->left.fexpr->satv=
al;
> +       case PE_AND:
> +       case PE_OR:
> +               e1 =3D pexpr_deep_copy(e1);
> +               e2 =3D pexpr_deep_copy(e2);
> +               old_count =3D trans_count;
> +               pexpr_eliminate_eq(&e1, &e2, data);
> +               res =3D (e1->type =3D=3D PE_SYMBOL && e2->type =3D=3D PE_=
SYMBOL &&
> +                       e1->left.fexpr->satval =3D=3D e2->left.fexpr->sat=
val);
> +               pexpr_put(e1);
> +               pexpr_put(e2);
> +               trans_count =3D old_count;
> +               return res;
> +       case PE_NOT:
> +               return pexpr_eq(e1->left.pexpr, e2->left.pexpr, data);
> +       }
> +
> +       return false;
> +}
> +
> +/*
> + * print a pexpr
> + */
> +static void pexpr_print_util(struct pexpr *e, int prevtoken)
> +{
> +       if (!e)
> +               return;
> +
> +       switch (e->type) {
> +       case PE_SYMBOL:
> +               printf("%s", str_get(&e->left.fexpr->name));
> +               break;
> +       case PE_AND:
> +               if (prevtoken !=3D PE_AND && prevtoken !=3D -1)
> +                       printf("(");
> +               pexpr_print_util(e->left.pexpr, PE_AND);
> +               printf(" && ");
> +               pexpr_print_util(e->right.pexpr, PE_AND);
> +               if (prevtoken !=3D PE_AND && prevtoken !=3D -1)
> +                       printf(")");
> +               break;
> +       case PE_OR:
> +               if (prevtoken !=3D PE_OR && prevtoken !=3D -1)
> +                       printf("(");
> +               pexpr_print_util(e->left.pexpr, PE_OR);
> +               printf(" || ");
> +               pexpr_print_util(e->right.pexpr, PE_OR);
> +               if (prevtoken !=3D PE_OR && prevtoken !=3D -1)
> +                       printf(")");
> +               break;
> +       case PE_NOT:
> +               printf("!");
> +               pexpr_print_util(e->left.pexpr, PE_NOT);
> +               break;
> +       }
> +}
> +void pexpr_print(char *tag, struct pexpr *e, int prevtoken)
> +{
> +       printf("%s: ", tag);
> +       pexpr_print_util(e, prevtoken);
> +       printf("\n");
> +}
> +
> +/*
> + * convert a fexpr to a pexpr
> + */
> +struct pexpr *pexf(struct fexpr *fe)




Not only this one, but more descriptive function name please.

"pexf", so what?
I do not understand what it is doing from the name.









> +{
> +       struct pexpr *pe =3D xcalloc(1, sizeof(*pe));
> +
> +       pexpr_construct_sym(pe, fe, 1);
> +       return pe;
> +}
> +
> +void pexpr_construct_or(struct pexpr *e, struct pexpr *left,
> +                            struct pexpr *right, unsigned int ref_count)
> +{
> +       e->type =3D PE_OR;
> +       e->left.pexpr =3D left;
> +       e->right.pexpr =3D right;
> +       e->ref_count =3D ref_count;
> +}
> +
> +void pexpr_construct_and(struct pexpr *e, struct pexpr *left,
> +                            struct pexpr *right, unsigned int ref_count)
> +{
> +       e->type =3D PE_AND;
> +       e->left.pexpr =3D left;
> +       e->right.pexpr =3D right;
> +       e->ref_count =3D ref_count;
> +}
> +
> +void pexpr_construct_not(struct pexpr *e, struct pexpr *left,
> +                         unsigned int ref_count)
> +{
> +       e->type =3D PE_NOT;
> +       e->left.pexpr =3D left;
> +       e->right.pexpr =3D NULL;
> +       e->ref_count =3D ref_count;
> +}
> +
> +void pexpr_construct_sym(struct pexpr *e, struct fexpr *left,
> +                         unsigned int ref_count)
> +{
> +       e->type =3D PE_SYMBOL;
> +       e->left.fexpr =3D left;
> +       e->right.pexpr =3D NULL;
> +       e->ref_count =3D ref_count;
> +}
> +
> +static struct pexpr *pexpr_join_or(struct pexpr *e1, struct pexpr *e2, s=
truct cfdata *data)
> +{
> +       if (pexpr_eq(e1, e2, data))
> +               return pexpr_deep_copy(e1);
> +       else
> +               return NULL;
> +}
> +
> +static struct pexpr *pexpr_join_and(struct pexpr *e1, struct pexpr *e2, =
struct cfdata *data)
> +{
> +       if (pexpr_eq(e1, e2, data))
> +               return pexpr_deep_copy(e1);
> +       else
> +               return NULL;
> +}
> +
> +/*
> + * pexpr_eliminate_dups() helper.
> + */
> +static void pexpr_eliminate_dups1(enum pexpr_type type, struct pexpr **e=
p1, struct pexpr **ep2,
> +                                 struct cfdata *data)
> +{
> +#define e1 (*ep1)
> +#define e2 (*ep2)
> +
> +       struct pexpr *tmp;
> +
> +       /* recurse down to leaves */
> +       if (e1->type =3D=3D type) {
> +               pexpr_eliminate_dups1(type, &e1->left.pexpr, &e2, data);
> +               pexpr_eliminate_dups1(type, &e1->right.pexpr, &e2, data);
> +               return;
> +       }
> +       if (e2->type =3D=3D type) {
> +               pexpr_eliminate_dups1(type, &e1, &e2->left.pexpr, data);
> +               pexpr_eliminate_dups1(type, &e1, &e2->right.pexpr, data);
> +               return;
> +       }
> +
> +       /* e1 and e2 are leaves. Compare them. */
> +
> +       if (e1 =3D=3D e2)
> +               return;
> +
> +       switch (e1->type) {
> +       case PE_AND:
> +       case PE_OR:
> +               pexpr_eliminate_dups1(e1->type, &e1, &e1, data);
> +       default:
> +               break;
> +       }
> +
> +       switch (type) {
> +       case PE_AND:
> +               tmp =3D pexpr_join_and(e1, e2, data);
> +               if (tmp) {
> +                       pexpr_put(e1);
> +                       pexpr_put(e2);
> +                       e1 =3D pexf(data->constants->const_true);
> +                       e2 =3D tmp;
> +                       trans_count++;
> +               }
> +               break;
> +       case PE_OR:
> +               tmp =3D pexpr_join_or(e1, e2, data);
> +               if (tmp) {
> +                       pexpr_put(e1);
> +                       pexpr_put(e2);
> +                       e1 =3D pexf(data->constants->const_false);
> +                       e2 =3D tmp;
> +                       trans_count++;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +
> +#undef e1
> +#undef e2
> +}
> +
> +/*
> + * eliminate duplicate and redundant operands
> + */
> +struct pexpr *pexpr_eliminate_dups(struct pexpr *e, struct cfdata *data)
> +{
> +       int oldcount;
> +
> +       if (!e)
> +               return e;
> +
> +       oldcount =3D trans_count;
> +       while (true) {
> +               trans_count =3D 0;
> +               switch (e->type) {
> +               case PE_AND:
> +               case PE_OR:
> +                       pexpr_eliminate_dups1(e->type, &e, &e, data);
> +               default:
> +                       break;
> +               }
> +               if (!trans_count)
> +                       /* no simplification done in this pass. We're don=
e. */
> +                       break;
> +               pexpr_eliminate_yn(e, data);
> +       }
> +       trans_count =3D oldcount;
> +       return e;
> +}



This is a full copy-paste of scripts/kconfig/expr.c

If you need all of these, please referector
to avoid code duplication.












> diff --git a/scripts/kconfig/cf_expr.h b/scripts/kconfig/cf_expr.h
> new file mode 100644
> index 000000000000..07435ae381e6
> --- /dev/null
> +++ b/scripts/kconfig/cf_expr.h
> @@ -0,0 +1,296 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
> + */
> +
> +#ifndef CF_EXPR_H
> +#define CF_EXPR_H
> +
> +#include <stdbool.h>
> +
> +#include "cf_defs.h"(
> +
> +#define fexpr_list_for_each(node, list) \
> +       for (node =3D list->head; node !=3D NULL; node =3D node->next)
> +
> +#define fexl_list_for_each(node, list) \
> +       fexpr_list_for_each(node, list)
> +
> +#define pexpr_list_for_each(node, list) \
> +       fexpr_list_for_each(node, list)
> +
> +#define sdv_list_for_each(node, list) \
> +       fexpr_list_for_each(node, list)
> +
> +#define sfix_list_for_each(node, list) \
> +       fexpr_list_for_each(node, list)
> +
> +#define sfl_list_for_each(node, list) \
> +       fexpr_list_for_each(node, list)
> +
> +#define sym_list_for_each(node, list) \
> +       fexpr_list_for_each(node, list)
> +
> +#define defm_list_for_each(node, list) \
> +       fexpr_list_for_each(node, list)
> +
> +#define prop_list_for_each(node, list) \
> +       fexpr_list_for_each(node, list)


All of these are the same as fexpr_list_for_each(),
which is the same as list_for_each().

kconfig already use list.h

Please do not proliferate similar code.







> +
> +/* call pexpr_put for a list of pexpr's */
> +#define PEXPR_PUT(...) _pexpr_put_list((struct pexpr *[]){ __VA_ARGS__, =
NULL })
> +
> +/* create a fexpr */
> +struct fexpr *fexpr_create(int satval, enum fexpr_type type, char *name)=
;
> +
> +/* create the fexpr for a symbol */
> +void sym_create_fexpr(struct symbol *sym, struct cfdata *data);
> +
> +struct pexpr *expr_calculate_pexpr_both(struct expr *e, struct cfdata *d=
ata);
> +struct pexpr *expr_calculate_pexpr_y(struct expr *e, struct cfdata *data=
);
> +struct pexpr *expr_calculate_pexpr_m(struct expr *e, struct cfdata *data=
);
> +struct pexpr *expr_calculate_pexpr_y_and(struct expr *a, struct expr *b,
> +                                        struct cfdata *data);
> +struct pexpr *expr_calculate_pexpr_m_and(struct expr *a, struct expr *b,
> +                                        struct cfdata *data);
> +struct pexpr *expr_calculate_pexpr_both_and(struct expr *a, struct expr =
*b,
> +                                           struct cfdata *data);
> +struct pexpr *expr_calculate_pexpr_y_or(struct expr *a, struct expr *b,
> +                                       struct cfdata *data);
> +struct pexpr *expr_calculate_pexpr_m_or(struct expr *a, struct expr *b,
> +                                       struct cfdata *data);
> +struct pexpr *expr_calculate_pexpr_both_or(struct expr *a, struct expr *=
b,
> +                                          struct cfdata *data);
> +struct pexpr *expr_calculate_pexpr_y_not(struct expr *e, struct cfdata *=
data);
> +struct pexpr *expr_calculate_pexpr_m_not(struct expr *e, struct cfdata *=
data);
> +struct pexpr *expr_calculate_pexpr_y_equals(struct expr *e,
> +                                           struct cfdata *data);
> +struct pexpr *expr_calculate_pexpr_y_unequals(struct expr *e,
> +                                             struct cfdata *data);
> +struct pexpr *expr_calculate_pexpr_y_comp(struct expr *e, struct cfdata =
*data);
> +
> +/* macro to create a pexpr of type AND */
> +struct pexpr *pexpr_and_share(struct pexpr *a, struct pexpr *b,
> +                             struct cfdata *data);
> +struct pexpr *pexpr_and(struct pexpr *a, struct pexpr *b, struct cfdata =
*data,
> +                       enum pexpr_move move);
> +
> +/* macro to create a pexpr of type OR */
> +struct pexpr *pexpr_or_share(struct pexpr *a, struct pexpr *b,
> +                            struct cfdata *data);
> +struct pexpr *pexpr_or(struct pexpr *a, struct pexpr *b, struct cfdata *=
data,
> +                      enum pexpr_move move);
> +
> +/* macro to create a pexpr of type NOT */
> +struct pexpr *pexpr_not_share(struct pexpr *a, struct cfdata *data);
> +struct pexpr *pexpr_not(struct pexpr *a, struct cfdata *data);
> +
> +/* check whether a pexpr is in CNF */
> +bool pexpr_is_cnf(struct pexpr *e);
> +
> +/* check whether a pexpr is in NNF */
> +bool pexpr_is_nnf(struct pexpr *e);
> +
> +/* return fexpr_both for a symbol */
> +struct pexpr *sym_get_fexpr_both(struct symbol *sym, struct cfdata *data=
);
> +
> +/* return fexpr_sel_both for a symbol */
> +struct pexpr *sym_get_fexpr_sel_both(struct symbol *sym, struct cfdata *=
data);
> +
> +/* create the fexpr of a non-boolean symbol for a specific value */
> +struct fexpr *sym_create_nonbool_fexpr(struct symbol *sym, char *value,
> +                                      struct cfdata *data);
> +
> +/*
> + * return the fexpr of a non-boolean symbol for a specific value, NULL i=
f
> + * non-existent
> + */
> +struct fexpr *sym_get_nonbool_fexpr(struct symbol *sym, char *value);
> +
> +/*
> + * return the fexpr of a non-boolean symbol for a specific value, if it =
exists
> + * otherwise create it
> + */
> +struct fexpr *sym_get_or_create_nonbool_fexpr(struct symbol *sym, char *=
value, struct cfdata *data);
> +
> +/* macro to construct a pexpr for "A implies B" */
> +struct pexpr *pexpr_implies_share(struct pexpr *a, struct pexpr *b, stru=
ct cfdata *data);
> +struct pexpr *pexpr_implies(struct pexpr *a, struct pexpr *b, struct cfd=
ata *data,
> +                           enum pexpr_move move);
> +
> +/* check, if the fexpr is a symbol, a True/False-constant, a literal sym=
bolising a non-boolean or
> + * a choice symbol
> + */
> +bool fexpr_is_symbol(struct fexpr *e);
> +
> +/* check whether a pexpr is a symbol or a negated symbol */
> +bool pexpr_is_symbol(struct pexpr *e);
> +
> +/* check whether the fexpr is a constant (true/false) */
> +bool fexpr_is_constant(struct fexpr *e, struct cfdata *data);
> +
> +/* add a fexpr to the satmap */
> +void fexpr_add_to_satmap(struct fexpr *e, struct cfdata *data);
> +
> +/* print an fexpr */
> +void fexpr_print(char *tag, struct fexpr *e);
> +
> +/* write an fexpr into a string (format needed for testing) */
> +void fexpr_as_char(struct fexpr *e, struct gstr *s);
> +
> +/* write pn pexpr into a string */
> +void pexpr_as_char_short(struct pexpr *e, struct gstr *s, int parent);
> +
> +/* write an fexpr into a string (format needed for testing) */
> +void pexpr_as_char(struct pexpr *e, struct gstr *s, int parent, struct c=
fdata *data);
> +
> +/* check whether a pexpr contains a specific fexpr */
> +bool pexpr_contains_fexpr(struct pexpr *e, struct fexpr *fe);
> +
> +/* init list of fexpr */
> +struct fexpr_list *fexpr_list_init(void);
> +
> +/* init list of fexpr_list */
> +struct fexl_list *fexl_list_init(void);
> +
> +/* init list of pexpr */
> +struct pexpr_list *pexpr_list_init(void);
> +
> +/* init list of symbol_fix */
> +struct sfix_list *sfix_list_init(void);
> +
> +/* init list of sfix_list */
> +struct sfl_list *sfl_list_init(void);
> +
> +/* init list of symbol_dvalue */
> +struct sdv_list *sdv_list_init(void);
> +
> +/* init list of symbols */
> +struct sym_list *sym_list_init(void);
> +
> +/* init list of default_maps */
> +struct defm_list *defm_list_init(void);
> +
> +/* init list of properties */
> +struct prop_list *prop_list_init(void);
> +
> +/* add element to tail of a fexpr_list */
> +void fexpr_list_add(struct fexpr_list *list, struct fexpr *fe);
> +
> +/* add element to tail of a fexl_list */
> +void fexl_list_add(struct fexl_list *list, struct fexpr_list *elem);
> +
> +/* add element to tail of a pexpr_list */
> +void pexpr_list_add(struct pexpr_list *list, struct pexpr *e);
> +
> +/* add element to tail of a sfix_list */
> +void sfix_list_add(struct sfix_list *list, struct symbol_fix *fix);
> +
> +/* add element to tail of a sfl_list */
> +void sfl_list_add(struct sfl_list *list, struct sfix_list *elem);
> +
> +/* add element to tail of a sdv_list */
> +void sdv_list_add(struct sdv_list *list, struct symbol_dvalue *sdv);
> +
> +/* add element to tail of a sym_list */
> +void sym_list_add(struct sym_list *list, struct symbol *sym);
> +
> +/* add element to tail of a defm_list */
> +void defm_list_add(struct defm_list *list, struct default_map *map);
> +
> +/* add element to tail of a prop_list */
> +void prop_list_add(struct prop_list *list, struct property *prop);
> +
> +/* delete an element from a fexpr_list */
> +void fexpr_list_delete(struct fexpr_list *list, struct fexpr_node *node)=
;
> +
> +/* delete an element from a fexpr_list */
> +void fexl_list_delete(struct fexl_list *list, struct fexl_node *node);
> +
> +/* delete the first occurrence of elem in an fexl_list */
> +void fexl_list_delete_elem(struct fexl_list *list, struct fexpr_list *el=
em);
> +
> +/* delete an element from a pexpr_list */
> +void pexpr_list_delete(struct pexpr_list *list, struct pexpr_node *node)=
;
> +
> +/* delete an element from a sfix_list */
> +void sfix_list_delete(struct sfix_list *list, struct sfix_node *node);
> +
> +/* make a shallow copy of a fexpr_list */
> +struct fexpr_list *fexpr_list_copy(struct fexpr_list *list);
> +
> +/* make a shallow copy of a fexpr_list */
> +struct fexl_list *fexl_list_copy(struct fexl_list *list);
> +
> +/* make a shallow copy of a sdv_list */
> +struct sdv_list *sdv_list_copy(struct sdv_list *list);
> +
> +/* make a shallow copy of a sfix_list */
> +struct sfix_list *sfix_list_copy(struct sfix_list *list);
> +
> +/* print a fexpr_list */
> +void fexpr_list_print(char *title, struct fexpr_list *list);
> +
> +/* print a fexl_list */
> +void fexl_list_print(char *title, struct fexl_list *list);
> +
> +/* print a pexpr_list */
> +void pexpr_list_print(char *title, struct pexpr_list *list);
> +
> +/* free an fexpr_list */
> +void fexpr_list_free(struct fexpr_list *list);
> +
> +/* free an pexpr_list (and pexpr_put the elements) */
> +void pexpr_list_free_put(struct pexpr_list *list);
> +
> +/* free an fexl_list */
> +void fexl_list_free(struct fexl_list *list);
> +
> +/* free a sdv_list */
> +void sdv_list_free(struct sdv_list *list);
> +
> +/* free a prop_list */
> +void prop_list_free(struct prop_list *list);
> +
> +/* free a defm_list (and pexpr_put the conditions of the maps) */
> +void defm_list_destruct(struct defm_list *list);
> +
> +/* free a sym_list */
> +void sym_list_free(struct sym_list *list);
> +
> +/* check whether 2 pexpr are equal */
> +bool pexpr_eq(struct pexpr *e1, struct pexpr *e2, struct cfdata *data);
> +
> +/* copy a pexpr */
> +struct pexpr *pexpr_deep_copy(const struct pexpr *org);
> +
> +void pexpr_construct_sym(struct pexpr *e, struct fexpr *left,
> +                        unsigned int ref_count);
> +void pexpr_construct_not(struct pexpr *e, struct pexpr *left,
> +                        unsigned int ref_count);
> +void pexpr_construct_and(struct pexpr *e, struct pexpr *left,
> +                        struct pexpr *right, unsigned int ref_count);
> +void pexpr_construct_or(struct pexpr *e, struct pexpr *left,
> +                       struct pexpr *right, unsigned int ref_count);
> +
> +/* free a pexpr */
> +void pexpr_free_depr(struct pexpr *e);
> +
> +/* give up a reference to e. Also see struct pexpr. */
> +void pexpr_put(struct pexpr *e);
> +/* Used by PEXPR_PUT(). Not to be used directly. */
> +void _pexpr_put_list(struct pexpr **es);
> +
> +/* acquire a reference to e. Also see struct pexpr. */
> +struct pexpr *pexpr_get(struct pexpr *e);
> +
> +/* print a pexpr  */
> +void pexpr_print(char *tag, struct pexpr *e, int prevtoken);
> +
> +/* convert a fexpr to a pexpr */
> +struct pexpr *pexf(struct fexpr *fe);
> +
> +/* eliminate duplicate and redundant operands */
> +struct pexpr *pexpr_eliminate_dups(struct pexpr *e, struct cfdata *data)=
;
> +
> +#endif

> --
> 2.39.2
>


--
Best Regards


Masahiro Yamada

