Return-Path: <linux-kbuild+bounces-12268-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOWvI+rGxGl33gQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12268-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 06:40:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C585532F764
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 06:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FF8A3026175
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 05:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E768F3A3E8B;
	Thu, 26 Mar 2026 05:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="dLRebvcn";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="ldcLAgFv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BEE39E183;
	Thu, 26 Mar 2026 05:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774503652; cv=none; b=m6hw5+pBVYiZ/V0htOWZARXsDD1F1AQV8DQg0T3Lyha8n5OLema9EbZFGxe729eftfalpRoLTRH8izeMJtVQVKcuhQPyeCsKXJQehmdvIrWcUai4+rknACgc4fY+C6tt1iQvubeaT2vyjDGUcOcM03NyEUKQd7JH5/4FkEF9EtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774503652; c=relaxed/simple;
	bh=n9xjHtpRhSH9ix3QmcQLv0kr4+Yq4N4rwcbqb/HE28g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPEMhpQZAsJbJ8B+6QTavi3lgxV5/iQifvv7HMgx25nNsHo9LjPIhg6GPVgDNmSFipQrAmFfz20oMiLLU9hj4wRy8LeQq4PYQ9ZTm+mW4OpMSAbpXNIEqjuOuRhrOPYIV4S6KhpBN9EezJWLt6LHPRUZlyvowh7IFe/TlTOk92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=dLRebvcn; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=ldcLAgFv; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1774503291;
	bh=n9xjHtpRhSH9ix3QmcQLv0kr4+Yq4N4rwcbqb/HE28g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dLRebvcntzwFpH7dQ1ezEtnqDQrnfqOEkALvx6okdHaLJcFTIf99TajN5GORbPKWZ
	 pzWUXjjlB85klCEskTlHka1vHn7UFo+4kN8yYmLjwhKdVxjR4Tx2pGLccU7OvWX91b
	 vsVM1JEIvYiMZ8cgOGZCAopB4/OvjyRL//b49SKEgkYEILkZFH2sp9LmdVYPOelCP2
	 P3Gft+GBYKZhwaVAddIXCBfwhTOlTRmoUUVsHAIOWmcBtj1QThwprO68PNS7mPnUJU
	 dB+kjJ3+HtQy8CY4JmT7OeAfYlkpL2BlkbRK+AgDNs+oyCtz1E7ThssjRv15wNYTKc
	 yQDTb44BrW7mfb4RDB095TPbgIv/8jYehe+/2A5zby9SFR5rpsa2HHaj4OrqVBiLI/
	 wACG+VnA1eEkKTXyCe0CaoqARO1hv1p00DHneWvEhK3puX587so1qBVLqmzoeWJj9K
	 WIGHsIz/xlDwv4HGZ9ayBgbxsX7QP9cDGjA5v9KXYoh6HvtoRk9Pd1JjXD8034zc11
	 OwKwVmvhTy/14T0Qe/HagRLXKImMZDTaD3fA8MIOfweIIasKRlAR3+mxHTbtFzswDi
	 +K3+ydlywGLxNurwWrMCSL+96gafwB0a6Q07wosQxDoM9zEuKQuBeIo8yRLYCDIdDx
	 xFWMC4LRykuiwsrXV2HLMueA=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 2C2471E833E; Thu, 26 Mar 2026 13:34:51 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1774503287;
	bh=n9xjHtpRhSH9ix3QmcQLv0kr4+Yq4N4rwcbqb/HE28g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ldcLAgFv276uo5NW6LPy7yICCVgujhSzmWWh6jq+0as7zdXji4UzHT6jmt4Pz/+33
	 S3izhb/lP9G6bwJL2/2H1qTs2LUaVuCj/ABRbszrZp4q62JjEXq55nTfRp2SvLuI9R
	 fm906bBysocD7LOT3MwsI7/Yswz4Tiu7PEgJoKZ1suCr2uP3hzygBpq9Y/uHrCvnlV
	 hL320KohBE1/nJw3XzMRLlA2C6A8q7IH7kiC+wl1eGgKbZUpqeffPGP1oYo0M96OJC
	 b7+eOTWzv4JyqwtBOF8ElsXU3R7ytXb6QQaJ6JxxljEQwj2nIYkCAf94e9nYx5u4JE
	 4903DdFW1gSuzq8xO+jxBKsA7ZEGlu1on8XW++IES/3QjXnfMvh/tT99aAmzDk70mK
	 Q12zsoXnahHRQZEKsNXsV7IS8i6e64DETF7+FG/6LFPOLnJzdxuyTYZMWVs6YLIIDG
	 aFSeffc9zYPYLL5KHnYpKyLYtJTLbeBA1SbKt6JO1LkMj8NOUC7hfwUzjxN/oHDv2z
	 3/L5hJqEG8WzvGUCwLtLeVT2cCVUWYkRhKzxdIUzYLENGP4vUxvX5aCNKe1wTm38eG
	 Uoepqbm42xqept2Sy0Ah2AWCkqIRpUM2alnyL+hUrW0AW3Nejd9c4XWG434jAvhFQB
	 SI3cbpjzbw15rKzFZT3TjCdA=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id DC56A1E737C;
	Thu, 26 Mar 2026 13:34:46 +0800 (AWST)
Message-ID: <e6bcf016-4739-4ba4-a46c-c0416c07400f@davidgow.net>
Date: Thu, 26 Mar 2026 13:34:42 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, aliceryhl@google.com
Cc: linux-um@lists.infradead.org, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 a.hindborg@kernel.org, acourbot@nvidia.com, akpm@linux-foundation.org,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 gary@garyguo.net, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com,
 nicolas.schier@linux.dev, peterz@infradead.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com,
 will@kernel.org
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260322192159.88138-1-ojeda@kernel.org>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260322192159.88138-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[davidgow.net,none];
	R_DKIM_ALLOW(-0.20)[davidgow.net:s=201606];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12268-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,armlinux.org.uk,nod.at,cambridgegreys.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,lists.linux.dev,vger.kernel.org,kernel.org,nvidia.com,linux-foundation.org,protonmail.com,gmail.com,garyguo.net,kvack.org,arm.com,google.com,linux.dev,infradead.org,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@davidgow.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[davidgow.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C585532F764
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 23/03/2026 à 3:21 AM, Miguel Ojeda a écrit :
> On Tue, 03 Feb 2026 11:34:07 +0000 Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> To get rid of these helper symbols, provide functionality to inline
>> helpers into Rust using llvm-link. This option complements full LTO, by
>> being much cheaper and avoiding incompatibility with BTF.
> 
> I have been testing this. I think we can go ahead with it, with a few
> notes.
> 
> I will reply to a couple other bindings in separate emails to avoid
> spamming people too much.
> 
>    - I will mark the Kconfig option as "(EXPERIMENTAL)", since that is
>      what the commit message says and it allows us to be a bit
>      conservative.
> 
> 
>    - Clang passes `-Werror=unused-command-line-argument`, which means
>      under arm (i.e. 32-bit) we get:
> 
>        clang: error: argument unused during compilation: '-U arm' [-Werror,-Wunused-command-line-argument]
> 
>      And under UML I see:
> 
>        clang: error: argument unused during compilation: '-I ./arch/um/include/shared' [-Werror,-Wunused-command-line-argument]
>        clang: error: argument unused during compilation: '-I ./arch/x86/um/shared' [-Werror,-Wunused-command-line-argument]
>        clang: error: argument unused during compilation: '-I ./arch/um/include/shared/skas' [-Werror,-Wunused-command-line-argument]
> 
>      So we would need e.g. `-Wno-unused-command-line-argument` there
>      close to the `-Wno-override-module` one, unless Kbuild or
>      ClangBuiltLinux thinks it is important to keep it for this case.
> 
>      On the other hand, regardless of whether we fix this (and another
>      issue in a separate email found thanks to the UML build), we could
>      instead add `depends on` listing explicitly the architectures where
>      this is going to be actually tested. That way maintainers can decide
>      whether they want to support it when they are ready. Thoughts?
> 
>      Cc'ing Nathan, Nicolas, Nick, Bill, Justin, David, UML, ARM.
I'm quite happy personally to just have 
-Wno-unused-command-line-argument here, given that it otherwise is 
working pretty well on UML and 32-bit UML.

That being said, I expect it won't get a lot of testing (regardless of 
architecture) while it's hidden behind CONFIG_EXPERT.

Cheers,
-- David

