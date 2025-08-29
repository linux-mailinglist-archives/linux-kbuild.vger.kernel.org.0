Return-Path: <linux-kbuild+bounces-8668-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A680B3C5A3
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Aug 2025 01:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D6521C80FEC
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 23:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A9A2609D9;
	Fri, 29 Aug 2025 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYj29Dlr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC79273F9;
	Fri, 29 Aug 2025 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756510709; cv=none; b=qYn2JIbi8u9Pe6VWTiZkimdbtIOiQvEuk0ItCQJzFDW91acsT5/rAaNVIXBpjPxrgmZZRP1k/CLENgehH6Z24ULWJTJ0TlrLg88xBZrxQ47r0Iwd1pJs3ozniulfFZZLebKuQ9UZ+l9Usk+sKh50ZNwELkPXcEgQOm84OOc/Hzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756510709; c=relaxed/simple;
	bh=WkvTp6f06aBzz6mMxgJlv68d8gusZL5MpxOSsdmeb2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6Z+fQu7avLjOhXB2hrevxc6cl11ZhjfiFmHGTIqqt3XCnRZfhtc/wVHLH1rcX7nQe+He00onDXzG/6JIeoOn9QGhcbJJ0dqdLcGrozQPITreoPdsOcy3aACrjFTWvZtinZAvt7HRKSJccQs2NhXaACSJqmifBd1y3x5pjHrl2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYj29Dlr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D40C4CEF0;
	Fri, 29 Aug 2025 23:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756510709;
	bh=WkvTp6f06aBzz6mMxgJlv68d8gusZL5MpxOSsdmeb2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYj29DlrQwydXqOF86OiP1MmfJvNkS7E672zE1FZ9NugTUm51xr/S/EkmnxMI+iVC
	 gD5iPIyL/+kdJXinqVci+0QOI4vJdt2UsTnzQjCSdVxSLoaizmQh3U3wqTs+sIQxdZ
	 yYXv02A3fWGJht2eWGvNTkH4JifGAlEJWm9KcxXHgB+9Oq2KSMhfDAGDvvL7T92MNW
	 v+ZD6PW4H3T4blxL+Z9cWQgjq7qO+KmO8x78DZOcQoHyn/EUzkrg3Llhw7mLP0W3gq
	 Np4++1FWEbAnrdsLuIDxaBP82sKwHqlVUC+JR1k1Cy1+7uMqhnPXcBq+3QT/Dmj+CD
	 ILwjLMuxTH0Zw==
Date: Fri, 29 Aug 2025 16:38:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH] .gitignore: ignore temporary files from 'bear'
Message-ID: <20250829233824.GB1983886@ax162>
References: <20250827-master-v1-1-19f9f367219c@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-master-v1-1-19f9f367219c@google.com>

Hi Brendan,

On Wed, Aug 27, 2025 at 08:59:43AM +0000, Brendan Jackman wrote:
> Bear [0] is a tool for generating compile_commands.json. For Kbuild,
> Bear is not useful, since Kbuild already generates the necessary info
> and that can be converted to compile_commands.json by
> gen_compile_commads.py.
> 
> However, for code in tools/, it's handy. For example, this command
> updates compile_commands.json so that clangd code navigation will also
> work for the VMA unit tests:
> 
> 	bear --append -- make -C tools/testing/vma -j
> 
> Bear generates some temporary files. These are usually deleted again
> but having them show up ephemerally confuses tools that trigger
> recompilation on source code changes. Ignore them in Git so that these
> tools can tell they aren't source code.
> 
> [0]: https://github.com/rizsotto/Bear
> 
> Signed-off-by: Brendan Jackman <jackmanb@google.com>

We can likely take this via the Kbuild tree. I do wonder if this would
be better in a tools/.gitignore file since bear is really only of use
there but I am not sure it matters much.

> ---
>  .gitignore | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 929054df5212d68a32a1f5ee2b267389fcd1c8db..b07c8c8383bd791e903ce985c14c231cb6928411 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -53,6 +53,7 @@
>  *.tar
>  *.xz
>  *.zst
> +*.tmp

Please keep the globs alphabetized.

>  Module.symvers
>  dtbs-list
>  modules.order
> @@ -177,6 +178,9 @@ x509.genkey
>  
>  # Clang's compilation database file
>  /compile_commands.json
> +# Temporary files created by 'bear', a tool used for generating
> +# compile_commands.json for non-Kbuild code.
> +*.events.json

Please rebase this on kbuild-next, as '/' is no longer present in the
compile_commands.json line:

https://git.kernel.org/kbuild/l/kbuild-next

The comment feels a little lengthy compared to the rest of the file but
I am not sure it can really be slimmed down...

I am guessing the pattern cannot be made more specific, as I do wonder
if anyone would introduce files with this pattern but that is why we
have the check in scripts/misc-check, so it is probably not that big of
a deal.

>  
>  # Documentation toolchain
>  sphinx_*/
> 
> ---
> base-commit: fab1beda7597fac1cecc01707d55eadb6bbe773c
> change-id: 20250827-master-23458abb102d
> 
> Best regards,
> -- 
> Brendan Jackman <jackmanb@google.com>
> 
> 

