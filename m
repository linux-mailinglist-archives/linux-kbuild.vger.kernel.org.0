Return-Path: <linux-kbuild+bounces-2585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF193426C
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 20:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AE6D1F226A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F153C3399B;
	Wed, 17 Jul 2024 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="d0p+aCQ7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OcH1DZc1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43503111A8;
	Wed, 17 Jul 2024 18:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721242319; cv=none; b=FE+WSM62FQF1+Ku7idiq/Ze1UXTm1avcV0HJTqiJhN8zyvtHTkoHyv98hhQ3WxG9h84t8BlnTdYPW9ubnpMNv0xAXNG0C+47+NRmP5IEm6rEkHOuMInhI0xGyPsvpmJFyMAdCqHucoZ5tQ0i14UJF/ONMs2xQlP2OqvUhXxDXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721242319; c=relaxed/simple;
	bh=4kQaiPSKNT7OrCUL/sikJGVE7tto60s6xdTGAUeSykA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=KVg7k8UVPbZQ/u+JcZw6zDp58MCosf5gO7nU6wIHbB6ucjaOF7B4oxa1JCQ1gGFyDt1xiKUXhgEAcXBFtDhZiy1vnvHVs9JP3RGfG2pU1/IrT3tZDDD3AMkkdI5VpVb/LOlxKiZGL3t/wmo+7cf1tL2qDfjTaQyiYOT6zdM9PGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=d0p+aCQ7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OcH1DZc1; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 5936013800CB;
	Wed, 17 Jul 2024 14:51:57 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute6.internal (MEProxy); Wed, 17 Jul 2024 14:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721242317; x=1721328717; bh=rQzoOAnY/Q
	s9EZwKdD2C6zcON/V2W7TMOgPGeSGSL0U=; b=d0p+aCQ70+p4xAdaoxVyTda9wD
	dztLPqL6UvlfXpIBm+JwaouHmQO/XOPEtANTLQc6cIUIhRjw6eaz7nzE7emA0RA5
	Zw8MWzQklu1PQGQiIoVZKpMuC+D3d5osFcocw7ECWahOGuWJJalXJxluP+eFTwvF
	IjTIyE9XovjFNpvjtO6IJnyTeeg4a60Ha4pzGQRIETcf5+1qLRkCOU7BCBW+W/AW
	DftsXPrx13YgbuK+jcOfdKTviv14KYU4Xt4Tsg5O61ZYzD5Oto0495yelboeGy15
	ywOyF4+LjJuNiPU5Hmg6XhFUU/uiYrXBll6yAM6si9QYsSz/AUdTyhjWhSXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721242317; x=1721328717; bh=rQzoOAnY/Qs9EZwKdD2C6zcON/V2
	W7TMOgPGeSGSL0U=; b=OcH1DZc1reZaLi5Lv1hOHGj2wiucBwByLmoqsI7NzvUP
	iLFv1JOXU53hdsYEcsb4udGw1qdPZ3OjHqcQ7oWONez/Ajwe6+Fq0OcAKFmhr9fW
	6/i/PHrIlp8f9zhH2AZIjG+G5FYxDPSXnLl/LSjTYcpUCLYQct54ePiNW/tIrc0i
	9oMl6wgy5wOB6DVaLz6I1jJOlIL/t2kxUydikQ+vzoYTWf+g6F5mE+amyRc1f1Jh
	DWpItJNRO+cf0AxWRH3dGLyIvUsxpER+HEpSWGZFTEWjNYxBwUfCf3hI3KM+On+Z
	PE3+8HsLuoc1VrMzxIex16dKCaXIeixiMslM3QtJZQ==
X-ME-Sender: <xms:yxKYZrx47q_8T-CofJVcg2jYGbcXMln-cRdOZfxLbrxjBg8T_7kBcQ>
    <xme:yxKYZjRsSMaTIt__P1Wzft1wgfu3w8QrhB7Kei4dqac1L0ZcGgAXFA6bbG3Muwy5j
    9rveTa2Opwb1EmmmEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeejgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgepud
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:yxKYZlUiXU0E1CEdLF1uWhoTJi9lbfDCeZNg4tnz_QkQ4v-0EuDQDA>
    <xmx:zBKYZlhovz6nbSWUE4qjPeVqDLLSsf1yYNDh7s0f4mKFvmRrf5_-lQ>
    <xmx:zBKYZtBBomzSu04XZVj64YA-lQqjj2hLff24IiPOQ5sB1v6zgb8JNg>
    <xmx:zBKYZuKB3ZQZalYCpZhW8yi1TNLEscqH6Te2OU8JSpx0gJZX6r7GmQ>
    <xmx:zRKYZg7qQZTqVQpTg5DJQ3J7UDLkEVLwuVlSCRDP1QjOSG24szTcWobV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9DE0619C0063; Wed, 17 Jul 2024 14:51:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3115c9ce-d7ac-47e3-91e8-65aef4826760@app.fastmail.com>
In-Reply-To: <20240717162421.1402773-1-masahiroy@kernel.org>
References: <20240717162421.1402773-1-masahiroy@kernel.org>
Date: Wed, 17 Jul 2024 20:51:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: fix rebuild of generic syscall headers
Content-Type: text/plain

On Wed, Jul 17, 2024, at 18:24, Masahiro Yamada wrote:
> Commit fbb5c0606fa4 ("kbuild: add syscall table generation to
> scripts/Makefile.asm-headers") started to generate syscall headers
> for architectures using generic syscalls.
>
> However, these headers are always rebuilt using GNU Make 4.4.1 or newer.
>
> When using GNU Make 4.4 or older, these headers are not rebuilt when the
> command to generate them is changed, despite the use of the if_changed
> macro.
>
> scripts/Makefile.asm-headers now uses FORCE, but it is not marked as
> .PHONY. To handle the command line change correctly, .*.cmd files must
> be included.
>
> Fixes: fbb5c0606fa4 ("kbuild: add syscall table generation to 
> scripts/Makefile.asm-headers")
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: 
> https://lore.kernel.org/lkml/CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks a lot for the fix!

Tested-by: Arnd Bergmann <arnd@arndb.de>

