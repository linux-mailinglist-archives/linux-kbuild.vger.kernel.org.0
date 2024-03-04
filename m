Return-Path: <linux-kbuild+bounces-1143-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84B86FDA8
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 10:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 568811F23B15
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 09:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F81249F1;
	Mon,  4 Mar 2024 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="3uWKzKO8";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="a7rsJPkp";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="L8PbEoDI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i652.smtp2go.com (e2i652.smtp2go.com [103.2.142.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897D249E6
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544419; cv=none; b=Z4O0hfLR3AgdZ3flzD/yQTp5OMV4fp4/FLQ3EzXDwcyh+N940krIQ9I+Rj+QO447JJ5T36uCZWYNIPoupTd+sdAWUaaB2FG/4k/3KfBQvfoRp5Zv1hF9gAHJBBSoYfZAWvmK6Au3ZoyJzHaCAFPq6KUH8ShcwrQCwzCJFzg6hS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544419; c=relaxed/simple;
	bh=7VDmsob5dJwaz3X9qMt+VxPXL/JvM00gxmRyrpIxXqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwqQFDquQpurFGN3dgaWYPN8u5SynaMNPnVA760xZed7YWzThISIOXq/nq8d09nzxTGLTc1RIjdYEUKwJLWDT2reItOm4sElGfQnHg9xf1XCM2GqXotZbE7bMAPHJqqodWN136n1nFdi2C3ZaxaatSPQB7U4dyY/9AzEJQJsOZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=3uWKzKO8; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=a7rsJPkp; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=L8PbEoDI; arc=none smtp.client-ip=103.2.142.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1709545311; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=dSA4zZatV9UqbY6asTaR1XvA3gHAvLPK2adXkrBBVSE=; b=3uWKzKO8
	THMIsjNc+4sGSKVyTPvl4kFisObLc6pOUMeK1+RPi3qvjq/q4WxuYSI4Nqwd41G/bPHta2NUqDEny
	NI2mdDrcZWxpfOj1lMvYIBrxT36Zcbgc5ETrxJxa7mCZwqPX2P/Vlvf18QoDugkToX7RqAV074joO
	lagUMmePvyRuwB4cSjsIJtDBYLVwrV6UdzyDtrfCkERpiDYu8rWDxJ7QaXjOAhOCwIx+RU05lONqb
	tt/z88Mb/eTDZEwJgDMs3TRzkLUUp5jIyNM4OU7RfE27oRdDXP36GCOJ3g/GJNO4JoJxbqZITct5C
	cfcfPrzM6CrNB/DcygKrU5TnQQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1709544411; h=from : subject :
 to : message-id : date;
 bh=dSA4zZatV9UqbY6asTaR1XvA3gHAvLPK2adXkrBBVSE=;
 b=a7rsJPkp3VLAIzvvxWmmBMRL924ebsWMpzta4SHupq6ZFj1OfJz4nGi1QpcTImNgq/7dD
 19Sgz1ipS6R1pqCv7eIH59hy5CRF8JCfj8OD0wkpp1QEYXlEBti6HA3YQJoYjoopaIq6ZQh
 6cY4At1VU+wDcMYRqH7offKTIwiDDq0DhBs6YVmTpYGV7V8TGjQ1RDmdSiI5yiajQRGI6Mm
 PTPIFMXuG7ZgZpC9PYdB5ACX368acgmM6UrVBcn6oXoeYy54OrJc39t1MfqxlI0mR4Cw+BT
 gI/Nf2h3TcvSs7upTLnmuJ5QZ2FO+dSa0zRMFLsR7tuMZe5WbcwjNQb7RnEQ==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rh4al-qt4Jyi-NR; Mon, 04 Mar 2024 09:26:39 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rh4ak-4XdKRo-2S; Mon, 04 Mar 2024 09:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1709544397; bh=7VDmsob5dJwaz3X9qMt+VxPXL/JvM00gxmRyrpIxXqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L8PbEoDIRyhOAJsNNVtfEGp7Kf/YyPuMCfIc/ZbYWls23k8CexemOWoOVkteqmQV+
 u/aXJwND072hSFMlOdTCvXjGIp84hoX2VkIE0nN8MLQqYZq6k/HfIzMsB9ON4P4VjA
 cAu3YCePvRfbpxtgFMOjN2F04gszsBWfMy3+Lfmk=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id E94683C312; Mon,  4 Mar 2024 10:26:36 +0100 (CET)
Date: Mon, 4 Mar 2024 10:26:36 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kconfig: link menus to a symbol
Message-ID: <ZeWTzJK8rX35tRnJ@fjasle.eu>
References: <20240303040035.3450914-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240303040035.3450914-1-masahiroy@kernel.org>
X-Smtpcorp-Track: 1rh4ak4bdKRo2S.5leu9HMjOTNPn
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286syjhgZ2FMH
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Sun, Mar 03, 2024 at 01:00:33PM +0900 Masahiro Yamada wrote:
> Currently, there is no direct link from (struct symbol *) to
> (struct menu *).
> 
> It is still possible to access associated menus through the P_SYMBOL
> property, because property::menu is the relevant menu entry, but it
> results in complex code, as seen in get_symbol_str().
> 
> Use a linked list for simpler traversal of relevant menus.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/expr.h   | 5 +++++
>  scripts/kconfig/menu.c   | 4 +++-
>  scripts/kconfig/symbol.c | 4 ++++
>  3 files changed, 12 insertions(+), 1 deletion(-)

Thanks, the whole series looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

