Return-Path: <linux-kbuild+bounces-6575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A512A855D3
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 09:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E616170803
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 07:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EFB27E1AE;
	Fri, 11 Apr 2025 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HauYklEs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pfvfCZZA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D1C293473;
	Fri, 11 Apr 2025 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357701; cv=none; b=gV5K/Qk123wp1ZIkZiSRq7Su5BJEX0CgdgtTfwuVGFpJFxtpK23J9O91UmdVvmdr4Vkr2EmLtYz3q2GQtPIqzlb8SxawmkJNYlRkzQOae14Xpw7bWFHZekC6CVQiXeaDlBx2n5y+53OjbaydNImckS9WSZa3iEHEvdf57zOJ7bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357701; c=relaxed/simple;
	bh=hiZDW/wltbaeVUflk1SbUDv/+7af9kZO5nsD9Vb9I9w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FrMg+E+gZcY/HQfLhL3BXhIb6OObnKlDnObRwPiNcPyX2nH5WtVNzYfZgQu3XD0CNhjYs5jvKA0b/WCsYAOE8pTBmSubpSd9Y0Sq41QnM2R6wYXb4kA6Ere7CRl1tWvOWPlcvRELiQXUaPzjJ0V5Put9xN7PYPyEiCrXpAQS41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HauYklEs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pfvfCZZA; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id DFD091380233;
	Fri, 11 Apr 2025 03:48:15 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 11 Apr 2025 03:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744357695;
	 x=1744444095; bh=C8qu2/USiUBNgma963cXFWLigmWdQNWUtuAfEatWw0I=; b=
	HauYklEsZ9hrL1e3fm9iPKdqWoVA1FvunJ30bfP6OfcBuWZyDudpzWS/znRQ+lVH
	QC0AkSJ2jK5RjasHh+MwXX4tloI4xxBbIw6uYjto8oEsatmN+2qwpQalDXFw7h/P
	6KKS4FrgjuLtI+SXrcA15ejduEbvb8I2XOCmfCIgLVNqd7Ap7BSmZisrF4h0Bo3U
	W2rsPLzgqGr9H4Nurwyt/GPtCySuwzLMQMBTCktDGJIbrj/is59KSNx3//YluPkN
	21QWRjj24COVXTAsTuzr4dCDtUPuzEolR5lVyB+kHjwrcyxWV9yayYccG3FClACf
	zrIVMUdho/QT3xA21E8qXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744357695; x=
	1744444095; bh=C8qu2/USiUBNgma963cXFWLigmWdQNWUtuAfEatWw0I=; b=p
	fvfCZZArAJv7MOKq1wBMQZi+CqNWPQdPBe10NDTHoDYYE5cOpaC7f1otoqlvbytg
	Lr+iUrp/Fl+fGsmrNlMQHNcpc1u4TPuilzLT096Ya/rIz4CREjV4hqBYCAZIh29Z
	rqJbcri7EvXQbMb1YjfjWXhu6hvOUoic1u49qXOerJPEeW/zor0fewFI9MeLbxY2
	dvN2MBTh7TboCJxllDyKsq9EGX/Sqq2UVw15cmrzKcJdz/8EB10tXwyJbkDudLgG
	nDCWrAiiOO5Dc2JavRYbSmeVlY+ceKLV73UQtSijQMvWU1IAo9bHlmPuq3Di3Lv4
	r/NG5BLfOKu3HguXOrvWg==
X-ME-Sender: <xms:P8n4ZyjOr6qqMB2Ezs-vUXYVm2xqP3Vq5HW5dGpjwui2spyPVGKOsg>
    <xme:P8n4ZzDT6KQyFa1S-ENJgbKSphwBo_skiwvshBUSZe5Hz9H-3F8dkhUiOF8QxGNE7
    STONWECAoPA25BB7Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsvghrghhiohdrtgholhhlrg
    guohesghhmrghilhdrtghomhdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgv
    rdgtohhmpdhrtghpthhtoheprhhmohgrrhesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epshhmohhsthgrfhgrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehpvghtvghriies
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepjhhpohhimhgsohgvsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:P8n4Z6Fjf6wx4q2gTRIQ8AW4uRhfNP0sMaNU0J6TkcPOiav34hlWJA>
    <xmx:P8n4Z7R9D6GcxQX_PlZmPCAB_StZEol_ldDPRV6QqBvjMPss0HvxVQ>
    <xmx:P8n4Z_wBvLQzChsF4rjtD5RMBjbQs-kfm2V_o6VNfCzcGnYPzY2Rcw>
    <xmx:P8n4Z57cC7uUJfDPlzx07Hj_EWLLXt2kSp5SJZaShB2PWCNRIZlzrw>
    <xmx:P8n4Z5AAVl4teAB79TKtwOprOqGBFyjfqYALVOALeX0NxA_nXjlbE0pJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 463372220073; Fri, 11 Apr 2025 03:48:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td3151a787cba798d
Date: Fri, 11 Apr 2025 09:47:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Zijlstra" <peterz@infradead.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>, "Rae Moar" <rmoar@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>,
 "David Gow" <davidgow@google.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas.schier@linux.dev>,
 "Mostafa Saleh" <smostafa@google.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <0073e739-e3aa-4743-ad2d-29d7c969f454@app.fastmail.com>
In-Reply-To: <20250411065054.GM9833@noisy.programming.kicks-ass.net>
References: <20250328112156.2614513-1-arnd@kernel.org>
 <ycgbf7jcq7nc62ndqiynogt6hkabgl3hld4uyelgo7rksylf32@oysq7jpchtp4>
 <20250411065054.GM9833@noisy.programming.kicks-ass.net>
Subject: Re: [PATCH] scripts/mksysmap: skip objtool __pfx_ symbols
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 11, 2025, at 08:50, Peter Zijlstra wrote:
> On Tue, Apr 08, 2025 at 06:58:49PM -0700, Josh Poimboeuf wrote:
>> On Fri, Mar 28, 2025 at 11:48:19AM +0100, Arnd Bergmann wrote:
>> 
>> For example, FineIBT writes code in the __pfx area which can trigger an
>> #UD.  And we'd want a sane backtrace for that.
>
> On top of that, clang kcfi builds do a similar thing, they will generate
> __cfi_ prefixed symbols.
>
> And yes, those symbols exist for a reason, there is code there under
> various circumstances and backtraces look really weird without these
> symbols on -- notably the code in the prefix will be attributed to
> whatever symbol comes before, most confusing.
>
> So yeah, don't remove these symbols, and fix the kunit test.

kallsyms already removes some CFI symbol names based on regular
expressions:

# CFI type identifiers
/ __kcfi_typeid_/d
/ __kvm_nvhe___kcfi_typeid_/d
/ __pi___kcfi_typeid_/d

Do you think it should not remove some of them?

I ran into another problem with generated symbols that I don't
understand yet, and added this line to avoid the build failures:

/ _GLOBAL__sub_/d

This one is 534 characters long:
_GLOBAL__sub_I_65535_1_snnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n

      Arnd

