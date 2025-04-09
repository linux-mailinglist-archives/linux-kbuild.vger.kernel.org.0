Return-Path: <linux-kbuild+bounces-6549-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14042A82C21
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 18:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C49B71891460
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 16:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E1B1D514E;
	Wed,  9 Apr 2025 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Sf9N7x9+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w4jf9RrY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA8C25D53F;
	Wed,  9 Apr 2025 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215181; cv=none; b=KRC1v2QaZYETX22tTdQaDFkCmIaTqJbv4wejrl2Ow8Y0K2NFD4AaFRs0TyhHRwOuWEFvvn3NCzYnx9sPYDf/YkCF87bjS4JvZzsktLEar4na/ze1ZfLliTWO8g0u9uWUGivwVsvnBn2tS9VFJeu0hU5S2UvWqMvT00auBjnmw20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215181; c=relaxed/simple;
	bh=F+tkmTBxAkQ7XxT5PXvydcdDOtzhCLLWni8C2dOYaJw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=e2CPUmvctTKp5+8akwzLe4kQAUGWJXdAo3CHnTI47zGg43+sDJi9DsvWKDJSy6CRuE69xYAAoWnOePbNNk5n6IcnZ8Mj5RXHTybCG/42XAsa7VLMsfbcAbhiGnA9ZxO+Jx2xcpzYpDFig2Qi6yL205M6QSmntHoGxdWuYR9d77o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Sf9N7x9+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=w4jf9RrY; arc=none smtp.client-ip=202.12.124.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailflow.stl.internal (Postfix) with ESMTP id BDFB91D40378;
	Wed,  9 Apr 2025 12:12:57 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 12:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744215177;
	 x=1744222377; bh=33jataLKOMrDl7oW0kqbiVVzQKavk3L6wvJAXox3arE=; b=
	Sf9N7x9+592spj2w4NNDK8DtL3spi5xwI2nbpr/pMDEQ7Lenz94gJddRGkxKPJCd
	dxmat3ZDeyFSH/Z7Dl6Jp9DfbjS8kEY9kJN1riq4740H7cNcxmnBTaplX+hyvRjE
	DkA7ealGvq25awf+4agXajLLLcPGVDQvYHRQFbe8lAJGmAllko4J/11Kfnip48dT
	xlx/Bk/ZiK3aPWlvPbxMoqZoln02HfAbvScwfwtzlTNLSFOWcJymaz9jX/ZyaVjG
	0E6DiN7uJmFOLhCDjt6zSog9WoffVL8fGYYaCz/RMKuOrtz1YFKwGpDJ4Iozjh9J
	szqvIOSXe0zIGR100jkiOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744215177; x=
	1744222377; bh=33jataLKOMrDl7oW0kqbiVVzQKavk3L6wvJAXox3arE=; b=w
	4jf9RrYg4MM5owPrOa4DT6jv3N1l91Yu4GO1QlERQ+SMDVQAyKmHGZiX+Db3faDE
	IhNLd3+8fbLy7AspKB+5YG6/wIQY6Xmc6aMqFiw+zvJnZb6rNOOCBGdhyus+uFZn
	P8A9+xez6PLjbt+ieWYeC2Cz9C0krrpgg17oF0SMkYjWkC/Mnr9VU1GscuUhfVYG
	0kqBdl4/6vPwcdltUJzuNftlFIrsY8ttt6MUcOlz0oPDLCkOmB5SGotmrzrDzsvl
	sYOXaUt89J21qTGkdHMkBzUDAW3Ke7+Pv2RA2759ZjHnucWUh3SjPX6oBGNIqYCI
	uHeaYM6uTncr0j6e9WCRA==
X-ME-Sender: <xms:h5z2Z8KHSoVXEffdwRcJgSRi8DSBQzY1RtX891upV9s3lgmUI8fwmw>
    <xme:h5z2Z8I1gmGW-Ei2-vrmdTZioXTfQxxD2AoXWBL3t2PIMur3C7gcvmPQ5mTCqkkTl
    09xfb8_7etFlMG9lBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeigeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheptghhrhhishdrphgrtghkhhgrmhesrghllhhivgguthgvlhgvshhishdr
    tghordhniidprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpd
    hrtghpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhr
    tghpthhtohepughirghnuggvrhhssegthhhrohhmihhumhdrohhrghdprhgtphhtthhope
    hnihgtohhlrghssehfjhgrshhlvgdrvghupdhrtghpthhtohepghgvvghrthdorhgvnhgv
    shgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegvsghighhgvghrshesghhoohhglh
    gvrdgtohhmpdhrtghpthhtoheplhhiuhihuhhnthgrohduvdeshhhurgifvghirdgtohhm
    pdhrtghpthhtoheprhhurghnjhhinhhjihgvsehhuhgrfigvihdrtghomh
X-ME-Proxy: <xmx:h5z2Z8uH9UIIzQnIliicFwHgsOXHjzdCs4Ex5QgLPr22gZQc2YCcYw>
    <xmx:h5z2Z5afkpjYXabgkSsHiAciTMBD6ajkQSbDxosFYTcLBn6CkU3Qgg>
    <xmx:h5z2ZzZ7WiCmp4sZvdoocklgHZiXZXbt_i2LvM6eWrCg8y2RcF5eRQ>
    <xmx:h5z2Z1CW5_uxueBOV24t9UGGki1NZ76N5o6InHz9Kk6Y6SHvEjWyHw>
    <xmx:iZz2Z3z_uLxm7F_ZG070Y08vLseOaj9es3758GkaThsd27sU5h0BuLLi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BBAC22220073; Wed,  9 Apr 2025 12:12:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T1a2df1155f45051f
Date: Wed, 09 Apr 2025 18:12:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ard Biesheuvel" <ardb@kernel.org>, "Kees Cook" <kees@kernel.org>
Cc: "Chris Packham" <chris.packham@alliedtelesis.co.nz>,
 "Doug Anderson" <dianders@chromium.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Andrew Davis" <afd@ti.com>,
 "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Xin Li" <xin3.li@intel.com>,
 "Ruan Jinjie" <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 "Eric Biggers" <ebiggers@google.com>, "Yuntao Liu" <liuyuntao12@huawei.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Dave Vasilevsky" <dave@vasilevsky.ca>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Message-Id: <b5a57fd6-ceae-45b7-b8eb-1ea85001dd45@app.fastmail.com>
In-Reply-To: 
 <CAMj1kXHks1_eC=cAmkPC45deMp3_VdxckjyRoWvMovdBekg2bQ@mail.gmail.com>
References: <20250409160409.work.168-kees@kernel.org>
 <CAMj1kXHks1_eC=cAmkPC45deMp3_VdxckjyRoWvMovdBekg2bQ@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: Remove ARM_SSP_PER_TASK plugin
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 9, 2025, at 18:08, Ard Biesheuvel wrote:
> On Wed, 9 Apr 2025 at 18:04, Kees Cook <kees@kernel.org> wrote:
>>
>> As part of trying to remove GCC plugins from Linux, drop the
>> ARM_SSP_PER_TASK plugin. The feature is available upstream since GCC
>> 12, so anyone needing newer kernels with per-task ssp can update their
>> compiler[1].
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Link: https://lore.kernel.org/all/08393aa3-05a3-4e3f-8004-f374a3ec4b7e@app.fastmail.com/ [1]
>> Signed-off-by: Kees Cook <kees@kernel.org>
>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I was going to send the same patch and double-checked it to
make sure they are actually identical.

        Arnd

