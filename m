Return-Path: <linux-kbuild+bounces-9178-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9DFBE0590
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 21:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C297219C775B
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 19:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47ED288522;
	Wed, 15 Oct 2025 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/YS5nc2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4991D90DF;
	Wed, 15 Oct 2025 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556150; cv=none; b=OAq3wqGtTeMOiXkHoPJ6kuN6BAnXDIHcOv2nhfk+D6wJZa2oSL7dmW5utPYGX9Oiy4SA4MQ4Kbxvh47zhgt//QtUzKXAswkDM/oLlG46L7GRlWW2nua0Pqb4Movtda5FgKSCfAX09KQBsk7Eqso63rgRMrH73jDIo6KXjpx27SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556150; c=relaxed/simple;
	bh=J9gr5l+EsJy5ZCEcQdc+AKOxsPTvCFbN5kZDZLb3xTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLQKrH/SBcL+7v7iJ/pAXzynZqFj5ot1D4iP0qPj1x0Wcj473bQO5OMAYKPCyqNl5RwtdB+9C9+9G6zDSY4bGaG0/lhawKZpFoOyMkcZJNE6zDgJIt+IQrE+v/JzdSImJER6ckhc5KaIxvFB/1whS2tmFzVeiLLPDdniijJZl24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/YS5nc2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5330DC4CEF8;
	Wed, 15 Oct 2025 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760556149;
	bh=J9gr5l+EsJy5ZCEcQdc+AKOxsPTvCFbN5kZDZLb3xTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/YS5nc2IZammuq1IcmEDcB+lkGzuxnCibU5hBpU3bT/rhMHJEFUZDWxeCeGMYfty
	 BYMjoEJZvGFmG364IWVGKGqUzdMfq6TaKsu+o8VLMyT44lJ8hB+vrGVGWUqJz2gmxN
	 V9FHHtv35dU0gGz1MwCnFz+pEDbZcp6V5QXjlUwsWe6xR37Khnxn/0VCbx0dYIoSaS
	 BSB1Mk63MhOqchhTYvxfQs08m9e/x4sJckPHfDF+yCNWt4EenHbrqAiQQbpt5gMRAw
	 OpZZo+So95El8bGL+vPivagcCaf7hjwv5cNhbiWQ5Nn0tt4XoAKcxH9SofpEpYqGrQ
	 pnKME2u1OKpLg==
Date: Wed, 15 Oct 2025 21:08:35 +0200
From: Nicolas Schier <nsc@kernel.org>
To: mike.malyshev@gmail.com
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Use objtree for module signing key path
Message-ID: <aO_xM1PraLOLjD4h@levanger>
References: <20251015163452.3754286-1-mike.malyshev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015163452.3754286-1-mike.malyshev@gmail.com>

On Wed, Oct 15, 2025 at 04:34:52PM +0000, mike.malyshev@gmail.com wrote:
> From: Mikhail Malyshev <mike.malyshev@gmail.com>
> 
> When building out-of-tree modules with CONFIG_MODULE_SIG_FORCE=y,
> module signing fails because the private key path uses $(srctree)
> while the public key path uses $(objtree). Since signing keys are
> generated in the build directory during kernel compilation, both
> paths should use $(objtree) for consistency.
> 
> This causes SSL errors like:
>   SSL error:02001002:system library:fopen:No such file or directory
>   sign-file: /kernel-src/certs/signing_key.pem
> 
> The issue occurs because:
> - sig-key uses: $(srctree)/certs/signing_key.pem (source tree)
> - cmd_sign uses: $(objtree)/certs/signing_key.x509 (build tree)
> 
> But both keys are generated in $(objtree) during the build.
> 
> This complements commit 25ff08aa43e37 ("kbuild: Fix signing issue for
> external modules") which fixed the scripts path and public key path,
> but missed the private key path inconsistency.
> 
> Fixes out-of-tree module signing for configurations with separate
> source and build directories (e.g., O=/kernel-out).
> 
> Signed-off-by: Mikhail Malyshev <mike.malyshev@gmail.com>
> ---
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks!

Tested-by: Nicolas Schier <nsc@kernel.org>

I am going to wait a few days for possible tags and other feedback.

-- 
Nicolas

