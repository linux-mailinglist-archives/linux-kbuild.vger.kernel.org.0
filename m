Return-Path: <linux-kbuild+bounces-5180-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D87E9F6FBF
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 22:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2829169002
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 21:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4DB1FCF66;
	Wed, 18 Dec 2024 21:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dBlHxNhg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541661FCD00
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2024 21:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734558911; cv=none; b=Cj3nWFVArtak6fiYCd2Ftut58G1z5tKfzrxBnqmD/HEnoM7vS3SNItnjiA79WLUQQon9mwS7BQ9UlXVdY4cSWtdOw9/KTF4gmNhHykBfndP0Kt9YjGpQpz+TZDni4T7febgeJfA1PxFpN8vAGdtiSRCwZaTOZLC7WnA+QgUCk6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734558911; c=relaxed/simple;
	bh=mHREIE73ZX2NkJWLFVbnaeOle9nuQBT1vzekshsUriI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o53E6UgwOS3GG9xkY3wnj3ulsOHRZ8N1deiaNMVhe00tOPUunKYVbV6oFVcEmn8/HlN8SG6aLqNWsaVYcuHlBCGOvmvLXXlbQ1NUMUNIyoqq08okeTxGjQUOit0gXVXAZLHF6NTkDNxEjkAsjzCZ+zyRuxSNfhE2wGfTV7/UQDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dBlHxNhg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166360285dso1522695ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2024 13:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734558908; x=1735163708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQSiK4s4Uqm4QJokNKH0Tf7jwBuMNzU4RqKyMwdUVzU=;
        b=dBlHxNhgV1X1ck6ngRPuygtxvgAqzkHSiR9TPO4TgKirtVxHyHVrHGrqv2s5CekbRl
         Mwfo9sQPZK/W5b6E3XZ3czu0bfcnF6ki/aeZGCTd1lZ0iSy7D+O+zvuE48Mg4dETJUA6
         bhyvQtZ8WsSvUJo07090v2gypaIlqqPNlgSk14yc38h+u0bnP5Mm4b1ittlmlSsny6ZK
         n4mBE7nj/o0yJM7ipYc+QSrlIM/8HQEqSgrhvom6OATA08a81c5V9t5/2uBPgT5NOfkI
         OcCy9vhvVldncUVVUfzkbQPqVnylbWHrr7PjdeeTclGATz7ysWUjyfMKwybcC0KOo5eL
         s0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734558908; x=1735163708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQSiK4s4Uqm4QJokNKH0Tf7jwBuMNzU4RqKyMwdUVzU=;
        b=jzT59D8vKUA1rrWHd/ZloHGBOF4Qp6K+4sPckDopi3clzSlsr4t8GRZZRxjrS157NL
         4ZaypCln8QHX/sfbcGFWHdsuIeDQ5Eqdy58ci7xsGXABCFDYTgzIMnyfW5w6uJLrIbS4
         UpwUnMRUAH0l98zbGN0GGryeEye013a3GyS7K+ebIQIHbKo96vLAfAZvPn2qTX4Hlc/g
         LEsjU2p8liXvvzmPI8o+wAkPfwtUUQpulQj4/F2qQzZWUzxmHC0FTevJOdaAWib7cSAE
         L7GGsVFOZqSWUr9ilRofk4muZRSXaPy/ygcEpNrCv2Z4YkoTbv+Rhr7sTCsuovdUu1gT
         d1zA==
X-Forwarded-Encrypted: i=1; AJvYcCXAFj4zaCSejo6rOQqqR06u2xn/hO0FZgbENgARsexI1vYBAq/lGmqi35OgXp1Y12NEftZeNbBOcCZpnRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRxtS57EqweRJYUKwtuVKfY5I5qocaeDMBxouKqIW9+sMTQp5P
	1J8orJw9eECWuVE17Jhg5AUj2RyubfLcOwtJqcNV85Tv1WkSEfhFtFQaLRWwsxw=
X-Gm-Gg: ASbGncseGPKxXhkD0kZfJdWzKkiRuWCTXajxp53GGJa7NJTC+P/ytfZCmlOJ73l7td7
	Un28by4HeDQmRdKTNtldfSMcBEXzEmq+KLcBgsmV0cE2hkNj79pod5uLzNsqSXrSRMPOQjX6wTn
	juMWyGz0jLxK6za/dayBr7/wSfyd/Uiys7T44i8Kq1V3r8V0ws7P9AUX5aluioc9T3cfAJ5RgzN
	ymPuGWZIEm267O2A+Td7iwLHmunpheJ3LZZvdosVoFQ/54=
X-Google-Smtp-Source: AGHT+IED7YCeQuGuUtpDThJELTrJknNCN7ilLzn7fIFW/Z/Wgd/+nA9XgNr9h0l1o/RBE85pV6GJMQ==
X-Received: by 2002:a17:90b:2d0e:b0:2ee:dcf6:1c77 with SMTP id 98e67ed59e1d1-2f2e91f0dbemr7484871a91.16.1734558908287;
        Wed, 18 Dec 2024 13:55:08 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2d9dc7342sm1451271a91.0.2024.12.18.13.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:55:07 -0800 (PST)
Date: Wed, 18 Dec 2024 13:55:05 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Nelson Chu <nelson@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: Check version of objdump
Message-ID: <Z2NEuXMiP7QKhQnW@ghost>
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
 <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
 <20241218-sandfish-hence-5fa18539f7ca@spud>
 <20241218-hypnotic-acid-630e8a8d35da@spud>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218-hypnotic-acid-630e8a8d35da@spud>

On Wed, Dec 18, 2024 at 03:40:25PM +0000, Conor Dooley wrote:
> On Wed, Dec 18, 2024 at 03:14:46PM +0000, Conor Dooley wrote:
> > On Mon, Dec 16, 2024 at 03:12:51PM -0800, Charlie Jenkins wrote:
> > > Similar to ld-version, add a way to check the version of objdump. This
> > > should most of the time end up being the binutils version or the llvm
> > > version.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > 
> > This fails for allmodconfig and rv32_defconfig with clang. 19.1.1
> > according to Bjorn :)
> 
> Some additional info from Bjorn:
> https://paste.debian.net/1340410
> and the steps to reproduce:
> https://paste.debian.net/1340408
> 
> That should not be reporting 13.0.1, it should be 19.1.x, there's one
> included in the toolchains we use from https://mirrors.edge.kernel.org/pub/tools/llvm/
> 
> 13.0.1 looks like a host toolchain?

I ended up sending a v2 that dropped this in favor of detecting this at
runtime [1] so this is no longer needed.

- Charlie

Link:
https://lore.kernel.org/lkml/20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com/
[1]

> 
> > 
> > Cheers,
> > Conor.
> > 
> > > ---
> > >  init/Kconfig               | 10 +++++++
> > >  scripts/Kconfig.include    |  6 ++++
> > >  scripts/objdump-version.sh | 69 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 85 insertions(+)
> > > 
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index a20e6efd3f0fbdd7f0df2448854cc30734a0ee4f..0b5d36f939e1de89c12ebdd61e4815015314d4f1 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -60,6 +60,16 @@ config LLD_VERSION
> > >  	default $(ld-version) if LD_IS_LLD
> > >  	default 0
> > >  
> > > +config OBJDUMP_IS_GNU
> > > +	def_bool $(success,test "$(objdump-name)" = objdump)
> > > +
> > > +config OBJDUMP_IS_LLVM
> > > +	def_bool $(success,test "$(objdump-name)" = llvm-objdump)
> > > +
> > > +config OBJDUMP_VERSION
> > > +	int
> > > +	default $(objdump-version)
> > > +
> > >  config RUSTC_VERSION
> > >  	int
> > >  	default $(rustc-version)
> > > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > > index 33193ca6e8030e659d6b321acaea1acd42c387a4..cb3e2d2564fea8cce780adb3be672c9596b7ccf2 100644
> > > --- a/scripts/Kconfig.include
> > > +++ b/scripts/Kconfig.include
> > > @@ -58,6 +58,12 @@ $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supp
> > >  ld-name := $(shell,set -- $(ld-info) && echo $1)
> > >  ld-version := $(shell,set -- $(ld-info) && echo $2)
> > >  
> > > +# Get the objdump name, version, and error out if it is not supported.
> > > +objdump-info := $(shell,$(srctree)/scripts/objdump-version.sh $(OBJDUMP))
> > > +$(error-if,$(success,test -z "$(objdump-info)"),Sorry$(comma) this objdump is not supported.)
> > > +objdump-name := $(shell,set -- $(objdump-info) && echo $1)
> > > +objdump-version := $(shell,set -- $(objdump-info) && echo $2)
> > > +
> > >  # machine bit flags
> > >  #  $(m32-flag): -m32 if the compiler supports it, or an empty string otherwise.
> > >  #  $(m64-flag): -m64 if the compiler supports it, or an empty string otherwise.
> > > diff --git a/scripts/objdump-version.sh b/scripts/objdump-version.sh
> > > new file mode 100755
> > > index 0000000000000000000000000000000000000000..fa24f8dc2d3c42fd1195fceb3c96b27f7127db25
> > > --- /dev/null
> > > +++ b/scripts/objdump-version.sh
> > > @@ -0,0 +1,69 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +#
> > > +# Print the objdump name and its version in a 5 or 6-digit form.
> > > +# Also, perform the minimum version check.
> > > +
> > > +set -e
> > > +
> > > +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> > > +get_canonical_version()
> > > +{
> > > +	IFS=.
> > > +	set -- $1
> > > +
> > > +	# If the 2nd or 3rd field is missing, fill it with a zero.
> > > +	#
> > > +	# The 4th field, if present, is ignored.
> > > +	# This occurs in development snapshots as in 2.35.1.20201116
> > > +	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> > > +}
> > > +
> > > +orig_args="$@"
> > > +
> > > +# Get the first line of the --version output.
> > > +IFS='
> > > +'
> > > +set -- $(LC_ALL=C "$@" --version)
> > > +
> > > +# Split the line on spaces.
> > > +IFS=' '
> > > +set -- $1
> > > +
> > > +min_tool_version=$(dirname $0)/min-tool-version.sh
> > > +
> > > +if [ "$1" = GNU -a "$2" = objdump ]; then
> > > +	shift $(($# - 1))
> > > +	version=$1
> > > +	min_version=$($min_tool_version binutils)
> > > +	disp_name="GNU objdump"
> > > +else
> > > +	while [ $# -gt 1 -a "$1" != "LLVM" ]; do
> > > +		shift
> > > +	done
> > > +
> > > +	if [ "$1" = LLVM ]; then
> > > +		version=$3
> > > +		min_version=$($min_tool_version llvm)
> > > +		disp_name="llvm-objdump"
> > > +	else
> > > +		echo "$orig_args: unknown objdump" >&2
> > > +		exit 1
> > > +	fi
> > > +fi
> > > +
> > > +version=${version%%[!0-9.]*}
> > > +
> > > +cversion=$(get_canonical_version $version)
> > > +min_cversion=$(get_canonical_version $min_version)
> > > +
> > > +if [ "$cversion" -lt "$min_cversion" ]; then
> > > +	echo >&2 "***"
> > > +	echo >&2 "*** objdump is too old."
> > > +	echo >&2 "***   Your $disp_name version:    $version"
> > > +	echo >&2 "***   Minimum $disp_name version: $min_version"
> > > +	echo >&2 "***"
> > > +	exit 1
> > > +fi
> > > +
> > > +echo objdump $cversion
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 



