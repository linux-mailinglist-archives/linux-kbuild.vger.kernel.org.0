Return-Path: <linux-kbuild+bounces-4676-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3F9C8801
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 11:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588D3287AA0
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 10:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78E51F7797;
	Thu, 14 Nov 2024 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="nu1seUDC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BEE1991CD;
	Thu, 14 Nov 2024 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581293; cv=none; b=CukmaZFGZyfO2j2fjpOulY1tlpwIycrKVFbxvtA3XhBtbf8elGxLXNk7Kl96pZqfFLPA5HFgNn1Nxp4x5Of4gOK7I59cHOxLBg3HnMEZKrtnMP+JfhDtDl9UL3GHBQ2YujPEYcTOl5E6VJbald5yucOL2lK8PQlnPNBNdoWWm1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581293; c=relaxed/simple;
	bh=JtnymOeA7YRQ66y2RXqppVp30a9MHOAweBfmRUKLvlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJFnTrApfFae+l1pegLqFyS8uLbLMBbuFwKwhljSKBO0VwDCu93cOxV/hsDdufMxEn/AJAJnEYIewa0tUszKe1ImRNONXYKHJeqo/QnQZ6UInyt9h1TTbcMoSv/xFBZqlGMXpyXXlLNTxbEpD62Zt0CFDIXS+u46yfMl7QeTYz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=nu1seUDC; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lu+7vH6xwVL7N+wfozAYRKNKVdcCPqTWSuDF6eWHGEg=; b=nu1seUDCGRrB03T+S48rNjDhIW
	sVwKuAwKOfomyM4ToasXOtBVu+TboACph0pR5wSuBRshJuPhH9SPSETb/DxwsBgwJdR2cLRGtaGyc
	4JMNq+14Bd6Ch3F54ZFeP7RFZpLK4EVbLW45lqVf3pDEkDVYlQBosG63fRorKjeH71Q5VXbBFLu5D
	KxJLX7P1V8zc8fJdnBb7R1sRczO3ae3ye85NqEsMurQ8gfRHGAVvJDvYLF9EssYKCt4YMsOh7GtOC
	BG3N7ucMym/SjAjXhr5B2gbt+Fg+T2ttuKxidnvJ3GDXKQqZkVFpfW7/FURSuuU+hxAVC29dptCfe
	2aHVeOmQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tBXOM-00Btoi-ER;
	Thu, 14 Nov 2024 11:48:02 +0100
Date: Thu, 14 Nov 2024 11:47:59 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Morten Linderud <morten@linderud.pw>,
	Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
	Kees Cook <kees@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 08/11] kbuild: make link-vmlinux.sh respect $dry_run
Message-ID: <20241112-private-adventurous-gaur-7271ca@lindesnes>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-9-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-9-vegard.nossum@oracle.com>

On Mon, Aug 19, 2024 at 06:03:05PM +0200, Vegard Nossum wrote:
> Make link-vmlinux.sh print the commands it wants to run instead of
> actually running them when $dry_run is defined.

Do we need link-vmlinux.sh to show it's commands?  Couldn't we just show
the call of link-vmlinux.sh instead (and replace/hide the '+' prefix if
'dry_run' is set)?  Why not?  (I guess, you found good reasons.  Can you
please add them to the commit message?)

> 
> This is needed in order for make -n/--dry-run to output a complete
> build script.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  scripts/Makefile.vmlinux | 15 ++++++++++++--
>  scripts/link-vmlinux.sh  | 44 ++++++++++++++++++++++++++--------------
>  2 files changed, 42 insertions(+), 17 deletions(-)
> 
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 10d80e07f945c..1fe0faab52889 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -1,5 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +# there doesn't seem to be a straightforward way for 'make -n' to output
> +# one command while actually executing another, so we resort to this hack
> +# where we set an environment variable differently depending on whether
> +# we are executing from 'make' or executing from the 'make -n' log.
> +LINK_VMLINUX=scripts/link-vmlinux.sh
> +export LINK_VMLINUX
> +
>  PHONY := __default
>  __default: vmlinux
>  
> @@ -29,7 +36,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>  
>  # Final link of vmlinux with optional arch pass after final link
>  cmd_link_vmlinux =							\
> -	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";		\
> +	"$${LINK_VMLINUX}"						\
> +	"$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";		\
>  	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>  
>  # We don't know how to build these
> @@ -37,7 +45,10 @@ PHONY += vmlinux.o
>  PHONY += $(KBUILD_LDS)
>  
>  targets += vmlinux
> -vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
> +vmlinux: $(LINK_VMLINUX) vmlinux.o $(KBUILD_LDS) FORCE
> +ifdef dry_run
> +	@LINK_VMLINUX=/bin/true
> +endif
>  	+$(call if_changed_dep,link_vmlinux)
>  
>  # Add FORCE to the prequisites of a target to force it to be always rebuilt.
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index f7b2503cdba95..fd32e48a8a455 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -32,6 +32,17 @@ LD="$1"
>  KBUILD_LDFLAGS="$2"
>  LDFLAGS_vmlinux="$3"
>  
> +# If $dry_run is set, just echo the command instead of executing it.
> +run()
> +{
> +	if [ ! -v dry_run ]
> +	then
> +		eval "$1"
> +	else
> +		echo "$1"
> +	fi
> +}
> +
>  is_enabled() {
>  	grep -q "^$1=y" include/config/auto.conf
>  }
> @@ -40,7 +51,10 @@ is_enabled() {
>  # Will be supressed by "make -s"
>  info()
>  {
> -	printf "  %-7s %s\n" "${1}" "${2}"
> +	if [ ! -v dry_run ]
> +	then
> +		printf "  %-7s %s\n" "${1}" "${2}"
> +	fi
>  }
>  
>  # Link of vmlinux

Do you have some thoughts about the

     if is_enabled ...

lines?  Do we need to defer the evaluation of include/config/auto.conf,
too?


> @@ -97,10 +111,10 @@ vmlinux_link()
>  		ldflags="${ldflags} ${wl}-Map=${output}.map"
>  	fi
>  
> -	${ld} ${ldflags} -o ${output}					\
> +	run "${ld} ${ldflags} -o ${output}				\
>  		${wl}--whole-archive ${objs} ${wl}--no-whole-archive	\
>  		${wl}--start-group ${libs} ${wl}--end-group		\
> -		${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}
> +		${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}"
>  }
>  
>  # generate .BTF typeinfo from DWARF debuginfo
> @@ -129,8 +143,8 @@ gen_btf()
>  	# deletes all symbols including __start_BTF and __stop_BTF, which will
>  	# be redefined in the linker script. Add 2>/dev/null to suppress GNU
>  	# objcopy warnings: "empty loadable segment detected at ..."
> -	${OBJCOPY} --only-section=.BTF --set-section-flags .BTF=alloc,readonly \
> -		--strip-all ${1} "${btf_data}" 2>/dev/null
> +	run "${OBJCOPY} --only-section=.BTF --set-section-flags .BTF=alloc,readonly \
> +		--strip-all ${1} "${btf_data}" 2>/dev/null"

                                 ^^^^^^^^^^^^^
Backslashes to keep ${btf_data} quoted are missing.

>  	# Change e_type to ET_REL so that it can be used to link final vmlinux.
>  	# GNU ld 2.35+ and lld do not allow an ET_EXEC input.
>  	if is_enabled CONFIG_CPU_BIG_ENDIAN; then

printf "${et_rel}" | dd of="${btf_data}" conv=notrunc bs=1 seek=16 status=none

'dd' should probably be called via 'run'.


> @@ -161,11 +175,11 @@ kallsyms()
>  	fi
>  
>  	info KSYMS "${2}.S"
> -	scripts/kallsyms ${kallsymopt} "${1}" > "${2}.S"
> +	run "scripts/kallsyms ${kallsymopt} \"${1}\" > \"${2}.S\""
>  
>  	info AS "${2}.o"
> -	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
> -	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o "${2}.o" "${2}.S"
> +	run "${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
> +	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o \"${2}.o\" \"${2}.S\""
>  
>  	kallsymso=${2}.o
>  }
> @@ -184,12 +198,12 @@ sysmap_and_kallsyms()
>  mksysmap()
>  {
>  	info NM ${2}
> -	${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
> +	run "${NM} -n \"${1}\" | sed -f \"${srctree}/scripts/mksysmap\" > \"${2}\""
>  }
>  
>  sorttable()
>  {
> -	${objtree}/scripts/sorttable ${1}
> +	run "${objtree}/scripts/sorttable ${1}"
>  }
>  
>  cleanup()

I know, 'link-vmlinux.sh clean' will not by called by 'make --dry-run
clean' (as there is no '+' prefix in the call in Makefile), but for
consistency, I'd like to see also cleanup() be prepared for handling
dry_run correctly.


Can you please move patch 11 (resetting of KBUILD_VERBOSE if '--dry-run'
or '--silent' is given) before this one?


Does '${MAKE} ...' also need to be called via 'run'?

> @@ -270,13 +284,13 @@ if is_enabled CONFIG_KALLSYMS; then
>  	strip_debug=1
>  
>  	sysmap_and_kallsyms .tmp_vmlinux1
> -	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
> +	[ -v dry_run ] || size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
>  
>  	vmlinux_link .tmp_vmlinux2
>  	sysmap_and_kallsyms .tmp_vmlinux2
> -	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
> +	[ -v dry_run ] || size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
>  
> -	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
> +	if [ ! -v dry_run ] || [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
>  		vmlinux_link .tmp_vmlinux3
>  		sysmap_and_kallsyms .tmp_vmlinux3
>  	fi
> @@ -289,7 +303,7 @@ vmlinux_link vmlinux
>  # fill in BTF IDs
>  if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then
>  	info BTFIDS vmlinux
> -	${RESOLVE_BTFIDS} vmlinux
> +	run ${RESOLVE_BTFIDS} vmlinux

Quotes are missing, as run only evaluated its first argument.

>  fi
>  
>  mksysmap vmlinux System.map
> @@ -303,7 +317,7 @@ if is_enabled CONFIG_BUILDTIME_TABLE_SORT; then

I am sceptical about

	if ! sorttable vmlinux

and similar.  With dry_run being set, sorttable shows the call of
'sorttable' and always returns success.  In effect, the resulting output
shell build script will miss such error detection.

I think it would be really good, if we could skip patching
link-vmlinux.sh but show its call instead.

Kind regards,
Nicolas

>  fi
>  
>  # step a (see comment above)
> -if is_enabled CONFIG_KALLSYMS; then
> +if [ ! -v dry_run ] && is_enabled CONFIG_KALLSYMS; then
>  	if ! cmp -s System.map "${kallsyms_sysmap}"; then
>  		echo >&2 Inconsistent kallsyms data
>  		echo >&2 'Try "make KALLSYMS_EXTRA_PASS=1" as a workaround'
> -- 
> 2.34.1
> 

-- 
Nicolas

