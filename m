Return-Path: <linux-kbuild+bounces-1797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7818BDD83
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 10:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BE481C21A85
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 08:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9DD14D2B6;
	Tue,  7 May 2024 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="P4IaUwGu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8205014D2B1;
	Tue,  7 May 2024 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072047; cv=none; b=dlRumy+vnWZM/15fbojnEgcfjPWehPRlooNiIOh6k0/nlI/hZMjxeH6YZsqgsQdsB3Ypywe+Vckg3D+Vp4GKcYNp+jKVM+C96CYUkJn4zmFiiaRtievEokZHO8+JK1aDGMXT8fNxTEQXYWMIg8q+crHpwkZmzyd7e7JaktfP5Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072047; c=relaxed/simple;
	bh=7ca9YuB5VrdaT3JVMfo/kNaW3t3MJyyjoSVX6MqN7MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbtIAkD1cGkyxHq4eD30WSCL/00CJdLRopH7w4vO8nB9N9E27rLv+SJyJbwplFFqxpXyS+yJSTQNUmcJ1IYr5s9ICpv7KDadSQqgjHVtKOcRm2RKYmCwMkUnsSuWwWUZjqSnu0w2DWY5kaaXUfqkgTy2xFq+TZzS+qW09n9WEqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=P4IaUwGu; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1715072043; bh=7ca9YuB5VrdaT3JVMfo/kNaW3t3MJyyjoSVX6MqN7MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4IaUwGuRkcnu/Kh8TgkzfD9xvgEe8+XD5lVSvQIbjj4hPOTO2Z3Sk7MCdQ1BLTss
	 VaE0bxEGCeR/+l3vei50A21IDBSDfie9PltDD2CF6aVlLjaLaRDuKFheKjfKL5qwYn
	 icYcthuByfPyLeLdBaBihXw8obGPSIgqBXlyxjRU=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  7 May 2024 10:54:03 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 0C46F806DA;
	Tue,  7 May 2024 10:54:03 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 0044318118C; Tue,  7 May 2024 10:54:02 +0200 (CEST)
Date: Tue, 7 May 2024 10:54:02 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/4] kbuild: do not add $(srctree) or $(objtree) to
 header search paths
Message-ID: <ZjnsKnjNhXwh5uz1@buildd.core.avm.de>
References: <20240427145502.2804311-1-masahiroy@kernel.org>
 <20240427145502.2804311-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240427145502.2804311-3-masahiroy@kernel.org>
X-purgate-ID: 149429::1715072043-A4DAF2A6-E75377FD/0/0
X-purgate-type: clean
X-purgate-size: 876
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Sat, Apr 27, 2024 at 11:55:00PM +0900, Masahiro Yamada wrote:
> scripts/Makefile.lib is included not only from scripts/Makefile.build
> but also from scripts/Makefile.{vmlinux,modfinal} for building generated
> C files.
> 
> In scripts/Makefile.{vmlinux,modfinal}, $(obj) and $(src) are empty.
> 
> Therefore, the header include paths:
> 
>     -I $(srctree)/$(src) -I $(objtree)/$(obj)
> 
> ... become meaningless code:
> 
>     -I $(srctree)/ -I $(objtree)/
> 
> Add these paths only when 'obj' and 'src' are defined.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202404170634.BlqTaYA0-lkp@intel.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>  - New patch to address the build error reported by 0day bot

Reviewed-by: Nicolas Schier <n.schier@avm.de>

