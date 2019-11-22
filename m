Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D92106971
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2019 11:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfKVKBO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Nov 2019 05:01:14 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:29487 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKVKBO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Nov 2019 05:01:14 -0500
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id xAMA114b032362
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2019 19:01:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com xAMA114b032362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574416862;
        bh=+oZKfD9ay5lPDxoWUbinYfRBDT8eJc0QDz2yBEDVscU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oSHrIJIfFIv1qxCoZ4Lm/r5Nj+Svlr/LA8XoIH+ey/jqZP8owlshBXFvgrvNqukKy
         mT6XW0eMjUHuyjpYMDpGvixJWp+Vvv3JwNYhF1wVxYtbb2x0wazAZDfpiJTCbmW1el
         uAlK0vvhTMn1Rtk+rysvrJntzGkpOmq7/70MdL79ThMxhHDpbTGQMGDCqsOuDF0HR3
         NDegeArGHY7NIwCN1NcPei9y5ArBFY7ac3DqsH2rZLGaK310FUqHr/r5cRqPu4gSW0
         kk2VSexDMSzt9C4T+pk8RFL9Qi6b/nKTHg3OtDx/kIIQ2D4XTVcWtfNgJOBYM/K3Dc
         Ttqt+agUZT2jQ==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id x21so4419133vsp.6
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2019 02:01:02 -0800 (PST)
X-Gm-Message-State: APjAAAXNw0/A84CEw0D6vzAmW4pByOlI2b/ZB7DTSgxmN23jUcVQpu21
        n+5Af74+Fr4Mx626ilJs2i8aRSRIU6Et3tPAEec=
X-Google-Smtp-Source: APXvYqz4l0YkqhL8AjVL4NNeQyz62lrxg8Ng9bnFfYotx5RwV8lEquil/mmnP2tatY2C3uZlWU7oi0g/iW6YK6bSJSI=
X-Received: by 2002:a67:d31b:: with SMTP id a27mr9860105vsj.215.1574416859845;
 Fri, 22 Nov 2019 02:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20191119224225.2438-1-eugene.loh@oracle.com> <20191120045938.2155-1-eugene.loh@oracle.com>
In-Reply-To: <20191120045938.2155-1-eugene.loh@oracle.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 22 Nov 2019 19:00:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNASv4BkjHYaUXWEjeizHF6UckSef72y=X1VV2zEAOn1XdA@mail.gmail.com>
Message-ID: <CAK7LNASv4BkjHYaUXWEjeizHF6UckSef72y=X1VV2zEAOn1XdA@mail.gmail.com>
Subject: Re: [PATCH v3] kallsyms: add names of built-in modules
To:     eugene.loh@oracle.com
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Keller, Jacob E" <jacob.e.keller@intel.com>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 20, 2019 at 2:02 PM <eugene.loh@oracle.com> wrote:
>
> From: Eugene Loh <eugene.loh@oracle.com>
>
> /proc/kallsyms is very useful for tracers and other tools that need
> to map kernel symbols to addresses.
>
> It would be useful if there were a mapping between kernel symbol and
> module name that only changed when the kernel source code is changed.



Unfortunately, this is not necessarily true.

Some objects could be linked into multiple modules.

For example, see
lib/zstd/Makefile
drivers/net/ethernet/cavium/liquidio/Makefile


For real modules, the mapping from a symbol to a modname
works well in /proc/kallsyms.

For built-in modules, it is quite subtle.


I will show corner cases.

Build with CONFIG_LIQUIDIO=m && CONFIG_LIQUIDIO_VF=m

Then, do
$ modprobe liquidio
$ modprobe liquidio_vf
$ grep  lio_get_link_ksettings  /proc/kallsyms

I think the output is correct.



CONFIG_LIQUIDIO=y && CONFIG_LIQUIDIO_VF=n  is OK
CONFIG_LIQUIDIO=n && CONFIG_LIQUIDIO_VF=y  is OK

The symbol-to-modname mapping changes depending on
the .config though.


What about  CONFIG_LIQUIDIO=y && CONFIG_LIQUIDIO_VF=y ?

It is hard to say which particular module the symbol came from.

As far as I tested this patch, it seems it picked up a
random one?




> This mapping should not vanish simply because a module becomes built
> into the kernel.
>
> Therefore:
>
> - Generate a file "modules_thick.builtin" that maps from thin
>   archives that make up built-in modules to their constituent
>   object files.
>
> - Generate a linker map ".tmp_vmlinux.map", converting it into
>   ".tmp_vmlinux.ranges", mapping address ranges to object files.
>
> - Read "modules_thick.builtin" and ".tmp_vmlinux.ranges" to
>   map symbol addresses to built-in-module names.  Write those
>   module names (kallsyms_modules) and that per-symbol module
>   information (kallsyms_symbol_modules) to the *.s output file.
>
> - Use kallsyms_modules and kallsyms_symbol_modules to add
>   built-in-module information to /proc/kallsyms.
>
> Note that kernel symbols for built-in modules appear in ascending
> order by address, as usual, and thus will appear interspersed with
> symbols that are part of other built-in modules or of the kernel.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  .gitignore                  |   1 +
>  Documentation/dontdiff      |   1 +
>  Makefile                    |  41 ++-
>  kernel/kallsyms.c           |  12 +-
>  scripts/Makefile.modbuiltin |  20 +-
>  scripts/kallsyms.c          | 515 +++++++++++++++++++++++++++++++++++-
>  scripts/link-vmlinux.sh     |  17 ++
>  scripts/namespace.pl        |   5 +
>  8 files changed, 589 insertions(+), 23 deletions(-)


This diff-stat is unfortunate.
scripts/kallsyms.c increased 65% for parsing
.tmp_vmlinux.ranges and modules_think.builtin

I tend to suspect the design mistake...



I tested this patch on x86_64_defconfig
It also increases 24% of kallsyms data.

The data increase is  outstanding compared with the
amount of information added.

   text    data     bss     dec     hex filename
 830000       0       0 830000   caa30 .tmp_kallsyms2.o.before
1031216       0       0 1031216   fbc30 .tmp_kallsyms2.o.after




> diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> index 9f4392876099..32ee05f91410 100644
> --- a/Documentation/dontdiff
> +++ b/Documentation/dontdiff
> @@ -180,6 +180,7 @@ modpost
>  modules.builtin
>  modules.builtin.modinfo
>  modules.order
> +modules_thick.builtin
>  modversions.h*
>  nconf
>  nconf-cfg

Most people missed to add this.
I think you took time for internal review.


> diff --git a/Makefile b/Makefile
> index 49363caa7079..15b4e897cd3e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1077,7 +1077,7 @@ cmd_link-vmlinux =                                                 \
>         $(CONFIG_SHELL) $< $(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) ;    \
>         $(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>
> -vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
> +vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) modules_thick.builtin FORCE
>         +$(call if_changed,link-vmlinux)
>
>  targets := vmlinux
> @@ -1292,17 +1292,6 @@ modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order modules.builtin
>  modules.order: descend
>         $(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
>
> -modbuiltin-dirs := $(addprefix _modbuiltin_, $(build-dirs))
> -
> -modules.builtin: $(modbuiltin-dirs)
> -       $(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
> -
> -PHONY += $(modbuiltin-dirs)
> -# tristate.conf is not included from this Makefile. Add it as a prerequisite
> -# here to make it self-healing in case somebody accidentally removes it.
> -$(modbuiltin-dirs): include/config/tristate.conf
> -       $(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_%,%,$@)
> -
>  # Target to prepare building external modules
>  PHONY += modules_prepare
>  modules_prepare: prepare
> @@ -1355,6 +1344,33 @@ modules modules_install:
>
>  endif # CONFIG_MODULES
>
> +# modules.builtin has a 'thick' form which maps from kernel modules (or rather
> +# the object file names they would have had had they not been built in) to their
> +# constituent object files: kallsyms uses this to determine which modules any
> +# given object file is part of.  (We cannot eliminate the slight redundancy
> +# here without double-expansion.)
> +
> +modbuiltin-dirs := $(addprefix _modbuiltin_, $(build-dirs))
> +
> +modbuiltin-thick-dirs := $(addprefix _modbuiltin_thick_, $(build-dirs))
> +
> +modules.builtin: $(modbuiltin-dirs)
> +       $(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
> +
> +modules_thick.builtin: $(modbuiltin-thick-dirs)
> +       $(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
> +
> +PHONY += $(modbuiltin-dirs) $(modbuiltin-thick-dirs)
> +# tristate.conf is not included from this Makefile. Add it as a prerequisite
> +# here to make it self-healing in case somebody accidentally removes it.
> +$(modbuiltin-dirs): include/config/tristate.conf
> +       $(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_%,%,$@) \
> +                       builtin-file=modules.builtin
> +
> +$(modbuiltin-thick-dirs): include/config/tristate.conf
> +       $(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_thick_%,%,$@) \
> +                       builtin-file=modules_thick.builtin
> +
>  ###
>  # Cleaning is done on three levels.
>  # make clean     Delete most generated files
> @@ -1674,6 +1690,7 @@ clean: $(clean-dirs)
>                 -o -name '*.asn1.[ch]' \
>                 -o -name '*.symtypes' -o -name 'modules.order' \
>                 -o -name modules.builtin -o -name '.tmp_*.o.*' \
> +               -o -name modules_thick.builtin \
>                 -o -name '*.c.[012]*.*' \
>                 -o -name '*.ll' \
>                 -o -name '*.gcno' \) -type f -print | xargs rm -f
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 136ce049c4ad..ce8576503e35 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -46,6 +46,8 @@ __attribute__((weak, section(".rodata")));
>
>  extern const u8 kallsyms_token_table[] __weak;
>  extern const u16 kallsyms_token_index[] __weak;
> +extern const char kallsyms_modules[] __weak;
> +extern const u32 kallsyms_symbol_modules[] __weak;
>
>  extern const unsigned int kallsyms_markers[] __weak;
>
> @@ -508,8 +510,16 @@ static int get_ksymbol_bpf(struct kallsym_iter *iter)
>  static unsigned long get_ksymbol_core(struct kallsym_iter *iter)
>  {
>         unsigned off = iter->nameoff;
> +       u32 mod_index = 0;
>
> -       iter->module_name[0] = '\0';
> +       if (kallsyms_symbol_modules)
> +               mod_index = kallsyms_symbol_modules[iter->pos];
> +
> +       if (mod_index == 0 || kallsyms_modules == NULL)
> +               iter->module_name[0] = '\0';
> +       else
> +               strcpy(iter->module_name, &kallsyms_modules[mod_index]);
> +       iter->exported = 0;
>         iter->value = kallsyms_sym_address(iter->pos);
>
>         iter->type = kallsyms_get_symbol_type(off);
> diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
> index 7d4711b88656..06f31e58111e 100644
> --- a/scripts/Makefile.modbuiltin
> +++ b/scripts/Makefile.modbuiltin
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # ==========================================================================
> -# Generating modules.builtin
> +# Generating modules.builtin and modules_thick.builtin
>  # ==========================================================================
>
>  src := $(obj)
> @@ -30,19 +30,29 @@ __subdir-Y     := $(patsubst %/,%,$(filter %/, $(obj-Y)))
>  subdir-Y       += $(__subdir-Y)
>  subdir-ym      := $(sort $(subdir-y) $(subdir-Y) $(subdir-m))
>  subdir-ym      := $(addprefix $(obj)/,$(subdir-ym))
> -obj-Y          := $(addprefix $(obj)/,$(obj-Y))
> +pathobj-Y      := $(addprefix $(obj)/,$(obj-Y))
>
>  modbuiltin-subdirs := $(patsubst %,%/modules.builtin, $(subdir-ym))
> -modbuiltin-mods    := $(filter %.ko, $(obj-Y:.o=.ko))
> +modbuiltin-mods    := $(filter %.ko, $(pathobj-Y:.o=.ko))
>  modbuiltin-target  := $(obj)/modules.builtin
> +modthickbuiltin-subdirs := $(patsubst %,%/modules_thick.builtin, $(subdir-ym))
> +modthickbuiltin-target  := $(obj)/modules_thick.builtin
>
> -__modbuiltin: $(modbuiltin-target) $(subdir-ym)
> +__modbuiltin: $(obj)/$(builtin-file) $(subdir-ym)
>         @:
>
>  $(modbuiltin-target): $(subdir-ym) FORCE
>         $(Q)(for m in $(modbuiltin-mods); do echo $$m; done;    \
>         cat /dev/null $(modbuiltin-subdirs)) > $@
>
> +$(modthickbuiltin-target): $(subdir-ym) FORCE
> +       $(Q) $(foreach mod-o, $(filter %.o,$(obj-Y)),\
> +               printf "%s:" $(addprefix $(obj)/,$(mod-o)) >> $@; \
> +               printf " %s" $(sort $(strip $(addprefix $(obj)/,$($(mod-o:.o=-objs)) \
> +                       $($(mod-o:.o=-y)) $($(mod-o:.o=-Y))))) >> $@; \
> +               printf "\n" >> $@; ) \
> +       cat /dev/null $(modthickbuiltin-subdirs) >> $@;
> +
>  PHONY += FORCE
>
>  FORCE:
> @@ -52,6 +62,6 @@ FORCE:
>
>  PHONY += $(subdir-ym)
>  $(subdir-ym):
> -       $(Q)$(MAKE) $(modbuiltin)=$@
> +       $(Q)$(MAKE) $(modbuiltin)=$@ builtin-file=$(builtin-file)
>
>  .PHONY: $(PHONY)
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index ae6504d07fd6..f71432df09d8 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -5,7 +5,10 @@
>   * This software may be used and distributed according to the terms
>   * of the GNU General Public License, incorporated herein by reference.
>   *
> - * Usage: nm -n vmlinux | scripts/kallsyms [--all-symbols] > symbols.S
> + * Usage: nm -n vmlinux
> + *        | scripts/kallsyms [--all-symbols] [--absolute-percpu]
> + *             [--base-relative] [--builtin=modules_thick.builtin]
> + *        > symbols.S
>   *
>   *      Table compression uses all the unused char codes on the symbols and
>   *  maps these to the most used substrings (tokens). For instance, it might
> @@ -18,12 +21,15 @@
>   *
>   */
>
> +#define _GNU_SOURCE 1
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <ctype.h>
>  #include <limits.h>
>
> +#include <errno.h>
> +
>  #ifndef ARRAY_SIZE
>  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
>  #endif
> @@ -36,6 +42,7 @@ struct sym_entry {
>         unsigned int start_pos;
>         unsigned char *sym;
>         unsigned int percpu_absolute;
> +       unsigned int module;
>  };
>
>  struct addr_range {
> @@ -69,10 +76,116 @@ static unsigned char best_table[256][2];
>  static unsigned char best_table_len[256];
>
>
> +static unsigned int strhash(const char *s)
> +{
> +       /* fnv32 hash */
> +       unsigned int hash = 2166136261U;
> +
> +       for (; *s; s++)
> +               hash = (hash ^ *s) * 0x01000193;
> +       return hash;
> +}
> +
> +#define OBJ2MOD_BITS 10
> +#define OBJ2MOD_N (1 << OBJ2MOD_BITS)
> +#define OBJ2MOD_MASK (OBJ2MOD_N - 1)
> +struct obj2mod_elem {
> +       char *obj;
> +       int mod;
> +       struct obj2mod_elem *next;
> +};
> +
> +static struct obj2mod_elem *obj2mod[OBJ2MOD_N];
> +
> +static void obj2mod_init(void)
> +{
> +       memset(obj2mod, 0, sizeof(obj2mod));
> +}


Unneeded.

The .bss section is automatically zero-cleared by
operating system.  obj2mod is already zero-filled.




> +static void obj2mod_put(char *obj, int mod)

you can add 'const' to the 'char *'.

Same for obj2mod_get().


> +{
> +       int i = strhash(obj) & OBJ2MOD_MASK;
> +       struct obj2mod_elem *elem = malloc(sizeof(struct obj2mod_elem));
> +
> +       if (!elem) {
> +               fprintf(stderr, "kallsyms: out of memory\n");
> +               exit(1);
> +       }
> +
> +       elem->obj = strdup(obj);
> +       if (!elem->obj) {
> +               fprintf(stderr, "kallsyms: out of memory\n");
> +               free(elem);
> +               exit(1);
> +       }
> +
> +       elem->mod = mod;
> +       elem->next = obj2mod[i];
> +       obj2mod[i] = elem;
> +}
> +
> +static int obj2mod_get(char *obj)
> +{
> +       int i = strhash(obj) & OBJ2MOD_MASK;
> +       struct obj2mod_elem *elem;
> +
> +       for (elem = obj2mod[i]; elem; elem = elem->next)
> +               if (strcmp(elem->obj, obj) == 0)
> +                       return elem->mod;
> +       return 0;
> +}
> +
> +static void obj2mod_free(void)
> +{
> +       int i;
> +
> +       for (i = 0; i < OBJ2MOD_N; i++) {
> +               struct obj2mod_elem *elem = obj2mod[i];
> +               struct obj2mod_elem *next;
> +
> +               while (elem) {
> +                       next = elem->next;
> +                       free(elem->obj);
> +                       free(elem);
> +                       elem = next;
> +               }
> +       }
> +}
> +
> +/*
> + * The builtin module names.  The "offset" points to the name as if
> + * all builtin module names were concatenated to a single string.
> + */
> +static unsigned int builtin_module_size;       /* number allocated */
> +static unsigned int builtin_module_len;                /* number assigned */
> +static char **builtin_modules;                 /* array of module names */
> +static unsigned int *builtin_module_offsets;   /* offset */
> +
> +/*
> + * modules_thick.builtin iteration state.
> + */
> +struct modules_thick_iter {
> +       FILE *f;
> +       char *line;
> +       size_t line_size;
> +};
> +
> +/*
> + * An ordered list of address ranges and how they map to built-in modules.
> + */
> +struct addrmap_entry {
> +       unsigned long long addr;
> +       unsigned long long size;
> +       unsigned int module;
> +};
> +static struct addrmap_entry *addrmap;
> +static int addrmap_num, addrmap_alloced;
> +
>  static void usage(void)
>  {
> -       fprintf(stderr, "Usage: kallsyms [--all-symbols] "
> -                       "[--base-relative] < in.map > out.S\n");
> +       fprintf(stderr, "Usage: kallsyms [--all-symbols] [--absolute-percpu] "
> +                       "[--base-relative] [--builtin=modules_thick.builtin] "
> +                       "< nm_vmlinux.out > symbols.S\n");
>         exit(1);
>  }
>
> @@ -107,11 +220,25 @@ static int check_symbol_range(const char *sym, unsigned long long addr,
>         return 1;
>  }
>
> +static int addrmap_compare(const void *keyp, const void *rangep)
> +{
> +       unsigned long long addr = *((const unsigned long long *)keyp);
> +       const struct addrmap_entry *range = (const struct addrmap_entry *)rangep;

Cast is uneeded since rangep is an opaque pointer.



> +
> +       if (addr < range->addr)
> +               return -1;
> +       if (addr < range->addr + range->size)
> +               return 0;
> +       return 1;
> +}
> +
>  static int read_symbol(FILE *in, struct sym_entry *s)
>  {
>         char sym[500], stype;
> -       int rc;
> +       int rc, init_scratch = 0;
> +       struct addrmap_entry *range;
>
> +read_another:
>         rc = fscanf(in, "%llx %c %499s\n", &s->addr, &stype, sym);
>         if (rc != 3) {
>                 if (rc != EOF && fgets(sym, 500, in) == NULL)
> @@ -125,6 +252,16 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>                 return -1;
>         }
>
> +       /* skip the .init.scratch section */
> +       if (strcmp(sym, "__init_scratch_end") == 0) {
> +               init_scratch = 0;
> +               goto read_another;
> +       }
> +       if (strcmp(sym, "__init_scratch_begin") == 0)
> +               init_scratch = 1;
> +       if (init_scratch)
> +               goto read_another;


How is this hunk related?
I do not understand it from the commit log.

The address range check is done in symbol_valid().
I do not like to see different people adopt
different ways.


>         /* Ignore most absolute/undefined (?) symbols. */
>         if (strcmp(sym, "_text") == 0)
>                 _text = s->addr;
> @@ -154,6 +291,14 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>         else if (!strncmp(sym, ".LASANPC", 8))
>                 return -1;
>
> +       /* look up the builtin module this is part of (if any) */
> +       range = (struct addrmap_entry *) bsearch(&s->addr,

Unneeded cast because bsearch() returns an opaque pointer.



> +           addrmap, addrmap_num, sizeof(*addrmap), &addrmap_compare);
> +       if (range)
> +               s->module = builtin_module_offsets[range->module];
> +       else
> +               s->module = 0;
> +
>         /* include the type field in the symbol name, so that it gets
>          * compressed together */
>         s->len = strlen(sym) + 1;
> @@ -206,6 +351,8 @@ static int symbol_valid(struct sym_entry *s)
>                 "kallsyms_markers",
>                 "kallsyms_token_table",
>                 "kallsyms_token_index",
> +               "kallsyms_symbol_modules",
> +               "kallsyms_modules",
>
>         /* Exclude linker generated symbols which vary between passes */
>                 "_SDA_BASE_",           /* ppc */
> @@ -454,6 +601,19 @@ static void write_src(void)
>         for (i = 0; i < 256; i++)
>                 printf("\t.short\t%d\n", best_idx[i]);
>         printf("\n");
> +
> +       output_label("kallsyms_modules");
> +       for (i = 0; i < builtin_module_len; i++)
> +               printf("\t.asciz\t\"%s\"\n", builtin_modules[i]);
> +       printf("\n");


Output strings in plain text?

Did you consider the possibility for compression?



> +       for (i = 0; i < builtin_module_len; i++)
> +               free(builtin_modules[i]);
> +
> +       output_label("kallsyms_symbol_modules");
> +       for (i = 0; i < table_cnt; i++)
> +               printf("\t.int\t%d\n", table[i].module);
> +       printf("\n");
>  }
>
>
> @@ -738,23 +898,368 @@ static void record_relative_base(void)
>                         relative_base = table[i].addr;
>  }
>
> +/*
> + * Read a modules_thick.builtin file.
> + */
> +
> +/*
> + * Construct a modules_thick.builtin iterator.
> + */
> +static struct modules_thick_iter *
> +modules_thick_iter_new(const char *modules_thick_file)
> +{
> +       struct modules_thick_iter *i;
> +
> +       i = calloc(1, sizeof(struct modules_thick_iter));
> +       if (i == NULL)
> +               return NULL;
> +
> +       i->f = fopen(modules_thick_file, "r");
> +
> +       if (i->f == NULL) {
> +               fprintf(stderr, "Cannot open builtin module file %s: %s\n",
> +                       modules_thick_file, strerror(errno));
> +               return NULL;
> +       }
> +
> +       return i;
> +}
> +
> +/*
> + * Iterate, returning a new null-terminated array of object file names, and a
> + * new dynamically-allocated module name.  (The module name passed in is freed.)
> + *
> + * The array of object file names should be freed by the caller: the strings it
> + * points to are owned by the iterator, and should not be freed.
> + */
> +static char ** __attribute__((__nonnull__))
> +modules_thick_iter_next(struct modules_thick_iter *i, char **module_name)
> +{
> +       size_t npaths = 1;
> +       char **module_paths;
> +       char *last_slash;
> +       char *last_dot;
> +       char *trailing_linefeed;
> +       char *object_name = i->line;
> +       char *dash;
> +       int composite = 0;
> +
> +       /*
> +        * Read in all module entries, computing the suffixless, pathless name
> +        * of the module and building the next arrayful of object file names for
> +        * return.
> +        *
> +        * Modules can consist of multiple files: in this case, the portion
> +        * before the colon is the path to the module (as before): the portion
> +        * after the colon is a space-separated list of files that should be *
> +        * considered part of this module.  In this case, the portion before the
> +        * name is an "object file" that does not actually exist: it is merged
> +        * into built-in.a without ever being written out.
> +        *
> +        * All module names have - translated to _, to match what is done to the
> +        * names of the same things when built as modules.
> +        */
> +
> +       /*
> +        * Reinvocation of exhausted iterator. Return NULL, once.
> +        */
> +retry:
> +       if (getline(&i->line, &i->line_size, i->f) < 0) {
> +               if (ferror(i->f)) {
> +                       fprintf(stderr,
> +                               "Error reading from modules_thick file: %s\n",
> +                               strerror(errno));
> +                       exit(1);
> +               }
> +               rewind(i->f);
> +               return NULL;
> +       }
> +
> +       if (i->line[0] == '\0')
> +               goto retry;
> +
> +       /*
> +        * Slice the line in two at the colon, if any.  If there is anything
> +        * past the ': ', this is a composite module.  (We allow for no colon
> +        * for robustness, even though one should always be present.)
> +        */
> +       if (strchr(i->line, ':') != NULL) {
> +               char *name_start;
> +
> +               object_name = strchr(i->line, ':');
> +               *object_name = '\0';
> +               object_name++;
> +               name_start = object_name + strspn(object_name, " \n");
> +               if (*name_start != '\0') {
> +                       composite = 1;
> +                       object_name = name_start;
> +               }
> +       }
> +
> +       /*
> +        * Figure out the module name.
> +        */
> +       last_slash = strrchr(i->line, '/');
> +       last_slash = (!last_slash) ? i->line :
> +               last_slash + 1;
> +       free(*module_name);
> +       *module_name = strdup(last_slash);
> +       dash = *module_name;
> +
> +       while (dash != NULL) {
> +               dash = strchr(dash, '-');
> +               if (dash != NULL)
> +                       *dash = '_';
> +       }
> +
> +       last_dot = strrchr(*module_name, '.');
> +       if (last_dot != NULL)
> +               *last_dot = '\0';
> +
> +       trailing_linefeed = strchr(object_name, '\n');
> +       if (trailing_linefeed != NULL)
> +               *trailing_linefeed = '\0';
> +
> +       /*
> +        * Multifile separator? Object file names explicitly stated:
> +        * slice them up and shuffle them in.
> +        *
> +        * The array size may be an overestimate if any object file
> +        * names start or end with spaces (very unlikely) but cannot be
> +        * an underestimate.  (Check for it anyway.)
> +        */
> +       if (composite) {
> +               char *one_object;
> +
> +               for (npaths = 0, one_object = object_name;
> +                    one_object != NULL;
> +                    npaths++, one_object = strchr(one_object + 1, ' '))
> +                       ;
> +       }
> +
> +       module_paths = malloc((npaths + 1) * sizeof(char *));
> +       if (!module_paths) {
> +               fprintf(stderr, "%s: out of memory on module %s\n", __func__,
> +                       *module_name);
> +               exit(1);
> +       }
> +
> +       if (composite) {
> +               char *one_object;
> +               size_t i = 0;
> +
> +               while ((one_object = strsep(&object_name, " ")) != NULL) {
> +                       if (i >= npaths) {
> +                               fprintf(stderr, "%s: npaths overflow on module "
> +                                       "%s: this is a bug.\n", __func__,
> +                                       *module_name);
> +                               exit(1);
> +                       }
> +
> +                       module_paths[i++] = one_object;
> +               }
> +       } else
> +               module_paths[0] = i->line;      /* untransformed module name */
> +
> +       module_paths[npaths] = NULL;
> +
> +       return module_paths;
> +}
> +
> +/*
> + * Free an iterator. Can be called while iteration is underway, so even
> + * state that is freed at the end of iteration must be freed here too.
> + */
> +static void
> +modules_thick_iter_free(struct modules_thick_iter *i)
> +{
> +       if (i == NULL)
> +               return;
> +       fclose(i->f);
> +       free(i->line);
> +       free(i);
> +}
> +
> +/*
> + * Expand the builtin modules list.
> + */
> +static void expand_builtin_modules(void)
> +{
> +       builtin_module_size += 50;
> +
> +       builtin_modules = realloc(builtin_modules,
> +                                 sizeof(*builtin_modules) *
> +                                 builtin_module_size);
> +       builtin_module_offsets = realloc(builtin_module_offsets,
> +                                        sizeof(*builtin_module_offsets) *
> +                                        builtin_module_size);
> +
> +       if (!builtin_modules || !builtin_module_offsets) {
> +               fprintf(stderr, "kallsyms failure: out of memory.\n");
> +               exit(EXIT_FAILURE);
> +       }
> +}
> +
> +/*
> + * Add a single built-in module (possibly composed of many files) to the
> + * modules list.  Take the offset of the current module and return it
> + * (purely for simplicity's sake in the caller).
> + */
> +static size_t add_builtin_module(const char *module_name, char **module_paths,
> +                                size_t offset)
> +{
> +       /* map the module's object paths to the module offset */
> +       while (*module_paths) {
> +               obj2mod_put(*module_paths, builtin_module_len);
> +               module_paths++;
> +       }
> +
> +       /* add the module name */
> +       if (builtin_module_size <= builtin_module_len)
> +               expand_builtin_modules();
> +       builtin_modules[builtin_module_len] = strdup(module_name);
> +       builtin_module_offsets[builtin_module_len] = offset;
> +       builtin_module_len++;
> +
> +       return (offset + strlen(module_name) + 1);
> +}
> +
> +/*
> + * Read the linker map.
> + */
> +static void read_linker_map(void)
> +{
> +       unsigned long long addr, size;
> +       char obj[PATH_MAX+1];
> +       FILE *f = fopen(".tmp_vmlinux.ranges", "r");
> +
> +       if (!f) {
> +               fprintf(stderr, "Cannot open '.tmp_vmlinux.ranges'.\n");
> +               exit(1);
> +       }
> +
> +       addrmap_num = 0;
> +       addrmap_alloced = 4096;
> +       addrmap = malloc(sizeof(*addrmap) * addrmap_alloced);
> +       if (!addrmap)
> +               goto oom;
> +
> +       /*
> +        * For each address range (addr,size) and object, add to addrmap
> +        * the range and the built-in module to which the object maps.
> +        */
> +       while (fscanf(f, "%llx %llx %s\n", &addr, &size, obj) == 3) {
> +               int m = obj2mod_get(obj);
> +
> +               if (addr == 0 || size == 0 || m == 0)
> +                       continue;
> +
> +               if (addrmap_num >= addrmap_alloced) {
> +                       addrmap_alloced *= 2;
> +                       addrmap = realloc(addrmap,
> +                           sizeof(*addrmap) * addrmap_alloced);
> +                       if (!addrmap)
> +                               goto oom;
> +               }
> +
> +               addrmap[addrmap_num].addr = addr;
> +               addrmap[addrmap_num].size = size;
> +               addrmap[addrmap_num].module = m;
> +               addrmap_num++;
> +       }
> +       fclose(f);
> +       return;
> +
> +oom:
> +       fprintf(stderr, "kallsyms: out of memory\n");
> +       exit(1);
> +}
> +
> +/*
> + * Read "modules_thick.builtin" (the list of built-in modules).  Construct:
> + *   - builtin_modules: array of built-in-module names
> + *   - builtin_module_offsets: array of offsets that will later be
> + *       used to access a concatenated list of built-in-module names
> + *   - obj2mod: a temporary, many-to-one, hash mapping
> + *       from object-file paths to built-in-module names
> + * Read ".tmp_vmlinux.ranges" (the linker map).
> + *   - addrmap[] maps address ranges to built-in module names (using obj2mod)
> + */
> +static void read_modules(const char *modules_builtin)
> +{
> +       struct modules_thick_iter *i;
> +       size_t offset = 0;
> +       char *module_name = NULL;
> +       char **module_paths;
> +
> +       obj2mod_init();
> +
> +       /*
> +        * builtin_modules[0] is a null entry signifying a symbol that cannot be
> +        * modular.
> +        */
> +       builtin_module_size = 50;
> +       builtin_modules = malloc(sizeof(*builtin_modules) *
> +                                builtin_module_size);
> +       builtin_module_offsets = malloc(sizeof(*builtin_module_offsets) *
> +                                builtin_module_size);
> +       if (!builtin_modules || !builtin_module_offsets) {
> +               fprintf(stderr, "kallsyms: out of memory\n");
> +               exit(1);
> +       }
> +       builtin_modules[0] = strdup("");
> +       builtin_module_offsets[0] = 0;
> +       builtin_module_len = 1;
> +       offset++;
> +
> +       /*
> +        * Iterate over all modules in modules_thick.builtin and add each.
> +        */
> +       i = modules_thick_iter_new(modules_builtin);
> +       if (i == NULL) {
> +               fprintf(stderr, "Cannot iterate over builtin modules.\n");
> +               exit(1);
> +       }
> +
> +       while ((module_paths = modules_thick_iter_next(i, &module_name))) {
> +               offset = add_builtin_module(module_name, module_paths, offset);
> +               free(module_paths);
> +               module_paths = NULL;
> +       }
> +
> +       free(module_name);
> +       modules_thick_iter_free(i);
> +
> +       /*
> +        * Read linker map.
> +        */
> +       read_linker_map();
> +
> +       obj2mod_free();
> +}
> +
>  int main(int argc, char **argv)
>  {
> +       const char *modules_builtin = "modules_thick.builtin";
> +
>         if (argc >= 2) {
>                 int i;
>                 for (i = 1; i < argc; i++) {
> -                       if(strcmp(argv[i], "--all-symbols") == 0)
> +                       if (strcmp(argv[i], "--all-symbols") == 0)
>                                 all_symbols = 1;
>                         else if (strcmp(argv[i], "--absolute-percpu") == 0)
>                                 absolute_percpu = 1;
>                         else if (strcmp(argv[i], "--base-relative") == 0)
>                                 base_relative = 1;
> +                       else if (strncmp(argv[i], "--builtin=", 10) == 0)
> +                               modules_builtin = &argv[i][10];


".tmp_vmlinux.ranges" is hard-coded, but
"modules_think.builtin" can be changed via option. Heh.



>                         else
>                                 usage();
>                 }
>         } else if (argc != 1)
>                 usage();
>
> +       read_modules(modules_builtin);
>         read_map(stdin);
>         if (absolute_percpu)
>                 make_percpus_absolute();
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 06495379fcd8..e4d5a98133e7 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -76,6 +76,7 @@ vmlinux_link()
>                         --start-group                           \
>                         ${KBUILD_VMLINUX_LIBS}                  \
>                         --end-group                             \
> +                       -Map=.tmp_vmlinux.map                   \
>                         ${@}"
>
>                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
> @@ -88,6 +89,7 @@ vmlinux_link()
>                         -Wl,--start-group                       \
>                         ${KBUILD_VMLINUX_LIBS}                  \
>                         -Wl,--end-group                         \
> +                       -Wl,-Map=.tmp_vmlinux.map               \
>                         ${@}"
>
>                 ${CC} ${CFLAGS_vmlinux}                         \
> @@ -138,6 +140,19 @@ kallsyms()
>         info KSYM ${2}
>         local kallsymopt;
>
> +       # read the linker map to identify ranges of addresses:
> +       #   - for each *.o file, report address, size, pathname
> +       #       - most such lines will have four fields
> +       #       - but sometimes there is a line break after the first field
> +       #   - start reading at "Linker script and memory map"


Searching for "Linker script and memory map" will probably bring
portability issue.

llvm folks will be unhappy with it.




> +       #   - stop reading at ".brk"
> +       ${AWK} '
> +           /\.o$/ && start==1 { print $(NF-2), $(NF-1), $NF }
> +           /^Linker script and memory map/ { start = 1 }
> +           /^\.brk/ { exit(0) }
> +       ' .tmp_vmlinux.map | sort > .tmp_vmlinux.ranges
> +
> +       # get kallsyms options
>         if [ -n "${CONFIG_KALLSYMS_ALL}" ]; then
>                 kallsymopt="${kallsymopt} --all-symbols"
>         fi
> @@ -150,11 +165,13 @@ kallsyms()
>                 kallsymopt="${kallsymopt} --base-relative"
>         fi
>
> +       # set up compilation
>         local aflags="${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL}               \
>                       ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS}"
>
>         local afile="`basename ${2} .o`.S"
>
> +       # construct file and compile
>         ${NM} -n ${1} | scripts/kallsyms ${kallsymopt} > ${afile}
>         ${CC} ${aflags} -c -o ${2} ${afile}
>  }
> diff --git a/scripts/namespace.pl b/scripts/namespace.pl
> index 1da7bca201a4..4c7615e720de 100755
> --- a/scripts/namespace.pl
> +++ b/scripts/namespace.pl
> @@ -120,6 +120,11 @@ my %nameexception = (
>      'kallsyms_addresses'=> 1,
>      'kallsyms_offsets' => 1,
>      'kallsyms_relative_base'=> 1,
> +    'kallsyms_token_table'=> 1,
> +    'kallsyms_token_index'=> 1,
> +    'kallsyms_markers' => 1,
> +    'kallsyms_modules' => 1,
> +    'kallsyms_symbol_modules'=> 1,
>      '__this_module'    => 1,
>      '_etext'           => 1,
>      '_edata'           => 1,
> --
> 2.18.1
>


-- 
Best Regards
Masahiro Yamada
