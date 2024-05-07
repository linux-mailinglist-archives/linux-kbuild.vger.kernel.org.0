Return-Path: <linux-kbuild+bounces-1796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4008BDD69
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 10:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E777F2857B7
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 08:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D620714D2B7;
	Tue,  7 May 2024 08:45:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5C13D25E;
	Tue,  7 May 2024 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715071508; cv=none; b=hoTmjz3sDvewgjPI33ExqTD2bRj199qSJbO+bOVrRC1tPz+Lmknx7jIOCtO5J7Rjh3LdHYRgbKVSAdRWdybNXgkh+3Z33WaC9znNly0a6jZpsvhGJVJxRvrDfRssvN2Y3r1evaJiW/qszAJ6j7VnoiD7zxKlZi8j/B6RgoYrYNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715071508; c=relaxed/simple;
	bh=9A8aEb/H5tnV9h/oJOLC+7cvqcA0+aC7Q7/UdHScoJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyhyQWyEbiOBaaHNpvr7KsMHjgg91OMMURTaRFpQuOZaZfXSYGqpSx5UyREdamx7w5jyNGHD2LHlFktLUu6aUH9pMxOIVfYqqwvBlVsTyPeEEYYimCDjXVMin/7tDqeGEsDI0uYjieOXOMwriG80KcXOLLMQkHjzVuZ7X2Hgb8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  7 May 2024 10:45:00 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 26098805BF;
	Tue,  7 May 2024 10:45:00 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 151C2181156; Tue,  7 May 2024 10:45:00 +0200 (CEST)
Date: Tue, 7 May 2024 10:45:00 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] kconfig: do not imply the type of choice from the
 first entry
Message-ID: <ZjnqDCqRLWmvFxWN@buildd.core.avm.de>
References: <20240427104231.2728905-1-masahiroy@kernel.org>
 <20240427104231.2728905-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240427104231.2728905-3-masahiroy@kernel.org>
X-purgate-ID: 149429::1715071500-93D8D2A6-18139FF2/0/0
X-purgate-type: clean
X-purgate-size: 2183
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Sat, Apr 27, 2024 at 07:42:31PM +0900, Masahiro Yamada wrote:
> The followng two test cases are very similar, but the latter does not
> work.
> 
> [test case 1]
> 
>     choice
>             prompt "choose"
> 
>     config A
>             bool "A"
> 
>     if y
>     config B
>             bool "B"
>     endif
> 
>     endchoice
> 
> [test case 2]
> 
>     choice
>             prompt "choose"
> 
>     if y
>     config A
>             bool "A"
> 
>     config B
>             bool "B"
>     endif
> 
>     endchoice
> 
> Since 'if y' is always true, both of them should be equivalent to:
> 
>     choice
>             prompt "choose"
> 
>     config A
>             bool "A"
> 
>     config B
>             bool "B"
> 
>     endchoice
> 
> However, the test case 2 warns:
>   Kconfig:1:warning: config symbol defined without type
> 
> If the type of choice is not specified, it is implied from the first
> entry within the choice block.
> 
> When inferring the choice type, menu_finalize() checks only direct
> children of the choice. At this point, the menu entries still exist
> under the 'if' entry:
> 
>   choice
>   \-- if y
>       |-- A
>       \-- B
> 
> Later, menu_finalize() re-parents the menu, so A and B will be lifted up
> right under the choice:
> 
>   choice
>   |-- if y
>   |-- A
>   \-- B
> 
> This is complex because menu_finalize() sets attributes, restructures
> the menu tree, and checks the sanity at the same time, leading to some
> bugs.
> 
> It would be possible to resolve it by setting the choice type after
> re-parenting, but the current mechanism looks questionable to me.
> 
> Let's default all choices to 'bool' unless the type is specified.
> This change makes sense because 99% of choice use cases are bool.
> 
> There exists only one 'tristate' choice in drivers/rapidio/Kconfig.
> Another (much cleaner) approach would be to remove the tristate choice
> support entirely, but I have not yet made up my mind.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Thanks, looks good to me.

Reviewed-by: Nicolas Schier <n.schier@avm.de>

