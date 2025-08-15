Return-Path: <linux-kbuild+bounces-8480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A5B278AF
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Aug 2025 07:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AADC1C86F9E
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Aug 2025 05:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F0A221FDC;
	Fri, 15 Aug 2025 05:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gnx2hwby";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lR+ki2Ag"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D94D221282;
	Fri, 15 Aug 2025 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755237461; cv=none; b=YRldUaM7Yl2gqMCayCE+EZNosXd+nfM2rw6VRGUAZJx8yYRsa9NvcSfVIOxN5aMSarX3aPL121VorwmtyzaPWnkwmrcAJiuqoALvSBqvo5/EXpfbNOeIjMAfKjKnHBKl+2XgOKQrvpBpTmKZt1omx4uH7HqOOaJYVUAF6FUYAmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755237461; c=relaxed/simple;
	bh=l44K6EU3NXEPW6Rv9x+dtp6Tv4IlAF6CW6XOLMarcfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwOH/MF3FlGx43vlOa42WsDmyWo0xl950kYBEQN3u25Q/32NMQU6QFq/ApurG+hMs5CexfpySAlXTVPIPaK9v3Kie6Q2JHvxDYxN6IUUYto6iBDzcneuMR44hCGvYnr9T2RFp2w1XqkRFi9/oziB8oTy8jhWIvHbC3LfvmOQy3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gnx2hwby; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lR+ki2Ag; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 15 Aug 2025 07:57:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755237456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQ6MIkb8TH9cRez5JksAJktPFrLt2N/0sPo/EUUigpo=;
	b=gnx2hwby2zpCUoBr1yu1qSDR4/4jWa9JIRzrUqtB35/Ohv0LAIqQfpOb2aF3SOfOaZ1hAK
	T0MQ3DG4aMauthybT3ifXyiuwvpkXBwiTvHcYon2rsAC69MRnAyFprREKQbJ449K2ZCQfu
	hbr2PGkZuI/iUd4jJ4OKw/kiVQd4i2bdASylcyvySCrDPJ/7YUkEc7wMlNW8F+eZUZHos0
	i/lXQ6SD+BrQFFSDJd17bEZLM9KihNhMzKvx4MnyswjDfXztj0ovX6qiEM52yvyAjWOUn1
	LeDr2TqwdDaI2KvhIfjkPleg5Yh1VCz/B5AIfJAJ+3uFFV4sDeqA/XSwPz4I3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755237456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQ6MIkb8TH9cRez5JksAJktPFrLt2N/0sPo/EUUigpo=;
	b=lR+ki2AgD+haXMRY3weRgBBpoEh/CPLLgkvYU5QtlVs5oL+GasrGKTRLH5b8IHnn8DJH1d
	EuZmhJhUAW2HpkAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 0/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <20250815075527-ada0921a-d2ab-40b6-8882-3c84339f0582@linutronix.de>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250814184646.GA1764877@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250814184646.GA1764877@ax162>

On Thu, Aug 14, 2025 at 11:46:46AM -0700, Nathan Chancellor wrote:
> On Wed, Aug 13, 2025 at 07:43:39AM +0200, Thomas Weißschuh wrote:
> > Make sure the byte order and ABI of the userprogs matches the one of the
> > kernel, similar to how the bit size is handled.
> > Otherwise the userprogs may not be executable.
> > This happens for example on powerpc little endian, or riscv32.
> > 
> > These patches where originally part of my series "kunit: Introduce UAPI
> > testing framework" [0], but that isn't going anywhere right now and the
> > patches are useful on their own.
> > 
> > [0] kunit: Introduce UAPI testing framework

[0] https://lore.kernel.org/lkml/20250717-kunit-kselftests-v5-0-442b711cde2e@linutronix.de/

> > ---
> > Thomas Weißschuh (2):
> >       kbuild: userprogs: avoid duplication of flags inherited from kernel
> >       kbuild: userprogs: also inherit byte order and ABI from kernel
> 
> Seems reasonable to me. Should I fast track this via kbuild-fixes or
> should I just apply it to kbuild-next? I am guessing you only noticed
> this in the context of developing [0] so it might not be a big issue in
> the wild?

kbuild-next should be fine.


Thomas

