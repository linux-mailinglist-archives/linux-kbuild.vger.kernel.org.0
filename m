Return-Path: <linux-kbuild+bounces-10283-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2028CCD207B
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 22:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEC68301E6F3
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 21:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5E7262808;
	Fri, 19 Dec 2025 21:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJCIDaiq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C75922173A;
	Fri, 19 Dec 2025 21:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180577; cv=none; b=V1HMkzAnMOEIOqlM7bNlETOJQ8xW93Z1rPOoQI5aneLo18iaOTQN9noszMuaqz25vxTTuKXQkobdbXVWC0uoSgOUGXVsoi05ygsk+DaiCaRZDO9LIt8lxtK0SX21c4w/884S/2Bqcy6mf93+/82Vk7xteKAXf1GroP7jS1/UrOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180577; c=relaxed/simple;
	bh=zM5khfpTqfgCD0EcR/GaqChm4KtHdyC12vjKCxAg5r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoevRhQyGN7kNax/vC9ybqa5YpMwxowk908TE/tKpnRm73ZpwOp/w+awhOp2TSAJWMHKoZBU2BOlnQWEhLZh/2tZtLpTeqx88lMPrsf39Sn6ZxuzeCPTF64tXF17XXl+N42yxMdxt1TfPuwcco99tdRVRCP0+3Hb/Lj4DSYpzcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJCIDaiq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D257FC4CEF1;
	Fri, 19 Dec 2025 21:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766180577;
	bh=zM5khfpTqfgCD0EcR/GaqChm4KtHdyC12vjKCxAg5r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJCIDaiqUF3dbi8Zerljtj/fu8otm5ziKjGuBoJUHN7nbvBKjko1FvkAVj7vio0DI
	 ne4BnviDc0feigWWgHyshjWYOKG7jKVbmSshUZdYXRjliucHjMxy1b5iIrc68BAvsg
	 dSrfJhkv3sZdGPsJ+8t3osW630LNjiidzPlJMHrYVBiHRNFd5os0zWAzxRJMRniuAt
	 7zqkyiJCP3fxaf7ZLzuqhmmV8E3u7is/ffyp9MTMVUaDH7/RXHDEI+3mHgrmc8EiH7
	 X1xUMB28dU8OI/GDIFl5Lodq6LVDP9ZI9NCXzHNz01vMB32NrUAMlOerSF0f/sToSH
	 glAGXRTmHH8dQ==
Date: Fri, 19 Dec 2025 14:42:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Carlos Llamas <cmllamas@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: prefer ${NM} in check-function-names.sh
Message-ID: <20251219214252.GD1407372@ax162>
References: <20251218175824.3122690-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218175824.3122690-1-cmllamas@google.com>

On Thu, Dec 18, 2025 at 05:58:06PM +0000, Carlos Llamas wrote:
> The check-function-names.sh scripts invokes 'nm' directly and this can
> be problematic during cross-compilation when the toolchain is different
> from the system's default (e.g. LLVM=1).
> 
>   scripts/check-function-names.sh: nm: not found
> 
> Let's prefer the ${NM} variable which is already set by kbuild. However,
> still fallback to plain 'nm' to ensure the script is still usable when
> called directly.
> 
> Fixes: 93863f3f859a ("kbuild: Check for functions with ambiguous -ffunction-sections section names")

I may have caught this during review if linux-kbuild or its maintainers
were CC'd on that change.

> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

If Josh or Peter want to take this through a fixes branch in -tip, that
is fine with me. Otherwise, Nicolas can apply this to kbuild-fixes since
this change was merged in 6.19-rc1.

> ---
>  scripts/check-function-names.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/check-function-names.sh b/scripts/check-function-names.sh
> index 410042591cfc..08071133e5a5 100755
> --- a/scripts/check-function-names.sh
> +++ b/scripts/check-function-names.sh
> @@ -13,7 +13,7 @@ if [ ! -f "$objfile" ]; then
>  	exit 1
>  fi
>  
> -bad_symbols=$(nm "$objfile" | awk '$2 ~ /^[TtWw]$/ {print $3}' | grep -E '^(startup|exit|split|unlikely|hot|unknown)(\.|$)')
> +bad_symbols=$(${NM:-nm} "$objfile" | awk '$2 ~ /^[TtWw]$/ {print $3}' | grep -E '^(startup|exit|split|unlikely|hot|unknown)(\.|$)')
>  
>  if [ -n "$bad_symbols" ]; then
>  	echo "$bad_symbols" | while read -r sym; do
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

