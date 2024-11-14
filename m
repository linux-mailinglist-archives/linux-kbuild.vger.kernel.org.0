Return-Path: <linux-kbuild+bounces-4678-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F899C8803
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 11:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08C7928783E
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 10:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560B01F76CD;
	Thu, 14 Nov 2024 10:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="sDfzcuER"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51ED1F709C;
	Thu, 14 Nov 2024 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581307; cv=none; b=WNrt/Mh3/gqdZC73SFTrqOmMYmc3LHJkrtgXGM3vocXPbbEqDbsZRL0zF7f5un/hIte6ASkiGSyI5g4Itqd57NLfa/Icdwx932a8F87lPbZ1K6vilcPRsWlMzuL9CuLCZN40NSfAzHDPausKPG1Vyjh3ixikQxewiGlWs2oEg0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581307; c=relaxed/simple;
	bh=PWg50iWXfuXg3RsLU+A46yYuy14Uza9axjJIUQiNcMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvXLXa8eLmLXaHOk9c/6eaTRQMRORh7loH7IpExanfFR0Sd4LbeUxv0D9RP6gc+xPTrLdkClnn1trkGp3Fgy9787aVLTKXllqCYmEqa1b0zBJHZYYoeuAjwJxLm1EkE4h0kEezwKgi/aT2LPO03H+hvBb7kwfzk12PvMu7qa+B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=sDfzcuER; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5fYlpR/pEWddbqkzkLykoWSuTuKOAdmw/RCfUudGYT8=; b=sDfzcuER/NyTW2B4kMgL9eDuxA
	lqYgRlDZIlaRg9AcoA6VmSpW70hsyLWluq5P8fJP4kC84EM0JQKZOEaiwLhHXrWgY/Wxwkv0/gD0l
	Elpx2MqDyjHgn38L/t0xcq7irsyEpyCV6jumfGkABoH3eBVZ47/FRTRVRhxAAwc++lcenPANRl9A1
	ik40Ljj6NOYwMAmBPWf/kf6tZ//e/oVeYENVn6R7ieH/weTyMQ/Awby1Skl+xKP+j3dqmjh9FwHeX
	s4qQbWc4jtqYipZfkDOjv1M6LGRxWfom2CMpzMFEeFYdKKvY0ReU7TxWGGTSxwOmpOzw51i0n4aX0
	5B+/BJIg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tBXOf-00Btyt-08;
	Thu, 14 Nov 2024 11:48:21 +0100
Date: Thu, 14 Nov 2024 11:48:15 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Morten Linderud <morten@linderud.pw>,
	Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
	Kees Cook <kees@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 10/11] kbuild: don't test for file presence in
 --dry-run mode
Message-ID: <20241114-flat-demonic-mole-cfbf24@lindesnes>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-11-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-11-vegard.nossum@oracle.com>

On Mon, Aug 19, 2024 at 06:03:07PM +0200, Vegard Nossum wrote:
> I'm not really sure if this is correct as I'm not sure under which
> circumstances the files tested for with $(wildcard) would NOT be
> present. I'm not even sure if this is the right approach to take.
> 
> However, it _should_ keep working the same as before for regular
> 'make' invocations and is necessary for 'make --dry-run' to work.

This might become interesting.  Makefile.modpost is called in several
different situations (e.g. in-tree kernel build, single target builds,
out-of-tree module builds), and if we want to get full shell script
output with --dry-run for all these situations, this probably has to be
refactored in more depth.

Kind regards,
Nicolas

