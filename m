Return-Path: <linux-kbuild+bounces-9279-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97988C04E3B
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Oct 2025 09:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 807D33B02ED
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Oct 2025 07:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21AB2F0C6A;
	Fri, 24 Oct 2025 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0+HL3SKX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aMgiSbfo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA762EFD98;
	Fri, 24 Oct 2025 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292505; cv=none; b=mnNRJDKMIcEXtRx/XckctZcAOcYO2fT0p4uxs9Hie6ppiZwrxi8KIdf8lly5Kf9sQxGaOqHcfCRO/H9THGJ3ukIfofpG8fpaFP9yhwYQ2BoPvpdGxy8QEpkpfBWxWi8KdV/CSf8geQVIwiiYawi9cc87sxd+u5kV5iQRFU92f2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292505; c=relaxed/simple;
	bh=XnVkgAsIUfRBNvBJGWukmn6VBM9xzBoNnyPbfVXjfBM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=JpKTSPhGUCE3jl3EGyy+nA3YPL64NafHXCX2EenJfIZheiB5CGFdjj8ItBm4eCQTezq91XIdIDtAqFJKXwS9R4aoMAbacjBjMUhn8nt5ym7R/QAMgXo8Y6LlAZySFXizubqGSPPFNxvB3GP4RGQi7VKoLJVErjBrYbV+kFslqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0+HL3SKX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aMgiSbfo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 24 Oct 2025 10:54:50 +0300 (GMT+03:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761292500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XnVkgAsIUfRBNvBJGWukmn6VBM9xzBoNnyPbfVXjfBM=;
	b=0+HL3SKXNzFTGZBn8R4YsNFYZ6w2k81QUdSogoV4mUyY+E2TcNLpZDyipuY2dkVyX3GZUY
	tICQd6J3VmBmMWcyGNZCN47+OGE/gEs3wTULLJywI57Bve7TZB/blAiIP9Una0AvuODuGO
	z2ivKxeqqwQEaS5R5XgNUM7MhNAJ+AJwRGT15qJHnBz5kPQXqj5xtOh4Q95EES+WHZUrok
	GOvTooFWmQc1vDc6lzit3LPbg3zDO4JuFi6frcYyYLGX1aHUrkRxuuWruMRzsegetYrSVp
	nNBAWA4KN+GyENyy52V7yzRkzvGNhCuItMvXKQ5OrB33+OlABwqwo/fQ7Lqbfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761292500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XnVkgAsIUfRBNvBJGWukmn6VBM9xzBoNnyPbfVXjfBM=;
	b=aMgiSbfo1BtypJxBPEmna54bwUv/tsy2zx+epxwHGFGsaz5jRQYChO8+Utuv5E++dcAtCG
	I83Ce/oK20d+67DA==
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Message-ID: <a3ae3f0b-62b8-452c-8a20-b3dfe9823465@linutronix.de>
In-Reply-To: <20251023-headers-pl-drop-check-sizes-v1-1-18bd21cf8f5e@kernel.org>
References: <20251023-headers-pl-drop-check-sizes-v1-1-18bd21cf8f5e@kernel.org>
Subject: Re: [PATCH] kbuild: uapi: Drop types.h check from headers_check.pl
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <a3ae3f0b-62b8-452c-8a20-b3dfe9823465@linutronix.de>

Oct 24, 2025 01:51:49 Nathan Chancellor <nathan@kernel.org>:

> Since commit d6fc9fcbaa65 ("kbuild: compile-test exported headers to
> ensure they are self-contained"), the UAPI headers are compile tested
> standalone with the compiler. This compile testing will catch a missing
> include of types.h, making the types.h checking in headers_check.pl
> originally added in commit 483b41218fa9 ("kbuild: add checks for include
> of linux/types in userspace headers") obsolete.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

> ---
> usr/include/headers_check.pl | 63 ---------------------------------------=
-----
> 1 file changed, 63 deletions(-)

(...)

