Return-Path: <linux-kbuild+bounces-2573-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 580AA934059
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1435E282894
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 16:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1286818003B;
	Wed, 17 Jul 2024 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="beTfElnY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TCQQ7fuG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF5E1D52B;
	Wed, 17 Jul 2024 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721233501; cv=none; b=W0nxUuvA+J/YYZFLPWHRXdqiPVouiNG7fdvwPrMMna1TJtAJXFjAA2CqEBFXSAsDZDE2eai0Q3AF8fJpCqeznK3ZRAGl/AICpNzy6ejBa7V7o9uLbf+pHWS3tkosKoiU1ddWY0Q28flvdlQWws5TyKOvMMamKIV1TJJ1CfHhwCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721233501; c=relaxed/simple;
	bh=F17R1ylOnAHC4H/n8d8kSyYk/8iTj1Gyafq/NG1afZw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=lgnvfEFKXcgKrK0iT+cMIxTvLgA2b5yCfTj9mEi2lVJCwzwcwFQtAvc1Afm4C3irCPsVUXwajVtJsKsYz0YnP/eTTZOg7LOQsCNgV2poZJY1h/ELYRmHsBWlMHRB7hCUDku69Zo8LrBN0E67IUtTaSw1E6ajUq0TO9KpSghEgHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=beTfElnY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TCQQ7fuG; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute9.internal (compute9.nyi.internal [10.202.2.228])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8566D1140123;
	Wed, 17 Jul 2024 12:24:57 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute9.internal (MEProxy); Wed, 17 Jul 2024 12:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721233497; x=1721319897; bh=1W3K3SSfi2
	iYaeyeomygFHiBI3aPjhu9ub0OyFFAtjg=; b=beTfElnYZrN7CEjAlJZ7NGKvby
	TENCctlXZoWcKs440e4WBcdgdNhnumWfZQGutcmV4zu2Wva9zOGIM/AL+2l/SkCR
	H+pOvSEe3NpUZUFzy02cY7QTtslDstB4bVthOcqefr1pYUd1NDGQI2emXkVoKJLs
	1Yq7TeOnixkcKC3TKRUChwkUYvtZGKHSTjPNOp9f0jmcWMyWHPJWAc5XOL2VDowZ
	7QZTsr/GOu6ay1knZrUMxWHhoIp7LNdI2nWjXe1o9VMAK0gEq6tV0Q6JzTvAU1UU
	fdBtS5d7fVyAgJ/nKhZFiAURUx/VLdqtdsOpKbQKr+gVFXdCegTIAJGwxh6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721233497; x=1721319897; bh=1W3K3SSfi2iYaeyeomygFHiBI3aP
	jhu9ub0OyFFAtjg=; b=TCQQ7fuGL+rFlxm+Sd+6z0Uw7KVyFvDNu8gZ0ouZBgS6
	g4f15WlysNLgKGreIH4YsHrIzvOXKKBCFr6omYXmgj6tlTHWYvZV4mlhLtcUfvdJ
	h73JX8lFmuhSn4gaE2gdQrRVR1+cKg/xo0oWDQYLys9CwBt7WjO6rk5vz+9mgCXa
	Rasc2B40urtNQaHYCg70stcjMeGLUzQti5ujBdf7AGe63eZOPq0WjBhAFpOnGFno
	xreaVlhbWFkjrXFvm11hDtICYO1yHr3OJ5BTytdCx5rzF4v6e1sHsdsEpnDL7dCL
	ZnXvIFpo+9KS+9OEzal8zhn21KWVjsTb8Zsk5Risqw==
X-ME-Sender: <xms:V_CXZhO8LNaIWm9OEYqjHzES-aJ1J6vb57vYjagWZNmehmTJkTU_qA>
    <xme:V_CXZj9Cf4WlE0GpcDUpKjdiX-Gd6XvvyB-v4yVLqzUoj-8ge9IdK4yYsJgdTiyBt
    SUx7aYR6z7Qao6XoWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeejgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:V_CXZgQnKNiojAFNWu0q2_IDsvTp5o5sqCwyHGlVb6BppFO7-V_9oQ>
    <xmx:V_CXZtugudBNAaKQJ9gbPyayyf2vKtHqabYQCifBDi3zb4f1CJrj-Q>
    <xmx:V_CXZpcDthWcwI_QvDfBfm6leE1TtmuWYarYxyhx-D3UX4LFSigpBA>
    <xmx:V_CXZp3N04dHHx_C3Cg_hKujFFEZIS5vxnG-wEqa0iSS_fFRhFjQFA>
    <xmx:WfCXZhRM3b7PRAYC2jZei_gViimYexbCP2msoUXaLlbjp-RBB0Yw_cqy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B2FAC19C0062; Wed, 17 Jul 2024 12:24:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <8333c062-a773-45d3-88d3-ba78e8abbd47@app.fastmail.com>
In-Reply-To: 
 <CAK7LNASOtyqJMET7YuuFzTCkwg02p850PnqCC57-BZNJhyKT7Q@mail.gmail.com>
References: <20240717124253.2275084-1-arnd@kernel.org>
 <CAK7LNASOtyqJMET7YuuFzTCkwg02p850PnqCC57-BZNJhyKT7Q@mail.gmail.com>
Date: Wed, 17 Jul 2024 18:24:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: mark "FORCE" target as secondary
Content-Type: text/plain

On Wed, Jul 17, 2024, at 17:18, Masahiro Yamada wrote:
>
> Of course, NACK.
>
> Now I am surprised that this broken series was quickly merged
> into the mainline.
> I really dislike how you changed scripts/Makefile.asm-headers
>
>
> I will send a correct fix.
> Please do not break Kbuild even further.

Should we maybe revert ff96f5c6971c..3db80c999deb then
and find a better way to do it in 6.12?

      Arnd


