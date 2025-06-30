Return-Path: <linux-kbuild+bounces-7768-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C3FAED331
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 06:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3979E1891253
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED714317D;
	Mon, 30 Jun 2025 04:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CVDnoBaA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0FF23CE;
	Mon, 30 Jun 2025 04:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751256587; cv=none; b=EFO9AdwWyGBtrQxiUpNmBxEpW4YBo/EHikpbv8bShYwangu7bSsrQUUXLWiiJAroQI/AYN7QuyKNwNflnufDJD3UkkFJiZqU5mHbqpuCegUSAo4jOJPb1cV5LvqHQuSG56qpbiTmVccQSo2e8qiKREbhJRPxKZl+6oZp6ALZmcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751256587; c=relaxed/simple;
	bh=30ek6oGb+cGfS4lt0UoSMnrxWa/g31Q5bcqDRsr7GyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUBGyStDyavnvTXjaNv/8bfrvo0MjeD2YdE8Eor6Dvx1n9KsqOJNzSRb8fMFJEpHlUfSz7cscQET2zERoRXQpKR95pY8aJtmgMUGHjFSwNjN8/kwqcM+9Pt9KpMRP07OFT3uYdzvPqai9cY06K/zUrY4yiYXuVkhioluMbi+U2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CVDnoBaA; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TRXJC2MSREIE7B6qxrs+Kx8/OTZ/fJnjX5FD4YcEq7Y=; b=CVDnoBaAyXoizMCDKc4N/ug+v7
	HAZQRiLDR3crHVLc+/0o4HHOXNtE+M7XazQqQkCN+EiiacsNm90Nw01+pv8wpHjpmWK8e3jpd7gNr
	jfezAxdKQM+2XVMJYc6Ns8DsVNt3aq7xJBK6xRnBHpZ93tofU+KTnOLpwafSQkBtzZY1UEV9ti8Q6
	G0FCwx6Hl3U/aRcLLMutCmybWHgtsMwvaB0njnsg5lpbSrfDg1Mclm+NYB4lGGSE3T2hrqiwWc36m
	w3p5rY2Uzha4hwFJgLc1KRmX9Y81nKYjhaXA+DTuxa3udEBZD0GWEC8BrzLLAGQ97LCGu1FuzF007
	SZ2vgYmw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5pu-00000006ipq-3qst;
	Mon, 30 Jun 2025 04:09:43 +0000
Message-ID: <f5ce4e1e-e5e5-4b83-8590-e0efccde57cc@infradead.org>
Date: Sun, 29 Jun 2025 21:09:41 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/66] kconfig: gconf: make introduction, about, license
 dialogs modal
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-41-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-41-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> These are modal dialogs in xconfig. Make them modal in gconfig as well.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> 
>  scripts/kconfig/gconf.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 

-- 
~Randy

