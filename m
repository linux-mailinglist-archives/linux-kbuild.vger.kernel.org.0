Return-Path: <linux-kbuild+bounces-9065-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A0BCA458
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 18:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91313A62F1
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 16:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3B022B584;
	Thu,  9 Oct 2025 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFqnZlP6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590D23CB;
	Thu,  9 Oct 2025 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760028982; cv=none; b=DfOWDMg3QKLkEd6gp3ZOK9/sQPpKAoWHI0heB2NdK3bEnvRciizTPv9h8hjnJ4KFiPuVelskFWO5vNuCkLIjeERyGVGqR7sNuuQedYG9zEe1mlibX+y7bFcRYYUXt3Lxd3EuJogXqAePruoiHFg/uuWT8uth19e9boqHPUu851I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760028982; c=relaxed/simple;
	bh=RQLnWwBR+swqXooGaYfoCQyHm0wP3zu1dL87x2ZhUto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df595UtffCoiQ5PYcn4hb3MstpjSSG3X4PF3IP39IQQeD2soCVjXttPN6Uld2bO7+UD6WSULVtFOFJkG29JF4dpNA465rH1Bl/89MfMIdBM4qPMLmR5kVnd3OkUICN63sid3HuzAgcDF2GPAK+yLRPCKU96p/29MoOSOliFuTp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFqnZlP6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524DAC4CEE7;
	Thu,  9 Oct 2025 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760028982;
	bh=RQLnWwBR+swqXooGaYfoCQyHm0wP3zu1dL87x2ZhUto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fFqnZlP6ZwxyMFub012HEiMsK1v03Q3+vrE//ALxXnWghwedgP5YRhQhTmLpN6wqN
	 avPgevojrPpG2vF15SElBTGjKH4KQiacGRwH9WkRz2LUfQuTYutsCImPeau3GBUXbJ
	 kMPfD0GVA40xdMtgeZPW7+fcwBPQm6lL/0nu0deb6Y0NQAfg6HH0DKPB54V6hOQY7d
	 qLmLupblrJZdrScII8kqM3oGNzvwZyDSXDv6i5/ygLh7OA9rJYduPAC+w+uXyadTKN
	 5AwFRFU9RfMUcQvWRuM1nJniN8rSmTDA7UW9OO6qb6nwL1ESEJkE0LkkjC3EgEBoqP
	 fb+9l/0KH+coQ==
Date: Thu, 9 Oct 2025 09:56:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] kbuild: uapi: upgrade check_sizetypes() warning
 to error
Message-ID: <20251009165618.GA441460@ax162>
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
 <20250813-kbuild-hdrtest-fixes-v2-4-8a7921ca3a03@linutronix.de>
 <20251006190048.GA2395186@ax162>
 <aObA4vNF4tppZ5vR@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aObA4vNF4tppZ5vR@levanger>

On Wed, Oct 08, 2025 at 09:52:02PM +0200, Nicolas Schier wrote:
> Good question.  I think you're right, that header compiling should be
> enough.
> 
> I cannot think of a sensible way that with successful header compile
> test for an UAPI header file that is not contained. 
> 
> Setting USERCFLAGS='-include something/like/types.h' during header
> compilation may hide a missing '#include <linux/types.h>', but I don't
> think that this is a good reason to keep the checking.

Yeah that seems extremely unlikely to me...

Okay, I think I will send Geert's fix for 6.18 then send a patch in a
couple of weeks that removes this check from headers_check.pl
altogether for 6.19.

Cheers,
Nathan

