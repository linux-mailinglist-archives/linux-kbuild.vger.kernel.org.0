Return-Path: <linux-kbuild+bounces-7811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0097AEFC3B
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 16:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36317169947
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 14:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B0A1A0B0E;
	Tue,  1 Jul 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E4A9zjCc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kR72CZU6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2D222759C;
	Tue,  1 Jul 2025 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379854; cv=none; b=IxwtWZrNHY/K5/lf2h77tJJ7vLQRqjJFUdaAxM/i9e6KFuuu4O3xkgPEfTBE+MfwGGPEZCdtFHWNoar+qe+G9ISTHBLvylTPQsAarRVQB3n6bPxoP+jV/XPSItqVpsRwGhy0eKE2pFYOrVZUu223JeBj9FV+47Lvw7KZtM9Oc8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379854; c=relaxed/simple;
	bh=u8jo3wPwcr0SV5rAGgSDsWJrWtE0o0znfRHq8ZvN4dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FYEYGTWGDf+FOZgPHkiRppJKwaCANusgURBRSeP/Z2aQGoCdI3zgX9Uyl+m3/AE8XixBV54b4WGB0AEHx3S3LOrI6dTB3oUGGSNIXjl42K2AfGDP94HIzLac8yO/sHNBSZOS2E7mk/aBkBcnpMN0XvXN/6Y4TcyFNLI7HaI80oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E4A9zjCc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kR72CZU6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751379850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yrhIzJY6j2GCP1j8YoMALxbdfE6AuNqMmruju79XP2A=;
	b=E4A9zjCcH4eONXmYKdpyUKiuy5Dvb5R7iLfUkY0WeKjzJTfWN/G+nPyx9lnF1XNzWAlOOL
	nkt2uPio8x7xkPkGSnoT5XA4q6rkIIJWI51X/crzEStgHKWdY6EXxVuvBD0obldqQPEsJr
	y19XgfshrTA2tdlSRIo/YqEeydehmVZCt2jQfGuVcSFcxJ4cp04piYqnXMpZRrzQ4cVr4M
	SNfY5YGhcXvtis++EvdUUB+IPs0c6fRF4CA2Vlkqf/Y0JIYuf12PAgabmOwCd6WHKWJreW
	bhKkcHWgQbu43Y2IcNLCUOS2tPCxNmJ3zkyhZvEbKYgKoCjVxA0HbUtVjX0twQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751379850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yrhIzJY6j2GCP1j8YoMALxbdfE6AuNqMmruju79XP2A=;
	b=kR72CZU6E90JaYfqUdECtEWs1GmTpnbAMrv8ueJycdhm55zP7RKt8aCXJR5LS4GCwEapIk
	vtSEo6MfmBUsGiBg==
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Agustin Vega-Frias <agustinv@codeaurora.org>, Marc Zyngier
 <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann
 <msp@baylibre.com>, Masahiro Yamada <masahiroy@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
In-Reply-To: <53ugz6qg3rfgpcokrre6sqfr73tdjwiz67dvgvlnbiu6kkyc5u@bapjxdheqrzt>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <87ldp9m7la.ffs@tglx>
 <gbjim7wxszmwfvm523bgyfxf5mk5773pafdxnf2wf4mgaebsmz@qfeejv4ilwxv>
 <877c0smgip.ffs@tglx>
 <53ugz6qg3rfgpcokrre6sqfr73tdjwiz67dvgvlnbiu6kkyc5u@bapjxdheqrzt>
Date: Tue, 01 Jul 2025 16:24:09 +0200
Message-ID: <87o6u4kn06.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 01 2025 at 15:58, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Jul 01, 2025 at 11:01:18AM +0200, Thomas Gleixner wrote:
>> > Anyhow, I agree that depending on the name is unfortunate, maybe we can
>> > come up with something more clever?
>>=20
>> That's what I was referring to. Doing checks based on struct names is a
>> bad idea. Having distinct '...driver_probe(name)' and ...driver(name)'
>> macros to distinguish the functionality is the proper thing to do and
>> way simpler to analyse than names.
>
> A driver struct should have no reference to .init.text (i.e. no callback
> to a function marked with __init) no matter if it is registered using
> module_platform_driver_probe() or module_platform_driver().

I came from this wording in your change log:

 "The modpost section mismatch checks are more lax for objects that have a
  name that ends in "_probe". This is not justified here...."

That's the underlying problem. Using object names for deciding which
check rule to use is error prone and wrong to begin with. That what I
was referring to and there are obviously different rules for these
section checks, otherwise with your rename there would be no
difference, no?

I'm not talking about what this driver should do or not in it's
callbacks, that's a different problem, independent of this discussion.

I'm just horrified by the idea that such issues go unnoticed
because of a object name ending in _foo.

> But even if the requirements for those were different, how do you
> signal in the binary if the driver was registered using the normal
> (i.e platform_driver_register()) or the platform_driver_probe() way?
> Or do you want to check the source file?

No. We have a lot of magic already which puts annotations into sections
so that tools of all sorts can extract them for post processsing and not
make magic assumptions about names or their endings.

It's clearly simpler to do analyis based on:

     magic_driver_allowed_to_do_stupid_stuff($name);

than on

     default_driver_whatever($name);

both for tools when the magic macros emits section data and for humans
to grep, no?

Thanks,

        tglx

