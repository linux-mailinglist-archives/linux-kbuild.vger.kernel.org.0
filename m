Return-Path: <linux-kbuild+bounces-10347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EEECE67DA
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 12:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51CBA30124C8
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 11:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13A5301010;
	Mon, 29 Dec 2025 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r8KzYJ5b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ndtR8WFz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDEF29BD85;
	Mon, 29 Dec 2025 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006985; cv=none; b=ZwLpd57uLHOvSoLdA9anIee5PlrlawyPRZP7OwVLFaEPqfkMJOxKZWZ/ZAWihJfv56i4SqfhTfp7dDxHb7J3c+FuVDYsnaifj0Wj23Hy4DjnUtFLUZSlQALvPlJkQlB2LbStmK5jJX9p3Y8GgfpeS7iodWPhdaOxiP3T7CWUXIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006985; c=relaxed/simple;
	bh=xERIz/eSLkqEcJvmiFHfNpakclwboxY+TdQUKjKNgAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qr3/8TlqYLMKmSip5iLPJhUPJp5SYh6i+UGNNwrU8G6NU+jnTuV8mqa7runtUogGdx1ckszGyd/fFuUltgtEMBunI8PSMr1ry6VRShJfcRleSYATuhXsgq1cpuhFiZ5swSESna5z8j1IRLKmLzDWGX367mZHnwQDyvVUjJK+v10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r8KzYJ5b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ndtR8WFz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 29 Dec 2025 12:16:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767006975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrxtWAvskIXEXOytpuCW2heED14C9wnzaFnhAG9367E=;
	b=r8KzYJ5bEowxdJbLkhurTBahFKSRzCJcrY+pd6G93rM60EpAKQGFgxwsryBuJgnZzAZOvz
	Lk+QtaoexSJmwtY0mAWM7XYsyb0m+EgaYczQV2cRjSEydZEAw9mFHHTW/BhkTZDGkmJhrn
	jV72e+Nio96+S4+91af8YAmuUDADXDetiOPA9dJ/+mk4twGUwTdp1jUqIOWdevY9gX8yKw
	xeB2nOdRH1W8OCv5Fhq3Giylu7QJOc/yUAkBmmesWOv1X4zfJHg2ngP9lUmS4ROH2Ls6bH
	wXyRZ+qZEzki3ZMpBg+agDD/nHajasJsisNWELr5rkkvb7JAdUxYyrtANS1ftg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767006975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrxtWAvskIXEXOytpuCW2heED14C9wnzaFnhAG9367E=;
	b=ndtR8WFz8e6Y+5Zjym/Gu8UtAX3CH415PgrHRPcuFZW17vYEua9C7xIY0ToRrLfwhzZ9iu
	GNlnVLcqI+ZLwnBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Tom Rini <trini@konsulko.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>, Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/6] kbuild: Support a MAKE_FIT_FLAGS environment
 variable
Message-ID: <20251229121440-55a7d82a-6fd9-4875-9399-ab6b3ab05740@linutronix.de>
References: <20251227142200.2241198-1-sjg@chromium.org>
 <20251227142200.2241198-5-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251227142200.2241198-5-sjg@chromium.org>

On Sat, Dec 27, 2025 at 07:21:48AM -0700, Simon Glass wrote:
> In some cases it is useful to be able to pass additional flags to the
> make_fit.py script. For example, since ramdisks are typically large,
> passing -E to use external data can be helpful.
> 
> Add a new MAKE_FIT_FLAGS variable for this.

The new variable's name is a bit inconsistent with the other ones.
I would have used `FIT_EXTRA_ARGUMENTS` or such.

> Signed-off-by: Simon Glass <sjg@chromium.org>

In any case:
Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

