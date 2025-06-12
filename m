Return-Path: <linux-kbuild+bounces-7483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF37AD7808
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 18:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AFEF166472
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 16:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A165A29A30A;
	Thu, 12 Jun 2025 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ejZaZXGU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LIUyUDZ/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A80C2F4337;
	Thu, 12 Jun 2025 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745028; cv=none; b=lC5/JueLK6Ua5HBipUb/ymMHgoWVCn6c1v5TxaBbNNiersNgPenE+vU5Mz//uTeupEG2VQgyZQzZ2EYMVjVKmlMjNdhS+gqQ6+4oXqtMXYR/yd6fAcVNcFGfCBvQqtlsJM9+kNuHGqtvuta5fYEC2+Hj48U5iFoKChBktUWyCmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745028; c=relaxed/simple;
	bh=ZdAQYl3xLxxVDP9k8YsKDv4QGuAbrDv49F2oSRw6+K0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=f0zOIiwrZ1U2VkMSWwy5GBuLIHy+3yqJfWqB1iPkZxIR1VyjPGeaiq3LHraviNL8X4VnKE05DUFz9QHRW9W5ktLv3/E3SYyocKqJaRcNeXaamHhWqpyoh9MHdc5tfO1RBUxsQIclOdvKOvs6ZlqA0FsXIWV25HoTl0gUkLcQQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ejZaZXGU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LIUyUDZ/; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 714B313804D5;
	Thu, 12 Jun 2025 12:17:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 12 Jun 2025 12:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749745025;
	 x=1749831425; bh=Y6bA1Hx4Vgb3DM5g7jT8tbjx0SAERhSgVJ2+7reS3V0=; b=
	ejZaZXGU8rk+h374vHGBo6ngEfcT+M1zwLXPpzRfYGu48EkpsMRWsieBdQCPCrAM
	neLQAehAGLJY+rJ3bZ+tmRUXKq8dxk6TqQIq4ALbIH2Nl9RzVTWlOLVdSf159kja
	Rn17ct+YYV2FYwY1yvw+HX96D4SnCgYM5IwCr2TENUbIMhTPuV6CXo714Zp8jeFP
	ueP4vI+EH8QAW9tP/NJf7k9wEf056ADr0apNoIto/cLsapz2sPnp72NIkxOve2AF
	GWcRWSvCW34AFJ1JZ5hUKmb2nb4uMBaFTfbXQKCt+dvaiS90mocaxwn+0oPfgnTk
	U6v3rkOEGK/Yao6V4FaSMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749745025; x=
	1749831425; bh=Y6bA1Hx4Vgb3DM5g7jT8tbjx0SAERhSgVJ2+7reS3V0=; b=L
	IUyUDZ/xYr3nkCJlqsd/YzLB8KnSs0nQRVoFO0k/7zmM9ivM87qpttvNGseYMe1f
	SpAvrGOZE+Vvsg44wx4nxLzKA57yhlx42ffZTzskfCTHnFy7aadZQ+ekidjWnxvO
	Y27vVbaAFgBbVjqjJ7zA2MSaEjJt8+CSH+Wcagd7oI2h+An/RPNcA20iXr9sukF/
	lbuM75r2HUT1pJ46k/l3qlxHguMzEanUwItqTp9b8k4UHLStE86RzwI8nVvmtY5G
	9OWjyK9+p6RuLUAt61MTc+AH1E8zScHZ/vm/VlwIDqfF4Bb1Altav5r2k/56pKeV
	u/j49jjHO77RXi7OxTjfw==
X-ME-Sender: <xms:gP1KaNfcYcrf7nlZhzvY7ZCGvkmb-GhgJRhK4JaTj7Ki39f8JslNew>
    <xme:gP1KaLNNPmh-gHpwvJlS2cowaJNTPgDX-bMEe1EIrG1SGT4MbJMoh-AGct_MB1Dfh
    7F_yiq8du2sWCTKQD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsvggrnhhjtgesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrg
    hsrdhstghhihgvrheslhhinhhugidruggvvhdprhgtphhtthhopehhtggrsehlihhnuhig
    rdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:gf1KaGg_ui7Z7HMs-tr7oIJfm--Vq1Lo3inmvFlJrAaK_5TLLgd9MA>
    <xmx:gf1KaG_bByO1SVI0PrYyi20yDuJARiZne68Fgj4XhzdYfYzH9YLFbw>
    <xmx:gf1KaJvsFcJqlvkEZ7CPINnx-Y4W7IL-CuVcZJrtvGAMAIuBSiKfPw>
    <xmx:gf1KaFGcs1-5d3H6RcBrgQUcYWSornybixw3MeCpenqPPoCtyoxPeA>
    <xmx:gf1KaI2qyUhCN8LK30cv-cN8DeELLnARmmaRryhRWzW6Gcqj7bGyy2cc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E3AF8700062; Thu, 12 Jun 2025 12:17:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T0c97bc968294a699
Date: Thu, 12 Jun 2025 18:16:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: "Heiko Carstens" <hca@linux.ibm.com>,
 "Sean Christopherson" <seanjc@google.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org
Message-Id: <e67ad81a-2d26-4418-b632-4d5204b38796@app.fastmail.com>
In-Reply-To: <20250612160850.3007038-1-masahiroy@kernel.org>
References: <20250612160850.3007038-1-masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: move warnings about linux/export.h from W=1 to W=2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jun 12, 2025, at 18:08, Masahiro Yamada wrote:
> This hides excessive warnings, as nobody builds with W=2.
>
> Fixes: a934a57a42f6 ("scripts/misc-check: check missing #include 
> <linux/export.h> when W=1")
> Fixes: 7d95680d64ac ("scripts/misc-check: check unnecessary #include 
> <linux/export.h> when W=1")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

