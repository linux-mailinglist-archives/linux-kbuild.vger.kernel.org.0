Return-Path: <linux-kbuild+bounces-2958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA894F723
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 21:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7369B1C222BC
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 19:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656BB18EFC5;
	Mon, 12 Aug 2024 19:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIsTUHTG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EAD18E743;
	Mon, 12 Aug 2024 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723489494; cv=none; b=lFWU0ods8auDg73LJTRJRz19N7PNlOEzxO7SWu2kZ4ORsfuBd4amsrNAawdZ7KEZUlIkL3fe7LgF83Pzem4fYh5k0elWO7Eos0a6JmJBBHARmDn0hAwAFG3INmHoLnDT00rW6ywKIJ0GE8IIC3GRlcmGuW93ySwv1XsnQ3sUHm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723489494; c=relaxed/simple;
	bh=efZIQ1EDIoxszoGngUAVRA22x1seM7DAohtphRMl6gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixbkc++V3jxXhmh8dtdQy3/lOQqe5bjTATGDmjkEnj8SyX+OAD1fjHkQaOt1ZOLQSgxGD3X/Qy8ukAG3FBKU780uW4NPGY067FtmZn/TkLx5Ot7xaFbaNvJ6LcxpXoJ5AYtBHh7kUSMVOUDoAEK83JJs/LYsIBTIgSkw3ziEAik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIsTUHTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F87C4AF09;
	Mon, 12 Aug 2024 19:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723489493;
	bh=efZIQ1EDIoxszoGngUAVRA22x1seM7DAohtphRMl6gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIsTUHTGEEbf34h9liSvRMv+fibIe1kdVFpky0iPHqTEJagBKUsvTDUTRS1uoSGVd
	 l/mMVQHLTQhCNrCJ5KDW0ps22FZgRU/D4twMlTh/pQf+tzSe9JHZ5NsnCtRQ92uvKY
	 HEfgm4L/aptIuRpAixUuAnPDV/dGq/qs2ELs6IaLZqdqYij/gfDfAh9ThknBH48Zy8
	 MaCPU50Yx5i71JtBH2EQ1T1f2cx/+h5g+qxBfKt1ZgDYTTLf16APecO7QoDOCEUkGI
	 mxaCteMA3RMuBE8Bgqx5XTUKORJdv8zRRq/+AWv6aVpGS4LwYCrgH4llKsdyUd55F7
	 oxo89+TL50hUw==
Date: Mon, 12 Aug 2024 12:04:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/llvm: turn make command for ccache into
 code block
Message-ID: <20240812190451.GA631776@thelio-3990X>
References: <20240812-ccache-literal-code-block-v1-1-4f09de978667@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812-ccache-literal-code-block-v1-1-4f09de978667@gmail.com>

On Mon, Aug 12, 2024 at 02:17:21PM +0200, Javier Carrasco wrote:
> The command provided to use ccache with clang is not a literal code
> block. Once built, the documentation displays the '' symbols as a "
> character, which is wrong, and the command can not be applied as
> provided.
> 
> Turn the command into a literal code block.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Looks good to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Documentation/kbuild/llvm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index bb5c44f8bd1c..6dc66b4f31a7 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -126,7 +126,7 @@ Ccache
>  
>  ``ccache`` can be used with ``clang`` to improve subsequent builds, (though
>  KBUILD_BUILD_TIMESTAMP_ should be set to a deterministic value between builds
> -in order to avoid 100% cache misses, see Reproducible_builds_ for more info):
> +in order to avoid 100% cache misses, see Reproducible_builds_ for more info)::
>  
>  	KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
>  
> 
> ---
> base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
> change-id: 20240812-ccache-literal-code-block-8462614e91e9
> 
> Best regards,
> -- 
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 

