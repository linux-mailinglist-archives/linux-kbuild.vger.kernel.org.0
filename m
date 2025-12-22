Return-Path: <linux-kbuild+bounces-10319-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C9FCD5881
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 11:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16AE730145AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 10:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8693D33711E;
	Mon, 22 Dec 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="eR7RlxCd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tp9/gIiY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B053370F3;
	Mon, 22 Dec 2025 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398844; cv=none; b=UlXLSW6ZDjCBOG/EQHOXcvlhDhqP+DU8fgrYlAzLtmZavkLBlHWrVSwy5mSHYG5FWEN5Gshh5+h3s3vfx1/ubpHm6ru+sDL35ww+iIToaDlAKiCwmpzx28nKZvEaniTivSzLZfUWCzpwPoKYWaaNmPX08xoC4QqCxenOsjD/U9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398844; c=relaxed/simple;
	bh=A6wMyGlJfk0shkT+b1Z0zUTMa5SqFS0kLvYXFdAnrD0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ek7sl95yGlslIRQu6KKvaMO7k9//OzBaXGOlZ8mV+WWTzsUn/QfzmyFzS73abbRflOyYR70axVtQtf7Bda+kGOwNnhukW5ttKyLQftJP89elsrr3wv4l4GM+iF0LvRBlODnMMj1J39Q82WXu1JKbBvM2CKYdOZWjfTtybEnJgVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=eR7RlxCd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tp9/gIiY; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 1307A1D000CA;
	Mon, 22 Dec 2025 05:20:40 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Mon, 22 Dec 2025 05:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766398839;
	 x=1766485239; bh=YVLyOhDbuZs2CXKfwPtaKg0G6pIYL9MNLUfx8y42k4E=; b=
	eR7RlxCdk0pzVBnuWANMnwCvcwN1R05db/KCgr5OYYyknOyzui5uuOSNO5EDTgB1
	sX3H1ir4vEw+S+g5uJ2S2IE8fphMOdjVHFIum6MzMOwBZVoqtn9zYuLnRdJRd23/
	dhYHbZ3WMwXGZ8BwOsIF8kpJIYo1DCHd7plp4fj0mEPpMvK7lIEaOLKXyAs/akPz
	ApMMIkwA48623SJw7DwDkOw70TFtRwuk16xVRIg/Dc9emmLzl0n7a7n6XjrR62O9
	R1jiEW9ZY/KmKbEMgIo7/GEGLTTzJA1QPbZht9N7pkpfBek2Wpq3ePuffFmpjISA
	78OCABSqdLFYCQhc46GORA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766398839; x=
	1766485239; bh=YVLyOhDbuZs2CXKfwPtaKg0G6pIYL9MNLUfx8y42k4E=; b=t
	p9/gIiY/AI3FiMEhjl1BXyC65N/255yQk7LmJKcf+V7xb58bPVEepetyIflh8ZpR
	hVRA35MMvnOG5yIAVsl2hySUCTsRNFYcbMb+MPGrnm3d5HyL3Ev88k6hisBYXqEC
	3IfZ5cq2wUuxA6tempxzkjIdTWTVCBcXGiXFENMFC/nF+5OvlRxYA8O0YDfX1UIm
	9JIX52Ta3JHtkR3Pup0UGhwWdeArml6n2lJIIL5Z4DB5t/0gxa244UkCJqq3RbA6
	1fE0gmUqk0BPR+bCjx1S779X4XbOM2HXZUSU3iJHEbLFKv4/2cKjlVN8bHoYePrA
	5iL9KTIOobILsN6fTsexA==
X-ME-Sender: <xms:dxtJaRQs0hpubwQ-0PLmk-D3M1yeBLBLfg3wwPPt8nZe4bdrTp_DJQ>
    <xme:dxtJaVmQFRVysmryv2T5YQEpzGJN2xHeChwj8pR_Y2LQkkuzUGK8AoxJcugsSq5Au
    G1hpY3as6PwZXra6K4NvrKm2gEhHJi-0SW5ixWLh3UXIhRIeRt0Cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehieeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegurghvihgurdhlrghighhhthdrlhhinhhugiesghhmrghilhdrtghomh
    dprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhs
    tgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqd
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhluges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dxtJaRQoBrGtNCquikUQ2o7bpS1fARHVIWZFYxpfC0mNL8VQ9XUN9g>
    <xmx:dxtJaVsnQcHupvcmRstGs-Qe6Mgg6hXcYOl8Y3R9qpftrsA4TXgFCw>
    <xmx:dxtJaV36BRLl8cLVjdLhMBOT0SsJJIqbMFyFZj-JxNyK0Ydm0EbNoQ>
    <xmx:dxtJaeUrBX63kSJXc3336X9sLAUw5G5Dkal01WGr2E748rLjdCRW-Q>
    <xmx:dxtJaRu91awX4gJjhwZlBRf_gAxgAJNakH-Iq3K1cSMc68uGwzNUGW8b>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9518AC40054; Mon, 22 Dec 2025 05:20:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AnL4ggAL8ANo
Date: Mon, 22 Dec 2025 11:20:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Laight" <david.laight.linux@gmail.com>,
 "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <8b6d335b-d473-4442-a17f-497ae7996165@app.fastmail.com>
In-Reply-To: <20251220121531.0dae2544@pumpkin>
References: <20251214131528.3648-1-david.laight.linux@gmail.com>
 <20251219201231.GB1404453@ax162> <20251219221827.4efa210c@pumpkin>
 <40f1457c-6e57-4d09-b50e-7133bafa7c3e@app.fastmail.com>
 <20251220121531.0dae2544@pumpkin>
Subject: Re: [PATCH 1/1] kbuild: Only enable
 -Wtautological-constant-out-of-range-compare for W=2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Dec 20, 2025, at 13:15, David Laight wrote:
> On Sat, 20 Dec 2025 11:27:13 +0100
>> 
>> This does seem like a completely sensible warning to me, and it's
>> always been enabled by default. I see three patches in the git history
>> (all from Nathan), which all make sense as well.
>> 
>> > Inside FIELD_PREP_CONST(mask, val) there is (with the patch, and if I've
>> > typed it correctly):
>> > 	BUILD_BUG_ON_ZERO(!(mask) || (mask) & ((mask) + ((mask) & -(mask)))))
>> > to check the mask is non-zero and contiguous bits.  
>> 
>> I think the problem is (as so often) the linux/bitfield.h headers
>> making things way too complicated. That condition makes no sense to
>> me, and neither would I expect a compiler to make sense of it either.
>
> It is simple really :-)
> -mask is (~mask + 1) so its lowest set bit is the same at that of mask.
> Adding mask changes the adjacent 1s to zeros.
> Anding with mask is then any high bits that are the same in both.
> So is non-zero if mask has noncontiguous bits in it.

The bit that I find most confusing here is how you have a boolean '||'
operation of two integers, but then interpret the result as an
integer again.

> Adding ' == 0' and ' != 0' would just make the line longer.

I don't think we care about the link length here at all.
Splitting it up into two BUILD_BUG_ON() or BUILD_BUG_ON_ZERO()
lines would help here as well.

>> If there is no way to express those conditions more clearly, I would
>> prefer removing the BUILD_BUG_ON stuff from the bitfield.h header,
>> it keeps causing way more false positives than finding actual bugs
>> with the input.
>
> I was just trying to reduce the .i lines line from 18KB for a typical use.

That seems like a worthwhile goal, but I think the only way to
make an actual impact here is to reduce the fan-out and evaluate
'mask' less than the current five times in that line (plus additional
evalations. If the 'mask' value is defined using complex macros
like ilog2() or max3() already, the expansion explodes.

Unfortunately the constant version of these macros can't use
compound statements, otherwise we could use an __auto_type temporary
here.

> Probably the only useful check is statically_true(hi < lo) in GENMASK.

Agreed, that one is clearly worth keeping.

    Arnd

