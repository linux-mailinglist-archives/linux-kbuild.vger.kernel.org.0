Return-Path: <linux-kbuild+bounces-8286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD77B1A820
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 18:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651203A8EA1
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 16:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D050F28F92E;
	Mon,  4 Aug 2025 16:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gvyvCmMK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666DB28E607
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Aug 2025 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754326019; cv=none; b=epM4SLRrrA4PwUo4FoFTcqdVkrkNjZPQ0SfAeeKd/yQC1lSaIaYU6RTWXDrAHvMTmoX9YeZ+zdKz95IweoJLTu4YXKCYSXV3kPYdS67SB2w0ZXp5lmJ6P+czqvYxDiMz1UhmyBHoOHnWvUcc7vbBgcOkZK/AscUdXEknWardjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754326019; c=relaxed/simple;
	bh=kgp2Kfy3d10QFfLlwFfnBYPWaGU5v0v1MoaxBTTKJos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuG7FiGPe9Cdc9UfPQiEWZs+Ke0koTRA/hrd6my53L0io+nw25whegSFNtTbQge2PwkOclgnrCW1Er9kWG6aB0wd8aJ9w11J24xnBgniN6B2ToVfiLthVF1vfUK2O2zRGtRW6N68Apt99SQM13QHMQrsGK6vn6ERGW3c96CpiQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gvyvCmMK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=5HOYtx7djSclQvQSYjkxYyAlvvmYTCCQBKxvQRnkD3E=; b=gvyvCmMKz2gqjV/hNW7yYvtru5
	7B4sQAcr3rQSdydsAwGrn9ujqv//YvdqOU0WWxboceHHwUencKDYw8AcCVFlPBGI/hWO63+nNKx32
	D0Mk4N4Qv0Va+gA7cgbJYcP/PI/67/p3n+Pp/LeGmbjCx/kbVAVn915fwKJ7HmTYwb6KgmEfzpOUN
	5ShR/G7dgsOkn0WG47xfwvQ/5StyDaTVnqojzpUB/g9tMI35qCgxVbCIO72dnjnr10Zci/d5lk4Xy
	dgwNbfclQykSj1iJ02DPnPgYwmS1XSHEN8r7up+3A7dQ6Yl+Dm91SjkSjSrCzZKkktKbTEczn1oRJ
	ZHacodRg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKs-0000000B1Qe-28q0;
	Mon, 04 Aug 2025 16:46:54 +0000
Message-ID: <94eb7d40-827b-4d9b-806f-ae27499fe467@infradead.org>
Date: Mon, 4 Aug 2025 09:46:53 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: hand over Kbuild maintenance
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
References: <20250804142007.776418-1-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250804142007.776418-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/4/25 7:20 AM, Masahiro Yamada wrote:
> I'm stepping down as the maintainer of Kbuild/Kconfig.
> It was enjoyable to refactor and improve the kernel build system,
> but due to personal reasons, I believe it's difficult for me to
> continue in this role any further.

It's been great working with you. You have done a great job IMO.

> I discussed this off-list with Nathan and Nicolas, and they have
> kindly agreed to take over the maintenance of Kbuild with Odd Fixes.
> I'm grateful to them for stepping in.

Thank you, Nathan and Nicolas.

> As for Kconfig, there are currently no designated reviewers, so the
> maintainer position will remain vacant for now. I hope someone will
> step up to take on the role.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> Acked-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
> 
> More context.
> 
> I am having a health issue. I've been pushing myself, telling myself
> 'just a little more,' but feel that it's no longer sustainable for me
> to carry this responsibility long-term. I decided to dump the maintenance
> burden and have more restful time with my family.
> 

Sorry to hear about this, but I understand.

> 
>  CREDITS     |  6 ++++++
>  MAINTAINERS | 13 +++++--------
>  2 files changed, 11 insertions(+), 8 deletions(-)
-- 
~Randy


