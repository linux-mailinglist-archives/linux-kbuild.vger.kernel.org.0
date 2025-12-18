Return-Path: <linux-kbuild+bounces-10140-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C6CC9DE3
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 01:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B6AE301E91D
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 00:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F052AD0C;
	Thu, 18 Dec 2025 00:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsPNRPG8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19367168BD;
	Thu, 18 Dec 2025 00:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766016821; cv=none; b=L4/7Awh/CJSjr1o5aLRAtC8x5j2qM6Il5CbRJRNSAynE43V6FY8771GHo57VyOhBL8pe3g0OzdiM/COfVM1TOb+Ko0BSIokumz7ISDkYzLEGasLk0RsI48VZ50OlQVIRo2uzyXttuW/wCAwvqvRx9oLolhpRcE0CpHc4IBomStE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766016821; c=relaxed/simple;
	bh=CPOTYbejVR0Y51YZ1cD7TBeEDzZA+H4ktCkya/7UJhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gy4NfVkjuhvcvIbUDHLLu0+SqFwW060JJ26odCIvy7s4Ay0SjEWOldannnYFNtPqk+Aq+tmYDRtuCHpl8k8Yb+avhDk4WL03370VhuLRsKzWVNgRevBASZODrbCAOaDDIO+Bx+PHq4NJIxUH5ladENg4fJHW602rWYN+o+zecLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsPNRPG8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D10C4CEF5;
	Thu, 18 Dec 2025 00:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766016820;
	bh=CPOTYbejVR0Y51YZ1cD7TBeEDzZA+H4ktCkya/7UJhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsPNRPG8xMuTDf4+I5qrrYzjCDgP+dflnQk0pa0USlrbdKNFdk1xuO/8xPcmJKZgZ
	 Qi7T0uvxpEoWJJCTz/D9XuBybVetthneo4HAH84UsCU8IkOAShOlTNOHEc8CGOlqU9
	 Q4aCGJAITdvGE09iIpAd81vCJFW1BFt9sPrAJSZwuWEnSqjkmLCDfaMZ0uTDDahSSg
	 QcEqVk8IhBtLiBJwr6cjbMoon///PcMhSy+d08SYNtIc1/09ExcaKQ2xsK4/aPuBrX
	 425GwGSu7JMiVYTwBkEDq/nCmCM9ulYs+RMlFxVROLjj7+6ZO4y37wq3mueV2F6TvQ
	 qMBLziJaj1T8w==
Date: Thu, 18 Dec 2025 09:13:36 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH] Revert "scripts/clang-tools: Handle included .c files in
 gen_compile_commands"
Message-ID: <20251218001336.GA2451437@ax162>
References: <20251217-revert-scripts-clang-rools-handle-included-c-files-v1-1-def5651446da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-revert-scripts-clang-rools-handle-included-c-files-v1-1-def5651446da@kernel.org>

On Wed, Dec 17, 2025 at 08:13:43PM +0100, Nicolas Schier wrote:
> This reverts commit 9362d34acf91a706c543d919ade3e651b9bd2d6f.
> 
> Dmitry Vyukov reported that commit 9362d34acf91 ("scripts/clang-tools:
> Handle included .c files in gen_compile_commands") generates false
> entries in some cases for C files that are included in other C files but
> not meant for standalone compilation.
> 
> For properly forking clangd, including .c files is discouraged.
> 
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Closes: https://lore.kernel.org/r/CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com
> Signed-off-by: Nicolas Schier <nsc@kernel.org>

Acked-by: Nathan Chancellor <nathan@kernel.org>

