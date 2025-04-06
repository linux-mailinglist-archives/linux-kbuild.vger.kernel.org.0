Return-Path: <linux-kbuild+bounces-6460-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B06AA7CEE5
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 18:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27CDD7A3DEA
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 16:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361E421D3DF;
	Sun,  6 Apr 2025 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KT3JByzV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C41F1A83F4;
	Sun,  6 Apr 2025 16:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743955594; cv=none; b=g4drXTOugBUBHlYXvrPbqP0k+1ZjehPMDJ6WuMR9U835NGUh48t+3+/rmQOvDOH7OS5thhmGwqrZJW0dGboeLNlApA0+Tbg+I7OhN0g/cQKIPTgFBCik5Brihhqsn9oiiIAFFG/HqU4PV9z9j8bIHU6FZ1Oc8etZlQ1UtS7gbUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743955594; c=relaxed/simple;
	bh=oQ26qde6ixYxXx347KOehu15WvUe7xl0OBqh03H0CuM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QGUu2ltECRTm3ZH2XwZHWCDmzMVQoGFty5AhW2CoZuPs9jj9DhqJlQrdW0sbKtXxo34H3xJrc4szvJGEw6bHcRVs+r2fXIP0wAAMDM97/w3GjDg5X/NxOQrIQBB/3LUePKjxhE3NYEqUiDhjhsiLlik5YuY1jjwWl31xCM6Ly3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KT3JByzV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08A6C4CEE3;
	Sun,  6 Apr 2025 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743955593;
	bh=oQ26qde6ixYxXx347KOehu15WvUe7xl0OBqh03H0CuM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=KT3JByzVrfnd/HKtRsbxF3lYmhRFPV0pYx9ew6AbH1AKkj8MzG8ZrBeaknyGo/pRm
	 vyWxR73xTLb1foI6oAsUO1Gb9x3bZvA7RT9oZQ2MOpn/XihfF8xIZznq709C1X2o+8
	 sbkggu07HIXEs16DlIcMOpwgVXtJLC7AghIs61aes2RCT09VOkea8VNVgVKaM+PzSN
	 An/wfSq3jJ4bcLYKYP1AUXPm4vvSEp++i7PTESX1pJL9hd+YBFCIhs0TPgTeqHuE9C
	 kGTknqI6qpXXinvX7rqzNDGA9aoM8eQAEVAqWidtjd5vLv97hdSjtDVjOLHde4PBy+
	 JteIXwKXoLPdw==
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id DE6331200043;
	Sun,  6 Apr 2025 12:06:31 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Sun, 06 Apr 2025 12:06:31 -0400
X-ME-Sender: <xms:h6byZ_8V_jshdt2YJrhC3CaNk28wlA6o2CKOVO0v_ohRaRe5gw45-g>
    <xme:h6byZ7uT_IOPFzrl_G2s3vHKxArB0Xh53dxo5iWTUYY5NdnDaZd-CypgciOtG5i0O
    k_lcoy_-odhxMO5VWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleejjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepjeejffetteefteekieejudeguedvgfef
    feeitdduieekgeegfeekhfduhfelhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvg
    hlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslhgvrdgvuhdprhgtphhtth
    hopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgr
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgvfhhfrdhjohhhnhhsohhnsehosh
    hsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhu
    shdrnhgvthdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:h6byZ9BACXFPPwHpY9i3LafZbGK_q3ekLSBUym5DUFtYCfw400QeDg>
    <xmx:h6byZ7fkztXycyhQvUBULJNyPYqY4uV-Faf7XDsajtBSw8JQ-EZ28Q>
    <xmx:h6byZ0OQi7GU18gD3OlwxazQbL4Hw6c7TIwROBV5y0tbfp3EeOriag>
    <xmx:h6byZ9k6s5QNzzmnWmaU7Eji4gZldQ1Qc1FCQ6FlfXizQqME7FF0rQ>
    <xmx:h6byZ-uV2DdUhblSt21oqlYRMvmz0zmAlDBU6CfVXaimSdIrItVblaVL>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ACDFB2220075; Sun,  6 Apr 2025 12:06:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ta79fad8bc959031a
Date: Sun, 06 Apr 2025 18:06:11 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Guenter Roeck" <linux@roeck-us.net>,
 "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <a30bd547-d0e8-44d2-ac2c-22396ecb9270@app.fastmail.com>
In-Reply-To: <32b8f7fa-3c48-4f5f-b99b-c1a8cd065442@roeck-us.net>
References: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com>
 <32b8f7fa-3c48-4f5f-b99b-c1a8cd065442@roeck-us.net>
Subject: Re: [PATCH] script: modpost: require a MODULE_DESCRIPTION()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Apr 6, 2025, at 17:59, Guenter Roeck wrote:
> On Tue, Mar 11, 2025 at 12:49:02PM -0700, Jeff Johnson wrote:
>> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
>> description is missing"), a module without a MODULE_DESCRIPTION() has
>> resulted in a warning with make W=1. Since that time, all known
>> instances of this issue have been fixed. Therefore, now make it an
>> error if a MODULE_DESCRIPTION() is not present.
>> 
>> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
>> ---
>> did my treewide cleanup for v6.11, Arnd had a few more stragglers that
>> he was going to fix. I hope that by posting, some of the 0-day bots
>> will pick it up and hopefully provide some feedback.
>> 
>> Note: I'm not really sure if *all* of these have been fixed. After I
>
> FWIW, I ran
>
> for f in $(find . -name '*.c'); do grep -q MODULE_LICENSE $f && (grep 
> -q MODULE_DESCRIPTION $f || echo $f); done
>
> That reports a large number of files (111, to be exact) with MODULE_LICENSE
> but not MODULE_DESCRIPTION. I cross-checked a few, and found that many can
> be built as module. The fall-out from this patch might be interesting.

The ones I sent were only the result of what I found from randconfig
builds on x86, arm32 and arm64, so I likely missed drivers that are
specific to other architectures, or that are very unlikely to be
in loadable modules because of random 'select FOO' Kconfig statements
leading to them being always built-in in practice.

        Arnd

