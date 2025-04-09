Return-Path: <linux-kbuild+bounces-6550-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD3A82C35
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 18:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50DC716E0A5
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 16:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B647266B72;
	Wed,  9 Apr 2025 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BIC2fPhu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lrNjiqBJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2D267706;
	Wed,  9 Apr 2025 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215442; cv=none; b=t72yI/DugDDOQrpGVWDcdiYp5vW4UyOKotiR6bODXEGuXkmaKzpx8dqcE05kuUwnq0So7FQMSRL2+ageBebNkoFkthMtsU82Tk4xIJY+U5R7q/MkISvK5btI38t3dLP7253ftfn0jM/LEROnlk81qpZtlvSRxK3CAEz0M3s4mgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215442; c=relaxed/simple;
	bh=XfHW06Dy2VMKjf/LFoF0QIsnA7+wPxtG7THX/fmY/Hw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=U0wsdgUeaJCFJyqdfMVXEUdqUV5QgCX1H3lzr5aswO5T/CwuMNjP9Bva/nCxbIvjZnNvC6kzJHpncqKCQwIma1EbsSvs0qdlOt+mtKJ8AabtxXXpKvXfomy0gwuj3CS/CKppjOO5NUuYrlxO6qK+G64C4+4LIL8dSth8GVHBN+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BIC2fPhu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lrNjiqBJ; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9693C2540102;
	Wed,  9 Apr 2025 12:17:19 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 12:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744215439;
	 x=1744301839; bh=6yCL3QYH4w/BEqNIYYKQKEvXiLPGj6zFsd+qqSWKc2o=; b=
	BIC2fPhuFN4O34uzXrc7w9sWwETNR72n7+NmaftayQmIoEfS8y6JwVJh2fUFgg7b
	uA9kxEHaGSPeist88Axy+j+eGenO5oSRqRbqh63ISxOhrlg0LA4lKXd+lHNvvZK9
	MCtAresvPzXgqFmFh2BhZyHZH1FtCxNctmf0HGkUhAViHRcYBHVlUAFnwo6f/z4n
	keqnAl/He0NOyEZEHAhUvMe4DPUjtBNcFbB80sVzYZ0vjD2O70rTSpBLw/8ThLfX
	eanMwfCpi+m0+i9fsiOhV4t4s3rNQ2JczoHlyhFD4QPPUQ7c0RugzCY5w9HoJEHu
	U0V/WWUA6MXMLY1YE17eEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744215439; x=
	1744301839; bh=6yCL3QYH4w/BEqNIYYKQKEvXiLPGj6zFsd+qqSWKc2o=; b=l
	rNjiqBJbS/d0WYLdu5AvBsetdsU73PENU43o7fiHGn7epBPAtbR6dEfwWKETVze9
	cr6q6FqzWIqXyXo1HZe0kircH0rEfdXBDiGJDSpb5cSft4gSVYhXUOoirbncbmZa
	ztOFDen4HzVgg+BFwA2tGg/fpWFCQRAwc2Xtky/kMFUEbLmoEIXQE6P62l39fln0
	M7C8aPM2EQF6gcu7BJWnOPM0rWraNgHkijoJkQlwr9E2Qck8AtFERYIDt3+Re6uL
	/FiMhP6w84ACeckOELBT5r/KijUzMF9L91lWgUn2mR3dpwS5BcEBErS1L4RCxNem
	L5SJDUDsonBaTwa6bo/Ew==
X-ME-Sender: <xms:jp32ZzdgkZ65iEXkV1kwTPd-LkJxwkOOiA__J4G6FJrBahmqATDZkg>
    <xme:jp32Z5N9Ac2i03ezWLg0C4p59Jsor6WeXWdPyk-7becJwnKMkW6IZARqtnU_d56OT
    s8blHdeUmLMmgrlGG0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeigeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepnhhitgholhgrshesfhhjrghslhgvrdgvuhdprhgtphhtthhopegrnhgu
    rhgvhihknhhvlhesghhmrghilhdrtghomhdprhgtphhtthhopeguvhihuhhkohhvsehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hkrghsrghnqdguvghvsehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopehk
    vggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jp32Z8jhWNUNs_fGPEwj7VXCuAZ-OSBHky21rJzSv_C4iQAECV4b7w>
    <xmx:jp32Z08-9Yq_wYejE7bwe2RdYallQdJ2OI7ufSn8fv31rsUURBFpQg>
    <xmx:jp32Z_tFfq-ue-j7rEcqfOgDEna_D6_HYkY_p2ZBPww1s4NG31_ocA>
    <xmx:jp32ZzHq7dkQt9pI32EaIrDnq9vN27ZLtG4iXiFAz5PHOt0-3zHhMA>
    <xmx:j532Z4r6N7xgeqO_1YO1xL9sDbbPqhsupKI8FDSAONyYX8xO3xVxacgn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 818DF2220073; Wed,  9 Apr 2025 12:17:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T654dc7563e4388c4
Date: Wed, 09 Apr 2025 18:16:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kees Cook" <kees@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Dmitry Vyukov" <dvyukov@google.com>,
 "Andrey Konovalov" <andreyknvl@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <32bb421a-1a9e-40eb-9318-d8ca1a0f407f@app.fastmail.com>
In-Reply-To: <20250409160251.work.914-kees@kernel.org>
References: <20250409160251.work.914-kees@kernel.org>
Subject: Re: [PATCH] gcc-plugins: Remove SANCOV plugin
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 9, 2025, at 18:02, Kees Cook wrote:
> There are very few users of this plugin[1], and since it's features
> are available in GCC 6 and later (and Clang), users can update their
> compilers if they need support on newer kernels.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: 
> https://lore.kernel.org/all/08393aa3-05a3-4e3f-8004-f374a3ec4b7e@app.fastmail.com/ 
> [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 1af972a92d06..e7347419ffc5 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2135,15 +2135,13 @@ config ARCH_HAS_KCOV
>  config CC_HAS_SANCOV_TRACE_PC
>  	def_bool $(cc-option,-fsanitize-coverage=trace-pc)
> 

My version removed CC_HAS_SANCOV_TRACE_PC as well, as I planned
to have this on top of my patch to require gcc-8.1 as the
minimum version.

>  config KCOV
>  	bool "Code coverage for fuzzing"
>  	depends on ARCH_HAS_KCOV
> -	depends on CC_HAS_SANCOV_TRACE_PC || GCC_PLUGINS
> +	depends on CC_HAS_SANCOV_TRACE_PC

So this dependency would also disappear. I think either way is fine.

The rest of the patch is again identical to my version.

      Arnd

