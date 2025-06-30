Return-Path: <linux-kbuild+bounces-7802-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F09AEEAD6
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 01:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98E0B1BC3EC9
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 23:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95141F2BB8;
	Mon, 30 Jun 2025 23:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hFUs9ImE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331318D;
	Mon, 30 Jun 2025 23:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325402; cv=none; b=peDZN7PTqt85HKFTop/mn5EiLqhrnKCnTOzZ6hrHctiZYtYMEf+VVqv9IFTKfTfRLOpIsn0iyfUhBTebmW73ALHiBmHZSHbljbDPosiO3PQQWCdabm2NBoAqMlJgBgmu8OGg7U0EQ0IjfSXorMNuNSUqOptH3ptWcprDTvkWMF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325402; c=relaxed/simple;
	bh=lp80JHHz8jv2U4A89C0+4VZvkAEIIh2NJGm7G4GpqgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVpojPtWWY6UG5nG6SpPXDRBH+vUBeWVNtymxGi4RCd+MdQA65gDhiC4U7dq/sYiMPDEDYlPKmavUezvsJ6vYEJH0EQ6XaXLjhF7qWEuWs9JBvwtJA1/WO6ucXM14/fS5c96y33a8A0vyKzNHdnY43RCilqjSjIh2fE2Bh5Bn44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hFUs9ImE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+hGcaVUqQOcFUzGZaRUFjvTq2d09AkHEAvAJGNjzbmw=; b=hFUs9ImEWkq1qcG9OFVYzQu05q
	vXSWQzU4Qpsicy9idtQs9RLuedBp0PaH+491ft7tA35EMHXG+U/23JIhWSvMtZ86g9rQgwEaYhnao
	omw2+PGgEl3zLJsR94iztRvWmKJx0+IluK20WUSY1J5undTYJrJ5NVWvh4rGYm6TEeVctw+Cwe22w
	UroExWfio+fn0Nx1lny2/mNvl+NbIoj1VjCiBX5Wqyk7xFg9fKjGHwV/zz8uPmA1xPeKD4GptiF+I
	QlX7obJnmx92QNDHO3TWifSAbUWBQ8boZAiCykVSp6D+q3O7q0adKxh6o/+5CDgfeaMdZaJ5liPl6
	hRyO/9fw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNjr-00000006u5e-2es4;
	Mon, 30 Jun 2025 23:16:39 +0000
Message-ID: <3333efa0-ce4b-4a06-996c-ad7ad6aaf0de@infradead.org>
Date: Mon, 30 Jun 2025 16:16:37 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] kconfig: gconf: show GTK version in About dialog
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250629184554.407497-1-masahiroy@kernel.org>
 <20250629184554.407497-10-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250629184554.407497-10-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/25 11:43 AM, Masahiro Yamada wrote:
> Likewise xconfig, it is useful to display the GTK version in the About
> dialog.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
> (no changes since v1)
> 
>  scripts/kconfig/gconf.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 


-- 
~Randy

