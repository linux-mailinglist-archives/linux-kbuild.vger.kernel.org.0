Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B0FFE322
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 17:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbfKOQrM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 11:47:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:57122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727585AbfKOQrM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 11:47:12 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6853220730;
        Fri, 15 Nov 2019 16:47:09 +0000 (UTC)
Date:   Fri, 15 Nov 2019 11:47:08 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     eugene.loh@oracle.com
Cc:     corbet@lwn.net, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, jeyu@kernel.org,
        linux-kbuild@vger.kernel.org, maz@kernel.org,
        songliubraving@fb.com, tglx@linutronix.de,
        jacob.e.keller@intel.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kallsyms: new /proc/kallmodsyms with builtin modules
 and symbol sizes
Message-ID: <20191115114708.2a784f8d@gandalf.local.home>
In-Reply-To: <20191114223036.9359-1-eugene.loh@oracle.com>
References: <20191114223036.9359-1-eugene.loh@oracle.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


[ Adding Linus, Andrew and Greg as this is something that needs higher
  level of approval for acceptance ]

On Thu, 14 Nov 2019 14:30:36 -0800
eugene.loh@oracle.com wrote:

> From: Kris Van Hees <kris.van.hees@oracle.com>
> 
> /proc/kallsyms is very useful for tracers and other tools that need to
> map kernel symbols to addresses.
> 
> It would be useful if:
> 
> - there were a mapping between kernel symbol and module name
>   that only changed when the kernel source code is changed.
>   This mapping should not change simply because a module
>   becomes built into the kernel.
> 
> - there were symbol size information to determine whether an
>   address is within a symbol or outside it, especially given
>   that there could be huge gaps between symbols.
> 
> Therefore:
> 
> - Introduce a new config parameter CONFIG_KALLMODSYMS.
> 
> - Generate a file "modules_thick.builtin" that maps from
>   the thin archives that make up built-in modules to their
>   constituent object files.
> 
> - Generate a linker map ".tmp_vmlinux.map", converting it
>   into ".tmp_vmlinux.ranges", mapping address ranges to
>   object files.
> 
> - Change scripts/kallsyms.c stdin from "nm" to "nm -S" so that
>   symbol sizes are available.  Have sort_symbols() incorporate
>   size info.  Emit size info in the *.s output file.  Skip the
>   .init.scratch section.
> 
> - If CONFIG_KALLMODSYMS, have scripts/kallsyms also read
>   "modules_thick.builtin" and ".tmp_vmlinux.ranges" to map
>   symbol addresses to built-in-module names and then write
>   those module names and per-symbol module information to
>   the *.s output file.
> 
> - Change module_get_kallsym() to return symbol size as well.
> 
> - In kernel/kallsyms:
>   - Use new, accurate symbol size information in get_symbol_pos(),
>     both to identify the correct symbol and to return correct size
>     information.
>   - Introduce a field builtin_module to say if the symbol is in a
>     built-in module.
>   - If CONFIG_KALLMODSYMS, produce a new /proc/kallmodsyms file,
>     akin to /proc/kallsyms but with built-in-module names and symbol
>     sizes.
> 
> The resulting /proc/kallmodsyms file looks like this:
>     ffffffff8b013d20 409 t pt_buffer_setup_aux
>     ffffffff8b014130 11f T intel_pt_interrupt
>     ffffffff8b014250 2d T cpu_emergency_stop_pt
>     ffffffff8b014280 13a t rapl_pmu_event_init      [intel_rapl_perf]

I personally can use this as it will help the function tracer be able
to filter on functions of modules that are builtin, where as we can not
do that today.

-- Steve


>     ffffffff8b0143c0 bb t rapl_event_update [intel_rapl_perf]
>     ffffffff8b014480 10 t rapl_pmu_event_read       [intel_rapl_perf]
>     ffffffff8b014490 a3 t rapl_cpu_offline  [intel_rapl_perf]
>     ffffffff8b014540 24 t __rapl_event_show [intel_rapl_perf]
>     ffffffff8b014570 f2 t rapl_pmu_event_stop       [intel_rapl_perf]
> This is emitted even if intel_rapl_perf is built into the kernel.
> 
> As with /proc/kallsyms, non-root usage produces addresses that are
> all zero;  symbol sizes are treated similarly.
> 
> Programs that consume /proc/kallmodsyms should note that unlike
> /proc/kallsyms, kernel symbols for built-in modules may appear
> interspersed with other symbols that are part of different modules or
> of the kernel.
> 
> Orabug: 29891866
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  .gitignore                  |   1 +
>  Documentation/dontdiff      |   1 +
>  Makefile                    |  41 ++-
>  include/linux/module.h      |   7 +-
>  init/Kconfig                |   8 +
>  kernel/kallsyms.c           | 145 +++++++---
>  kernel/module.c             |   4 +-
>  scripts/Makefile.modbuiltin |  20 +-
>  scripts/kallsyms.c          | 559 +++++++++++++++++++++++++++++++++++-
>  scripts/link-vmlinux.sh     |  23 +-
>  scripts/namespace.pl        |   6 +
>  11 files changed, 748 insertions(+), 67 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 70580bdd352c..474491775a1a 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -47,6 +47,7 @@
>  Module.symvers
>  modules.builtin
>  modules.order
> +modules_thick.builtin
>  
>  #
>  # Top-level generic files
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
> diff --git a/Makefile b/Makefile
> index 49363caa7079..15b4e897cd3e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1077,7 +1077,7 @@ cmd_link-vmlinux =                                                 \
>  	$(CONFIG_SHELL) $< $(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) ;    \
>  	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>  
> -vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
> +vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) modules_thick.builtin FORCE
>  	+$(call if_changed,link-vmlinux)
>  
>  targets := vmlinux
> @@ -1292,17 +1292,6 @@ modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order modules.builtin
>  modules.order: descend
>  	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
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
>  ###
>  # Cleaning is done on three levels.
>  # make clean     Delete most generated files
> @@ -1674,6 +1690,7 @@ clean: $(clean-dirs)
>  		-o -name '*.asn1.[ch]' \
>  		-o -name '*.symtypes' -o -name 'modules.order' \
>  		-o -name modules.builtin -o -name '.tmp_*.o.*' \
> +		-o -name modules_thick.builtin \
>  		-o -name '*.c.[012]*.*' \
>  		-o -name '*.ll' \
>  		-o -name '*.gcno' \) -type f -print | xargs rm -f
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 6d20895e7739..b4f3f680a77d 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -592,7 +592,8 @@ bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
>  /* Returns 0 and fills in value, defined and namebuf, or -ERANGE if
>     symnum out of range. */
>  int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
> -			char *name, char *module_name, int *exported);
> +		       char *name, char *module_name, unsigned long *size,
> +		       int *exported);
>  
>  /* Look for this name: can be of form module:name. */
>  unsigned long module_kallsyms_lookup_name(const char *name);
> @@ -774,8 +775,8 @@ static inline int lookup_module_symbol_attrs(unsigned long addr, unsigned long *
>  }
>  
>  static inline int module_get_kallsym(unsigned int symnum, unsigned long *value,
> -					char *type, char *name,
> -					char *module_name, int *exported)
> +				     char *type, char *name, char *module_name,
> +				     unsigned long *size, int *exported)
>  {
>  	return -ERANGE;
>  }
> diff --git a/init/Kconfig b/init/Kconfig
> index ff6108deaad2..15294af2a1e9 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1429,6 +1429,14 @@ config POSIX_TIMERS
>  
>  	  If unsure say y.
>  
> +config KALLMODSYMS
> +	default y
> +	bool "Enable support for /proc/kallmodsyms" if EXPERT
> +	depends on KALLSYMS
> +	help
> +	  This option enables the /proc/kallmodsyms file, which maps symbols
> +	  to addresses and their associated modules.
> +
>  config PRINTK
>  	default y
>  	bool "Enable support for printk" if EXPERT
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 136ce049c4ad..a51fdf73f9b3 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -32,6 +32,7 @@
>   */
>  extern const unsigned long kallsyms_addresses[] __weak;
>  extern const int kallsyms_offsets[] __weak;
> +extern const unsigned long kallsyms_sizes[] __weak;
>  extern const u8 kallsyms_names[] __weak;
>  
>  /*
> @@ -46,6 +47,8 @@ __attribute__((weak, section(".rodata")));
>  
>  extern const u8 kallsyms_token_table[] __weak;
>  extern const u16 kallsyms_token_index[] __weak;
> +extern const char kallsyms_modules[] __weak;
> +extern const u32 kallsyms_symbol_modules[] __weak;
>  
>  extern const unsigned int kallsyms_markers[] __weak;
>  
> @@ -195,12 +198,24 @@ int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
>  }
>  EXPORT_SYMBOL_GPL(kallsyms_on_each_symbol);
>  
> +/*
> + * The caller passes in an address, and we return an index to the symbol --
> + * potentially also size and offset information.
> + * But an address might map to multiple symbols because:
> + *   - some symbols might have zero size
> + *   - some symbols might be aliases of one another
> + *   - some symbols might span (encompass) others
> + * The symbols should already be ordered so that, for a particular address,
> + * we first have the zero-size ones, then the biggest, then the smallest.
> + * So we find the index by:
> + *   - finding the last symbol with the target address
> + *   - backing the index up so long as both the address and size are unchanged
> + */
>  static unsigned long get_symbol_pos(unsigned long addr,
>  				    unsigned long *symbolsize,
>  				    unsigned long *offset)
>  {
> -	unsigned long symbol_start = 0, symbol_end = 0;
> -	unsigned long i, low, high, mid;
> +	unsigned long low, high, mid;
>  
>  	/* This kernel should never had been booted. */
>  	if (!IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE))
> @@ -221,36 +236,17 @@ static unsigned long get_symbol_pos(unsigned long addr,
>  	}
>  
>  	/*
> -	 * Search for the first aliased symbol. Aliased
> -	 * symbols are symbols with the same address.
> +	 * Search for the first aliased symbol.
>  	 */
> -	while (low && kallsyms_sym_address(low-1) == kallsyms_sym_address(low))
> +	while (low
> +	    && kallsyms_sym_address(low-1) == kallsyms_sym_address(low)
> +	    && kallsyms_sizes[low-1] == kallsyms_sizes[low])
>  		--low;
>  
> -	symbol_start = kallsyms_sym_address(low);
> -
> -	/* Search for next non-aliased symbol. */
> -	for (i = low + 1; i < kallsyms_num_syms; i++) {
> -		if (kallsyms_sym_address(i) > symbol_start) {
> -			symbol_end = kallsyms_sym_address(i);
> -			break;
> -		}
> -	}
> -
> -	/* If we found no next symbol, we use the end of the section. */
> -	if (!symbol_end) {
> -		if (is_kernel_inittext(addr))
> -			symbol_end = (unsigned long)_einittext;
> -		else if (IS_ENABLED(CONFIG_KALLSYMS_ALL))
> -			symbol_end = (unsigned long)_end;
> -		else
> -			symbol_end = (unsigned long)_etext;
> -	}
> -
>  	if (symbolsize)
> -		*symbolsize = symbol_end - symbol_start;
> +		*symbolsize = kallsyms_sizes[low];
>  	if (offset)
> -		*offset = addr - symbol_start;
> +		*offset = addr - kallsyms_sym_address(low);
>  
>  	return low;
>  }
> @@ -270,6 +266,7 @@ int kallsyms_lookup_size_offset(unsigned long addr, unsigned long *symbolsize,
>  	return !!module_address_lookup(addr, symbolsize, offset, NULL, namebuf) ||
>  	       !!__bpf_address_lookup(addr, symbolsize, offset, namebuf);
>  }
> +EXPORT_SYMBOL_GPL(kallsyms_lookup_size_offset);
>  
>  /*
>   * Lookup an address
> @@ -440,9 +437,11 @@ struct kallsym_iter {
>  	loff_t pos_ftrace_mod_end;
>  	unsigned long value;
>  	unsigned int nameoff; /* If iterating in core kernel symbols. */
> +	unsigned long size;
>  	char type;
>  	char name[KSYM_NAME_LEN];
>  	char module_name[MODULE_NAME_LEN];
> +	int builtin_module;
>  	int exported;
>  	int show_value;
>  };
> @@ -472,7 +471,9 @@ static int get_ksymbol_mod(struct kallsym_iter *iter)
>  	int ret = module_get_kallsym(iter->pos - iter->pos_arch_end,
>  				     &iter->value, &iter->type,
>  				     iter->name, iter->module_name,
> -				     &iter->exported);
> +				     &iter->size, &iter->exported);
> +	iter->builtin_module = 0;
> +
>  	if (ret < 0) {
>  		iter->pos_mod_end = iter->pos;
>  		return 0;
> @@ -508,10 +509,22 @@ static int get_ksymbol_bpf(struct kallsym_iter *iter)
>  static unsigned long get_ksymbol_core(struct kallsym_iter *iter)
>  {
>  	unsigned off = iter->nameoff;
> +	u32 mod_index = 0;
> +
> +	if (kallsyms_symbol_modules)
> +		mod_index = kallsyms_symbol_modules[iter->pos];
>  
> -	iter->module_name[0] = '\0';
> +	if (mod_index == 0 || kallsyms_modules == NULL) {
> +		iter->module_name[0] = '\0';
> +		iter->builtin_module = 0;
> +	} else {
> +		strcpy(iter->module_name, &kallsyms_modules[mod_index]);
> +		iter->builtin_module = 1;
> +	}
> +	iter->exported = 0;
>  	iter->value = kallsyms_sym_address(iter->pos);
>  
> +	iter->size = kallsyms_sizes[iter->pos];
>  	iter->type = kallsyms_get_symbol_type(off);
>  
>  	off = kallsyms_expand_symbol(off, iter->name, ARRAY_SIZE(iter->name));
> @@ -556,7 +569,7 @@ static int update_iter_mod(struct kallsym_iter *iter, loff_t pos)
>  }
>  
>  /* Returns false if pos at or past end of file. */
> -static int update_iter(struct kallsym_iter *iter, loff_t pos)
> +int update_iter(struct kallsym_iter *iter, loff_t pos)
>  {
>  	/* Module symbols can be accessed randomly. */
>  	if (pos >= kallsyms_num_syms)
> @@ -592,18 +605,22 @@ static void s_stop(struct seq_file *m, void *p)
>  {
>  }
>  
> -static int s_show(struct seq_file *m, void *p)
> +static int s_show_internal(struct seq_file *m, void *p, int builtin_modules)
>  {
>  	void *value;
>  	struct kallsym_iter *iter = m->private;
> +	unsigned long size;
>  
>  	/* Some debugging symbols have no name.  Ignore them. */
>  	if (!iter->name[0])
>  		return 0;
>  
>  	value = iter->show_value ? (void *)iter->value : NULL;
> +	size = iter->show_value ? iter->size : 0;
>  
> -	if (iter->module_name[0]) {
> +	if ((iter->builtin_module == 0 && iter->module_name[0]) ||
> +	    (iter->builtin_module != 0 && iter->module_name[0] &&
> +	     builtin_modules != 0)) {
>  		char type;
>  
>  		/*
> @@ -612,14 +629,34 @@ static int s_show(struct seq_file *m, void *p)
>  		 */
>  		type = iter->exported ? toupper(iter->type) :
>  					tolower(iter->type);
> -		seq_printf(m, "%px %c %s\t[%s]\n", value,
> -			   type, iter->name, iter->module_name);
> -	} else
> +		if (builtin_modules)
> +			seq_printf(m, "%px %lx %c %s\t[%s]\n", value,
> +				   size, type, iter->name,
> +				   iter->module_name);
> +		else
> +			seq_printf(m, "%px %c %s\t[%s]\n", value,
> +				   type, iter->name, iter->module_name);
> +	} else if (builtin_modules)
> +		seq_printf(m, "%px %lx %c %s\n", value, size,
> +			   iter->type, iter->name);
> +	else
>  		seq_printf(m, "%px %c %s\n", value,
>  			   iter->type, iter->name);
>  	return 0;
>  }
>  
> +static int s_show(struct seq_file *m, void *p)
> +{
> +	return s_show_internal(m, p, 0);
> +}
> +
> +#ifdef CONFIG_KALLMODSYMS
> +static int s_mod_show(struct seq_file *m, void *p)
> +{
> +	return s_show_internal(m, p, 1);
> +}
> +#endif
> +
>  static const struct seq_operations kallsyms_op = {
>  	.start = s_start,
>  	.next = s_next,
> @@ -627,6 +664,15 @@ static const struct seq_operations kallsyms_op = {
>  	.show = s_show
>  };
>  
> +#ifdef CONFIG_KALLMODSYMS
> +static const struct seq_operations kallmodsyms_op = {
> +	.start = s_start,
> +	.next = s_next,
> +	.stop = s_stop,
> +	.show = s_mod_show
> +};
> +#endif
> +
>  static inline int kallsyms_for_perf(void)
>  {
>  #ifdef CONFIG_PERF_EVENTS
> @@ -661,7 +707,8 @@ int kallsyms_show_value(void)
>  	}
>  }
>  
> -static int kallsyms_open(struct inode *inode, struct file *file)
> +static int kallsyms_open_internal(struct inode *inode, struct file *file,
> +	const struct seq_operations *ops)
>  {
>  	/*
>  	 * We keep iterator in m->private, since normal case is to
> @@ -669,7 +716,7 @@ static int kallsyms_open(struct inode *inode, struct file *file)
>  	 * using get_symbol_offset for every symbol.
>  	 */
>  	struct kallsym_iter *iter;
> -	iter = __seq_open_private(file, &kallsyms_op, sizeof(*iter));
> +	iter = __seq_open_private(file, ops, sizeof(*iter));
>  	if (!iter)
>  		return -ENOMEM;
>  	reset_iter(iter, 0);
> @@ -678,6 +725,18 @@ static int kallsyms_open(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> +static int kallsyms_open(struct inode *inode, struct file *file)
> +{
> +	return kallsyms_open_internal(inode, file, &kallsyms_op);
> +}
> +
> +#ifdef CONFIG_KALLMODSYMS
> +static int kallmodsyms_open(struct inode *inode, struct file *file)
> +{
> +	return kallsyms_open_internal(inode, file, &kallmodsyms_op);
> +}
> +#endif
> +
>  #ifdef	CONFIG_KGDB_KDB
>  const char *kdb_walk_kallsyms(loff_t *pos)
>  {
> @@ -705,9 +764,21 @@ static const struct file_operations kallsyms_operations = {
>  	.release = seq_release_private,
>  };
>  
> +#ifdef CONFIG_KALLMODSYMS
> +static const struct file_operations kallmodsyms_operations = {
> +	.open = kallmodsyms_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = seq_release_private,
> +};
> +#endif
> +
>  static int __init kallsyms_init(void)
>  {
>  	proc_create("kallsyms", 0444, NULL, &kallsyms_operations);
> +#ifdef CONFIG_KALLMODSYMS
> +	proc_create("kallmodsyms", 0444, NULL, &kallmodsyms_operations);
> +#endif
>  	return 0;
>  }
>  device_initcall(kallsyms_init);
> diff --git a/kernel/module.c b/kernel/module.c
> index ff2d7359a418..4a31e1e94acd 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -4184,7 +4184,8 @@ int lookup_module_symbol_attrs(unsigned long addr, unsigned long *size,
>  }
>  
>  int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
> -			char *name, char *module_name, int *exported)
> +		       char *name, char *module_name, unsigned long *size,
> +		       int *exported)
>  {
>  	struct module *mod;
>  
> @@ -4203,6 +4204,7 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
>  			strlcpy(name, kallsyms_symbol_name(kallsyms, symnum), KSYM_NAME_LEN);
>  			strlcpy(module_name, mod->name, MODULE_NAME_LEN);
>  			*exported = is_exported(name, *value, mod);
> +			*size = kallsyms->symtab[symnum].st_size;
>  			preempt_enable();
>  			return 0;
>  		}
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
>  	@:
>  
>  $(modbuiltin-target): $(subdir-ym) FORCE
>  	$(Q)(for m in $(modbuiltin-mods); do echo $$m; done;	\
>  	cat /dev/null $(modbuiltin-subdirs)) > $@
>  
> +$(modthickbuiltin-target): $(subdir-ym) FORCE
> +	$(Q) $(foreach mod-o, $(filter %.o,$(obj-Y)),\
> +		printf "%s:" $(addprefix $(obj)/,$(mod-o)) >> $@; \
> +		printf " %s" $(sort $(strip $(addprefix $(obj)/,$($(mod-o:.o=-objs)) \
> +			$($(mod-o:.o=-y)) $($(mod-o:.o=-Y))))) >> $@; \
> +		printf "\n" >> $@; ) \
> +	cat /dev/null $(modthickbuiltin-subdirs) >> $@;
> +
>  PHONY += FORCE
>  
>  FORCE:
> @@ -52,6 +62,6 @@ FORCE:
>  
>  PHONY += $(subdir-ym)
>  $(subdir-ym):
> -	$(Q)$(MAKE) $(modbuiltin)=$@
> +	$(Q)$(MAKE) $(modbuiltin)=$@ builtin-file=$(builtin-file)
>  
>  .PHONY: $(PHONY)
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index ae6504d07fd6..e88653b00f36 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -5,7 +5,10 @@
>   * This software may be used and distributed according to the terms
>   * of the GNU General Public License, incorporated herein by reference.
>   *
> - * Usage: nm -n vmlinux | scripts/kallsyms [--all-symbols] > symbols.S
> + * Usage: nm -n -S vmlinux
> + *        | scripts/kallsyms [--all-symbols] [--absolute-percpu]
> + *             [--base-relative] [--builtin=modules_thick.builtin]
> + *        > symbols.S
>   *
>   *      Table compression uses all the unused char codes on the symbols and
>   *  maps these to the most used substrings (tokens). For instance, it might
> @@ -18,12 +21,19 @@
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
> +#include "../include/generated/autoconf.h"
> +
> +#ifdef CONFIG_KALLMODSYMS
> +#include <errno.h>
> +#endif
> +
>  #ifndef ARRAY_SIZE
>  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
>  #endif
> @@ -32,10 +42,14 @@
>  
>  struct sym_entry {
>  	unsigned long long addr;
> +	unsigned long long size;
>  	unsigned int len;
>  	unsigned int start_pos;
>  	unsigned char *sym;
>  	unsigned int percpu_absolute;
> +#ifdef CONFIG_KALLMODSYMS
> +	unsigned int module;
> +#endif
>  };
>  
>  struct addr_range {
> @@ -68,11 +82,118 @@ static int token_profit[0x10000];
>  static unsigned char best_table[256][2];
>  static unsigned char best_table_len[256];
>  
> +#ifdef CONFIG_KALLMODSYMS
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
> +static void obj2mod_init(void)
> +{
> +	memset(obj2mod, 0, sizeof(obj2mod));
> +}
> +
> +static void obj2mod_put(char *obj, int mod)
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
> +static int obj2mod_get(char *obj)
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
> + * modules_thick.builtin iteration state.
> + */
> +struct modules_thick_iter {
> +	FILE *f;
> +	char *line;
> +	size_t line_size;
> +};
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
> +#endif
>  
>  static void usage(void)
>  {
> -	fprintf(stderr, "Usage: kallsyms [--all-symbols] "
> -			"[--base-relative] < in.map > out.S\n");
> +	fprintf(stderr, "Usage: kallsyms [--all-symbols] [--absolute-percpu] "
> +			"[--base-relative] [--builtin=modules_thick.builtin] "
> +			"< nm_vmlinux.out > symbols.S\n");
>  	exit(1);
>  }
>  
> @@ -107,13 +228,32 @@ static int check_symbol_range(const char *sym, unsigned long long addr,
>  	return 1;
>  }
>  
> +#ifdef CONFIG_KALLMODSYMS
> +static int addrmap_compare(const void *keyp, const void *rangep)
> +{
> +	unsigned long long addr = *((const unsigned long long *)keyp);
> +	const struct addrmap_entry *range = (const struct addrmap_entry *)rangep;
> +
> +	if (addr < range->addr)
> +		return -1;
> +	if (addr < range->addr + range->size)
> +		return 0;
> +	return 1;
> +}
> +#endif
> +
>  static int read_symbol(FILE *in, struct sym_entry *s)
>  {
>  	char sym[500], stype;
> -	int rc;
> +	int rc, init_scratch = 0;
> +#ifdef CONFIG_KALLMODSYMS
> +	struct addrmap_entry *range;
> +#endif
>  
> -	rc = fscanf(in, "%llx %c %499s\n", &s->addr, &stype, sym);
> -	if (rc != 3) {
> +read_another:
> +	rc = fscanf(in, "%llx %llx %c %499s\n",
> +		    &s->addr, &s->size, &stype, sym);
> +	if (rc != 4) {
>  		if (rc != EOF && fgets(sym, 500, in) == NULL)
>  			fprintf(stderr, "Read error or end of file.\n");
>  		return -1;
> @@ -125,6 +265,16 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>  		return -1;
>  	}
>  
> +	/* skip the .init.scratch section */
> +	if (strcmp(sym, "__init_scratch_end") == 0) {
> +		init_scratch = 0;
> +		goto read_another;
> +	}
> +	if (strcmp(sym, "__init_scratch_begin") == 0)
> +		init_scratch = 1;
> +	if (init_scratch)
> +		goto read_another;
> +
>  	/* Ignore most absolute/undefined (?) symbols. */
>  	if (strcmp(sym, "_text") == 0)
>  		_text = s->addr;
> @@ -154,6 +304,16 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>  	else if (!strncmp(sym, ".LASANPC", 8))
>  		return -1;
>  
> +#ifdef CONFIG_KALLMODSYMS
> +	/* look up the builtin module this is part of (if any) */
> +	range = (struct addrmap_entry *) bsearch(&s->addr,
> +	    addrmap, addrmap_num, sizeof(*addrmap), &addrmap_compare);
> +	if (range)
> +		s->module = builtin_module_offsets[range->module];
> +	else
> +		s->module = 0;
> +#endif
> +
>  	/* include the type field in the symbol name, so that it gets
>  	 * compressed together */
>  	s->len = strlen(sym) + 1;
> @@ -201,11 +361,14 @@ static int symbol_valid(struct sym_entry *s)
>  		"kallsyms_addresses",
>  		"kallsyms_offsets",
>  		"kallsyms_relative_base",
> +		"kallsyms_sizes",
>  		"kallsyms_num_syms",
>  		"kallsyms_names",
>  		"kallsyms_markers",
>  		"kallsyms_token_table",
>  		"kallsyms_token_index",
> +		"kallsyms_symbol_modules",
> +		"kallsyms_modules",
>  
>  	/* Exclude linker generated symbols which vary between passes */
>  		"_SDA_BASE_",		/* ppc */
> @@ -405,6 +568,11 @@ static void write_src(void)
>  		printf("\n");
>  	}
>  
> +	output_label("kallsyms_sizes");
> +	for (i = 0; i < table_cnt; i++)
> +		printf("\tPTR\t%#llx\n", table[i].size);
> +	printf("\n");
> +
>  	output_label("kallsyms_num_syms");
>  	printf("\t.long\t%u\n", table_cnt);
>  	printf("\n");
> @@ -454,8 +622,22 @@ static void write_src(void)
>  	for (i = 0; i < 256; i++)
>  		printf("\t.short\t%d\n", best_idx[i]);
>  	printf("\n");
> -}
>  
> +#ifdef CONFIG_KALLMODSYMS
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
> +#endif
> +}
>  
>  /* table lookup compression functions */
>  
> @@ -683,6 +865,18 @@ static int compare_symbols(const void *a, const void *b)
>  	if (sa->addr < sb->addr)
>  		return -1;
>  
> +	/* zero-size markers before nonzero-size symbols */
> +	if (sa->size > 0 && sb->size == 0)
> +		return 1;
> +	if (sa->size == 0 && sb->size > 0)
> +		return -1;
> +
> +	/* sort by size (large size preceding symbols it encompasses) */
> +	if (sa->size < sb->size)
> +		return 1;
> +	if (sa->size > sb->size)
> +		return -1;
> +
>  	/* sort by "weakness" type */
>  	wa = (sa->sym[0] == 'w') || (sa->sym[0] == 'W');
>  	wb = (sb->sym[0] == 'w') || (sb->sym[0] == 'W');
> @@ -738,23 +932,372 @@ static void record_relative_base(void)
>  			relative_base = table[i].addr;
>  }
>  
> +#ifdef CONFIG_KALLMODSYMS
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
> +	struct modules_thick_iter *i;
> +
> +	i = calloc(1, sizeof(struct modules_thick_iter));
> +	if (i == NULL)
> +		return NULL;
> +
> +	i->f = fopen(modules_thick_file, "r");
> +
> +	if (i->f == NULL) {
> +		fprintf(stderr, "Cannot open builtin module file %s: %s\n",
> +			modules_thick_file, strerror(errno));
> +		return NULL;
> +	}
> +
> +	return i;
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
> +	size_t npaths = 1;
> +	char **module_paths;
> +	char *last_slash;
> +	char *last_dot;
> +	char *trailing_linefeed;
> +	char *object_name = i->line;
> +	char *dash;
> +	int composite = 0;
> +
> +	/*
> +	 * Read in all module entries, computing the suffixless, pathless name
> +	 * of the module and building the next arrayful of object file names for
> +	 * return.
> +	 *
> +	 * Modules can consist of multiple files: in this case, the portion
> +	 * before the colon is the path to the module (as before): the portion
> +	 * after the colon is a space-separated list of files that should be *
> +	 * considered part of this module.  In this case, the portion before the
> +	 * name is an "object file" that does not actually exist: it is merged
> +	 * into built-in.a without ever being written out.
> +	 *
> +	 * All module names have - translated to _, to match what is done to the
> +	 * names of the same things when built as modules.
> +	 */
> +
> +	/*
> +	 * Reinvocation of exhausted iterator. Return NULL, once.
> +	 */
> +retry:
> +	if (getline(&i->line, &i->line_size, i->f) < 0) {
> +		if (ferror(i->f)) {
> +			fprintf(stderr,
> +				"Error reading from modules_thick file: %s\n",
> +				strerror(errno));
> +			exit(1);
> +		}
> +		rewind(i->f);
> +		return NULL;
> +	}
> +
> +	if (i->line[0] == '\0')
> +		goto retry;
> +
> +	/*
> +	 * Slice the line in two at the colon, if any.  If there is anything
> +	 * past the ': ', this is a composite module.  (We allow for no colon
> +	 * for robustness, even though one should always be present.)
> +	 */
> +	if (strchr(i->line, ':') != NULL) {
> +		char *name_start;
> +
> +		object_name = strchr(i->line, ':');
> +		*object_name = '\0';
> +		object_name++;
> +		name_start = object_name + strspn(object_name, " \n");
> +		if (*name_start != '\0') {
> +			composite = 1;
> +			object_name = name_start;
> +		}
> +	}
> +
> +	/*
> +	 * Figure out the module name.
> +	 */
> +	last_slash = strrchr(i->line, '/');
> +	last_slash = (!last_slash) ? i->line :
> +		last_slash + 1;
> +	free(*module_name);
> +	*module_name = strdup(last_slash);
> +	dash = *module_name;
> +
> +	while (dash != NULL) {
> +		dash = strchr(dash, '-');
> +		if (dash != NULL)
> +			*dash = '_';
> +	}
> +
> +	last_dot = strrchr(*module_name, '.');
> +	if (last_dot != NULL)
> +		*last_dot = '\0';
> +
> +	trailing_linefeed = strchr(object_name, '\n');
> +	if (trailing_linefeed != NULL)
> +		*trailing_linefeed = '\0';
> +
> +	/*
> +	 * Multifile separator? Object file names explicitly stated:
> +	 * slice them up and shuffle them in.
> +	 *
> +	 * The array size may be an overestimate if any object file
> +	 * names start or end with spaces (very unlikely) but cannot be
> +	 * an underestimate.  (Check for it anyway.)
> +	 */
> +	if (composite) {
> +		char *one_object;
> +
> +		for (npaths = 0, one_object = object_name;
> +		     one_object != NULL;
> +		     npaths++, one_object = strchr(one_object + 1, ' '))
> +			;
> +	}
> +
> +	module_paths = malloc((npaths + 1) * sizeof(char *));
> +	if (!module_paths) {
> +		fprintf(stderr, "%s: out of memory on module %s\n", __func__,
> +			*module_name);
> +		exit(1);
> +	}
> +
> +	if (composite) {
> +		char *one_object;
> +		size_t i = 0;
> +
> +		while ((one_object = strsep(&object_name, " ")) != NULL) {
> +			if (i >= npaths) {
> +				fprintf(stderr, "%s: npaths overflow on module "
> +					"%s: this is a bug.\n", __func__,
> +					*module_name);
> +				exit(1);
> +			}
> +
> +			module_paths[i++] = one_object;
> +		}
> +	} else
> +		module_paths[0] = i->line;	/* untransformed module name */
> +
> +	module_paths[npaths] = NULL;
> +
> +	return module_paths;
> +}
> +
> +/*
> + * Free an iterator. Can be called while iteration is underway, so even
> + * state that is freed at the end of iteration must be freed here too.
> + */
> +static void
> +modules_thick_iter_free(struct modules_thick_iter *i)
> +{
> +	if (i == NULL)
> +		return;
> +	fclose(i->f);
> +	free(i->line);
> +	free(i);
> +}
> +
> +/*
> + * Expand the builtin modules list.
> + */
> +static void expand_builtin_modules(void)
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
> +		expand_builtin_modules();
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
> +static void read_modules(const char *modules_builtin)
> +{
> +	struct modules_thick_iter *i;
> +	size_t offset = 0;
> +	char *module_name = NULL;
> +	char **module_paths;
> +
> +	obj2mod_init();
> +
> +	/*
> +	 * builtin_modules[0] is a null entry signifying a symbol that cannot be
> +	 * modular.
> +	 */
> +	builtin_module_size = 50;
> +	builtin_modules = malloc(sizeof(*builtin_modules) *
> +				 builtin_module_size);
> +	builtin_module_offsets = malloc(sizeof(*builtin_module_offsets) *
> +				 builtin_module_size);
> +	if (!builtin_modules || !builtin_module_offsets) {
> +		fprintf(stderr, "kallsyms: out of memory\n");
> +		exit(1);
> +	}
> +	builtin_modules[0] = strdup("");
> +	builtin_module_offsets[0] = 0;
> +	builtin_module_len = 1;
> +	offset++;
> +
> +	/*
> +	 * Iterate over all modules in modules_thick.builtin and add each.
> +	 */
> +	i = modules_thick_iter_new(modules_builtin);
> +	if (i == NULL) {
> +		fprintf(stderr, "Cannot iterate over builtin modules.\n");
> +		exit(1);
> +	}
> +
> +	while ((module_paths = modules_thick_iter_next(i, &module_name))) {
> +		offset = add_builtin_module(module_name, module_paths, offset);
> +		free(module_paths);
> +		module_paths = NULL;
> +	}
> +
> +	free(module_name);
> +	modules_thick_iter_free(i);
> +
> +	/*
> +	 * Read linker map.
> +	 */
> +	read_linker_map();
> +
> +	obj2mod_free();
> +}
> +#else
> +static void read_modules(const char *unused) {}
> +#endif /* CONFIG_KALLMODSYMS */
> +
>  int main(int argc, char **argv)
>  {
> +	const char *modules_builtin = "modules_thick.builtin";
> +
>  	if (argc >= 2) {
>  		int i;
>  		for (i = 1; i < argc; i++) {
> -			if(strcmp(argv[i], "--all-symbols") == 0)
> +			if (strcmp(argv[i], "--all-symbols") == 0)
>  				all_symbols = 1;
>  			else if (strcmp(argv[i], "--absolute-percpu") == 0)
>  				absolute_percpu = 1;
>  			else if (strcmp(argv[i], "--base-relative") == 0)
>  				base_relative = 1;
> +			else if (strncmp(argv[i], "--builtin=", 10) == 0)
> +				modules_builtin = &argv[i][10];
>  			else
>  				usage();
>  		}
>  	} else if (argc != 1)
>  		usage();
>  
> +	read_modules(modules_builtin);
>  	read_map(stdin);
>  	if (absolute_percpu)
>  		make_percpus_absolute();
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 06495379fcd8..c07eae553c08 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -76,6 +76,7 @@ vmlinux_link()
>  			--start-group				\
>  			${KBUILD_VMLINUX_LIBS}			\
>  			--end-group				\
> +			-Map=.tmp_vmlinux.map			\
>  			${@}"
>  
>  		${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}	\
> @@ -88,6 +89,7 @@ vmlinux_link()
>  			-Wl,--start-group			\
>  			${KBUILD_VMLINUX_LIBS}			\
>  			-Wl,--end-group				\
> +			-Wl,-Map=.tmp_vmlinux.map		\
>  			${@}"
>  
>  		${CC} ${CFLAGS_vmlinux}				\
> @@ -138,6 +140,19 @@ kallsyms()
>  	info KSYM ${2}
>  	local kallsymopt;
>  
> +	# read the linker map to identify ranges of addresses:
> +	#   - for each *.o file, report address, size, pathname
> +	#       - most such lines will have four fields
> +	#       - but sometimes there is a line break after the first field
> +	#   - start reading at "Linker script and memory map"
> +	#   - stop reading at ".brk"
> +	${AWK} '
> +	    /\.o$/ && start==1 { print $(NF-2), $(NF-1), $NF }
> +	    /^Linker script and memory map/ { start = 1 }
> +	    /^\.brk/ { exit(0) }
> +	' .tmp_vmlinux.map | sort > .tmp_vmlinux.ranges
> +
> +	# get kallsyms options
>  	if [ -n "${CONFIG_KALLSYMS_ALL}" ]; then
>  		kallsymopt="${kallsymopt} --all-symbols"
>  	fi
> @@ -150,12 +165,18 @@ kallsyms()
>  		kallsymopt="${kallsymopt} --base-relative"
>  	fi
>  
> +	# set up compilation
>  	local aflags="${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL}               \
>  		      ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS}"
>  
>  	local afile="`basename ${2} .o`.S"
>  
> -	${NM} -n ${1} | scripts/kallsyms ${kallsymopt} > ${afile}
> +	# "nm -S" does not print symbol size when size is 0
> +	# Therefore use awk to regularize the data:
> +	#   - when there are only three fields, add an explicit "0"
> +	#   - when there are already four fields, pass through as is
> +	${NM} -n -S ${1} | ${AWK} 'NF==3 {print $1, 0, $2, $3}; NF==4' | \
> +	    scripts/kallsyms ${kallsymopt} > ${afile}
>  	${CC} ${aflags} -c -o ${2} ${afile}
>  }
>  
> diff --git a/scripts/namespace.pl b/scripts/namespace.pl
> index 1da7bca201a4..40f82b4c3a50 100755
> --- a/scripts/namespace.pl
> +++ b/scripts/namespace.pl
> @@ -120,6 +120,12 @@ my %nameexception = (
>      'kallsyms_addresses'=> 1,  
>      'kallsyms_offsets'	=> 1,
>      'kallsyms_relative_base'=> 1,  
> +    'kallsyms_sizes'	=> 1,
> +    'kallsyms_token_table'=> 1,
> +    'kallsyms_token_index'=> 1,
> +    'kallsyms_markers'	=> 1,
> +    'kallsyms_modules'	=> 1,
> +    'kallsyms_symbol_modules'=> 1,
>      '__this_module'	=> 1,
>      '_etext'		=> 1,
>      '_edata'		=> 1,

