Return-Path: <linux-kbuild+bounces-5050-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEFF9E9DF2
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 19:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D63DB166C26
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 18:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CCF155325;
	Mon,  9 Dec 2024 18:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hd17BUb3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7B14D283;
	Mon,  9 Dec 2024 18:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733768388; cv=none; b=nsGmLOm1NbnxsWZIgzgvQe2BAAK/k8agO7hkv2O1nrF7J//ndo4JjrAaSVq/Nur+rxuMKd7cZMOwBT8VggSC4W4Qxo1hvkLdWzaK+h4pKgilpcY+DFzoD7XM3ExeRvxLDjMrlo1mlZyQyeo8coTqKrhEidpEbumX6nAjPf189aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733768388; c=relaxed/simple;
	bh=Hd1rQymEODPjoNCaX7qvSHK/dSAqSz+Wx1sGbb+/QXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3kxmDawT8s6ORNtA+bdxXJ/aT8WXCSSU2uLn79PIvXOtw9dWsATrjGiiC23MRejuTNDIhDdfdFvH+aLVjPUp830WtSCGshyd8ZUNvl3ZaqlAR2rdsqenLQOl5DFXgzsBqZgcOef4KmwqrUjyYK76V1s1eKsc63V1Sp6sICaSbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hd17BUb3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C439C4CED1;
	Mon,  9 Dec 2024 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733768387;
	bh=Hd1rQymEODPjoNCaX7qvSHK/dSAqSz+Wx1sGbb+/QXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hd17BUb3QP6Jqz+JNiWgfDlyBYBM607B2/k2WBFsvw0q9f50irIR4m936S+EWB3+i
	 EJUuW5NMfmRxoo45xlU/DcIh6GaK+n444FU1aP6Y1/uMhNt6SQ5MBju1MadLlgAtMb
	 xbXd5x6A8NVzpfkq7LVdRfi6iW49ox9NpBycSlQfxabMndBbfcrmj32Ue3OKzv6+1X
	 Nwo0j0fIgyO3OdbTayY0CBVdX0RhTiL1XjkVJQUbmbsc5itlGcYb6r8UgE/ZABcrNM
	 NDorQS7e3ELK5ErHMDBE4kyuqi/n9bvwIii3zdBGuuslQ9NbnKBlNOpqJXNHwIqYxr
	 70S3atnnLkWvg==
Date: Mon, 9 Dec 2024 20:19:41 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: suppress stdout from merge_config for silent
 builds
Message-ID: <20241209181941.GB1245331@unreal>
References: <20241208144622.605523-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208144622.605523-1-masahiroy@kernel.org>

On Sun, Dec 08, 2024 at 11:46:14PM +0900, Masahiro Yamada wrote:
> merge_config does not respect the Make's -s (--silent) option.
> 
> Let's sink the stdout from merge_config for silent builds.
> 
> This commit does not cater to the direct invocation of merge_config.sh
> (e.g. arch/mips/Makefile).
> 
> Reported-by: Leon Romanovsky <leon@kernel.org>
> Closes: https://lore.kernel.org/all/e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.defconf | 13 +++++++------
>  scripts/kconfig/Makefile |  4 +++-
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 

Thanks,
Tested-by: Leon Romanovsky <leon@kernel.org>

