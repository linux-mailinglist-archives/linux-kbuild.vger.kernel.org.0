Return-Path: <linux-kbuild+bounces-5796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E8A383FB
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 14:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94BA13B32AB
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 13:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A7E21CFF6;
	Mon, 17 Feb 2025 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="m7ovJ0Cq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p/oNoCF6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7DC21CC79;
	Mon, 17 Feb 2025 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797312; cv=none; b=Nc4DW6S9D71XphmA7PHEMKx7/6vUtYqkO5iGn9W22T8gGzJUzDx5AmeHcRF2AnsqivcqoTCyc4lpSlCtDIVhqv5XhxxADEOh9hQz86LGyJaOJWmmx+6KW+gwos0IRnuYPgZ2JlUxSB8gFajhv/gw/pkdWhmeiAUHzSGUtoOEGS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797312; c=relaxed/simple;
	bh=2jD9QuN6VW28G8GTwlxHKo4MVefLSMtcuuBQ7ppj4Do=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jlcA+8vWuG+twyo7o2udT3Z+yScAO21j8RqaWYjjPFwsGGmAUz4/fWdNxyEGwve7OsBpgSK5HeatNwWkfA4E/kYvnh2Gxag6u/hguFlMry+zLjjfPJIFAlMQKk3dWyQoG409XQPZ4OrcHBTAdUh9ePrl2ef1Sj9zb1xqjuOTuPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=m7ovJ0Cq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p/oNoCF6; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 3B76B138098A;
	Mon, 17 Feb 2025 08:01:49 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Mon, 17 Feb 2025 08:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739797309;
	 x=1739883709; bh=fGA+ofvv0mZ+MkkWUzOVgJmFJURib3VnJcpnpL+ZHus=; b=
	m7ovJ0CqOB+FGXNyWezZXR56R+dUPXg6y5/SjLuu+Z77Eyw6oLdhktPa22dnJyAq
	yZszsehsAJibdRlQQ3b0hBWrx4Aekp6tOEm/kBarmM8x+58Ewc8I8T5vhjgiqP+d
	Tkyh+51baL+h+SmlorvlQWJ+hb5nceMOegTiO2rCFxMR262XQgLMyuW17leo8SgK
	u7e9bU4WIs9ldGbq8om4mnP8TWzwzXTp4hGfEvQ27uIQldcwqoG6H55c0LUQIN+I
	CF+sHtRpHpEGtZMhAO+Wwsdsa81317GPh7ODhe2X5A6m1DUcmvLwdiR9/L8bCwLk
	vwXymEPs4zjaLRZP2YfNSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739797309; x=1739883709; bh=f
	GA+ofvv0mZ+MkkWUzOVgJmFJURib3VnJcpnpL+ZHus=; b=p/oNoCF6+AG2rsT1U
	oJoNbzjA2pwiZ6qSDsPpAm+UG3XX0E0me0IOaLb1y4QZes7coe/crzQCAJCjYgAi
	O3kpT2OHrLtN3uwDpNVAgG+2hf5tT8b+EJpNI/LSJITAOahD9YngzVNtTjIeIqsD
	CaHug9xQA7KtlZGvP+356t9HYT5JqetoOCu2PY/YKxGp6yAOQcrQSwo8uErfo/pS
	lMkw7vWWyTnhMsmbUyXokhNnbAIhUq+mwmCMBumUFu2eO0bQfmTy2yRLzY0Cr7w2
	RQCZR6bPUgd63iTX1s8YizTYbH1u4vjPtKGTtZM7Oa4957KmcSz42QMIKkjG3Adp
	E3m1g==
X-ME-Sender: <xms:PDOzZ0DdmgvgEDBJ02HcqB5xjLCi2S8W_eUnp2wxItsJbI8HXsmU3w>
    <xme:PDOzZ2jQrdI42GeBUxtyjyxZrLXR4Gd2erb7mIdYo-Ex9f9-BucKlU92SiMqn2qff
    YoRjXlK-eNYE1AQzbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfekledtffefhffghfetteehuefhgfetgefhtdeu
    feduueeltefghedtjeeifffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslhgvrd
    gvuhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiith
    hofhdrkhhoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghorhgs
    vghtsehlfihnrdhnvghtpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PDOzZ3mEfyRqMpos6wPvm0i6GQM0gnYE6rb5Tp63W4Op0L_RT3cCRw>
    <xmx:PDOzZ6yJv22itZ9lTlorwR4ohb5cZzUIOVnxhKUYz7xpV3o1XsrRMg>
    <xmx:PDOzZ5TqER8X68IL5Ie85fbeuYGpYQVjqbrSNqWWClkNNHLtETjKwA>
    <xmx:PDOzZ1Z1uGxPWPR6N3eSKIWV8P7Brtd0Bo6s6a9IRoo3dLUYzxywCw>
    <xmx:PTOzZ6RETDtBvsZ3WkggEr3Qf7EgZ8b5emkQCq69NMl3ro4FQU6xVbZ3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 830D72220073; Mon, 17 Feb 2025 08:01:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 14:01:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Jonathan Corbet" <corbet@lwn.net>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <b1667246-d6e3-46cb-9b76-997e6d6fe052@app.fastmail.com>
In-Reply-To: <20250217113153.161476-1-krzysztof.kozlowski@linaro.org>
References: <20250217113153.161476-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] docs: kconfig: Mention IS_REACHABLE as way for optional
 dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 17, 2025, at 12:31, Krzysztof Kozlowski wrote:
> Several drivers express optional Kconfig dependency with FOO || !FOO,
> but for many choices this is not suitable: lack of stubs for !FOO
> like in HWMON.  Describe the second, less favorable way of optional
> dependency with IS_REACHABLE by moving the code from "imply" chapter to
> "Optional dependencies".
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

