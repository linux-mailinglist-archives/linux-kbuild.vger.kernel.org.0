Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1DA12581D
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 00:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfLRX4T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 18:56:19 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60710 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfLRX4T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 18:56:19 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBINsYV1144272;
        Wed, 18 Dec 2019 23:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=sbWvsETQjubcbRvoMVa8B2Dig/33b6cr3z4ak0g83Xg=;
 b=AWgKkjZoCIPpkmk6j2/oe6i/m4UqxweloBoHXJVoITcY8CPjtLwWJA+2YlFlfuLmapVK
 uokiCexy+gNDMT7WnofJXzfLJ961Unxi3pyfWBc+jRy0KWgjVDoVnXS+gFuuL4buk6XH
 V/PjDPP3DLQPs0iMoNYeQmVfmVdOtRF6l7iZBJHG4Q1qzhPGoC0Ug0BTABRfw7tWNrsS
 wZrwpcly43909RQdDBIPqWwdG30zCWvPHyKoHVOEWMNrU3PxKwVwEepNSTJT7JSSQqeI
 rRCByANz7ycVQSRUB8zVYl7TZjFAeAG55PaGGieOsNfpxv6+lMRCvSAcHswX4aEdQXHO rQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2wvq5urvgq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Dec 2019 23:55:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBINsFL6145539;
        Wed, 18 Dec 2019 23:55:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2wyp507pjx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Dec 2019 23:55:23 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBINtKBO004886;
        Wed, 18 Dec 2019 23:55:20 GMT
Received: from [10.211.14.86] (/10.211.14.86)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 18 Dec 2019 15:55:19 -0800
Subject: Re: [PATCH v4] kallsyms: add names of built-in modules
Cc:     rostedt@goodmis.org, corbet@lwn.net, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, jeyu@kernel.org,
        linux-kbuild@vger.kernel.org, maz@kernel.org,
        songliubraving@fb.com, tglx@linutronix.de,
        jacob.e.keller@intel.com, Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>
References: <7e0f4a74-63c5-ad62-c619-c6277c4bc791@oracle.com>
 <20191210174826.5433-1-eugene.loh@oracle.com>
From:   Eugene Loh <eugene.loh@oracle.com>
Message-ID: <2a535000-e71e-fab9-cf6a-e7e5fb8053d8@oracle.com>
Date:   Wed, 18 Dec 2019 15:55:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20191210174826.5433-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912180177
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912180177
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Ping.


On 12/10/2019 09:48 AM, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> /proc/kallsyms is very useful for tracers and other tools that need
> to map kernel symbols to addresses.
>
> It would be useful if there were a mapping between kernel symbol and
> module name that only changed when the kernel source code is changed.
> This mapping should not vanish simply because a module becomes built
> into the kernel.
>
> Therefore:
>
> - Generate a file "modules_thick.builtin" that maps from thin
>    archives that make up built-in modules to their constituent
>    object files.
>
> - Generate a linker map ".tmp_vmlinux.map", converting it into
>    ".tmp_vmlinux.ranges", mapping address ranges to object files.
>
> - Read "modules_thick.builtin" and ".tmp_vmlinux.ranges" to
>    map symbol addresses to built-in-module names.  Write those
>    module names (kallsyms_modules) and that per-symbol module
>    information (kallsyms_symbol_modules) to the *.s output file.
>
> - Use kallsyms_modules and kallsyms_symbol_modules to add
>    built-in-module information to /proc/kallsyms.
>
> Note that kernel symbols for built-in modules appear in ascending
> order by address, as usual, and thus will appear interspersed with
> symbols that are part of other built-in modules or of the kernel.
>
> Also, while it is possible for an object to appear in multiple
> built-in modules, making an unambiguous mapping of symbol to module
> impossible in such cases, this patch addresses the typical cases.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   .gitignore                  |   1 +
>   Documentation/dontdiff      |   1 +
>   Makefile                    |  41 +++--
>   kernel/kallsyms.c           |  12 +-
>   scripts/Makefile            |   5 +
>   scripts/Makefile.modbuiltin |  20 ++-
>   scripts/kallsyms.c          | 298 +++++++++++++++++++++++++++++++++++-
>   scripts/link-vmlinux.sh     |  17 ++
>   scripts/modules_thick.c     | 104 +++++++++++++
>   scripts/modules_thick.h     |  27 ++++
>   scripts/namespace.pl        |   5 +
>   11 files changed, 509 insertions(+), 22 deletions(-)
>   create mode 100644 scripts/modules_thick.c
>   create mode 100644 scripts/modules_thick.h
>
> diff --git a/.gitignore b/.gitignore
> index 72ef86a5570d..0b9c88f1d388 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -46,6 +46,7 @@
>   Module.symvers
>   modules.builtin
>   modules.order
> +modules_thick.builtin
>   
>   #
>   # Top-level generic files
> diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> index 72fc2e9e2b63..9d0db2ef3a51 100644
> --- a/Documentation/dontdiff
> +++ b/Documentation/dontdiff
> @@ -181,6 +181,7 @@ modules.builtin
>   modules.builtin.modinfo
>   modules.nsdeps
>   modules.order
> +modules_thick.builtin
>   modversions.h*
>   nconf
>   nconf-cfg
> diff --git a/Makefile b/Makefile
> index 73e3c2802927..430d49d3a93e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1073,7 +1073,7 @@ cmd_link-vmlinux =                                                 \
>   	$(CONFIG_SHELL) $< $(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) ;    \
>   	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>   
> -vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
> +vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) modules_thick.builtin FORCE
>   	+$(call if_changed,link-vmlinux)
>   
>   targets := vmlinux
> @@ -1284,17 +1284,6 @@ modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order modules.builtin
>   modules.order: descend
>   	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
>   
> -modbuiltin-dirs := $(addprefix _modbuiltin_, $(build-dirs))
> -
> -modules.builtin: $(modbuiltin-dirs)
> -	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
> -
> -PHONY += $(modbuiltin-dirs)
> -# tristate.conf is not included from this Makefile. Add it as a prerequisite
> -# here to make it self-healing in case somebody accidentally removes it.
> -$(modbuiltin-dirs): include/config/tristate.conf
> -	$(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_%,%,$@)
> -
>   # Target to prepare building external modules
>   PHONY += modules_prepare
>   modules_prepare: prepare
> @@ -1347,6 +1336,33 @@ modules modules_install:
>   
>   endif # CONFIG_MODULES
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
> +	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
> +
> +modules_thick.builtin: $(modbuiltin-thick-dirs)
> +	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
> +
> +PHONY += $(modbuiltin-dirs) $(modbuiltin-thick-dirs)
> +# tristate.conf is not included from this Makefile. Add it as a prerequisite
> +# here to make it self-healing in case somebody accidentally removes it.
> +$(modbuiltin-dirs): include/config/tristate.conf
> +	$(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_%,%,$@) \
> +			builtin-file=modules.builtin
> +
> +$(modbuiltin-thick-dirs): include/config/tristate.conf
> +	$(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_thick_%,%,$@) \
> +			builtin-file=modules_thick.builtin
> +
>   ###
>   # Cleaning is done on three levels.
>   # make clean     Delete most generated files
> @@ -1712,6 +1728,7 @@ clean: $(clean-dirs)
>   		-o -name '*.asn1.[ch]' \
>   		-o -name '*.symtypes' -o -name 'modules.order' \
>   		-o -name modules.builtin -o -name '.tmp_*.o.*' \
> +		-o -name modules_thick.builtin \
>   		-o -name '*.c.[012]*.*' \
>   		-o -name '*.ll' \
>   		-o -name '*.gcno' \) -type f -print | xargs rm -f
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 136ce049c4ad..ce8576503e35 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -46,6 +46,8 @@ __attribute__((weak, section(".rodata")));
>   
>   extern const u8 kallsyms_token_table[] __weak;
>   extern const u16 kallsyms_token_index[] __weak;
> +extern const char kallsyms_modules[] __weak;
> +extern const u32 kallsyms_symbol_modules[] __weak;
>   
>   extern const unsigned int kallsyms_markers[] __weak;
>   
> @@ -508,8 +510,16 @@ static int get_ksymbol_bpf(struct kallsym_iter *iter)
>   static unsigned long get_ksymbol_core(struct kallsym_iter *iter)
>   {
>   	unsigned off = iter->nameoff;
> +	u32 mod_index = 0;
>   
> -	iter->module_name[0] = '\0';
> +	if (kallsyms_symbol_modules)
> +		mod_index = kallsyms_symbol_modules[iter->pos];
> +
> +	if (mod_index == 0 || kallsyms_modules == NULL)
> +		iter->module_name[0] = '\0';
> +	else
> +		strcpy(iter->module_name, &kallsyms_modules[mod_index]);
> +	iter->exported = 0;
>   	iter->value = kallsyms_sym_address(iter->pos);
>   
>   	iter->type = kallsyms_get_symbol_type(off);
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 00c47901cb06..44641cabb261 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -26,6 +26,11 @@ HOSTLDLIBS_extract-cert = -lcrypto
>   
>   always		:= $(hostprogs-y) $(hostprogs-m)
>   
> +kallsyms-objs	:= kallsyms.o
> +kallsyms-objs	+= modules_thick.o
> +
> +HOSTCFLAGS_modules_thick.o := -I$(srctree)/scripts
> +HOSTCFLAGS_kallsyms.o := -I$(srctree)/scripts
>   # The following hostprogs-y programs are only build on demand
>   hostprogs-y += unifdef
>   
> diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
> index 7d4711b88656..06f31e58111e 100644
> --- a/scripts/Makefile.modbuiltin
> +++ b/scripts/Makefile.modbuiltin
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # ==========================================================================
> -# Generating modules.builtin
> +# Generating modules.builtin and modules_thick.builtin
>   # ==========================================================================
>   
>   src := $(obj)
> @@ -30,19 +30,29 @@ __subdir-Y     := $(patsubst %/,%,$(filter %/, $(obj-Y)))
>   subdir-Y       += $(__subdir-Y)
>   subdir-ym      := $(sort $(subdir-y) $(subdir-Y) $(subdir-m))
>   subdir-ym      := $(addprefix $(obj)/,$(subdir-ym))
> -obj-Y          := $(addprefix $(obj)/,$(obj-Y))
> +pathobj-Y      := $(addprefix $(obj)/,$(obj-Y))
>   
>   modbuiltin-subdirs := $(patsubst %,%/modules.builtin, $(subdir-ym))
> -modbuiltin-mods    := $(filter %.ko, $(obj-Y:.o=.ko))
> +modbuiltin-mods    := $(filter %.ko, $(pathobj-Y:.o=.ko))
>   modbuiltin-target  := $(obj)/modules.builtin
> +modthickbuiltin-subdirs := $(patsubst %,%/modules_thick.builtin, $(subdir-ym))
> +modthickbuiltin-target  := $(obj)/modules_thick.builtin
>   
> -__modbuiltin: $(modbuiltin-target) $(subdir-ym)
> +__modbuiltin: $(obj)/$(builtin-file) $(subdir-ym)
>   	@:
>   
>   $(modbuiltin-target): $(subdir-ym) FORCE
>   	$(Q)(for m in $(modbuiltin-mods); do echo $$m; done;	\
>   	cat /dev/null $(modbuiltin-subdirs)) > $@
>   
> +$(modthickbuiltin-target): $(subdir-ym) FORCE
> +	$(Q) $(foreach mod-o, $(filter %.o,$(obj-Y)),\
> +		printf "%s:" $(addprefix $(obj)/,$(mod-o)) >> $@; \
> +		printf " %s" $(sort $(strip $(addprefix $(obj)/,$($(mod-o:.o=-objs)) \
> +			$($(mod-o:.o=-y)) $($(mod-o:.o=-Y))))) >> $@; \
> +		printf "\n" >> $@; ) \
> +	cat /dev/null $(modthickbuiltin-subdirs) >> $@;
> +
>   PHONY += FORCE
>   
>   FORCE:
> @@ -52,6 +62,6 @@ FORCE:
>   
>   PHONY += $(subdir-ym)
>   $(subdir-ym):
> -	$(Q)$(MAKE) $(modbuiltin)=$@
> +	$(Q)$(MAKE) $(modbuiltin)=$@ builtin-file=$(builtin-file)
>   
>   .PHONY: $(PHONY)
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index fb55f262f42d..7368996e5d7b 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -5,7 +5,8 @@
>    * This software may be used and distributed according to the terms
>    * of the GNU General Public License, incorporated herein by reference.
>    *
> - * Usage: nm -n vmlinux | scripts/kallsyms [--all-symbols] > symbols.S
> + * Usage: nm -n vmlinux | scripts/kallsyms [--all-symbols]
> + *                   [--absolute-percpu] [--base-relative] > symbols.S
>    *
>    *      Table compression uses all the unused char codes on the symbols and
>    *  maps these to the most used substrings (tokens). For instance, it might
> @@ -18,12 +19,15 @@
>    *
>    */
>   
> +#define _GNU_SOURCE 1
>   #include <stdbool.h>
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
>   #include <ctype.h>
>   #include <limits.h>
> +#include <errno.h>
> +#include "modules_thick.h"
>   
>   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
>   
> @@ -35,6 +39,7 @@ struct sym_entry {
>   	unsigned int start_pos;
>   	unsigned char *sym;
>   	unsigned int percpu_absolute;
> +	unsigned int module;
>   };
>   
>   struct addr_range {
> @@ -68,10 +73,101 @@ static unsigned char best_table[256][2];
>   static unsigned char best_table_len[256];
>   
>   
> +static unsigned int strhash(const char *s)
> +{
> +	/* fnv32 hash */
> +	unsigned int hash = 2166136261U;
> +
> +	for (; *s; s++)
> +		hash = (hash ^ *s) * 0x01000193;
> +	return hash;
> +}
> +
> +#define OBJ2MOD_BITS 10
> +#define OBJ2MOD_N (1 << OBJ2MOD_BITS)
> +#define OBJ2MOD_MASK (OBJ2MOD_N - 1)
> +struct obj2mod_elem {
> +	char *obj;
> +	int mod;
> +	struct obj2mod_elem *next;
> +};
> +
> +static struct obj2mod_elem *obj2mod[OBJ2MOD_N];
> +
> +static void obj2mod_put(const char *obj, int mod)
> +{
> +	int i = strhash(obj) & OBJ2MOD_MASK;
> +	struct obj2mod_elem *elem = malloc(sizeof(struct obj2mod_elem));
> +
> +	if (!elem) {
> +		fprintf(stderr, "kallsyms: out of memory\n");
> +		exit(1);
> +	}
> +
> +	elem->obj = strdup(obj);
> +	if (!elem->obj) {
> +		fprintf(stderr, "kallsyms: out of memory\n");
> +		free(elem);
> +		exit(1);
> +	}
> +
> +	elem->mod = mod;
> +	elem->next = obj2mod[i];
> +	obj2mod[i] = elem;
> +}
> +
> +static int obj2mod_get(const char *obj)
> +{
> +	int i = strhash(obj) & OBJ2MOD_MASK;
> +	struct obj2mod_elem *elem;
> +
> +	for (elem = obj2mod[i]; elem; elem = elem->next)
> +		if (strcmp(elem->obj, obj) == 0)
> +			return elem->mod;
> +	return 0;
> +}
> +
> +static void obj2mod_free(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < OBJ2MOD_N; i++) {
> +		struct obj2mod_elem *elem = obj2mod[i];
> +		struct obj2mod_elem *next;
> +
> +		while (elem) {
> +			next = elem->next;
> +			free(elem->obj);
> +			free(elem);
> +			elem = next;
> +		}
> +	}
> +}
> +
> +/*
> + * The builtin module names.  The "offset" points to the name as if
> + * all builtin module names were concatenated to a single string.
> + */
> +static unsigned int builtin_module_size;	/* number allocated */
> +static unsigned int builtin_module_len;		/* number assigned */
> +static char **builtin_modules;			/* array of module names */
> +static unsigned int *builtin_module_offsets;	/* offset */
> +
> +/*
> + * An ordered list of address ranges and how they map to built-in modules.
> + */
> +struct addrmap_entry {
> +	unsigned long long addr;
> +	unsigned long long size;
> +	unsigned int module;
> +};
> +static struct addrmap_entry *addrmap;
> +static int addrmap_num, addrmap_alloced;
> +
>   static void usage(void)
>   {
> -	fprintf(stderr, "Usage: kallsyms [--all-symbols] "
> -			"[--base-relative] < in.map > out.S\n");
> +	fprintf(stderr, "Usage: kallsyms [--all-symbols] [--absolute-percpu] "
> +			"[--base-relative] < nm_vmlinux.out > symbols.S\n");
>   	exit(1);
>   }
>   
> @@ -98,6 +194,8 @@ static bool is_ignored_symbol(const char *name, char type)
>   		"kallsyms_markers",
>   		"kallsyms_token_table",
>   		"kallsyms_token_index",
> +		"kallsyms_symbol_modules",
> +		"kallsyms_modules",
>   		/* Exclude linker generated symbols which vary between passes */
>   		"_SDA_BASE_",		/* ppc */
>   		"_SDA2_BASE_",		/* ppc */
> @@ -174,10 +272,23 @@ static void check_symbol_range(const char *sym, unsigned long long addr,
>   	}
>   }
>   
> +static int addrmap_compare(const void *keyp, const void *rangep)
> +{
> +	unsigned long long addr = *((const unsigned long long *)keyp);
> +	const struct addrmap_entry *range = rangep;
> +
> +	if (addr < range->addr)
> +		return -1;
> +	if (addr < range->addr + range->size)
> +		return 0;
> +	return 1;
> +}
> +
>   static int read_symbol(FILE *in, struct sym_entry *s)
>   {
>   	char sym[500], stype;
>   	int rc;
> +	struct addrmap_entry *range;
>   
>   	rc = fscanf(in, "%llx %c %499s\n", &s->addr, &stype, sym);
>   	if (rc != 3) {
> @@ -202,6 +313,14 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>   	check_symbol_range(sym, s->addr, text_ranges, ARRAY_SIZE(text_ranges));
>   	check_symbol_range(sym, s->addr, &percpu_range, 1);
>   
> +	/* try to find a module that this address belongs to */
> +	range = bsearch(&s->addr,
> +	    addrmap, addrmap_num, sizeof(*addrmap), &addrmap_compare);
> +	if (range)
> +		s->module = builtin_module_offsets[range->module];
> +	else
> +		s->module = 0;
> +
>   	/* include the type field in the symbol name, so that it gets
>   	 * compressed together */
>   	s->len = strlen(sym) + 1;
> @@ -469,6 +588,19 @@ static void write_src(void)
>   	for (i = 0; i < 256; i++)
>   		printf("\t.short\t%d\n", best_idx[i]);
>   	printf("\n");
> +
> +	output_label("kallsyms_modules");
> +	for (i = 0; i < builtin_module_len; i++)
> +		printf("\t.asciz\t\"%s\"\n", builtin_modules[i]);
> +	printf("\n");
> +
> +	for (i = 0; i < builtin_module_len; i++)
> +		free(builtin_modules[i]);
> +
> +	output_label("kallsyms_symbol_modules");
> +	for (i = 0; i < table_cnt; i++)
> +		printf("\t.int\t%d\n", table[i].module);
> +	printf("\n");
>   }
>   
>   
> @@ -734,12 +866,169 @@ static void record_relative_base(void)
>   		}
>   }
>   
> +/*
> + * Reallocate the builtin modules list.
> + */
> +static void realloc_builtin_modules(void)
> +{
> +	builtin_module_size += 50;
> +
> +	builtin_modules = realloc(builtin_modules,
> +				  sizeof(*builtin_modules) *
> +				  builtin_module_size);
> +	builtin_module_offsets = realloc(builtin_module_offsets,
> +					 sizeof(*builtin_module_offsets) *
> +					 builtin_module_size);
> +
> +	if (!builtin_modules || !builtin_module_offsets) {
> +		fprintf(stderr, "kallsyms failure: out of memory.\n");
> +		exit(EXIT_FAILURE);
> +	}
> +}
> +
> +/*
> + * Add a single built-in module (possibly composed of many files) to the
> + * modules list.  Take the offset of the current module and return it
> + * (purely for simplicity's sake in the caller).
> + */
> +static size_t add_builtin_module(const char *module_name, char **module_paths,
> +				 size_t offset)
> +{
> +	/* map the module's object paths to the module offset */
> +	while (*module_paths) {
> +		obj2mod_put(*module_paths, builtin_module_len);
> +		module_paths++;
> +	}
> +
> +	/* add the module name */
> +	if (builtin_module_size <= builtin_module_len)
> +		realloc_builtin_modules();
> +	builtin_modules[builtin_module_len] = strdup(module_name);
> +	builtin_module_offsets[builtin_module_len] = offset;
> +	builtin_module_len++;
> +
> +	return (offset + strlen(module_name) + 1);
> +}
> +
> +/*
> + * Read the linker map.
> + */
> +static void read_linker_map(void)
> +{
> +	unsigned long long addr, size;
> +	char obj[PATH_MAX+1];
> +	FILE *f = fopen(".tmp_vmlinux.ranges", "r");
> +
> +	if (!f) {
> +		fprintf(stderr, "Cannot open '.tmp_vmlinux.ranges'.\n");
> +		exit(1);
> +	}
> +
> +	addrmap_num = 0;
> +	addrmap_alloced = 4096;
> +	addrmap = malloc(sizeof(*addrmap) * addrmap_alloced);
> +	if (!addrmap)
> +		goto oom;
> +
> +	/*
> +	 * For each address range (addr,size) and object, add to addrmap
> +	 * the range and the built-in module to which the object maps.
> +	 */
> +	while (fscanf(f, "%llx %llx %s\n", &addr, &size, obj) == 3) {
> +		int m = obj2mod_get(obj);
> +
> +		if (addr == 0 || size == 0 || m == 0)
> +			continue;
> +
> +		if (addrmap_num >= addrmap_alloced) {
> +			addrmap_alloced *= 2;
> +			addrmap = realloc(addrmap,
> +			    sizeof(*addrmap) * addrmap_alloced);
> +			if (!addrmap)
> +				goto oom;
> +		}
> +
> +		addrmap[addrmap_num].addr = addr;
> +		addrmap[addrmap_num].size = size;
> +		addrmap[addrmap_num].module = m;
> +		addrmap_num++;
> +	}
> +	fclose(f);
> +	return;
> +
> +oom:
> +	fprintf(stderr, "kallsyms: out of memory\n");
> +	exit(1);
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
> +static void read_modules(void)
> +{
> +	FILE *f;
> +	char *line;
> +	size_t line_size;
> +	size_t offset = 0;
> +
> +	realloc_builtin_modules(); /* initial allocation */
> +
> +	builtin_modules[0] = strdup(""); /* a symbol that cannot be modular */
> +	builtin_module_offsets[0] = 0;
> +	builtin_module_len = 1;
> +	offset++;
> +
> +	/*
> +	 * Iterate over all modules in modules_thick.builtin and add each.
> +	 */
> +	f = fopen("modules_thick.builtin", "r");
> +	if (f == NULL) {
> +		fprintf(stderr, "Cannot open modules_thick.builtin: %s\n",
> +		    strerror(errno));
> +		exit(1);
> +	}
> +
> +	while (getline(&line, &line_size, f) > 0) {
> +		char **paths;
> +		char *module_name = NULL;
> +
> +		paths = modules_thick_parse(line, &module_name);
> +		if (paths == NULL)
> +			break;
> +		offset = add_builtin_module(module_name, paths, offset);
> +		free(paths);
> +		free(module_name);
> +	}
> +	if (ferror(f)) {
> +		fprintf(stderr, "Error reading from modules_thick file: %s\n",
> +		    strerror(errno));
> +		exit(1);
> +	}
> +
> +	fclose(f);
> +	free(line);
> +
> +	/*
> +	 * Read linker map.
> +	 */
> +	read_linker_map();
> +
> +	obj2mod_free();
> +}
> +
>   int main(int argc, char **argv)
>   {
>   	if (argc >= 2) {
>   		int i;
>   		for (i = 1; i < argc; i++) {
> -			if(strcmp(argv[i], "--all-symbols") == 0)
> +			if (strcmp(argv[i], "--all-symbols") == 0)
>   				all_symbols = 1;
>   			else if (strcmp(argv[i], "--absolute-percpu") == 0)
>   				absolute_percpu = 1;
> @@ -751,6 +1040,7 @@ int main(int argc, char **argv)
>   	} else if (argc != 1)
>   		usage();
>   
> +	read_modules();
>   	read_map(stdin);
>   	shrink_table();
>   	if (absolute_percpu)
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 436379940356..ac14d292387a 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -76,6 +76,7 @@ vmlinux_link()
>   			--start-group				\
>   			${KBUILD_VMLINUX_LIBS}			\
>   			--end-group				\
> +			-Map=.tmp_vmlinux.map			\
>   			${@}"
>   
>   		${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}	\
> @@ -88,6 +89,7 @@ vmlinux_link()
>   			-Wl,--start-group			\
>   			${KBUILD_VMLINUX_LIBS}			\
>   			-Wl,--end-group				\
> +			-Wl,-Map=.tmp_vmlinux.map		\
>   			${@}"
>   
>   		${CC} ${CFLAGS_vmlinux}				\
> @@ -140,6 +142,19 @@ kallsyms()
>   	info KSYM ${2}
>   	local kallsymopt;
>   
> +	# read the linker map to identify ranges of addresses:
> +	#   - for each *.o file, report address, size, pathname
> +	#       - most such lines will have four fields
> +	#       - but sometimes there is a line break after the first field
> +	#   - start reading at "Linker script and memory map"
> +	#   - stop reading at ".brk"
> +	${AWK} '
> +	    /\.o$/ && start==1 && NF>=3 { print $(NF-2), $(NF-1), $NF }
> +	    /^Linker script and memory map/ { start = 1 }
> +	    /^\.brk/ { exit(0) }
> +	' .tmp_vmlinux.map | sort > .tmp_vmlinux.ranges
> +
> +	# get kallsyms options
>   	if [ -n "${CONFIG_KALLSYMS_ALL}" ]; then
>   		kallsymopt="${kallsymopt} --all-symbols"
>   	fi
> @@ -152,11 +167,13 @@ kallsyms()
>   		kallsymopt="${kallsymopt} --base-relative"
>   	fi
>   
> +	# set up compilation
>   	local aflags="${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL}               \
>   		      ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS}"
>   
>   	local afile="`basename ${2} .o`.S"
>   
> +	# construct file and compile
>   	${NM} -n ${1} | scripts/kallsyms ${kallsymopt} > ${afile}
>   	${CC} ${aflags} -c -o ${2} ${afile}
>   }
> diff --git a/scripts/modules_thick.c b/scripts/modules_thick.c
> new file mode 100644
> index 000000000000..2d33b92060f9
> --- /dev/null
> +++ b/scripts/modules_thick.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * A simple modules_thick reader.
> + *
> + * (C) 2014, 2019 Oracle, Inc.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <errno.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include "modules_thick.h"
> +
> +/*
> + * Parse a line from "modules_thick.builtin".  Allocate and return a module name
> + * and a null-terminated array of object paths (file names).  The name and array
> + * should be freed by the caller; the strings the array points to are in "line".
> + *
> + * Modules can consist of multiple paths: in this case, the portion before the
> + * colon is the path to the module, while the portion after the colon is a
> + * space-separated list of object paths.  In this case, the portion before the
> + * colon is an "object file" that does not actually exist: it is merged into
> + * built-in.a without ever being written out.
> + */
> +char ** __attribute__((__nonnull__))
> +modules_thick_parse(char *line, char **module_name)
> +{
> +	size_t npaths = 1;
> +	char **paths;
> +	char *tmp;
> +	char *olist;
> +
> +	/* find object-file list after the colon, if any */
> +	olist = strchr(line, ':');
> +	if (olist != NULL) {
> +		*olist = '\0';
> +		olist++;
> +		olist += strspn(olist, " \n");
> +		if (*olist != '\0') {
> +			/* replace any trailing \n with \0 */
> +			tmp = strchr(olist, '\n');
> +			if (tmp != NULL)
> +				*tmp = '\0';
> +		} else
> +			olist = NULL;
> +	}
> +
> +	/* get pathless module_name, starting after the last '/', if any */
> +	tmp = strrchr(line, '/');
> +	*module_name = strdup(tmp ? tmp + 1 : line);
> +
> +	/* replace '-' with '_' as is done to names when built as modules */
> +	for (tmp = *module_name; *tmp != '\0'; tmp++)
> +		if (*tmp == '-')
> +			*tmp = '_';
> +
> +	/* terminate at the last '.' to remove any suffix */
> +	tmp = strrchr(*module_name, '.');
> +	if (tmp != NULL)
> +		*tmp = '\0';
> +
> +	/*
> +	 * Count the number of paths by counting the number of spaces.
> +	 * This could be an overestimate.
> +	 */
> +	if (olist) {
> +		npaths = 0;
> +		for (tmp = olist; tmp != NULL; tmp = strchr(tmp + 1, ' '))
> +			npaths++;
> +	}
> +
> +	paths = malloc((npaths + 1) * sizeof(char *));
> +	if (!paths) {
> +		fprintf(stderr, "%s: out of memory\n", __func__);
> +		exit(1);
> +	}
> +
> +	/* copy the paths in */
> +	if (olist) {
> +		size_t i = 0;
> +
> +		while ((tmp = strsep(&olist, " ")) != NULL) {
> +			if (i >= npaths) {
> +				fprintf(stderr,
> +				    "%s bug: npaths overflow on module %s\n",
> +				    __func__, *module_name);
> +				exit(1);
> +			}
> +			paths[i++] = tmp;
> +		}
> +		npaths = i;
> +	} else
> +		paths[0] = line;	/* untransformed module name */
> +
> +	paths[npaths] = NULL;
> +
> +	return paths;
> +}
> diff --git a/scripts/modules_thick.h b/scripts/modules_thick.h
> new file mode 100644
> index 000000000000..7e2c0309c731
> --- /dev/null
> +++ b/scripts/modules_thick.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * A simple modules_thick reader.
> + *
> + * (C) 2014, 2019 Oracle, Inc.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef _LINUX_MODULES_THICK_H
> +#define _LINUX_MODULES_THICK_H
> +
> +#include <stdio.h>
> +#include <stddef.h>
> +
> +/*
> + * Parse a line from "modules_thick.builtin".  Return a module name
> + * and a null-terminated array of object paths (file names).
> + */
> +
> +char ** __attribute__((__nonnull__))
> +modules_thick_parse(char *line, char **module_name);
> +
> +#endif
> diff --git a/scripts/namespace.pl b/scripts/namespace.pl
> index 1da7bca201a4..4c7615e720de 100755
> --- a/scripts/namespace.pl
> +++ b/scripts/namespace.pl
> @@ -120,6 +120,11 @@ my %nameexception = (
>       'kallsyms_addresses'=> 1,
>       'kallsyms_offsets'	=> 1,
>       'kallsyms_relative_base'=> 1,
> +    'kallsyms_token_table'=> 1,
> +    'kallsyms_token_index'=> 1,
> +    'kallsyms_markers'	=> 1,
> +    'kallsyms_modules'	=> 1,
> +    'kallsyms_symbol_modules'=> 1,
>       '__this_module'	=> 1,
>       '_etext'		=> 1,
>       '_edata'		=> 1,

