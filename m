Return-Path: <linux-kbuild+bounces-4319-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E71599AF8FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 06:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABDDB282FCA
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 04:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2827118D621;
	Fri, 25 Oct 2024 04:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KZAJuGyl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch [185.70.40.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A9D18D63C
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Oct 2024 04:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729831977; cv=none; b=cSTpRvae5UFIICcPKkF+Ur9bln6zSHZQ20KvNjw3v/tubBSEVWuEfCg5sgMOv/dNh4XBkcBSreT1Mfzaihz7SPfLSilnfxrYRS3b0F79dwVyCOzBNf1h4KZQiEPCH8nfxv9X2oRewGLmkvhDYLfnYuhRucOpTIU+gKNH26YkeuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729831977; c=relaxed/simple;
	bh=RGGpCfZfpksqP5CpiBryi//KERGu65h7PTpZDydu34Y=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ehOB1hc7ZAlc48/TsEVzU8jB1pOpxhduhs/TFObGUjWorWrHw9F/FYMbCC6jrzGDtQjrrjTn5SK2vB4Q6zFh8v7mL4zVtyTr6HKThGh4y/zT7A12jjJqFXJH3/40PMU1rqFl3+EYos0IptAj9fE/CY+ozAm0fOtUXeti/rIe5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KZAJuGyl; arc=none smtp.client-ip=185.70.40.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1729831966; x=1730091166;
	bh=RGGpCfZfpksqP5CpiBryi//KERGu65h7PTpZDydu34Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KZAJuGylY36SM06guinxRI52yJB3ndWuxWumXC71pZGHtKtV7n3fjtvCy90ueAfLx
	 vnYuJ8uAtI5NcdNtQddgkDKjtwt56DRr0aU/KQrRxEhRT6lvP1yGkGKFdK9yXqOjIs
	 goUfMTjswtEIXa8Os9eWSeVhmJqvyikZnT8wDWuWOaQ9IyN20JgGNNayd3TWyWZpO6
	 XDJid5E/PGk2IVouBmFJOeXrQlZ/af/km8AO6ettEIk9kYGn08G5o8GvLamQZ7tDSK
	 yb6Kd/mj6fuYReWZF5NbjCqF2cnnMzJ1DTgMEZ7l3sobJAt22YOKngMYXtlXRTHrtA
	 mDaWhYf9BpahA==
Date: Fri, 25 Oct 2024 04:52:41 +0000
To: masahiroy@kernel.org
From: Edmund Raile <edmund.raile@proton.me>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org
Subject: menuconfig: missing options in drivers - input device
Message-ID: <5fd0dfc7ff171aa74352e638c276069a5f2e888d.camel@proton.me>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: b7d4de6d7f34852a123a3b469c793833afcf5c2a
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,
I'd like to report a regression to menuconfig.

In "Device Drivers" ---> "Input device support"
There used to be submenus for keyboards, mice etc.
Now, only the entry "Hardware I/O ports" remains.
They can still be accessed (and configured) by searching for them,
then pressing the corresponding number:
/Keyboard
/KEYBOARD_ATKBD

I also determined the commit:
f79dc03fe68c79d388908182e68d702f7f1786bc
kconfig: refactor choice value calculation

#regzbot introduced: f79dc03fe68c

I've only encountered this here but it is not impossible other entries
elsewhere in menuconfig might be missing aswell.

The issue is present in stable 6.11.5 and mainline.

Kind regards,
Edmund Raile.



