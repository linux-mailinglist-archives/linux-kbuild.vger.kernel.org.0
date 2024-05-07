Return-Path: <linux-kbuild+bounces-1795-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6258E8BDD35
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 10:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 171D51F217C3
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 08:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E5F13C9A2;
	Tue,  7 May 2024 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="wz+oXJ81"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F36197;
	Tue,  7 May 2024 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715071004; cv=none; b=UraTjdnxKFnt1PTS89yeSs1T/GRtigNXhzhDusJmgYhJnKhJdR8uaDXq6Ts05evNEJVniKSS/xFfgOwedWv3eV6t1akVyJT8yyXPmi/fNxDC4XNpRioKWHtsRfD2AjaswkLI/6wejPhL0LmFeyvIoDWFpfTdPODK5uzWFQeYMrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715071004; c=relaxed/simple;
	bh=sZS4MN5xnifmnLSkaYI1Llu+jnyg2fYDwfngQe1qpnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/1n34Xmtw8VDd8WEr0MvqdFePdRKS+ndzD4ThN29pB6AR8bb5tUCK72+ZO9sGXut/i+CnOc+kE3Ukz7pBVIiVAN/wb99JuzuRGVeC7W4Z/v1dFhl/sWJp2eiw6YpGhFvXE4z7u6j9iIMxsds399t2pU0W51IEydU0R2Ka2mv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=wz+oXJ81; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1715070655; bh=sZS4MN5xnifmnLSkaYI1Llu+jnyg2fYDwfngQe1qpnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wz+oXJ81r4WEnyfs98d9WGOi2aktrZTBTJm6wy5XLHwI/prbStLyIiAPK9oPvX5OT
	 udYjS7M6sJZx6ejERAUq49LyiTl5VSJsMIA2LcaDVCcnfGNGzEGsGI+gYhJquWBJRu
	 zSUG7s5KbPHRBt8+MUoPnbUCKH40axgq0iZVeyGs=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  7 May 2024 10:30:55 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 32455806B0;
	Tue,  7 May 2024 10:30:55 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 25ACE181070; Tue,  7 May 2024 10:30:55 +0200 (CEST)
Date: Tue, 7 May 2024 10:30:55 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>
Subject: Re: [PATCH 1/2] rapidio: specify the type for tristate choice
 explicitly
Message-ID: <Zjnmv1os_fM_j7M0@buildd.core.avm.de>
References: <20240427104231.2728905-1-masahiroy@kernel.org>
 <20240427104231.2728905-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240427104231.2728905-2-masahiroy@kernel.org>
X-purgate-ID: 149429::1715070655-A65A22A6-CAA48F91/0/0
X-purgate-type: clean
X-purgate-size: 697
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Sat, Apr 27, 2024 at 07:42:30PM +0900, Masahiro Yamada wrote:
> If the type of choice is not specified, it is implied by the first
> entry within the choice block.
> 
> In this case, the first (and only) entry, RAPIDIO_ENUM_BASIC, is
> tristate, hence this choice behaves as tristate.
> 
> Kconfig will stop this implication because it has a bug, and 99% of
> choice use cases are bool. In fact, this is the only instance of
> tristate choice in the kernel.
> 
> Before transitioning the default choice type to 'bool', specify the
> type explicitly for this case.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Nicolas Schier <n.schier@avm.de>

