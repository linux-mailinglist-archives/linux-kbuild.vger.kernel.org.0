Return-Path: <linux-kbuild+bounces-8272-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B80B189FC
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 02:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BB557AC8D9
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 00:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9540E56B81;
	Sat,  2 Aug 2025 00:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1E+0BI+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F5D182B4;
	Sat,  2 Aug 2025 00:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754096128; cv=none; b=OFxWAzH3qZy3qzWvFFMqBgvcxlTPDneDsvel/AZ3/sQ6k0M2MQzyVUH3ORAM5boIvnP7FXlx7yH05wgUMq+a84CepMgeDPSruPmmLedSLRJqiOfl/zjtcfHeeizkaCBFnIb6x16bDHbjr77JE5uCPntvc+VFHkgw6yW60Jb12Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754096128; c=relaxed/simple;
	bh=ei5b0qLvfIJhkoiscWdNc7lhBOl5CVGHLS75IUH4AfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgiI+hcELrsoX608zubLALDxmr1cxV2mZShyjbwcetRNs6vOCJOpiSPuqNpChsYyEOBiMrz4r4keF3KebzO7jCvvlyyfhYEeor1/TLISK3xaWhIjrRlLQOlJ6zGpnSltLhJKTcs7uHUtgpi1ffGz58YBjbrg/Cy3f3DRrYqxYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1E+0BI+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBF3C4CEE7;
	Sat,  2 Aug 2025 00:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754096127;
	bh=ei5b0qLvfIJhkoiscWdNc7lhBOl5CVGHLS75IUH4AfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1E+0BI+pyslTL/bOIbdamc631pZPhvxo/Sk9A43iQaP66pGydroyP5ru5LMiNdD7
	 b23NoNW2bk6UmfLPzsAidWaYKFSPtnPJgwR9fthP47lc5qSX39LXfLYxmsH4OWunlN
	 +d2PfTtNqIE0nMbT2Q2Njqzt6iL5yVVX5/NTepeKUWpm2Wk5DeSTzmGSEo1aajSmHg
	 OhXwSwSz3WRWhVhYo5x/oj8T3XHfYbVF/I2BXJJrf+2fuUn/5PwuZqXQRc6axhFr1g
	 8mLiLu26MVkdRHUd+AH1MfnRozlHY53g3tUvtotR3MOJa19lswkbe8hd2pkBmO3N0G
	 pOo0nefgoL60g==
Date: Fri, 1 Aug 2025 17:55:27 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Re-enable -Wunterminated-string-initialization
Message-ID: <202508011754.BBDF043@keescook>
References: <20250802002733.work.941-kees@kernel.org>
 <20250802004316.GA3910513@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250802004316.GA3910513@ax162>

On Fri, Aug 01, 2025 at 05:43:16PM -0700, Nathan Chancellor wrote:
> On Fri, Aug 01, 2025 at 05:27:40PM -0700, Kees Cook wrote:
> > With the few remaining fixes now landed, we can re-enable the option
> > -Wunterminated-string-initialization for GCC. (Clang does not yet fully
> > understand the "nonstring" attribute.)
> > 
> > Signed-off-by: Kees Cook <kees@kernel.org>
> 
> What else does Clang need? Are bugs filed? I had requested support for
> multidimensional arrays, which Aaron implemented pretty quickly (and the
> tests seem pretty expansive):
> 
> https://github.com/llvm/llvm-project/commit/e8ae77947154e10dbc05cbb95ec9e10d3b0be13e

Oh! I missed that commit. Did that end up in Clang 21? Let me try some
test builds with a more recent Clang...

-- 
Kees Cook

