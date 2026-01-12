Return-Path: <linux-kbuild+bounces-10506-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D62D12C27
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 14:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 187023009767
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 13:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB87C358D09;
	Mon, 12 Jan 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arusekk.pl header.i=@arusekk.pl header.b="cwsLLvUB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44DC3587A1
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Jan 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224222; cv=none; b=prFDEzeH8SDyHgjjDLsaT3nwjYLDsfy+Y1KTqoDbeCJ9PvqvxNW/BK33Y863HA//rghUKl98gvy5b8KMro+QiEI0kyvSpU5/FFHQVMutxMWxA3yIKX8x6YyvcGoaSv9pGgm9/fMH5u4IOhnIk9CJYuZNL6G9vShOdRnUfwdhg6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224222; c=relaxed/simple;
	bh=CZTJjP0k6kzmoRJErfyVOrpsAr41G7M07VU+UPpF7xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsqlNduv6Ma7MWdmWsTODITE2IQ45yQyp+AVL7/hqzglBsvu8yqaY8tOiYB8R13OZIn96WNpwaWS7T9+6YAZz6Rf7Aqfq2T0YLvFGTVktUhvV3BF75jTCDhBIcfYf2MV7rQh89W8AYHmam7aHUwdHgd1O0FKYeUNZp+ildD6GYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arusekk.pl; spf=pass smtp.mailfrom=arusekk.pl; dkim=pass (2048-bit key) header.d=arusekk.pl header.i=@arusekk.pl header.b=cwsLLvUB; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arusekk.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arusekk.pl
Message-ID: <35312d4f-0783-43bf-8a91-0e80bffe821c@arusekk.pl>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arusekk.pl; s=key1;
	t=1768224217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBo48CIAcIoS+ESLNbk+BNRduXadIoFVGFtgQXU8cvM=;
	b=cwsLLvUBAK74E1aG/5ilarWIlurzxUKvxLcGozVH7MYnJTwwLg9yaAsZLP7V4JvF3OepdB
	olqGwqT1twa+df8tlDFA3Z6U8AH5QMBgHic7h7zE8mnInIW03wx29lddnLmP2qd6AdRtY2
	o/MtVcwcLVi1NHU6FIiKXoz8WZ2LIl0PKn88aSSjdyKKCmekvae/3LdpHW9tNCwjttl/6F
	CObhbP+OJImZbOEFjmWHI3Ii3UIZNtrPMKpL15TPrkQw8dFhC6xDDn6N7/2VEESUFJz8WH
	jT9gVH1fNGjNbrOApGb4zLB0Bl5xMOV13CBso1RXj61xE4IKLnHCXBDg9zpkHw==
Date: Mon, 12 Jan 2026 14:24:42 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: fix static linking of nconf
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown
 <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Arkadiusz Kozdra <floss@arusekk.pl>
References: <20260110114808.22595-1-floss@arusekk.pl>
 <20260110232043.GA90060@ax162>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Arkadiusz Kozdra <floss@arusekk.pl>
In-Reply-To: <20260110232043.GA90060@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

W dniu 11.01.2026 o 00:20, Nathan Chancellor pisze:
>> -PKG="ncursesw menuw panelw"
>> -PKG2="ncurses menu panel"
> Is it worth a comment that the order of these packages is intentional to
> support static library builds? I do not mind adding after the fact to
> save you from sending a v2. I guess this situation is not too common
> since 1c5af5cf9308 is over six years old at this point but if any other
> dependencies become necessary in the future, it might help folks place
> them in the correct order.

Sure, this is because ld still only visits each archive once, 
left-to-right, by design.
I think a comment about library dependencies and order would do a lot.
Feel free to reword and/or add comments as you please.
Thank you for your help.

- Arusekk


