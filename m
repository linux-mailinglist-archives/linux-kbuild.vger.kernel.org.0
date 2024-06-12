Return-Path: <linux-kbuild+bounces-2103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 072C7905C78
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 22:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9202F283B10
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 20:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB6F83CD3;
	Wed, 12 Jun 2024 20:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="Td09LbAf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F4D52F62;
	Wed, 12 Jun 2024 20:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718222520; cv=none; b=f4j5JE63NxGLfstusIB4n2tlV9ry+lejCk/AngItcjuLkou/hnwa4IHZ1X4u5TDiCWmTNSe5PaVVUgGkPUDZZm+ErA2ePuecm0TxEwFBvlRi406MDK1mUaYzvXg/AIZevuKk0UE0cpitWfp3TmUjUO9T0Mv3DMqrujzKlzMYjLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718222520; c=relaxed/simple;
	bh=4ghEk0+2e/ftxVktHOlwltaLErHhykij3a04hyxXYNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srIbeFESUErwGoSwIExaWU4chW7WB7Hnwy6e5gobxmJUsbnWY1ClKPXlaNZLk8mNcK5xIRhiMGDIJPLnWbl11nL7Iy2rmj2YkNgah6b9tGgbWovMSfPsIQOAsOcFZrnQLZlM3SCtx7Yl35LGJJk09S2lNsEe2nUCd/4pETckkC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=Td09LbAf; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VyUpBsSbK1lxgTqUPJT39Mr0V3D+t4hYJO+q7FwK8rE=; b=Td09LbAfl+NTA/wvy7s17165kA
	awlr0ZgdH6nadnAElokT34NY/FDPNG2A38fzFwWlcEWeypZP//LCYLA2FkvIbKJjC95vWlS5H0CB5
	zp+kJsrzQSuuDDG2O+GP0i84RaUS8iMUfMt3No/LZjx+zqJkIlfoYCpiBqCCv3TDa+jZUyxftBF+S
	+STCO2gndi3Vz2cgVZ3xgZMm9I6ACIhYqFztvMkeyWgANe08KDGiMGQF2DEHuRuzsArMAivFhtc4c
	PRU2Yq2JFh1s1ADmG2fsomtcs7CaG2ARZbOwm5FwJ4yLcfdk/YcjCh7s4svZalia0cdY8dJiJuwM6
	vI4PUWHw==;
Received: from [2001:9e8:9cb:9501:3235:adff:fed0:37e6] (port=37038 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sHUAB-005XhW-81;
	Wed, 12 Jun 2024 22:01:43 +0200
Date: Wed, 12 Jun 2024 22:01:35 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3 1/3] kbuild: refactor variables in
 scripts/link-vmlinux.sh
Message-ID: <20240612-olive-swine-of-tact-4acb2b@lindesnes>
References: <20240610112657.602958-1-masahiroy@kernel.org>
 <20240610112657.602958-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610112657.602958-2-masahiroy@kernel.org>

On Mon, Jun 10, 2024 at 08:25:16PM +0900, Masahiro Yamada wrote:
> Clean up the variables in scripts/link-vmlinux.sh
> 
>  - Specify the extra objects directly in vmlinux_link()
>  - Move the AS rule to kallsyms()
>  - Set kallsymso and btf_vmlinux_bin_o where they are generated
>  - Remove unneeded variable, kallsymso_prev
>  - Introduce the btf_data variable
>  - Introduce the strip_debug flag instead of checking the output name
> 
> No functional change intended.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v3:
>  - Use ${strip_debug} for cleanup
> 
>  scripts/link-vmlinux.sh | 67 +++++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 32 deletions(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 518c70b8db50..3d9d7257143a 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -45,7 +45,6 @@ info()
>  
>  # Link of vmlinux
>  # ${1} - output file
> -# ${2}, ${3}, ... - optional extra .o files
>  vmlinux_link()
>  {
>  	local output=${1}
> @@ -90,7 +89,7 @@ vmlinux_link()
>  	ldflags="${ldflags} ${wl}--script=${objtree}/${KBUILD_LDS}"
>  
>  	# The kallsyms linking does not need debug symbols included.
> -	if [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
> +	if [ -n "${strip_debug}" ] ; then
>  		ldflags="${ldflags} ${wl}--strip-debug"
>  	fi
>  
> @@ -101,7 +100,7 @@ vmlinux_link()
>  	${ld} ${ldflags} -o ${output}					\
>  		${wl}--whole-archive ${objs} ${wl}--no-whole-archive	\
>  		${wl}--start-group ${libs} ${wl}--end-group		\
> -		$@ ${ldlibs}
> +		${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}
>  }
>  
>  # generate .BTF typeinfo from DWARF debuginfo
> @@ -110,6 +109,7 @@ vmlinux_link()
>  gen_btf()
>  {
>  	local pahole_ver
> +	local btf_data=${2}
>  
>  	if ! [ -x "$(command -v ${PAHOLE})" ]; then
>  		echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
> @@ -124,16 +124,16 @@ gen_btf()
>  
>  	vmlinux_link ${1}
>  
> -	info "BTF" ${2}
> +	info BTF "${btf_data}"
>  	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}
>  
> -	# Create ${2} which contains just .BTF section but no symbols. Add
> +	# Create ${btf_data} which contains just .BTF section but no symbols. Add
>  	# SHF_ALLOC because .BTF will be part of the vmlinux image. --strip-all
>  	# deletes all symbols including __start_BTF and __stop_BTF, which will
>  	# be redefined in the linker script. Add 2>/dev/null to suppress GNU
>  	# objcopy warnings: "empty loadable segment detected at ..."
>  	${OBJCOPY} --only-section=.BTF --set-section-flags .BTF=alloc,readonly \
> -		--strip-all ${1} ${2} 2>/dev/null
> +		--strip-all ${1} "${btf_data}" 2>/dev/null
>  	# Change e_type to ET_REL so that it can be used to link final vmlinux.
>  	# GNU ld 2.35+ and lld do not allow an ET_EXEC input.
>  	if is_enabled CONFIG_CPU_BIG_ENDIAN; then
> @@ -141,10 +141,12 @@ gen_btf()
>  	else
>  		et_rel='\1\0'
>  	fi
> -	printf "${et_rel}" | dd of=${2} conv=notrunc bs=1 seek=16 status=none
> +	printf "${et_rel}" | dd of="${btf_data}" conv=notrunc bs=1 seek=16 status=none
> +
> +	btf_vmlinux_bin_o=${btf_data}
>  }
>  
> -# Create ${2} .S file with all symbols from the ${1} object file
> +# Create ${2}.o file with all symbols from the ${1} object file
>  kallsyms()
>  {
>  	local kallsymopt;
> @@ -165,27 +167,25 @@ kallsyms()
>  		kallsymopt="${kallsymopt} --lto-clang"
>  	fi
>  
> -	info KSYMS ${2}
> -	scripts/kallsyms ${kallsymopt} ${1} > ${2}
> +	info KSYMS "${2}.S"
> +	scripts/kallsyms ${kallsymopt} "${1}" > "${2}.S"
> +
> +	info AS "${2}.o"
> +	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
> +	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o "${2}.o" "${2}.S"
> +
> +	kallsymso=${2}.o
>  }
>  
>  # Perform one step in kallsyms generation, including temporary linking of
>  # vmlinux.
>  kallsyms_step()
>  {
> -	kallsymso_prev=${kallsymso}
>  	kallsyms_vmlinux=.tmp_vmlinux.kallsyms${1}
> -	kallsymso=${kallsyms_vmlinux}.o
> -	kallsyms_S=${kallsyms_vmlinux}.S
>  
> -	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
> -	mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
> -	kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
> -
> -	info AS ${kallsymso}
> -	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
> -	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
> -	      -c -o ${kallsymso} ${kallsyms_S}
> +	vmlinux_link "${kallsyms_vmlinux}"
> +	mksysmap "${kallsyms_vmlinux}" "${kallsyms_vmlinux}.syms"
> +	kallsyms "${kallsyms_vmlinux}.syms" "${kallsyms_vmlinux}"
>  }
>  
>  # Create map file with all symbols from ${1}
> @@ -223,19 +223,18 @@ fi
>  
>  ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init init/version-timestamp.o
>  
> -btf_vmlinux_bin_o=""
> +btf_vmlinux_bin_o=
> +kallsymso=
> +strip_debug=
> +
>  if is_enabled CONFIG_DEBUG_INFO_BTF; then
> -	btf_vmlinux_bin_o=.btf.vmlinux.bin.o
> -	if ! gen_btf .tmp_vmlinux.btf $btf_vmlinux_bin_o ; then
> +	if ! gen_btf .tmp_vmlinux.btf .btf.vmlinux.bin.o ; then
>  		echo >&2 "Failed to generate BTF for vmlinux"
>  		echo >&2 "Try to disable CONFIG_DEBUG_INFO_BTF"
>  		exit 1
>  	fi
>  fi
>  
> -kallsymso=""
> -kallsymso_prev=""
> -kallsyms_vmlinux=""
>  if is_enabled CONFIG_KALLSYMS; then
>  
>  	# kallsyms support
> @@ -261,11 +260,13 @@ if is_enabled CONFIG_KALLSYMS; then
>  	# a)  Verify that the System.map from vmlinux matches the map from
>  	#     ${kallsymso}.
>  
> -	kallsyms_step 1
> -	kallsyms_step 2
> +	# The kallsyms linking does not need debug symbols included.
> +	strip_debug=1
>  
> -	# step 3
> -	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
> +	kallsyms_step 1
> +	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
> +
> +	kallsyms_step 2
>  	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
>  
>  	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
> @@ -273,7 +274,9 @@ if is_enabled CONFIG_KALLSYMS; then
>  	fi
>  fi
>  
> -vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
> +strip_debug=
> +
> +vmlinux_link vmlinux
>  
>  # fill in BTF IDs
>  if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then
> -- 
> 2.43.0
> 
> 

Looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

