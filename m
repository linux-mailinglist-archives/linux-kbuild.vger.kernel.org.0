Return-Path: <linux-kbuild+bounces-3145-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484F95AC49
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 05:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A3CFB210A7
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 03:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B0C249ED;
	Thu, 22 Aug 2024 03:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dJRx3i9I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABDE2AF0D
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Aug 2024 03:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724298918; cv=none; b=i95vUzJgDn93IZWILzFUQLDLc+4crOzRZHze7D/mii7WOBFISOSxUPcKhT40XpM+o/Bkpn892c9FRIpmbg6tpLvdinyIbcQsfBao01c/yZukC5WFakT4QvutlK92E9nYEYDtXJiEqjExCbI5BGx2GAZX9tTNPbY+9MsmARNenvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724298918; c=relaxed/simple;
	bh=7dmwSdMRLm8qv0V1Uxb8MdeHJQDP8JaPwVdiHbK6+dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvW8UNZCN+J8ctJzbeHmbWMTGoOm9OY9CFQMo01/aZNX6fImXL3zOPZzLj9fmJyOVxbhYMb7AoYH98aXlKSRFmuEEwHoXSD8t5QTB26L9U+lmJAui8Cm/tr07RSCVeRq2xB4CrMZdOKlqWkydx07RtAtpnBFIfCpshp04+u578s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dJRx3i9I; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-42816ca797fso2035875e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Aug 2024 20:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724298915; x=1724903715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EiYt7wweiAWkF/UO6SLMM3+WC81D3aj+Mv9pKTlcxGI=;
        b=dJRx3i9Ig3Z5yMpJmwrkQAkZg1jjSLRn7sEpDfuCh3UXqoFrtFDbg4FIUBABGsmT5y
         wDu78y/J4KTxCgIJVfpRO8aFSks9/FeIkDNTcrpfagloqFdu7hTR6cMwLu6TTTE2R4tl
         ZdR+1WXp+7q9/gktGvQWV00EwFffj1EOK36xtaUVrHIlEfygB3/P+pgAnWiSJaSCImwh
         8bROEuNORSSfd49azTiKotUHcCz94HxOkHEYTEhWF1ReBkJ/1c2ZoE0bJgPFJ8lNjWi8
         AGl2pL4G54UPSTOHdhSvMt6c1N9poXnUtIq54COuMLS6Jy4eorAbKAtXswJrRiaYhsqb
         N54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724298915; x=1724903715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiYt7wweiAWkF/UO6SLMM3+WC81D3aj+Mv9pKTlcxGI=;
        b=UumHHU6wNFCHVH3WjwpHNHOLZ5YRKDeIlUEDEGmOAu8BwxK9utQ2dg3IdQkAgef69p
         zt0kasm4Mcl2ZEyVMvF4NW8TfxRdq18DllnVpEy1PT6Abhx4wAG66PQxbCUmOxs1hhX5
         bt2suv2lwKuwUPCubZcFc/RVlyPtiUQC14X+D/BJeOqMusqxVzo0dWm7tY0bSkymczzH
         Skt1xmix7hHLg9/c7AhxM3savarTg3Jh7w5ZaK59lnVTJ7gD4iT6KcXv1xfuK3Lv1WUe
         64o2Qr68WCmlBQW/OeJOUpByjeem5SMwqDBRf/bfYDx29T7N43cyiIf/iQqNzunLUCRx
         6Pzg==
X-Forwarded-Encrypted: i=1; AJvYcCVNi/8DtdfNOaB3oihojvvKo+++/usEo+e1kKx5KHh4sI5j7fmHqzy8iFLRP8FLPkkSTqxTOsD+1PDq/UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSw2w7wM5f90yKc73juK9hPG5Evx/VU+DSLPmWwmEP+vzmprqQ
	sYaNww8kWypW8zuDBfUH/a6+56cDPu/c85mqyDdaDI09g3zDKBz8lru/5TY0iZ8=
X-Google-Smtp-Source: AGHT+IH3il0dzh0Karjn7wXKw0/nFh5eMsCfDQk4ZeVPQydzWvcffelDn5Ofi4i92lXwme4MGZxdmQ==
X-Received: by 2002:adf:e44c:0:b0:367:bb20:b3e1 with SMTP id ffacd0b85a97d-372fd7316a3mr2514470f8f.51.1724298914516;
        Wed, 21 Aug 2024 20:55:14 -0700 (PDT)
Received: from u94a ([2401:e180:8831:ab89:50b7:7c42:dbeb:f22f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dded9sm3371905ad.161.2024.08.21.20.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 20:55:14 -0700 (PDT)
Date: Thu, 22 Aug 2024 11:55:05 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, dwarves@vger.kernel.org
Cc: Jiri Slaby <jirislaby@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, 
	masahiroy@kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Hao Luo <haoluo@google.com>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
	msuchanek@suse.com
Subject: Re: [RFC] kbuild: bpf: Do not run pahole with -j on 32bit userspace
Message-ID: <a45nq7wustxrztjxmkqzevv3mkki5oizfik7b24gqiyldhlkhv@4rpy4tzwi52l>
References: <20240820085950.200358-1-jirislaby@kernel.org>
 <ZsSpU5DqT3sRDzZy@krava>
 <523c1afa-ed9d-4c76-baea-1c43b1b0c682@kernel.org>
 <c2086083-4378-4503-b3e2-08fb14f8ff37@kernel.org>
 <7ebee21d-058f-4f83-8959-bd7aaa4e7719@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ebee21d-058f-4f83-8959-bd7aaa4e7719@kernel.org>

(Add pahole maintainer and mailing list)

Hi Arnaldo,

We're running into kernel build failure on 32-bit (both full 32-bit and
32-bit userspace on 64-bit kernel) because pahole crashed due to virtual
memory exhaustion[1]. As a workaround we currently limit pahole's
parallel job count to 1 on such system[2]:

On Tue, 20 Aug 2024 10:59:50AM +0200, Jiri Slaby wrote:
[...]
> diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
> index b75f09f3f424..f7de8e922bce 100644
> --- a/scripts/Makefile.btf
> +++ b/scripts/Makefile.btf
> @@ -12,7 +12,9 @@ endif
>  
>  pahole-flags-$(call test-ge, $(pahole-ver), 121)	+= --btf_gen_floats
>  
> +ifeq ($(CONFIG_PAHOLE_CLASS),ELF64)
>  pahole-flags-$(call test-ge, $(pahole-ver), 122)	+= -j
> +endif
>  
>  pahole-flags-$(call test-ge, $(pahole-ver), 125)	+= --skip_encoding_btf_inconsistent_proto --btf_gen_optimized
>  
> diff --git a/scripts/pahole-class.sh b/scripts/pahole-class.sh
> new file mode 100644
> index 000000000000..d15a92077f76
> --- /dev/null
> +++ b/scripts/pahole-class.sh
> @@ -0,0 +1,21 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Usage: $ ./pahole-class.sh pahole
> +#
> +# Prints pahole's ELF class, such as ELF64
> +
> +if [ ! -x "$(command -v "$@")" ]; then
> +	echo 0
> +	exit 1
> +fi
> +
> +PAHOLE="$(which "$@")"
> +CLASS="$(readelf -h "$PAHOLE" 2>/dev/null | sed -n 's/.*Class: *// p')"
> +
> +# Scripts like scripts/dummy-tools/pahole
> +if [ -n "$CLASS" ]; then
> +	echo "$CLASS"
> +else
> +	echo ELF64
> +fi
> -- 

This helped lowered the memory usage enough so pahole no longer crash:

On Wed, Aug 21, 2024 at 09:29:57AM GMT, Jiri Slaby wrote:
> On 21. 08. 24, 8:40, Jiri Slaby wrote:
> >  From https://bugzilla.suse.com/show_bug.cgi?id=1229450#c20:
> > Run on 64bit:
> > pahole -j32 -> 4.102 GB
> > pahole -j16 -> 3.895 GB
> > pahole -j1 -> 3.706 GB
> > 
> > On 32bit (the same vmlinux):
> > pahole -j32 -> 2.870 GB (crash)
> > pahole -j16 -> 2.810 GB
> > pahole -j1 -> 2.444 GB

Jiri (Slaby) in the meanwhile has also proposed structure packing to
further reduce memory usage. (Note: I think the numbers below are from a
64-bit machine)

> From https://bugzilla.suse.com/show_bug.cgi?id=1229450#c21:
> (In reply to Jiri Slaby from comment #20)
> > | |   |   ->24.01% (954,816,480B) 0x489B4AB: UnknownInlinedFun
> (dwarf_loader.c:959)
> 
> So given this struct class_member is the largest consumer, running pahole on
> pahole. The below results in 4.102 GB -> 3.585 GB savings.
> 
> --- a/dwarves.h
> +++ b/dwarves.h
> @@ -487,14 +487,14 @@ int cu__for_all_tags(struct cu *cu,
>   */
>  struct tag {
>         struct list_head node;
> +       const char       *attribute;
> +       void             *priv;
>         type_id_t        type;
>         uint16_t         tag;
> +       uint16_t         recursivity_level;
>         bool             visited;
>         bool             top_level;
>         bool             has_btf_type_tag;
> -       uint16_t         recursivity_level;
> -       const char       *attribute;
> -       void             *priv;
>  };
> 
>  // To use with things like type->type_enum ==
> perf_event_type+perf_user_event_type
> @@ -1086,17 +1086,17 @@ static inline int function__inlined(const struct
> function *func)
>  struct class_member {
>         struct tag       tag;
>         const char       *name;
> +       uint64_t         const_value;
>         uint32_t         bit_offset;
>         uint32_t         bit_size;
>         uint32_t         byte_offset;
>         int              hole;
>         size_t           byte_size;
> +       uint32_t         alignment;
>         int8_t           bitfield_offset;
>         uint8_t          bitfield_size;
>         uint8_t          bit_hole;
>         uint8_t          bitfield_end:1;
> -       uint64_t         const_value;
> -       uint32_t         alignment;
>         uint8_t          visited:1;
>         uint8_t          is_static:1;
>         uint8_t          has_bit_offset:1;
>--

What do you think?

IIUC pahole's memory usage is largely tied to the number of entries in
vmlinux/kmodule DWARF, and there probably isn't much we could do about
that.

Shung-Hsi

1: https://bugzilla.suse.com/show_bug.cgi?id=1229450
2: https://lore.kernel.org/all/20240820085950.200358-1-jirislaby@kernel.org/

