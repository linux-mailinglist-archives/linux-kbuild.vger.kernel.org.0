Return-Path: <linux-kbuild+bounces-8940-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF9B98676
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 08:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10CF57AC7AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 06:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA29B244661;
	Wed, 24 Sep 2025 06:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7a8ePEY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACBD33E7;
	Wed, 24 Sep 2025 06:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758696009; cv=none; b=NxIQfcuwyEoaHbHbsLrjd7rsjH+VKo7TNT412RT/LJM0gYGTB+Ly63M62c3dFueGPNpCgS83bVREf2BByvsqdTBg8HXHWe0+OgBJf9bOkP++1kC0g2B2HFDh1PojeC/1VXlmyWmmW32xk4n4i94hFwLKCdeQf6XhNeLnrb2qz0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758696009; c=relaxed/simple;
	bh=J8hov75qObfU9A6/REJMSZntidGERZYYdpEwKLEA7go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROe8dl3Vy9kmfg4Jp4pVu5KFu38VTq0ZDlIxoK2ZTPpWqmNMux1ou2YZYPg7BWpmvwS3zdcYBgeyD/m/o9Y+5uFuyks1zeCZkI0NJWO1rPRr+2aEvnoJZEPuWVfCpZIFOM6FN/GKJUEwgRwV5qm/2yxim8yMvcLkz3dSwjnPPbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7a8ePEY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DE6C4CEE7;
	Wed, 24 Sep 2025 06:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758696009;
	bh=J8hov75qObfU9A6/REJMSZntidGERZYYdpEwKLEA7go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7a8ePEYy62CyYZD1g/mEMj/SXZzafjUOL0ybRLJkgdWTZS/Sq75rPR5sd248sJhc
	 dd2wZt624QtaNBitVfiwxru6Uk5fBNXwg6lMA/DF7QeQ1CVOWxNoHLsReGUbL3qK24
	 S/kTG2dwwy8mRh9vp502h4lojs75kVsC+W0PID7wHz4BELZiriVxt6ze5FAhHc2yhD
	 kuOiDIxUg5URB2kdJcC+yuFCkTbiOqMYrQdnRDERmjQWCUMGhslo6xf1BHUsl7VsKl
	 FKdfUk6WgxcsGmjM/urRCqU6UkzIF328d+KvPUQJsjIrnMntOy92WHOYBJJN89Aj3w
	 8O9gnipfky9Kg==
Date: Wed, 24 Sep 2025 08:29:52 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v8 3/8] kbuild: keep .modinfo section in
 vmlinux.unstripped
Message-ID: <aNOP4NpaEzIFC7tz@levanger>
References: <cover.1758182101.git.legion@kernel.org>
 <aaf67c07447215463300fccaa758904bac42f992.1758182101.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaf67c07447215463300fccaa758904bac42f992.1758182101.git.legion@kernel.org>

On Thu, Sep 18, 2025 at 10:05:47AM +0200, Alexey Gladkov wrote:
> From: Masahiro Yamada <masahiroy@kernel.org>
> 
> Keep the .modinfo section during linking, but strip it from the final
> vmlinux.
> 
> Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms.
> 
> This change will allow the next commit to extract the .modinfo section
> from the vmlinux.unstripped intermediate.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>  include/asm-generic/vmlinux.lds.h | 2 +-
>  scripts/Makefile.vmlinux          | 7 +++++--
>  scripts/mksysmap                  | 3 +++
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

