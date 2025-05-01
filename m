Return-Path: <linux-kbuild+bounces-6836-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DFAAA5E68
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 14:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 629007B0167
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 12:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BC12253E4;
	Thu,  1 May 2025 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSeJjKp6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB4155A4E;
	Thu,  1 May 2025 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102599; cv=none; b=sO+h4mpCfMiGSK1Xd8tvzOTu8ScCvoKqAIlLpud2KV2BlHsypFyyVe4iz2o1BjIQNl6TFz0QmikpCSRe7HBT7pIgXFdJaDUD9nz/HRqAm2Hoec4q0t0XxsJsWaprT8xp1zwptx3BXVe/EDv3mYc6uF1Cf1kgXIVAFgeD/xU67Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102599; c=relaxed/simple;
	bh=HHFy+Y7/p4g7j7JA1ajf4JCe6GOcwd9Vi1vYBVJsTd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQUY1XfpgmTkcfBfQ4kUAxf6NQIXahTWFCDdIP2bvj28fgihcOWbRKv8sg5L8+2a2x/c6/3IgiTvM3wcD8B+un1zOoxmHYoRf8Ts6g76I/KHGvndXTVGr/FZsM/2fCnXhFEE9vEeetTrZR3emZd/ZR7rWIHL7LbDKyNQ+h17+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSeJjKp6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C377C4CEE3;
	Thu,  1 May 2025 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746102599;
	bh=HHFy+Y7/p4g7j7JA1ajf4JCe6GOcwd9Vi1vYBVJsTd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSeJjKp6qCz6ktAdluhvk1QdPWSgoTRyB69M5fzhB2x0PSoSyaN6wLZTPPKcBnmqB
	 v+aaOpL5I4kqWcpORrmkP3/Kg0n3keDb9OVFUwUWjcp/NwOwopBlrgtvFoXRBdHZY7
	 0kuVygHXNBqFK4FXwMF8mq/Hxy+F/z5dEb66wZ2VQhtU3w3F9j1ihY6+0xo/UIQrQ9
	 LpTTOpYaNIODC19bkbDE7oxDaP0tdyCo4Rq6xKjo8P2E2wWw6LX//ft8fEe8V6OJsp
	 tCKTy4bypn6uYMOkf9W8cPp95h9R2NfUHbQ6tyPxI0uiOVByLQtaoxx9nzoiCdz7FD
	 JSeiSMPVxDqkg==
Date: Thu, 1 May 2025 13:29:53 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v1 1/7] mfd: stmpe-spi: Correct the name used in
 MODULE_DEVICE_TABLE
Message-ID: <20250501122953.GL1567507@google.com>
References: <cover.1745591072.git.legion@kernel.org>
 <79d5a847303e45a46098f2d827d3d8a249a32be3.1745591072.git.legion@kernel.org>
 <60b92fba-8170-4e9a-bdae-1ad7dd6beefb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60b92fba-8170-4e9a-bdae-1ad7dd6beefb@kernel.org>

On Sun, 27 Apr 2025, Krzysztof Kozlowski wrote:

> On 26/04/2025 18:16, Alexey Gladkov wrote:
> > The name used in the macro does not exist.
> > 
> > drivers/mfd/stmpe-spi.c:132:26: error: use of undeclared identifier 'stmpe_id'
> >   132 | MODULE_DEVICE_TABLE(spi, stmpe_id);
> >       |                          ^
> > 1 error generated.
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> P.S. You can trim the error messages to relevant parts, e.g. "1 error
> generated" is really redundant and not needed to store in git history.

Trimmed on apply, thanks.

-- 
Lee Jones [李琼斯]

