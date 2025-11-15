Return-Path: <linux-kbuild+bounces-9641-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E3C607DD
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Nov 2025 16:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF5364E5219
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Nov 2025 15:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214C41DBB3A;
	Sat, 15 Nov 2025 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TwWPLRwE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QHXZs6ms"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F07286A9;
	Sat, 15 Nov 2025 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763221007; cv=none; b=ALN8HImSCkOpqhBgNTTA2KD2MmrH3x7xhvaxQUzgCcHDFtLzNWj81Qvo5TnbpPM6PEqb1gJocuZgcr7rvfERxWwUu17E7fvgNzCkmNrmM6reC7QvXQ0UdqYc++GU3phFeZr1wD4HTzOYHvJDq7Yxcn+i9t/GT70Hz+5RTOP1YRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763221007; c=relaxed/simple;
	bh=9Zk/qeQpMZ19IiW6eC0s8+aYB1QMBhsiaoJy0jw9KkI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dEpGK3cJO9/8/NEnx8CCLf+UYCsfU+63gtdQNrm1apJD8wTWRJAev4DTITBxTYBNJWhyLP0JzkmkFnSfgLCf+nDD5JltXqDuNy+MNgWGkkf9WchCk9sY8edDO1rjN+757mkAgfx45Ye9mtGmR/6NyVP5TlglPEC8cT3VWWya4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TwWPLRwE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QHXZs6ms; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763221004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Zk/qeQpMZ19IiW6eC0s8+aYB1QMBhsiaoJy0jw9KkI=;
	b=TwWPLRwEIx7g4C/vg6ClZZ1DrbFU4T28Gn302uUFtt4J6yaKbcYlNEirFJIeqb7Fzf6Jkz
	N7PlXKKNagVwlct4JWnkVnZm31nb3fURoZEgUP+xjRhkljlxpnEcDP9VIEjt02skGZnPGg
	ia+7p472iROist7NEYzhgcxZ9k5vDvdKGVBrzg2sFmRHdudpAYJZiXATXoMzZsu7KYWHSs
	sizU0joXTYw26Dw2nn4CaHJl112h6OCOYwU7kh68dfs5zpJuN3GH2fTtSqf4XQ/XvorPcz
	GK3WUbvT9DAAu6j8bWd/Lz62uQqy3CEJMKe/380lLFy7ipCvjaQIljlEeAB3Ig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763221004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Zk/qeQpMZ19IiW6eC0s8+aYB1QMBhsiaoJy0jw9KkI=;
	b=QHXZs6msAgwg5C89PiiTFYBJditY3kdSPrZPZKEaKNI/FTzLhkz20Q0jdYa9uUj5xjQRTV
	thJSrXPua0X6zKDw==
To: Johan Hovold <johan@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
In-Reply-To: <20251020091613.22562-1-johan@kernel.org>
References: <20251020091613.22562-1-johan@kernel.org>
Date: Sat, 15 Nov 2025 16:36:43 +0100
Message-ID: <87ms4n9uk4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 20 2025 at 11:16, Johan Hovold wrote:
> Several symbol patterns used to be whitelisted to allow drivers to refer
> to functions annotated with __devinit and __devexit, which have since
> been removed.
>
> Commit e1dc1bfe5b27 ("modpost: remove more symbol patterns from the
> section check whitelist") removed most of these patterns but left
> '*_probe' after a reported warning in an irqchip driver.
>
> Turns out that was indeed an incorrect reference which has now been
> fixed by commit 9b685058ca93 ("irqchip/qcom-irq-combiner: Fix section
> mismatch").
>
> A recently added clocksource driver also relies on this suffix to
> suppress another valid warning, and that is being fixed separately. [1]
>
> Note that drivers with valid reasons for suppressing the warnings can
> use the __ref macros.
>
> Link: https://lore.kernel.org/lkml/20251017054943.7195-1-johan@kernel.org/ [1]
> Signed-off-by: Johan Hovold <johan@kernel.org>

Thanks for cleaning this up!

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

