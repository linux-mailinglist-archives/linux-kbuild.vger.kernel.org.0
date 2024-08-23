Return-Path: <linux-kbuild+bounces-3183-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B032495D4B9
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 19:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4AFD1C22A1B
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 17:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7854D19047C;
	Fri, 23 Aug 2024 17:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k20cIOi2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51187188A1E;
	Fri, 23 Aug 2024 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724435710; cv=none; b=ma1DoGUQBzKKlEVRf1kx6Mcv1umZDCdooAb4ab5ZssNNkkMlVmGFX/M0PBs97NgDfEiEGEJaE4BSuWw1Fc9kqgoD9zKK9UTD/vuR1CIL6L4CxdoTMYhAsLe7wLlbxN6v1yu1Pho9p3cfG1Hs7nCl5VBEVzvtEtQ98xhKnk+2gV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724435710; c=relaxed/simple;
	bh=UOxjvt9pGASK1dIWt41XAXbmntqOAXtF5gBonB4kaaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HL/CcmZ3Ql5oM0iMfJIQQeb+IJzsX3BdXZ7caetZ9aB0KG3E/lwhnzys0ipYnTgQrWy101R0cNcz8/8n8d95EpU6krqcEB58eHDv4lac2Ti6788zNF03hMMiL+UI5ThLY6HVgWdpLHhJWIZpIVaUVzC2KexkNtEb6/j3oOemOOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k20cIOi2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995E8C4AF09;
	Fri, 23 Aug 2024 17:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724435709;
	bh=UOxjvt9pGASK1dIWt41XAXbmntqOAXtF5gBonB4kaaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k20cIOi2NsiNke0cyddJDXA0709XN9pkSxbL2o1Vy3SuDhl8wRPkzd2shvqW1sWZi
	 AGwMfKRGimshpYyE6f+2Qv794mt0dhVi7TGTUsXJsrbqcD0BPCqUXpt5TXsy7tXRBk
	 h8A5jSPnk3C8LkFrMhVKqCBtWswamPdnAIX0IKRcmSZYu3qW4yMv82o991IaA3tzXw
	 F1F56619cVMh7ZOxS4YCK9t85BF+QdAM7yuxE0rC26qf8pEIV0+GoWs7wt3BnnaNuy
	 LLXqCin2JqQGnmmgSG3w68vBXNz3fFzJ+v9N1s8aYrh2qUGkaaqHO5YLx8lEnhCrda
	 ZmLoeuJS6rUgg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5334c4d6829so2994736e87.2;
        Fri, 23 Aug 2024 10:55:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7S5MVbycc7XNfSmC+yf1xgbYCkZGBFqmmpMz/zm4NdLNR3PhmggbnRCMBLFnmOHVobxS/bUknjDXUEQQ=@vger.kernel.org, AJvYcCXE6nMhQLy1BJnQi3dXhc6os8uriCHVcIuzt1XDLvc63xikjE8C5/C6ipXFWIVnEX/ptFeao/6rHmhP5Ck0@vger.kernel.org
X-Gm-Message-State: AOJu0YxMl+FMeliJir5W+hKX3UHKgYWP0g528H/9HvRPRBIWNgky+x9T
	xW5PBciBmU9A6Ae+bEiMfupGa2xs+h/VOaSR5ivy6zas8AxPNexvJvvBCYYBkSboo88vebxhiDy
	diQOurSNXi5xU28qp9FNDW9tk6Zg=
X-Google-Smtp-Source: AGHT+IFPjZ8XOKb8LplakpJoEmjuYPSajrf1IroJYlFFS+eIZFbY+UJ53iYMccc/F7YlTZs0fk3qI5M6CHDST2SHyiA=
X-Received: by 2002:a05:6512:3d8d:b0:52e:97dd:327b with SMTP id
 2adb3069b0e04-5343877a93dmr2257515e87.23.1724435708200; Fri, 23 Aug 2024
 10:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823034455.3593819-1-mcgrof@kernel.org>
In-Reply-To: <20240823034455.3593819-1-mcgrof@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 24 Aug 2024 02:54:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT79Vgo4f335_XAfS36xqNcTm08=oz8aNqkj0LiJFbn4Q@mail.gmail.com>
Message-ID: <CAK7LNAT79Vgo4f335_XAfS36xqNcTm08=oz8aNqkj0LiJFbn4Q@mail.gmail.com>
Subject: Re: [RFC] kconfig: add optional selective yaml output support
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: kdevops@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 12:45=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> kconfig is used outside of Linux, and one of the uses of Kconfig is to
> also allow kconfig to be used for automation on kdevops by leveraging
> a smaller subset of variables for yaml run time for ansible runs.
> There is no need to clutter a full yaml file with every single config
> we have as we do in the kernel, and so this lets users decide if they
> want all or just a few select key symbols as part of the yaml output.
>
> What this will do is save us the pain of doing the selective transformati=
on
> we currently do and let's us only annotate what we need for runtime with
> ansible.
>
> You can test with the Linux kernel config (that's not what we use):
>
> export KCONFIG_YAMLCFG=3D".yaml"
> export KCONFIG_YAMLCFG_ALL=3D"y"
> rm -f .config .yaml
> make defconfig
> head -10 .yaml
> ---
> cc_version_text: "gcc (Debian 13.3.0-1) 13.3.0"
> cc_is_gcc: True
> gcc_version: 130300
> clang_version: 0
> as_is_gnu: True
> as_version: 24250
> ld_is_bfd: True
> ld_version: 24250
> lld_version: 0
>
> You can also use the selective mechanism "output yaml" on any symbol,
> so that we only output those. This also paves the way to let us later
> use kconfig for direct json transformations directly from the same
> kconfig logic.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>
> Long ago, I envisioned we could do this so to simplify the addition of
> new workflows and remove all the stupid Makefile transformations we have
> in kdevops today to generate extra_vars.yaml.
>
> Feedback welcome.
>
> I completley understand if this is not desirable upstream.


Agree.
Not desirable upstream.



> However
> kdevops does aim to track kconfig upstream using a git sub tree already,
> it follows linux-next, and so getting support upstream is easier rather
> than going with a branch for our git subtree.
>
> The only puzzle I have is why when we use the selective method, we end
> up with tons of empty lines.. Any ideas? Example of how one can use this
> this on random symbols in case it is not clear, with the selective
> method:
>
> If we use this for example:
>
>   diff --git a/fs/efivarfs/Kconfig b/fs/efivarfs/Kconfig
>   index edec8a19c894..2faf651725dc 100644
>   --- a/fs/efivarfs/Kconfig
>   +++ b/fs/efivarfs/Kconfig
>   @@ -3,6 +3,7 @@ config EFIVAR_FS
>         tristate "EFI Variable filesystem"
>         depends on EFI
>         default m
>   +     output yaml
>         help
>           efivarfs is a replacement filesystem for the old EFI
>           variable support via sysfs, as it doesn't suffer from the
>
> In this case we'd end up with just:
>
> export KCONFIG_YAMLCFG=3D".yaml"
> unset KCONFIG_YAMLCFG_ALL
> rm -f .config .yaml
> make defconfig
> cat .yaml | cat -s
> ---
>
> efivar_fs: m
>
> Thoughts?
>
>  scripts/kconfig/confdata.c | 152 ++++++++++++++++++++++++++++++++++++-
>  scripts/kconfig/expr.h     |   1 +
>  scripts/kconfig/lexer.l    |   2 +
>  scripts/kconfig/parser.y   |  11 +++
>  4 files changed, 163 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 76193ce5a792..78d188320040 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -233,6 +233,20 @@ static const char *conf_get_rustccfg_name(void)
>         return name ? name : "include/generated/rustc_cfg";
>  }
>
> +static bool conf_yaml_enable_all(void)
> +{
> +       char *name =3D getenv("KCONFIG_YAMLCFG_ALL");
> +
> +       return name ? true: false;
> +}
> +
> +static const char *conf_get_yaml_config_name(void)
> +{
> +       char *name =3D getenv("KCONFIG_YAMLCFG");
> +
> +       return name ? name : NULL;
> +}
> +
>  static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, =
char *p)
>  {
>         char *p2;
> @@ -623,9 +637,103 @@ static void __print_symbol(FILE *fp, struct symbol =
*sym, enum output_n output_n,
>         free(escaped);
>  }
>
> -static void print_symbol_for_dotconfig(FILE *fp, struct symbol *sym)
> +static char *conf_name_to_yaml(struct symbol *sym)
> +{
> +       const char *name =3D sym->name;
> +       size_t len =3D strlen(name);
> +       size_t i, j =3D 0;
> +       char *yaml_name =3D (char *) malloc(len + 1);
> +
> +       if (!yaml_name)
> +               return NULL;
> +
> +       for (i =3D 0; i < len; i++) {
> +               if (name[i] =3D=3D '_')
> +                       yaml_name[j++] =3D '_';
> +               else
> +                       yaml_name[j++] =3D tolower(name[i]);
> +       }
> +
> +       yaml_name[j] =3D '\0';
> +
> +    return yaml_name;
> +}
> +
> +static char *conf_value_to_yaml(struct symbol *sym, const char *val)
> +{
> +       char *yaml_value =3D NULL;
> +
> +       switch (sym->type) {
> +       case S_INT:
> +               yaml_value =3D strdup(val);
> +               break;
> +       case S_HEX:
> +            asprintf(&yaml_value, "0x%s", val);
> +            break;
> +        case S_STRING:
> +           /* Wrap strings in quotes */
> +            asprintf(&yaml_value, "\"%s\"", val);
> +            break;
> +        case S_BOOLEAN:
> +        case S_TRISTATE:
> +               if (strcmp(val, "y") =3D=3D 0)
> +                       yaml_value =3D strdup("True");
> +               else if (strcmp(val, "n") =3D=3D 0)
> +                       yaml_value =3D strdup("False");
> +               else
> +                       yaml_value =3D strdup(val); /* m in tristate */
> +               break;
> +        default:
> +               /* In case type is unknown */
> +               yaml_value =3D strdup(val);
> +               break;
> +       }
> +
> +       return yaml_value;
> +}
> +
> +static void __print_yaml_symbol(FILE *fp, struct symbol *sym,
> +                               enum output_n output_n,
> +                               bool escape_string)
> +{
> +       const char *val;
> +       char *yaml_config =3D NULL;
> +       char *yaml_config_value =3D NULL;
> +
> +       if (!fp || sym->type =3D=3D S_UNKNOWN)
> +               return;
> +       if (!conf_yaml_enable_all() && !(sym->flags & SYMBOL_YAML))
> +               return;
> +
> +       val =3D sym_get_string_value(sym);
> +
> +       yaml_config =3D conf_name_to_yaml(sym);
> +       if (!yaml_config)
> +               return;
> +
> +       yaml_config_value =3D conf_value_to_yaml(sym, val);
> +       if (!yaml_config_value) {
> +               free(yaml_config);
> +               return;
> +       }
> +
> +       if ((sym->type =3D=3D S_BOOLEAN || sym->type =3D=3D S_TRISTATE) &=
&
> +           output_n !=3D OUTPUT_N && *val =3D=3D 'n') {
> +               if (output_n =3D=3D OUTPUT_N_AS_UNSET && conf_yaml_enable=
_all())
> +                       fprintf(fp, "# %s: False\n", yaml_config);
> +               return;
> +       }
> +
> +       fprintf(fp, "%s: %s\n", yaml_config, yaml_config_value);
> +
> +       free(yaml_config);
> +       free(yaml_config_value);
> +}
> +
> +static void print_symbol_for_dotconfig(FILE *fp, FILE *yaml, struct symb=
ol *sym)
>  {
>         __print_symbol(fp, sym, OUTPUT_N_AS_UNSET, true);
> +       __print_yaml_symbol(yaml, sym, OUTPUT_N_AS_UNSET, true);
>  }
>
>  static void print_symbol_for_autoconf(FILE *fp, struct symbol *sym)
> @@ -748,11 +856,24 @@ int conf_write_defconfig(const char *filename)
>         struct symbol *sym;
>         struct menu *menu;
>         FILE *out;
> +       FILE *yaml_out =3D NULL;
> +       const char *yaml_config =3D NULL;
> +
> +       yaml_config =3D conf_get_yaml_config_name();
>
>         out =3D fopen(filename, "w");
>         if (!out)
>                 return 1;
>
> +       if (yaml_config) {
> +               yaml_out =3D fopen(yaml_config, "w");
> +               if (!yaml_out) {
> +                       fclose(out);
> +                       return 1;
> +               }
> +               fprintf(yaml_out, "---\n");
> +       }
> +
>         sym_clear_all_valid();
>
>         menu_for_each_entry(menu) {
> @@ -783,21 +904,25 @@ int conf_write_defconfig(const char *filename)
>                         if (sym =3D=3D ds && sym_get_tristate_value(sym) =
=3D=3D yes)
>                                 continue;
>                 }
> -               print_symbol_for_dotconfig(out, sym);
> +               print_symbol_for_dotconfig(out, yaml_out, sym);
>         }
>         fclose(out);
> +       if (yaml_out)
> +               fclose(yaml_out);
>         return 0;
>  }
>
>  int conf_write(const char *name)
>  {
>         FILE *out;
> +       FILE *yaml_out =3D NULL;
>         struct symbol *sym;
>         struct menu *menu;
>         const char *str;
>         char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
>         char *env;
>         bool need_newline =3D false;
> +       const char *yaml_config;
>
>         if (!name)
>                 name =3D conf_get_configname();
> @@ -815,18 +940,33 @@ int conf_write(const char *name)
>         if (make_parent_dir(name))
>                 return -1;
>
> +       yaml_config =3D conf_get_yaml_config_name();
> +
>         env =3D getenv("KCONFIG_OVERWRITECONFIG");
>         if (env && *env) {
>                 *tmpname =3D 0;
>                 out =3D fopen(name, "w");
> +               if (yaml_config)
> +                       yaml_out =3D fopen(yaml_config, "w");
>         } else {
>                 snprintf(tmpname, sizeof(tmpname), "%s.%d.tmp",
>                          name, (int)getpid());
>                 out =3D fopen(tmpname, "w");
> +               if (yaml_config)
> +                       yaml_out =3D fopen(yaml_config, "w");
>         }
>         if (!out)
>                 return 1;
>
> +       if (yaml_config) {
> +               if (!yaml_out) {
> +                       fclose(out);
> +                       return 1;
> +               }
> +               fprintf(yaml_out, "---\n");
> +       }
> +
> +
>         conf_write_heading(out, &comment_style_pound);
>
>         if (!conf_get_changed())
> @@ -852,9 +992,11 @@ int conf_write(const char *name)
>                         if (need_newline) {
>                                 fprintf(out, "\n");
>                                 need_newline =3D false;
> +                               if (yaml_config)
> +                                       fprintf(yaml_out, "\n");
>                         }
>                         sym->flags |=3D SYMBOL_WRITTEN;
> -                       print_symbol_for_dotconfig(out, sym);
> +                       print_symbol_for_dotconfig(out, yaml_out, sym);
>                 }
>
>  next:
> @@ -879,6 +1021,8 @@ int conf_write(const char *name)
>                 }
>         }
>         fclose(out);
> +       if (yaml_out)
> +               fclose(yaml_out);
>
>         for_all_symbols(sym)
>                 sym->flags &=3D ~SYMBOL_WRITTEN;
> @@ -898,6 +1042,8 @@ int conf_write(const char *name)
>         }
>
>         conf_message("configuration written to %s", name);
> +       if (yaml_config)
> +               conf_message("yaml configuration written to %s", yaml_con=
fig);
>
>         conf_set_changed(false);
>
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 2bc96cd28253..88e8a2a06f67 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -132,6 +132,7 @@ struct symbol {
>  #define SYMBOL_CHECK      0x0008  /* used during dependency checking */
>  #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated =
*/
>  #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFI=
G) */
> +#define SYMBOL_YAML       0x0400  /* write symbol to file (KCONFIG_YAMLC=
FG) */
>  #define SYMBOL_WRITTEN    0x0800  /* track info to avoid double-write to=
 .config */
>  #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
>  #define SYMBOL_WARNED     0x8000  /* warning has been issued */
> diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
> index 8dd597c4710d..190937070fb1 100644
> --- a/scripts/kconfig/lexer.l
> +++ b/scripts/kconfig/lexer.l
> @@ -120,6 +120,7 @@ n   [A-Za-z0-9_-]
>  "menuconfig"           return T_MENUCONFIG;
>  "modules"              return T_MODULES;
>  "on"                   return T_ON;
> +"output"               return T_OUTPUT;
>  "prompt"               return T_PROMPT;
>  "range"                        return T_RANGE;
>  "select"               return T_SELECT;
> @@ -127,6 +128,7 @@ n   [A-Za-z0-9_-]
>  "string"               return T_STRING;
>  "tristate"             return T_TRISTATE;
>  "visible"              return T_VISIBLE;
> +"yaml"                 return T_YAML;
>  "||"                   return T_OR;
>  "&&"                   return T_AND;
>  "=3D"                    return T_EQUAL;
> diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> index 61900feb4254..f298f052dddc 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -69,6 +69,7 @@ struct menu *current_menu, *current_entry, *current_cho=
ice;
>  %token T_MODULES
>  %token T_ON
>  %token T_OPEN_PAREN
> +%token T_OUTPUT
>  %token T_PLUS_EQUAL
>  %token T_PROMPT
>  %token T_RANGE
> @@ -77,6 +78,7 @@ struct menu *current_menu, *current_entry, *current_cho=
ice;
>  %token T_STRING
>  %token T_TRISTATE
>  %token T_VISIBLE
> +%token T_YAML
>  %token T_EOL
>  %token <string> T_ASSIGN_VAL
>
> @@ -234,6 +236,15 @@ config_option: T_MODULES T_EOL
>         modules_sym =3D current_entry->sym;
>  };
>
> +/* When we want to output symbols as part of an additional output format=
s */
> +
> +config_option: T_OUTPUT T_YAML T_EOL
> +{
> +       printd(DEBUG_PARSE, "%s will be part of the yaml output file %s:%=
d:\n",
> +              current_entry->sym->name, cur_filename, cur_lineno);
> +       current_entry->sym->flags |=3D SYMBOL_YAML;
> +};
> +
>  /* choice entry */
>
>  choice: T_CHOICE T_EOL
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

