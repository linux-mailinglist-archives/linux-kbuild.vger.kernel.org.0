Return-Path: <linux-kbuild+bounces-7805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F13CBAEF259
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 11:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFAE0444CBE
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 09:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F622417DE;
	Tue,  1 Jul 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eMhgA/FI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jQeTEXkU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CED1E570D;
	Tue,  1 Jul 2025 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360482; cv=none; b=Lrp1RfYrjdcJwxYpHqpEFNPUuoozw5PsfNLKd1SH81v8ObjyL2SfWGg0PHjk+AaTuUIgWZIGhcz3OzjOVaM2wxXpHMZ6bzgc1KiIiz58WSkUvnNSvGixckVY21dh19GplOuoz3/hNExVM6QAB76Z+9sqLGIOVS2AZn+2gaVCLrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360482; c=relaxed/simple;
	bh=OGSWwtje6N4tIG9QUVOFcGeHy89m4VbOCuXqRkkgLL8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tNqbeRON0DYpz1qDHtj6ZtG6y80roI+/OWZEOwIYzLzZo1Rbl5yK5Y5NFvCMQjzEvxWcWsyf0BeN2Hz5jibxJB41Bf/tUm8q370xy8G4lg9TZHJPHw2m063ckV4Rwe9kzNFc0YpcUbMQbGnNRjnW8vPqQZDEuM+y1z98AEBE3qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eMhgA/FI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jQeTEXkU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGSWwtje6N4tIG9QUVOFcGeHy89m4VbOCuXqRkkgLL8=;
	b=eMhgA/FIoEaFYpjY1UEJgR5Ya6qEjRwrGj7oEW6Fg4IB1rtMmzMnIej4IzVnXpsTiUubgd
	mIEESTJR2vLQ+yDg7A+SL/xccJP+dyLMqDQruQ5XPP/irX66JcnbkauAe43COEq49EQwz2
	kqHzrYHuGh9oh9+QqEBQjz6cGldMRYClMqnNRuSV9jcjmQ0ydrmEwD/gAQfThcXWmudOOd
	x+FuaMaUQWG6Ih8ZywNYXf6VvjdDON5fXJ+41x2f8cAX1235U2Esju0kMmfdMClykU/4lG
	UhCjk9OL8h18KdHpGRkKJ9fBdQiT5GV5CrU0Q3j1FEEafbef3ptrbnbm6RP5Bw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGSWwtje6N4tIG9QUVOFcGeHy89m4VbOCuXqRkkgLL8=;
	b=jQeTEXkUW+A/IHg+al/aCzHyq6SSzVwMujQLeipFToUBoTQXNIZs5EjAABHEnJ5+7U/iTP
	jhwhAKFe4lrISqAg==
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Agustin Vega-Frias <agustinv@codeaurora.org>, Marc Zyngier
 <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann
 <msp@baylibre.com>, Masahiro Yamada <masahiroy@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
In-Reply-To: <gbjim7wxszmwfvm523bgyfxf5mk5773pafdxnf2wf4mgaebsmz@qfeejv4ilwxv>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <87ldp9m7la.ffs@tglx>
 <gbjim7wxszmwfvm523bgyfxf5mk5773pafdxnf2wf4mgaebsmz@qfeejv4ilwxv>
Date: Tue, 01 Jul 2025 11:01:18 +0200
Message-ID: <877c0smgip.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30 2025 at 21:40, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Jun 30, 2025 at 08:01:53PM +0200, Thomas Gleixner wrote:
>> On Mon, Jun 30 2025 at 19:23, Uwe Kleine-K=C3=B6nig wrote:
>> > The modpost section mismatch checks are more lax for objects that have=
 a
>> > name that ends in "_probe". This is not justified here though, so rena=
me
>>=20
>> That's a truly bad design or lack of such.
>>=20
>> Why can't this muck use foo_driver(name) foo_probe(name) annotations to
>> make it entirely clear what is tested for instead of oracling it out of
>> the name itself. That would make it too easy to understand and analyse.
>
> I don't understand what you're suggesting here. Either I got it wrong or
> it is insufficient because every object is checked, not only the driver
> structs. That would result in more exceptions/special cases than we have
> now.
>
> Anyhow, I agree that depending on the name is unfortunate, maybe we can
> come up with something more clever?

That's what I was referring to. Doing checks based on struct names is a
bad idea. Having distinct '...driver_probe(name)' and ...driver(name)'
macros to distinguish the functionality is the proper thing to do and
way simpler to analyse than names.

