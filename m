Return-Path: <linux-kbuild+bounces-5775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B047A37904
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 00:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5A597A2574
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2025 23:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3251A38E4;
	Sun, 16 Feb 2025 23:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBsxaw8f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BAB1A3168;
	Sun, 16 Feb 2025 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739749402; cv=none; b=DyxNrr6jXtbLsbIH+GQJKsV2fC58ymW1ZNz6dMnHrkF6rMru6r+dqNQLiWunxEnLNVXDscBNf8ScIr2vzLTiMuizp8F8Q9qSMZLLRaGVMDVzX1qw9UrMcAbgAShR3Ti1K9iktcPOebBVkbxucYyNlY7syOI1AhF4Tv24NI04Xow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739749402; c=relaxed/simple;
	bh=Uq+c01FyZfmQ8IwJDlaJcYnRLG2lox+tfA5r37xPDT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSeWtbJ3b0JAMngp6X9fNLz2bxZpbOWfIoCAiRx1K0Z4/OvJNXslilOyCyVG+wJPU3g/lkOM14I82rPoLgNOjwKm6ByMm0YeCzPM9cWlAxtmYu1ARLZTma2grCTIuY/+yYLPiKTjLfviOO3lzIEqP3PIb2XshYJ4DJ63YcBGeK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBsxaw8f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56511C4CEDD;
	Sun, 16 Feb 2025 23:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739749402;
	bh=Uq+c01FyZfmQ8IwJDlaJcYnRLG2lox+tfA5r37xPDT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBsxaw8foJp1ShW1ZK+pCaFqlb2AdkGFvxKHQ21eXCMrAoCsHpbbhfsKsE33pMO7k
	 jRQoz4JyGjr79f6clp0VjVB7ZG4csEFtK5LLch/YVhx6edGIad37IAwKd6KyrYC48C
	 oThnP54Fkb5IawtzhSzmvzLOVQp8N3eT49vsf9wGvLHlYrLFyMt847R2gac3GfkbQS
	 QhYqHAS9yGX8X2oTlltCCcStr5BH+SrqFtSL3M6i998D7Z9+oDDD4h+GHnLhpLHJQe
	 Nf62fJ40VyUXsQz5Z61cYcyI9Y5MYgrXu60rCLKMO1GSyjED6T854AwSRIHK851qV5
	 L+S3EYtQ0I5NA==
Date: Sun, 16 Feb 2025 15:43:17 -0800
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: move -fzero-init-padding-bits=all to the
 top-level Makefile
Message-ID: <202502161542.DE21E47C65@keescook>
References: <20250215161604.690467-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215161604.690467-1-masahiroy@kernel.org>

On Sun, Feb 16, 2025 at 01:15:52AM +0900, Masahiro Yamada wrote:
> The -fzero-init-padding-bits=all option is not a warning flag, so
> defining it in scripts/Makefile.extrawarn is inconsistent.
> 
> Move it to the top-level Makefile for consistency.

Oops, yes. Thanks!

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

