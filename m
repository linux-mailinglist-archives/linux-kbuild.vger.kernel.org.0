Return-Path: <linux-kbuild+bounces-2010-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 663C18FD59A
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 20:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1767B28465
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 18:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B16FC02;
	Wed,  5 Jun 2024 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWVcaZYP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A2DF44
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 18:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717611337; cv=none; b=RY6c7j6w1ONOaexu5fSqrIjmEMYJgEguyx3LdwiQoPV42GjYEpmbyPGoBLpxB16E2sfUdaiYoCR/zdSUP3rLh+jzJlgTAlqnjipbRMEI31nruZa6J46TQNIUOJZ6bbWwqCIPhhUE20QUZ4XJcwHISIdjzh5a8iJe5CBu2ir+Mxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717611337; c=relaxed/simple;
	bh=MVvO8oYxT+sh5n08pNZTxvsM3Jw6iSORR6Kyr3FzWqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh3SQIZzzJ6WFqSRAQXwD++W55WN2R+W+iWDKb0/rUnvSTS5iclE28E1VBSjY+/HEZ84VhqdS0/8IiOmnRxSFrZ4VM/5stNXjKAhIXuq1ksH471R38VJNiT0R4xJ4dj4fQyx0HzsoMm36ycvqfmYae0o0SMnZ+n+9bYtCH1YWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWVcaZYP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AF3C2BD11;
	Wed,  5 Jun 2024 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717611336;
	bh=MVvO8oYxT+sh5n08pNZTxvsM3Jw6iSORR6Kyr3FzWqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWVcaZYPl2Q+BXK48q/+0DpDS4OvmvFho9tl7UyybGPn8OU9fKmoWnO34uAwEnpGM
	 BCEVnsAUgY1rrHWuqq9XOD0AFrEEKKQV1NmlXqgoStvhdrhfM74Zxpnw1ve4OiXL45
	 1jbxZNgXW1gqc5RzeuCFDeqezQOdsUoNNmAGREKi6StHhWCO0noXtCYoBMjJWVQloc
	 4/Bs+j6cfLmijYS9HdkIheVlXfe+CP+GSs6LyVigHOBQTN0d/Dd6CsS5XfoRm5vPoJ
	 vucxRgI7FnsvUHHifoeQovjDFVOjrC8j+z/Bsk0zufLUre04IKH8m1vpSdDdbSdXTB
	 XDK0pMuPlmp0A==
Date: Wed, 5 Jun 2024 11:15:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	linux-kbuild@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH -next v2] kbuild: explicitly run mksysmap as sed script
 from link-vmlinux.sh
Message-ID: <20240605181534.GA3973798@thelio-3990X>
References: <20240605175807.106447-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605175807.106447-3-mailingradian@gmail.com>

On Wed, Jun 05, 2024 at 01:58:09PM -0400, Richard Acayan wrote:
> In commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed
> script"), the mksysmap script was transformed into a sed script,
> made directly executable with "#!/bin/sed -f". Apparently, the path to
> sed is different on NixOS.
> 
> The shebang can't use the env command, otherwise the "sed -f" command
> would be treated as a single argument. This can be solved with the -S
> flag, but that is a GNU extension. Explicitly use sed instead of relying
> on the executable shebang to fix NixOS builds without breaking build
> environments using Busybox.
> 
> Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 46ce5d04dbeb..518c70b8db50 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -193,7 +193,7 @@ kallsyms_step()
>  mksysmap()
>  {
>  	info NM ${2}
> -	${NM} -n "${1}" | "${srctree}/scripts/mksysmap" > "${2}"
> +	${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
>  }
>  
>  sorttable()
> -- 
> 2.45.2
> 

