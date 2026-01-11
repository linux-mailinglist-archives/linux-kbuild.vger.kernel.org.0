Return-Path: <linux-kbuild+bounces-10481-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A51D0E050
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jan 2026 02:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7ACA30239EA
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jan 2026 01:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CE1156C6A;
	Sun, 11 Jan 2026 01:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M94Ziawc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1C820B22;
	Sun, 11 Jan 2026 01:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768094634; cv=none; b=NK9PDl24uLgTBSz0PQPca+xv65QHddkT2sl5iyjL9d5fCblWKy4OXLS9eaW7VM4LDUrjRlPiB9eGdYyF07FtQBJCmQ8sGyyKQP4WO+968Oq8j1WNr758Srq5dn6Sr+w+VxIEW4o4TGWEZjAo9lmJVtLDzL/2b/S6mfHXyGqWp/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768094634; c=relaxed/simple;
	bh=TYl0pk//iO7Wcgb+0xi9pDhnOfpYuYkb9X+NAKXwl5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMm0bZS373WK1IsZ/Q0/cOhFuKfBa1G+CEQjeiu4t7bf1lsoOTx0b+P/8/D5cTD3B0SwkJxizMHby7igT7nVJMDGqGBSn8J7Cg7ET6bgDI9op0dkegszyYwheWDFfEc/0NLh0eRAoqEGSwT6GO2XuGgOlk4lGLA8snOjitSTbAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M94Ziawc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404ADC4CEF1;
	Sun, 11 Jan 2026 01:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768094634;
	bh=TYl0pk//iO7Wcgb+0xi9pDhnOfpYuYkb9X+NAKXwl5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M94ZiawcYumMBKZL6xiHtaZQ7irKspbrUUKOGnmXlQOAK/LwRTQ6eNQHm7k3wgBzh
	 7j1kHc9OLllTKK6iFq9oNH2Tbl8eYQFrtDaIHM4oPsS1o+IXO9fwAu/2ne9OYvkj5L
	 NVS8r+ru75gkyVMooMRRbDgNEa4HWEmva9lbJTcuznRLnjq2QD868dSCH4zbnmPYJo
	 khAjSZYhgSdbcSxFhtas4mmWoY4KoXNcmQuNoDuA9fTVWyAcE0OT6G+nefq59mXvOb
	 CYaFMn69iR4jqrD44S3t3rOt68Xz5MjgaA6t+vS1xbteS06Fugl3gDCz0K0grsJ5Oy
	 Ygg5SbZ1+psvA==
Date: Sat, 10 Jan 2026 18:23:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] scripts: kconfig: merge_config.sh: refactor from
 shell/sed/grep to awk
Message-ID: <20260111012350.GA1267883@ax162>
References: <20251230205549.GE4062669@ax162>
 <20251231084050.186874-1-mikko.rapeli@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231084050.186874-1-mikko.rapeli@linaro.org>

Hi Mikko,

Thanks for the update! Just a heads up, please start a new thread for
newer patch revisions, preferring a link back to the earlier revisions
like b4 does. Sending it as a reply to the previous revision makes it
hard to follow in an mbox, as you might be able to see at the bottom of
the lore thread:

https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/

On Wed, Dec 31, 2025 at 10:40:48AM +0200, Mikko Rapeli wrote:
> From: Anders Roxell <anders.roxell@linaro.org>
> 
> merge_config.sh shell/sed/grep loop scales poorly and is slow.
> With Yocto genericarm64 kernel and around 190 config fragments
> the script takes more than 20 minutes to run on a fast build machine.
> Re-implementation with awk does the same job in 10 seconds.
> Using awk since it is likely available in the build environments
> and using perl, python etc would introduce more complex runtime
> dependencies. awk is good enough and lot better than shell/sed/grep.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  scripts/kconfig/merge_config.sh | 168 ++++++++++++++++++++++++--------
>  1 file changed, 128 insertions(+), 40 deletions(-)
> 
> v2: remove unused sed variables, awk from ${AWK} variable,
>     curly brace syntax fix after rebase, triple check that
>     correct revision of patches are used in testing with
>     yocto/bitbake
> 
> v1: https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#t
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 79c09b378be8..4cefe3cdfc2f 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -16,8 +16,8 @@
>  set -e
>  
>  clean_up() {
> -	rm -f $TMP_FILE
> -	rm -f $MERGE_FILE
> +	rm -f "${TMP_FILE}"
> +	rm -f "${TMP_FILE}.new"
...
> +if [ -z "${AWK}" ]; then

Small nit: This file seems to prefer $VAR over ${VAR} when not using
bash parameter expansion (and that is a little easier for me as a fish
user to read longterm).

> +	# Normalize: strip trailing comments, convert "is not set" to "=n"
> +	function normalize(line) {
> +		if (line == "") return ""
> +		sub(/[[:space:]]+#.*/, "", line)
> +		if (line ~ / is not set$/) {
> +			sub(/^# /, "", line)
> +			sub(/ is not set$/, "=n", line)
> +		}
> +		return line
> +	}

I think this normalization makes it a little harder to read when the
value is changed from "n" to "y".

Prior to this change:

  $ make -j"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- clean defconfig hardening.config
  ...
  Value of CONFIG_SLAB_FREELIST_HARDENED is redefined by fragment kernel/configs/hardening.config:
  Previous value: # CONFIG_SLAB_FREELIST_HARDENED is not set
  New value: CONFIG_SLAB_FREELIST_HARDENED=y
  ...

After this change:

  $ make -j"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- clean defconfig hardening.config
  ...
  Value of CONFIG_SLAB_FREELIST_HARDENED is redefined by fragment kernel/configs/hardening.config:
    Previous value: CONFIG_SLAB_FREELIST_HARDENED=n
    New value:     CONFIG_SLAB_FREELIST_HARDENED=y
  ...

Linus has complained about moving from "is not set" to "n" in the past:

https://lore.kernel.org/CAHk-=wgxcu9DFkXAOAFdDtLWwuv6qb5iV1E69yWE-JEVsd-NFg@mail.gmail.com/

I do like the alignment change for the "new value" line but I think
keeping "is not set" would be a little easier to quickly parse than
"=n".

  Value of CONFIG_SLAB_FREELIST_HARDENED is redefined by fragment kernel/configs/hardening.config:
    Previous value: # CONFIG_SLAB_FREELIST_HARDENED is not set
    New value:     CONFIG_SLAB_FREELIST_HARDENED=y

Might just be a personal preference though.

> +	function warn_builtin(cfg, prev, new) {
> +		if (warnoverride == "true") return
> +		print cfg ": -y passed, will not demote y to m" > "/dev/stderr"
> +		print "  Previous value: " prev > "/dev/stderr"
> +		print "  New value:	 " new > "/dev/stderr"
> +		print "" > "/dev/stderr"
> +	}
> +
> +	function warn_redefined(cfg, prev, new) {
> +		if (warnoverride == "true") return
> +		print "Value of " cfg " is redefined by fragment " mergefile ":" > "/dev/stderr"
> +		print "  Previous value: " prev > "/dev/stderr"
> +		print "  New value:	 " new > "/dev/stderr"
> +		print "" > "/dev/stderr"
> +	}
> +
> +	function warn_redundant(cfg) {
> +		if (warnredun != "true" || warnoverride == "true") return
> +		print "Value of " cfg " is redundant by fragment " mergefile ":" > "/dev/stderr"
> +	}

The use of /dev/stderr seems to introduce a change in behavior when
using 'make -s'.

Prior to this change:

  $ make -sj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- clean defconfig hardening.config

After this change:

  $ make -sj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- clean defconfig hardening.config
  Value of CONFIG_COMPAT_VDSO is redefined by fragment kernel/configs/hardening.config:
    Previous value: CONFIG_COMPAT_VDSO=y
    New value:     CONFIG_COMPAT_VDSO=n

  Value of CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is redefined by fragment kernel/configs/hardening.config:
    Previous value: CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=n
    New value:     CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
  ...

These should probably just be /dev/stdout?

Cheers,
Nathan

