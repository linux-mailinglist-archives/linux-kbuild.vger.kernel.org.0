Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF86943E6F4
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 19:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhJ1RRP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 13:17:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43890 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230174AbhJ1RRP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 13:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635441287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CKzHPmwBuuVZ+sZfNezc+/bbA27vHU7b9f4gWlByyIQ=;
        b=IxkGjMLMiNn8ARMW53Z4KknYeeB9aOlQGagwrkKPuD9NVzWuKu32y4CVEjupCIIClqP8u+
        6rxbM9XkUsofTKNbJ72r6gSBbiTFwRZ03MC1B03wxDGaSqinDn8D4gERDwONyV22Gl7j8w
        o1jDSwudDjWxanYpUCSjqWzM6mgmDxY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-gSpzzVjBPX-FW9nZp5O7-Q-1; Thu, 28 Oct 2021 13:14:46 -0400
X-MC-Unique: gSpzzVjBPX-FW9nZp5O7-Q-1
Received: by mail-wr1-f72.google.com with SMTP id y16-20020a5d4710000000b0017440201e67so1901568wrq.1
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Oct 2021 10:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CKzHPmwBuuVZ+sZfNezc+/bbA27vHU7b9f4gWlByyIQ=;
        b=GlHfwPfpx4GVMXRq3cm8E8NJqDUKNy8VJvSO2Yy/KJ+MVv83cQSzhBPt97bfNDj1rJ
         703bvaIXVnaVAPtxYEoC8rIcNpH9NfttJK3lWF4nmL82SptJU5Uf3hHfEa8sJvjWC8Oe
         2zVJYiay+/Y3UuiPbKl5IS/2R6h7qt19gvgILM2nlmsk35iL2CLKtHEx/Mk2EwwekiH3
         XQqe62w2KV4ji5zB6QVZseFUjcmG3GZ1AC7uTrMiMXh10HuT76oood2PGTfoXoeM8J5z
         pnksPjLlaOBCPRxgcqCfxs0DowEjp1D5TlfJ1/msEbi0FQoPPQpozv/iSFM0eIq6o2cv
         2wEg==
X-Gm-Message-State: AOAM533RX+XBkDxc5zhImuNxBZBk1FXIe86+HQcExNw6YJwAYaVfWORw
        UQlIp05RvZbK6RAILoYBrbXs4u/u89PsiaOVzqO1i4rKlxREpXZe48561b/lqU0ikNgejbp0ohn
        dOX2q8iGbW+BrgsWkESG/ZCNy
X-Received: by 2002:adf:ed0b:: with SMTP id a11mr7293700wro.272.1635441285336;
        Thu, 28 Oct 2021 10:14:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw35HfQ+pQU0AFKLh9Ihxe6USnrLC12wWLMPS8do1Rh2m1MMZwSyYrnpEMNB35BsmYAUvAm4g==
X-Received: by 2002:adf:ed0b:: with SMTP id a11mr7293680wro.272.1635441285173;
        Thu, 28 Oct 2021 10:14:45 -0700 (PDT)
Received: from krava (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id q14sm6541592wmq.4.2021.10.28.10.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 10:14:44 -0700 (PDT)
Date:   Thu, 28 Oct 2021 19:14:37 +0200
From:   Jiri Olsa <jolsa@redhat.com>
To:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@chromium.org>
Subject: Re: [PATCHv2 bpf-next] kbuild: Unify options for BTF generation for
 vmlinux and modules
Message-ID: <YXrafRBGp9E4+EEm@krava>
References: <20211026212419.144077-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026212419.144077-1-jolsa@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 26, 2021 at 11:24:19PM +0200, Jiri Olsa wrote:
> Using new PAHOLE_FLAGS variable to pass extra arguments to
> pahole for both vmlinux and modules BTF data generation.
> 
> Adding new scripts/pahole-flags.sh script that detect and
> prints pahole options.
> 
> Acked-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>

I'm checking on reported build failures and will send v3

jirka

> ---
> v2 changes:
>   - posting separately from original patchset
>   - added Andrii's ack
> 
>  Makefile                  |  3 +++
>  scripts/Makefile.modfinal |  2 +-
>  scripts/link-vmlinux.sh   | 11 +----------
>  scripts/pahole-flags.sh   | 20 ++++++++++++++++++++
>  4 files changed, 25 insertions(+), 11 deletions(-)
>  create mode 100755 scripts/pahole-flags.sh
> 
> diff --git a/Makefile b/Makefile
> index 437ccc66a1c2..ee514b80c62e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -480,6 +480,8 @@ LZ4		= lz4c
>  XZ		= xz
>  ZSTD		= zstd
>  
> +PAHOLE_FLAGS	= $(shell PAHOLE=$(PAHOLE) scripts/pahole-flags.sh)
> +
>  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>  		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
>  NOSTDINC_FLAGS :=
> @@ -534,6 +536,7 @@ export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
>  export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
>  export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
>  export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
> +export PAHOLE_FLAGS
>  
>  # Files to ignore in find ... statements
>  
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 1fb45b011e4b..7f39599e9fae 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -40,7 +40,7 @@ quiet_cmd_ld_ko_o = LD [M]  $@
>  quiet_cmd_btf_ko = BTF [M] $@
>        cmd_btf_ko = 							\
>  	if [ -f vmlinux ]; then						\
> -		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J --btf_base vmlinux $@; \
> +		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
>  		$(RESOLVE_BTFIDS) -b vmlinux $@; 			\
>  	else								\
>  		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index d74cee5c4326..3ea7cece7c97 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -205,7 +205,6 @@ vmlinux_link()
>  gen_btf()
>  {
>  	local pahole_ver
> -	local extra_paholeopt=
>  
>  	if ! [ -x "$(command -v ${PAHOLE})" ]; then
>  		echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
> @@ -220,16 +219,8 @@ gen_btf()
>  
>  	vmlinux_link ${1}
>  
> -	if [ "${pahole_ver}" -ge "118" ] && [ "${pahole_ver}" -le "121" ]; then
> -		# pahole 1.18 through 1.21 can't handle zero-sized per-CPU vars
> -		extra_paholeopt="${extra_paholeopt} --skip_encoding_btf_vars"
> -	fi
> -	if [ "${pahole_ver}" -ge "121" ]; then
> -		extra_paholeopt="${extra_paholeopt} --btf_gen_floats"
> -	fi
> -
>  	info "BTF" ${2}
> -	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${extra_paholeopt} ${1}
> +	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}
>  
>  	# Create ${2} which contains just .BTF section but no symbols. Add
>  	# SHF_ALLOC because .BTF will be part of the vmlinux image. --strip-all
> diff --git a/scripts/pahole-flags.sh b/scripts/pahole-flags.sh
> new file mode 100755
> index 000000000000..2b99fc77019c
> --- /dev/null
> +++ b/scripts/pahole-flags.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +extra_paholeopt=
> +
> +if ! [ -x "$(command -v ${PAHOLE})" ]; then
> +	return
> +fi
> +
> +pahole_ver=$(${PAHOLE} --version | sed -E 's/v([0-9]+)\.([0-9]+)/\1\2/')
> +
> +if [ "${pahole_ver}" -ge "118" ] && [ "${pahole_ver}" -le "121" ]; then
> +	# pahole 1.18 through 1.21 can't handle zero-sized per-CPU vars
> +	extra_paholeopt="${extra_paholeopt} --skip_encoding_btf_vars"
> +fi
> +if [ "${pahole_ver}" -ge "121" ]; then
> +	extra_paholeopt="${extra_paholeopt} --btf_gen_floats"
> +fi
> +
> +echo ${extra_paholeopt}
> -- 
> 2.31.1
> 

