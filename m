Return-Path: <linux-kbuild+bounces-8644-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66544B3AA86
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 21:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AD887AB4B6
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 19:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0D226FA50;
	Thu, 28 Aug 2025 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGNc/9l4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A06BA4A;
	Thu, 28 Aug 2025 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756407846; cv=none; b=n94RK1Zt4wBfWpgBcTw4PtlH4vV0YWK1jYta9bKp3X+3Ux66qMG0gz583anJd7JO5YFUQmf9dx/ALglfoHCk6ykIIVNkePkbkYMcBNrdfB8VUQpiF/53mBPjfx3qiZjhnGaqwFXlGTIA6hw/c92r48ELlxUjkCZFowAnbh5jXv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756407846; c=relaxed/simple;
	bh=XCtleJKsgC5hkcTak2AdBrB2yO5aoxsWFgTB969VZQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMLCElOKj/qaIU/H7a4RfKXUKyoyh8jiAPDQ9zJstcOPzU9aHgU9BnFPuLDDAFFhxm+NuIohWOncGeS2/W35CZ9KQclDQZxH8VYp+ku2wNSdlywQrioM57Ezd8AH7pHNKyMPwS+SQiXCcIca66QD05WtDG+O9DFi1ik6bfowT4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGNc/9l4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89F9C4CEEB;
	Thu, 28 Aug 2025 19:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756407846;
	bh=XCtleJKsgC5hkcTak2AdBrB2yO5aoxsWFgTB969VZQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGNc/9l4wadJJhvCxUHa2BoQ5Wf6wXbEwwUpCyeYmhqXVUoU35H91qvDzHIQ1RjtG
	 jl55EYGfpTfjFwEFOwbKiTRGmGU+9csVGQZm10NuDe6iBlP/id4k+qB0yg+gpF2FH0
	 N+QmjdkPYrnMWKF6YjEGHIQoWRUfwI6XCkm6YzZSTEfLCIhx+1mXIH7X74aFN6l+nF
	 bsnQvYcQWUppEb9tRn8Uz8CLibFjD+m+EVYOC1frc/+7I6VzcFJAdvYx1ajhSK9WeL
	 oRxiG2xH+ymNttpY2H7S/ViAARudJaYuL7EXhprTQmASAXC0SA4lnHjUV7G0+SjMVz
	 e9YQicI+dg/IQ==
Date: Thu, 28 Aug 2025 20:45:53 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Maxime Thiebaut <maxime@thiebaut.dev>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] extract-vmlinux: Output used decompression method
Message-ID: <aLCj4Ssluu-haN1S@levanger>
References: <X6OQ4pHdpreJtlTnf0tFEb4Uxz8T8gFv_7Yw6tpBK4ZBgHYjJr_URwUwCVynpkb-H8Yjk7DdBF01zY-sfqu_7N5trZQfcd6s_4PtdGlHtlA=@thiebaut.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X6OQ4pHdpreJtlTnf0tFEb4Uxz8T8gFv_7Yw6tpBK4ZBgHYjJr_URwUwCVynpkb-H8Yjk7DdBF01zY-sfqu_7N5trZQfcd6s_4PtdGlHtlA=@thiebaut.dev>

On Tue, Aug 26, 2025 at 07:23:49PM +0000, Maxime Thiebaut wrote:
> When extract-vmlinux succeeds, it doesn't output which decompression method
> was found at which offset. Adding this additional output in check_vmlinux()
> helps troubleshooting and reverse-engineering images.
> 
> The last check_vmlinux() call was also quoted to accept spaces.
> 
> Signed-off-by: Maxime Thiebaut <maxime+kernel@thiebaut.dev>
> ---
>  scripts/extract-vmlinux | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Thanks, looks good to me.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

