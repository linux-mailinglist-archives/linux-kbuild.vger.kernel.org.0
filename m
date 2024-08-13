Return-Path: <linux-kbuild+bounces-2963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A4A9501C3
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 11:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62CFB2816A6
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 09:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B08C17BB2F;
	Tue, 13 Aug 2024 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0SqktetI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LIfkUaHS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8143165;
	Tue, 13 Aug 2024 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723543031; cv=none; b=XawfTsJxrxRTHkM0D/2j4NHp7RyLYF97WLnFdbtxI12U1nYiUfO26Zu9wWRhnDrGb6ldQwmAxc2PcJUAhsXfprmehUMyigT3NdxWzajmjjgt684aI3d5+hdhW+oLE1CP1dA48XzZwm+qjllD6NOkLw6o2Ykz8/mvP+f2usE8cSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723543031; c=relaxed/simple;
	bh=+7QKdj7GtpZPwsF7z7r5k3lT2lK4IuF6zx7meV1VJ+4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TiKoZZYqEuePd9NIMITsKTgTa+FMzG26HwQOGcc/ds470lA/KI09YbdY6MJ8RsC8uUBPQiNp+euxI/aIgBYJ4Kuh3ugMlvOs7rCinLSfXWdWNaXbF3czEyzOHCCx4WLXpbNBs6DsBmtEfTGP2ps9k6sIahctndeiSwEf3KZTAJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0SqktetI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LIfkUaHS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723543028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MIBBnQCpaeIOfb2Kjjeff7Yy4ccdBuwpa2HPTwQ0yXo=;
	b=0SqktetIFWfU+vCDesHszRdtp/29RPqOt+oIKERhaUFoRReqrsE4aApGmVfvS3ok3Y6r+7
	CB00eyyiwZvahdQ/TakBduBpteBtG9DtxSd9JNE2BUUYZQyK5tWXe1qGPJvI1n/1PuhtVz
	fomLKhso5QnTUJhFR7lkNkCW2+MSgiJUWTRrbhGqc98HIny+sg7x7vinbN1xawT35vuNyw
	GfTpXqSVKSmBMco32R7nHmZvzHlW04i5kmEzXaj3m7sZFJWPk9b4wEfnBuvI0XdlaODmQd
	j7mj0ojzV05SN9R2QigQFVUn8V0FoJb3Rl/Ey1zuD1GbJKf8svxtWbIsvolM+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723543028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MIBBnQCpaeIOfb2Kjjeff7Yy4ccdBuwpa2HPTwQ0yXo=;
	b=LIfkUaHSKrD8oSMoulcbB7i8CVM+UBofbyAwJhI96NWK6O4E6wpK0vIHksBlL75/zANGaY
	ifDbTYLV1dzvkcAg==
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] tinyconfig: remove unnecessary 'is not set' for choice
 blocks
In-Reply-To: <20240812100148.2083203-1-masahiroy@kernel.org>
References: <20240812100148.2083203-1-masahiroy@kernel.org>
Date: Tue, 13 Aug 2024 11:57:07 +0200
Message-ID: <87bk1wrbik.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 12 2024 at 19:01, Masahiro Yamada wrote:

> This reverts the following commits:
>
>  - 236dec051078 ("kconfig: tinyconfig: provide whole choice blocks to
>    avoid warnings")
>  - b0f269728ccd ("x86/config: Fix warning for 'make ARCH=x86_64
>    tinyconfig'")
>
> Since commit f79dc03fe68c ("kconfig: refactor choice value calculation"),
> it is no longer necessary to disable the remaining options in choice
> blocks.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

