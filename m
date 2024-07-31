Return-Path: <linux-kbuild+bounces-2765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7E94378D
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 23:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C0581F22F64
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 21:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6F0168C26;
	Wed, 31 Jul 2024 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="FRqyRQOE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE491BC40;
	Wed, 31 Jul 2024 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722460233; cv=none; b=oPSezPVqA0q2AkKYg41yCojI5RpNRLw/uuJpE5EfFwGEftTuODV47fzur3VFbM1TPs9B7wfMH5BPqR1cEAVFCHU6rYvSKkLgp+bhrPboOKZxnP2eZR2uU3WmerXoA8M2QT16KRlmDtsJVbyi4jEKKSR+GTfFbSiy7BmNg0/XrCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722460233; c=relaxed/simple;
	bh=l0cnReIbW91JANPq/FU696lsBdvC9aXhKFy4s81Ocsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l78KsIS6vRnGl7kDgYYpCiPbKktz0cYgzey+SXnSMAACQhSU9YGIHN7P7FK3LtKTt8tZvMilA0uOiaMdSdJx0nM7HIfd8ps0qRXWtFSYtY4/nePtQqw4n7m324pEaP+pyGWDMTJIT/tarGhTEUrnczfUhlWUFGsMhWcmk7Sfobo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=FRqyRQOE; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nKIoEHTNwvUUskzHoklE3sFvXwC+lVNK3oAzavKOoGc=; b=FRqyRQOE5YhKdKWEkzUHtywwe8
	TdHzhVp76XhwmcpFTZZJRdo6u0LT4o+w6aBqnQZMtb1z9YCPQuntPi0cYy2lj5BWx4BZPup1Shh52
	7qd/BR/mj/1/gw+xo1T1yszTHbgrLCtVsVyefVAT984a/iB7v1VWL5+IMQMSm+nPgVr5YHAkSEiGX
	KHYM5F7e/4m9sirGvTUlAmeXsoCowltzkt1vNaJ+NS1Y+OaM4sDq5LJkYFUom34up84+C1PKFeTtV
	DfHin4CeLa5Ohgoth1FlbZbm6rUO6DGTSYnLqkgKaxhXoVFYD1qTEZY2bbpuGzdw5K4yDYbw0Ni9l
	KEhNsAug==;
Received: from [2001:9e8:9fa:4501:3235:adff:fed0:37e6] (port=51198 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sZGaR-009JCd-EM;
	Wed, 31 Jul 2024 23:10:19 +0200
Date: Wed, 31 Jul 2024 23:10:14 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when
 possible
Message-ID: <20240731-soft-kittiwake-of-election-a1dfa0@lindesnes>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727074526.1771247-5-masahiroy@kernel.org>

On Sat, Jul 27, 2024 at 04:42:04PM +0900, Masahiro Yamada wrote:
> A long standing issue in the upstream kernel packaging is that the
> linux-headers package is not cross-compiled.
> 
> For example, you can cross-build Debian packages for arm64 by running
> the following command:
> 
>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
> 
> However, the generated linux-headers-*_arm64.deb is useless because the
> host programs in it were built for your build machine architecture
> (likely x86), not arm64.
> 
> The Debian kernel maintains its own Makefiles to cross-compile host
> tools without relying on Kbuild. [1]
> 
> Instead of adding such full custom Makefiles, this commit adds a small
> piece of code to cross-compile host programs located under the scripts/
> directory.
> 
> A straightforward solution is to pass HOSTCC=${CROSS_COMPILE}gcc, but it
> would also cross-compile scripts/basic/fixdep, which needs to be native
> to process the if_changed_dep macro. (This approach may work under some
> circumstances; you can execute foreign architecture programs with the
> help of binfmt_misc because Debian systems enable CONFIG_BINFMT_MISC,
> but it would require installing QEMU and libc for that architecture.)
> 
> A trick is to use the external module build (KBUILD_EXTMOD=), which
> does not rebuild scripts/basic/fixdep. ${CC} needs to be able to link
> userspace programs (CONFIG_CC_CAN_LINK=y).
> 
> There are known limitations:
> 
>  - GCC plugins
> 
>    It would possible to rebuild GCC plugins for the target architecture
>    by passing HOSTCXX=${CROSS_COMPILE}g++ with necessary packages
>    installed, but gcc on the installed system emits
>    "cc1: error: incompatible gcc/plugin versions". I did not find a
>    solution for this because 'gcc' on a foreign architecture is a
>    different compiler after all.
> 
>  - objtool and resolve_btfids
> 
>    These are built by the tools build system. They are not covered by
>    the current solution.
> 
> I only tested this with Debian, but it should work for other package
> systems as well.
> 
> [1]: https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/debian/rules.real#L586
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/package/install-extmod-build | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> index cc335945dfbc..0b56d3d7b48f 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -43,4 +43,38 @@ mkdir -p "${destdir}"
>  	fi
>  } | tar -c -f - -T - | tar -xf - -C "${destdir}"
>  
> +# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebuild host
> +# programs using ${CC}. This assumes CC=${CROSS_COMPILE}gcc, which is usually
> +# the case for package building. It does not cross-compile when CC=clang.
> +#
> +# This caters to host programs that participate in Kbuild. objtool and
> +# resolve_btfids are out of scope.

Just for clarification: Why do you call both "out of scope" here?
Because they're not being built by kbuild, or because they will never be
needed for building oot kmods?

> +if [ "${CC}" != "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
> +	echo "Rebuilding host programs with ${CC}..."
> +
> +	cat <<-'EOF' >  "${destdir}/Kbuild"
> +	subdir-y := scripts
> +	EOF
> +
> +	# HOSTCXX is not overridden. The C++ compiler is used to build:
> +	# - scripts/kconfig/qconf, which is unneeded for external module builds
> +	# - GCC plugins, which will not work on the installed system even with
> +	#   being rebuilt.
> +	#
> +	# Use the single-target build to avoid the modpost invocation, which
> +	# would overwrite Module.symvers.
> +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> +
> +	cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
> +	subdir-y := basic
> +	hostprogs-always-y := mod/modpost
> +	mod/modpost-objs := $(addprefix mod/, modpost.o file2alias.o sumversion.o symsearch.o)
> +	EOF
> +
> +	# Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
> +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> +
> +	rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
> +fi
> +
>  find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
> -- 
> 2.43.0
> 
> 

Thanks for fixing this; looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


