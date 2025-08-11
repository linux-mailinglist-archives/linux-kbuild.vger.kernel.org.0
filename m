Return-Path: <linux-kbuild+bounces-8342-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F192AB20D1F
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 17:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F743176500
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 15:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638846A8D2;
	Mon, 11 Aug 2025 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LiTX9A5d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE742048
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Aug 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924910; cv=none; b=hXkb5ruBYgovQ/i/0ail1yQ2LK5out8fcAdfg14rhheAVhLUMEKXxAJvLOZaH1c+fKbHUiI6qgrfyquz+4gxrQ0baZ6Kektq/VZRzFKVKOfsM56ja3CG8iGKMJ97AqQUwKPCM/QacEAhBtWAlJXHPI5zsjLBlAS7uo5pBoWhaNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924910; c=relaxed/simple;
	bh=9mcIvw8TnqTafyJ+8Oq/Hi3wC4RkWVvI3M4CG1Gk+uA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UPCwlveuZvoowJx5AhUyneGJu+NiHvpmv4lGF/OJi2/uZVsNXTNQYengMP4LGWPqP2j8eFZC7c888FYmfEXUIZ8gQK7LGVvqoMkojGbr36OMDPqPCHNOwjYDB+NutTeJwWGn5Mpccfc2WZDrgcMU0+wRgBGz26UVt4ZCtggEexY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LiTX9A5d; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754924901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IcFl3Ghkjin7WsXXZp+/nVY4juF8ODjjvZjAsODy3wQ=;
	b=LiTX9A5db/1wkUONRwIhSnRFawSE+w4zT4gdYF+5FON9ACzziuBTKR0KgeyUWetAb2npy5
	9FZ2wuJXpdKLYhOiRGa4faaCAO36qbXwPtYXGWz+h6rUj0wg2Re9McG2fhkxPTuHZUXfey
	GV1XrTsYfn+QWjKodRuNHYVjWJBIJzQ=
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] kconfig: nconf: NUL-terminate 'line' correctly in
 fill_window()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <98b4d33c-24eb-4034-82ce-e88e85f8e6f2@gmail.com>
Date: Mon, 11 Aug 2025 17:08:07 +0200
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 "nir.tzachar@gmail.com" <nir.tzachar@gmail.com>,
 Michal Marek <mmarek@suse.cz>,
 stable@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <4B3C8558-81F3-4965-A09C-CE07D6A5FF4A@linux.dev>
References: <20250810142239.120294-2-thorsten.blum@linux.dev>
 <98b4d33c-24eb-4034-82ce-e88e85f8e6f2@gmail.com>
To: Franco Martelli <martellif67@gmail.com>
X-Migadu-Flow: FLOW_OUT

On 11. Aug 2025, at 14:51, Franco Martelli wrote:
> Is there a rationale behind the choice to avoid to use snprintf()
> in these circumstance?
> Preferring snprintf() you will not have to take care to
> compute the position of the NULL terminating character of the
> string, it's done automatically by this function.

I looked into it a bit more and I think we need neither strncpy() nor
snprintf() (and no temporary buffer) because this should be sufficient:

	mvwprintw(win, i, 0, "%.*s", len, line);

Unless I'm missing something, I'm happy to send a v2.

Thanks,
Thorsten


