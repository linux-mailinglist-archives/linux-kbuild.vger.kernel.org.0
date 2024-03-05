Return-Path: <linux-kbuild+bounces-1177-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FEF8726E8
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 19:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44C591C2501B
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 18:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1D81B95D;
	Tue,  5 Mar 2024 18:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ry3NVnRf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lksy24Hd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5358317997;
	Tue,  5 Mar 2024 18:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709664612; cv=none; b=RD4ILGhxVo9ocmNvfnmv5NaYmg+n08sQsAziIFccmVSClDjjTyTj2lkBqQfawTltgqPHrfNVZchJ/kJjUXEsESm7wh82mY2IPMl/FQltogE+sNiawzw11i/bpCiGRNC/3P/edi7xqglZf28UIXoiKyEIQlO9pZ8GsM9BNi4VmR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709664612; c=relaxed/simple;
	bh=cF8mcxoahwMTY2lS+hhxE6LsOx8abWC6gCBW/5nlCD4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=gHy52q8ge/Weiu/Akz/AM/LjV6Kk/SLFJ4CE8PgjdqZDZdBb1Mtb3wa7t3GANwtN4B+AiCFP0afGuKNqirWM3EtjSWMuW6CJfxW1AsKsnf4ZtCmJp9/inbya1a8kzQbm7VXOhKFwLQ2Tl5VZwTazv8eZ+IMZr3BcHDDe0IY7dvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ry3NVnRf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lksy24Hd; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id A0A7F18000CF;
	Tue,  5 Mar 2024 13:50:08 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 05 Mar 2024 13:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1709664608; x=1709751008; bh=qvGiduKtaH
	YBkD+OpqJXQGJHuSSmLHj7TrJpSvbER1I=; b=Ry3NVnRfVn6r7MLciTOQVKeNn9
	bjLVv0OlMbZYemE35QE13UhCLDS5dOGsTopAvISJvEPNweMUceA/iB/9frwMOZkW
	8FSVEi9ENh8Q3XEYWnsj9Sf73he3f2nMA5t/BwUKftnQS7x92SLqOkQw/w/5akSY
	/1gOntSEo3V1MSsw6CEsunvNSPLOfIJzA63jGyLSvbacAK3FDASp/ttwAjYF4MYp
	vx7cu7OTxbUJIZq//R+9udwP57HIgTjCFtojtzm23eo4zVB894TVz+I7tPmdMqjC
	bXQwfUEIrqGrvXWFn6bxKHrtPNF1SnKa0LDS7RpzlRTYlqUTuw70s0tQVdnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709664608; x=1709751008; bh=qvGiduKtaHYBkD+OpqJXQGJHuSSm
	LHj7TrJpSvbER1I=; b=Lksy24HdKMv55of5LbvQhgz6DpVWmlFBrlCgdZGt0oaY
	UwTGP5QeL81mpMy8kXnFSM9l18JeKT4g3X+RXtmw7v+jpIGvfb72hVyTaAIru/Eh
	SFxm+vB/Dk1otE6nuEobJQm+fWNUkgqXqevj9sv1clKsRDk1ftO/F/eheHlh5K3A
	cUeHYtPv7pxNSu/JOJA/BNlrT5f/u7ULp2fR+Bh1Buq9BD88PRT+Ftl1i5RAt2FF
	k3fnbNdznWVfZPGediS9VwntjqBTTXEz+G1Ug4hSy9t3TzPAGW6/hNghfGNH6B6k
	B2BUhJZrwMer2Lvb6GnLbwqdl/zed2wZ36De9+aqLw==
X-ME-Sender: <xms:XmnnZXl7sZk6uCLp-0N-q1tvj3OfvC3AkvgWvnX4LyW-kdEfJf_Gog>
    <xme:XmnnZa1kAu9fj5TAJ3SahZ8jhD1TOp7FBiMauq5W-9nTdr10T6GC8gzvz6p2PLgxp
    wh9-9nF61ThbHr8FnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheelgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:XmnnZdqjVLfv1YXQ3QvXtJJqRMm_ZwNOQc6kDG_dtXFGDo0YhfHj_A>
    <xmx:XmnnZfkLG3h2MOYfCbShAzmvS4wjtwnFD3KO9FJSeRvpjW2NSxNUOg>
    <xmx:XmnnZV2TFaSfPhuiahKDs1PdUxhQCYy4oIOdz8_4ge0SYoAwUfSvMg>
    <xmx:YGnnZeu2KwtdqUOTdsHW8mr-We8lVS2mVSjdIeRj7oHokq93SndBk_AQl_o>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A735DB6008D; Tue,  5 Mar 2024 13:50:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-208-g3f1d79aedb-fm-20240301.002-g3f1d79ae
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <57abd8e9-3177-4260-b423-38d5cdcda44e@app.fastmail.com>
In-Reply-To: 
 <20240305-disable-extra-clang-enum-warnings-v1-1-6a93ef3d35ff@kernel.org>
References: 
 <20240305-disable-extra-clang-enum-warnings-v1-1-6a93ef3d35ff@kernel.org>
Date: Tue, 05 Mar 2024 19:49:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>
Cc: "Nicolas Schier" <nicolas@fjasle.eu>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Yonghong Song" <yonghong.song@linux.dev>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: Disable two Clang specific enumeration warnings
Content-Type: text/plain

On Tue, Mar 5, 2024, at 18:42, Nathan Chancellor wrote:
>
> As the warnings do not appear to have a high signal to noise ratio and
> the source level silencing options are not sustainable, disable the
> warnings unconditionally, as they will be enabled with -Wenum-conversion
> and are supported in all versions of clang that can build the kernel.

I took a look at a sample of warnings in an allmodconfig build
and found a number that need attention. I would much prefer to 
leave these turned on at the W=1 level and only disable them
at the default warning level.

      Arnd

