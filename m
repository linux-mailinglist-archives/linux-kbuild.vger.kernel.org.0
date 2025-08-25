Return-Path: <linux-kbuild+bounces-8578-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026DB34608
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 17:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75483188ABE8
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 15:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC522FD7AD;
	Mon, 25 Aug 2025 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TykLHZcA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE822FD1B1;
	Mon, 25 Aug 2025 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136366; cv=none; b=JGJDDPkNYvTFXHUJ9kBzJKKu2hoC8BWt+A36RJY38rqR5VOhJElI7IiuClUJTMN5HG4zJCObFr/ZO+14h2LEhzBMP02RnP2emLYR+ParaBxMcwZlyggY6kSipvwdU6fUFKzVPQxutcKBNFTnT5wjxRVa3RUiRIR35FnvTIMgr44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136366; c=relaxed/simple;
	bh=wDX72lFXC9Zc3267BybmSNThL9SXJrH+3OnweEOr3JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ3zsku4ETn4W8hz/fY1n2R8p6jsWg8aCv7fU1JN+Xn+pAgFj8lWlgyZV79mvTitWJZYhevSn+Ih4YwHxBp12Sl4fwukiDFoJA1ZCbB+Ld/QZ6yqG21a69ZdIDg010Ks1I0iEIEdQUdFqKbTIyH89Cu83waWT9Not7mfzN7IZUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TykLHZcA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2363C4CEED;
	Mon, 25 Aug 2025 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756136366;
	bh=wDX72lFXC9Zc3267BybmSNThL9SXJrH+3OnweEOr3JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TykLHZcAmyav7iJuotWPm5t8m+TvFyNAhkljwLCNm9je3JAujyK/AClrcJmncLE/F
	 C0pBqAfAYY0Vm1UyecmOSzy79zpgMczYcRCQr0rLaEvAbo8TlcQk3Bn/mC8OfeqGaj
	 Z9ciVHGUox5vNj2NaAXS1dudRTDqfgUL2ckSNg3svdyE/ALeb00eNWLVaZyKejFejD
	 Go53C6scUEJn1hQGAGMXQSrkevCtvCWn/Gks88XJKONj9CDzdrmtQEVqsFSwcPWixf
	 WISE4wDACTqXkxm645PjLlkyUGhsxTLdjJrfPgZwQZvschB1FeoPg9tOYXZtT2d6Pi
	 puaYoQAQG9TLw==
Date: Mon, 25 Aug 2025 17:33:12 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts/misc-check: update export checks for
 EXPORT_SYMBOL_FOR_MODULES()
Message-ID: <aKyCOIZir4PrC1EA@levanger>
References: <20250825-export_modules_fix-v1-1-5c331e949538@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-export_modules_fix-v1-1-5c331e949538@suse.cz>

On Mon, Aug 25, 2025 at 05:00:37PM +0200, Vlastimil Babka wrote:
> The module export checks are looking for EXPORT_SYMBOL_GPL_FOR_MODULES()
> which was renamed to EXPORT_SYMBOL_FOR_MODULES(). Update the checks.
> 
> Fixes: 6d3c3ca4c77e ("module: Rename EXPORT_SYMBOL_GPL_FOR_MODULES to EXPORT_SYMBOL_FOR_MODULES")
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
> I've missed these new checks when renaming the export macro due to my
> git grep being too narrow. My commit went through Christian's vfs tree
> but seems the script is part of kbuild (which is currently Odd fixes).
> ---
>  scripts/misc-check | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Good catch, thanks a lot!  We will gladly take the patch to kbuild-next.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

