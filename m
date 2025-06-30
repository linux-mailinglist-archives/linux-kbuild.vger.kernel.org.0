Return-Path: <linux-kbuild+bounces-7777-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3726AED3E4
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 07:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AA161731BE
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 05:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF9719F13F;
	Mon, 30 Jun 2025 05:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eL/ucCyy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6C1EB5B;
	Mon, 30 Jun 2025 05:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261770; cv=none; b=MHDbowvv4KyEkIdCXSrT3Xf32ROsoTemm/ZDiJDTCCn+TY1xshQHuKUrmN4Cctm0/qSfaxBwmpaiNX8a/IGRKshMjxOz1uVPxTi7+Iu2pN5Ya8EZNkT52fu2tGLZ/958kZavf38muGmPQuFumVHOD+sFrV5msNVXH0Z2KIGmen8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261770; c=relaxed/simple;
	bh=0vfCw5cv/EAsGDc4WYfpgbmpPv5RFaiaeprd+D8KlY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5mNmhe89H2cUtiVZgJqj8TWqv8HIJUkf8kelk7aNDarMfNUntJ/8Y8tQp+JFP1/PIwPg1xR7ux1ZQgJQJvPtcD234cwMSjzs4rOyYCy8Sk1v+F0207KIMkB6/AYqAfikUAZlFbc51mXrMvX3+q4UmbxuoDRM9ESzUazQOr98ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eL/ucCyy; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wB+goVDcUknWqVv96eK5+IlH1aFLvYq0IXbrZl50hxQ=; b=eL/ucCyyp6ebd4PnIzbR33W7jV
	dZUArfA0AjJDFOT2+4FYGV/Xj3O73/+qibmZeztA5V7MsCVN1HCczeJTs62qBsZ4kmEaxqlGTnHcL
	uul8vXV3X8pych0ceJHTvWnZuj+Itz4dlTLbHEXGQxoK/6xh/v3oTfxzuuHB39QvXF7kxXhyKcz5C
	x6tTdBUKbVRi4qBLbF5SwnsWeksTQJF4WR81eCC5gPLOJC5FZBHBPbyDkkVlIKn3FMHuBhBDH1vUR
	+xWGMFSHY78SFM2K0FFbyjX2rYWaCtiqD+i2oJvnV2sSn2Y7z8cepc9DhihgZu5/hgVIilwl6b7G/
	MK8qmlMQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW7BU-00000006jMk-3lFl;
	Mon, 30 Jun 2025 05:36:05 +0000
Message-ID: <1f6cba18-60fe-4472-b186-2db0cf7fc0c5@infradead.org>
Date: Sun, 29 Jun 2025 22:36:03 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 57/66] kconfig: gconf: replace "tooltip" property with
 "tooltip-text"
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-58-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-58-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> This was replaced with "tooltip-text" in GtkBuilder with GTK 3.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

One nit below:

> ---
> 
>  scripts/kconfig/gconf.glade | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.glade
> index c0ada331a5bf..c3996f4635e9 100644
> --- a/scripts/kconfig/gconf.glade
> +++ b/scripts/kconfig/gconf.glade
> @@ -230,7 +230,7 @@
>  	      <child>
>  		<widget class="GtkToolButton" id="button1">
>  		  <property name="visible">True</property>
> -		  <property name="tooltip" translatable="yes">Goes up of one level (single view)</property>
> +		  <property name="tooltip-text" translatable="yes">Goes up of one level (single view)</property>

You didn't change the text here, but this would read better as

  Goes up by one level
or
  Goes up one level

I.e., drop the "of".

-- 
~Randy

