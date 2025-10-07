Return-Path: <linux-kbuild+bounces-9022-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3737ABBFEBF
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 03:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02546189D48E
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 01:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4FD20E032;
	Tue,  7 Oct 2025 01:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JX7ESfr9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1F31DE3B7
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 01:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799836; cv=none; b=ZOLdxACJTAD/gsX3Bg6bmzxpL6Hce5NpA+A4EXNOiZ8NVCZmdFBnrophn54IvaqUP1dPx66lziMYW57pLBgF6Qw8nTZz/2YX5MlwhEixTrM8jom1hRzXkxR4OXRCZDhzGDpt+pB8ak5z2uwUmtZJ/RqfdZ0aXoZVo+rgPDm8lMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799836; c=relaxed/simple;
	bh=ZoCuQIGKECVz2Og4x5nmupKDmXLNha8Nv8LewmenEmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtamUr58Q2cNpwuxz2pG+YmObG/9KjgLrRWJRFQb9aBt0rWFne83f0CtDaEg92KrsmDLXCHjw1IRL+iTqqGWZQyBrGAlz9mBK18qeAeyB+G8c4hDGqUjTVkGCOfi2BboMY39xNGl+Chc8UHUsvwuBqrjALStGHfm9xNRIzObNew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JX7ESfr9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759799829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpRMfKm9o1/F18kIBfBg6L03Iz4uKtsAej9zDsxfaLk=;
	b=JX7ESfr9uPMAEVYDwsbN0+lI9juMm4yxR2xUSUziGpczLAcLelh2bidfkKu/Hr7VL+SkJ/
	vwrRVUSAoxsgJA2URV4YohpXm0ppvsnlL1R1jvcU+iyj2A7jUMfe2bnyKtnF7Hc23uyXsa
	167LVu7/I73qXLlHjFGJWJe5+Ra+/Yo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-6M4nBPQVP42ztCl4msuiYw-1; Mon,
 06 Oct 2025 21:17:05 -0400
X-MC-Unique: 6M4nBPQVP42ztCl4msuiYw-1
X-Mimecast-MFC-AGG-ID: 6M4nBPQVP42ztCl4msuiYw_1759799823
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04ED4180034F;
	Tue,  7 Oct 2025 01:17:03 +0000 (UTC)
Received: from cmirabil.lan (unknown [10.22.64.13])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EB5E41800452;
	Tue,  7 Oct 2025 01:16:59 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: legion@kernel.org
Cc: da.gomez@samsung.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	masahiroy@kernel.org,
	mcgrof@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	petr.pavlu@suse.com,
	samitolvanen@google.com,
	sfr@canb.auug.org.au
Subject: Re: [PATCH v8 7/8] modpost: Create modalias for builtin modules
Date: Mon,  6 Oct 2025 21:16:37 -0400
Message-ID: <20251007011637.2512413-1-cmirabil@redhat.com>
In-Reply-To: <28d4da3b0e3fc8474142746bcf469e03752c3208.1758182101.git.legion@kernel.org>
References: <28d4da3b0e3fc8474142746bcf469e03752c3208.1758182101.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Thu, Sep 18, 2025 at 10:05:51AM +0200, Alexey Gladkov wrote:
> For some modules, modalias is generated using the modpost utility and
> the section is added to the module file.
> 
> When a module is added inside vmlinux, modpost does not generate
> modalias for such modules and the information is lost.
> 
> As a result kmod (which uses modules.builtin.modinfo in userspace)
> cannot determine that modalias is handled by a builtin kernel module.
> 
> $ cat /sys/devices/pci0000:00/0000:00:14.0/modalias
> pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> 
> $ modinfo xhci_pci
> name:           xhci_pci
> filename:       (builtin)
> license:        GPL
> file:           drivers/usb/host/xhci-pci
> description:    xHCI PCI Host Controller Driver
> 
> Missing modalias "pci:v*d*sv*sd*bc0Csc03i30*" which will be generated by
> modpost if the module is built separately.
> 
> To fix this it is necessary to generate the same modalias for vmlinux as
> for the individual modules. Fortunately '.vmlinux.export.o' is already
> generated from which '.modinfo' can be extracted in the same way as for
> vmlinux.o.

Hi -

This patch broke RISC-V builds for me. During the final objcopy where the new
symbols are supposed to be stripped, an error occurs producing lots of error
messages similar to this one:

riscv64-linux-gnu-objcopy: not stripping symbol `__mod_device_table__...'
because it is named in a relocation

It does not occur using defconfig, but I was able to bisect my way to this
commit and then reduce my config delta w.r.t defconfig until I landed on:

cat > .config <<'EOF'
CONFIG_RELOCATABLE=y
CONFIG_KASAN=y
EOF
ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- make olddefconfig
ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- make -j $(nproc)
...
  LD      vmlinux.unstripped
  NM      System.map
  SORTTAB vmlinux.unstripped
  CHKREL  vmlinux.unstripped
  OBJCOPY vmlinux
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin
riscv64-linux-gnu-objcopy: not stripping symbol `<long symbol name>'
because it is named in a relocation
<repeats with different symbol names about a dozen times>
make[3]: *** [scripts/Makefile.vmlinux:97: vmlinux] Error 1
make[3]: *** Deleting file 'vmlinux'
make[2]: *** [Makefile:1242: vmlinux] Error 2
make[1]: *** [/tmp/linux/Makefile:369: __build_one_by_one] Error 2
make: *** [Makefile:248: __sub-make] Error 2

I confirmed that reverting this commit fixes the issue.

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/module.h   |  4 ----
>  scripts/Makefile.vmlinux |  4 +++-
>  scripts/mksysmap         |  3 +++
>  scripts/mod/file2alias.c | 19 ++++++++++++++++++-
>  scripts/mod/modpost.c    | 15 +++++++++++++++
>  scripts/mod/modpost.h    |  2 ++
>  6 files changed, 41 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index e31ee29fac6b7..e135cc79aceea 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -256,14 +256,10 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
>  	__PASTE(type,			\
>  	__PASTE(__, name)))))
>  
> -#ifdef MODULE
>  /* Creates an alias so file2alias.c can find device table. */
>  #define MODULE_DEVICE_TABLE(type, name)					\
>  static typeof(name) __mod_device_table(type, name)			\
>    __attribute__ ((used, alias(__stringify(name))))
> -#else  /* !MODULE */
> -#define MODULE_DEVICE_TABLE(type, name)
> -#endif
>  
>  /* Version of form [<epoch>:]<version>[-<extra-version>].
>   * Or for CVS/RCS ID version, everything but the number is stripped.
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index ce79461714979..1e5e37aadcd05 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -89,11 +89,13 @@ endif
>  remove-section-y                                   := .modinfo
>  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
>  
> +remove-symbols := -w --strip-symbol='__mod_device_table__*'
> +
>  # To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
>  # it is necessary to remove the PT_LOAD flag from the segment.
>  quiet_cmd_strip_relocs = OBJCOPY $@
>        cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $@; \
> -                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $@
> +                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $(remove-symbols) $@
>  
>  targets += vmlinux
>  vmlinux: vmlinux.unstripped FORCE
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index a607a0059d119..c4531eacde202 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -59,6 +59,9 @@
>  # EXPORT_SYMBOL (namespace)
>  / __kstrtabns_/d
>  
> +# MODULE_DEVICE_TABLE (symbol name)
> +/ __mod_device_table__/d
> +
>  # ---------------------------------------------------------------------------
>  # Ignored suffixes
>  #  (do not forget '$' after each pattern)
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 1260bc2287fba..7da9735e7ab3e 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1477,7 +1477,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
>  	void *symval;
>  	char *zeros = NULL;
>  	const char *type, *name, *modname;
> -	size_t typelen;
> +	size_t typelen, modnamelen;
>  	static const char *prefix = "__mod_device_table__";
>  
>  	/* We're looking for a section relative symbol */
> @@ -1500,6 +1500,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
>  	type = strstr(modname, "__");
>  	if (!type)
>  		return;
> +	modnamelen = type - modname;
>  	type += strlen("__");
>  
>  	name = strstr(type, "__");
> @@ -1526,5 +1527,21 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
>  		}
>  	}
>  
> +	if (mod->is_vmlinux) {
> +		struct module_alias *alias;
> +
> +		/*
> +		 * If this is vmlinux, record the name of the builtin module.
> +		 * Traverse the linked list in the reverse order, and set the
> +		 * builtin_modname unless it has already been set in the
> +		 * previous call.
> +		 */
> +		list_for_each_entry_reverse(alias, &mod->aliases, node) {
> +			if (alias->builtin_modname)
> +				break;
> +			alias->builtin_modname = xstrndup(modname, modnamelen);
> +		}
> +	}
> +
>  	free(zeros);
>  }
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 5ca7c268294eb..47c8aa2a69392 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2067,11 +2067,26 @@ static void write_if_changed(struct buffer *b, const char *fname)
>  static void write_vmlinux_export_c_file(struct module *mod)
>  {
>  	struct buffer buf = { };
> +	struct module_alias *alias, *next;
>  
>  	buf_printf(&buf,
>  		   "#include <linux/export-internal.h>\n");
>  
>  	add_exported_symbols(&buf, mod);
> +
> +	buf_printf(&buf,
> +		   "#include <linux/module.h>\n"
> +		   "#undef __MODULE_INFO_PREFIX\n"
> +		   "#define __MODULE_INFO_PREFIX\n");
> +
> +	list_for_each_entry_safe(alias, next, &mod->aliases, node) {
> +		buf_printf(&buf, "MODULE_INFO(%s.alias, \"%s\");\n",
> +			   alias->builtin_modname, alias->str);
> +		list_del(&alias->node);
> +		free(alias->builtin_modname);
> +		free(alias);
> +	}
> +
>  	write_if_changed(&buf, ".vmlinux.export.c");
>  	free(buf.p);
>  }
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 9133e4c3803f0..2aecb8f25c87e 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -99,10 +99,12 @@ buf_write(struct buffer *buf, const char *s, int len);
>   * struct module_alias - auto-generated MODULE_ALIAS()
>   *
>   * @node: linked to module::aliases
> + * @modname: name of the builtin module (only for vmlinux)
>   * @str: a string for MODULE_ALIAS()
>   */
>  struct module_alias {
>  	struct list_head node;
> +	char *builtin_modname;
>  	char str[];
>  };
>  
> -- 
> 2.51.0
> 


