Return-Path: <linux-kbuild+bounces-8561-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 170FCB30118
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 19:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CD0D1BC214B
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 17:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1DE30EF9B;
	Thu, 21 Aug 2025 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nRbPuoNb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AcZBrPfX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F7C3101DA;
	Thu, 21 Aug 2025 17:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755797280; cv=none; b=F3/EFXgncp+gtMcVkbxbe2XgpgFbpBYLOy6zKVsqOrTGkmvm5/+JXqYQQYdl0//BJLbskWyiFGwlX8SisdXTTe5/h3X/FDFtMKZ/7/K3hXeWBuPtbzrEYpbknNECEoeyIay0g9c57ntGo4dDaJsjhNtW/dGJu60mP08o80nXRWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755797280; c=relaxed/simple;
	bh=k+fZbR7vi6SORcMtxToI0Uh++OGm5fQDcRIHv/PMwK8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=soa1/N+zZcljR21CeQbmo/WfE+GCOaOcik6XYsCGwkeE6FMTfnmdA8ubOKdIJSpZbw5J2j5tTER6+o6I7D1pq285bwIv6INLMHkY435vhl9snhyXvTt9/q7jgP/WUo1ZGRhVFVTwm/gdSdrMAmFB8rM8AjDM312Ua93KLGsbK68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nRbPuoNb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AcZBrPfX; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id D17EB1D0008A;
	Thu, 21 Aug 2025 13:27:55 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 21 Aug 2025 13:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755797275;
	 x=1755883675; bh=taXIpcBs8hxawlZihrYCKJolW66e8A/5PxtQ/jtVgvk=; b=
	nRbPuoNbpuBpfLzumrXdg4mdt6j/C/Ctf2+zU1j9ixixcPXAAe8yz51gdwsCEViG
	WR+OlTX+08Hstl4bwhgn2i1GSo9Cd3mfkK90mDG9Ki8AVSM2PxbaDoyFSDKIc13F
	S9LkdDgF5qWSsgq8SUnmmSrKaMxbjpNcF6ZykJTDp0Gx8GWHozhVTabxUbxZ32zy
	VPBrw8SOogl3sLNDPjF/dk5yUQs+CQgkovBqh1TYlaB3SsynaqQODDcgx0eJXnKn
	uRBrAwKKn7/o1omStONZbRhDQpWV94PKhzZ/BxsK6nq8BCq1mkWptCa7AIaNux1T
	is41sFXg8m7ElGb+7t/Cgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755797275; x=
	1755883675; bh=taXIpcBs8hxawlZihrYCKJolW66e8A/5PxtQ/jtVgvk=; b=A
	cZBrPfXHzxdUp/qlAZIN6btM/oSLrh7ZJg1eBo0NH8ZY6321izoDQs7uQqLKyx2i
	lArOyVNFjYArInARLb0lyw2Mlwg4XpFOiqO+fmkvucdFoSvEL67QSzncQgB/4jRF
	pQ0Lsv0Z6EWaWvpBNI3OQkiUyI3/wX1I16/GoJAnUna71aTORMg+5KAg2CqhPK4W
	mjwkEzVpZbgq59fU9zTXp5uENvINNfYGqXfTucRNw6k4WGv+o6YtXTUp98omVpZY
	SQRJQdoExMSiLjIAHdnuSQBS87mpzjvGMp3imh1aZkdp1kQGDHdwbMayRAXuRSpt
	3/DQjIPPH/DzOJ/Xw3l4g==
X-ME-Sender: <xms:G1enaFfxmiLSpr9ATX7LrlWwfUbX2hCEHEZYu6DoMs3gYTpcsJp9Bw>
    <xme:G1enaDMI9yaJQbhzIfl7mZ0B6nyvLC5atrk1bgBbAOy4907Bc8bk13grUvEcuP277
    Plh51RbevSUfJ5lf_I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedukeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnheptddvffetkeettdefkeffhfdtffeuvdeludeitdegleehhffgjeefveejledvheeg
    necuffhomhgrihhnpehllhhvmhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhitghkrdguvghsrg
    hulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhi
    nhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmohhrsghosehgohhogh
    hlvgdrtghomhdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinh
    hugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtohepphgrthgthhgvsheslhhishhtshdrlhhinh
    hugidruggvvhdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:G1enaNX064uVU-iH7XnV2MlWkLM2oaTjtExwfIwuD5WmgqXVSAopnQ>
    <xmx:G1enaGPgGPPb5QKBqQmq_c9taLjX7RjDSBAiFFuwmp2AoTAAmSphzQ>
    <xmx:G1enaA1PWYdzNW0ebO3LszW1CY83VJCY9q7STFKBttBF018HbP7_qg>
    <xmx:G1enaKRx09Ppik-VZnkKsxdLEBui5gW1ZA8c1IDLEEAiB_ZpSjCobg>
    <xmx:G1enaIgfF_A_rMkUDCQZPvx6BxaQXdQzYJEMDnslao78bv_PnmJaZ_eU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 36230700065; Thu, 21 Aug 2025 13:27:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AH1nf54z5bBN
Date: Thu, 21 Aug 2025 19:27:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Kees Cook" <kees@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev,
 linux-kbuild@vger.kernel.org
Message-Id: <6c23f58c-23ef-4f15-9fb3-b0f29c4e4880@app.fastmail.com>
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-1-c8b1d0f955e0@kernel.org>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
 <20250818-bump-min-llvm-ver-15-v1-1-c8b1d0f955e0@kernel.org>
Subject: Re: [PATCH 01/10] kbuild: Bump minimum version of LLVM for building the kernel
 to 15.0.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 18, 2025, at 20:57, Nathan Chancellor wrote:
> s390 and x86 have required LLVM 15 since
>
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang 
> version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
>
> respectively but most other architectures allow LLVM 13.0.1 or newer. In
> accordance with the recent minimum supported version of GCC bump that
> happened in
>
>   118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30")
>
> do the same for LLVM to 15.0.0.
>
> Of the supported releases of Arch Linux, Debian, Fedora, and OpenSUSE
> surveyed in evaluating this bump, this only leaves behind Debian
> Bookworm (14.0.6) and Ubuntu Jammy (14.0.0). Debian Trixie has 19.1.7
> and Ubuntu Noble has 18.1.3 (so there are viable upgrade paths) or users
> can use apt.llvm.org, which provides even newer packages for those
> distributions.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>

