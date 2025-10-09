Return-Path: <linux-kbuild+bounces-9064-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E06BC924B
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 14:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 565F73C8596
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 12:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7892E2644;
	Thu,  9 Oct 2025 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="HneMV+IP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E592E3360;
	Thu,  9 Oct 2025 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014518; cv=none; b=ZY4xi28gyQ5/f2bAZmuvgeA++A6y7CfwpwG3c8hHhpHue/PYH7jIx0creTWdIdE1YdoGUnu/gd/QGcNH2XBawKe1ioK1F6aXr5KtD7f7B5JGvk0j/O9h6SDUqlTdbTIGKU+BQGrhAo0YvKwO+kYSgY62+NukanlTyq9Km/Gu/4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014518; c=relaxed/simple;
	bh=jIhFOtKQU/lkJrJyL1qYj5eWE6G/dTbmIE7eefjITeE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m1IvSDmeIP42MN7cfF/OTrUNeL+/2EhyMdRaPfkq9WwhdXjUwagc1Q9KZOCNKGjaDwjACxSqLx6yJ8sEhahXGe9iipYmpPCZOsxAyhzO6DZOOAceKgUgFsUgFO9Ra0gdglYPpEqEDRmrIGp+KF2wmi/c3MFx0epM5QVOa9K4y/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=HneMV+IP; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:86a2:0:640:3ad2:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 38CFB815F9;
	Thu, 09 Oct 2025 15:55:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id xsJu6IYL0Os0-O1ne5mTO;
	Thu, 09 Oct 2025 15:55:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760014503;
	bh=k6NY8fK5kcU51JaRhSM3lV4/Sq3mMVoFn+plnqG/WAk=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=HneMV+IPrgEvAj9n1M1PN3lzYeCuaZEafbljot05ZpMxmg4ZP3x1H2ASjEgrodzyG
	 L8N649AXqsaGE9/Fb1y8VvNONWbuBNFjiwfqsZBPw2ydbuZC934Cz+5KtF5uFWIeO9
	 VAYmLXCFSeKNTcPYDxn5vc/hKhMkr6bbqJUnrtKA=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 9 Oct 2025 15:54:57 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev,
 masahiroy@kernel.org, aliceryhl@google.com,
 thomas.weissschuh@linutronix.de, tamird@gmail.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v2 0/1] rust: add `rustcheck` make target for check-only
 builds
Message-ID: <20251009155457.22131e41@nimda.home>
In-Reply-To: <20250915115311.3025-1-work@onurozkan.dev>
References: <20250915115311.3025-1-work@onurozkan.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Sep 2025 14:53:10 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> Changes in v2:
>   - Couple of indentation fixes in rust/Makefile.
>=20
> Onur =C3=96zkan (1):
>   rust: add `rustcheck` make target for check-only builds
>=20
>  Makefile      |  7 +++++
>  rust/Makefile | 73
> +++++++++++++++++++++++++++++++++++++++++++++++++++ 2 files changed,
> 80 insertions(+)
>=20

A friendly ping on this patch. It's been over two weeks with no
feedback, would appreciate any thoughts or suggestions.

Regards,
Onur

