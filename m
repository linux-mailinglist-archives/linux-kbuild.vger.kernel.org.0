Return-Path: <linux-kbuild+bounces-7801-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C6AEEAD4
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 01:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A3443B6AE6
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 23:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9B81F2BB8;
	Mon, 30 Jun 2025 23:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dlwMcJPM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC6D1DE3BA;
	Mon, 30 Jun 2025 23:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325340; cv=none; b=uIn8DfPEK4JBV2IAPjJeRHnAMrwr5mLGaiLyjlrFBTEJZtA1oKPVg5+LoH/R1IJb9Vut6stlZ8TjEpESpSnBCaVLSvCUpDsn621qKFquhmhFQ3McSM834qZEKu1ll/YjSA+lAX57wkNBVakM8m8WRlkOwlaFUsjm3jcaYyCfkp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325340; c=relaxed/simple;
	bh=rF/cOIdNRjfLGjKhRvM5KRuiAei09t6dV+kiYo4KDZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehbeA/tap+vrpkhjne8bIX89mQ1R8vl71YC4hz15ud8eyl6IrgVRvIQr8B23MTZvKjj/5pdOOLIopzwMStaRqX2967qxBIlArnfYc9yMmQ1rm9fjmrUqkfas1ndbQFGcfB1m7rg0KuH8zCMm9vTNk9X9jP3kAJKdl31wfFThFpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dlwMcJPM; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gPwmGnL05F/6Cj0+bebZV1txlBzJtdYKwZCgQ48zIG0=; b=dlwMcJPMemDaxhd4CqB5a4q6BU
	wjKDyAydQ7Pw8O1a/R3kqlI6SSw2LlX/obuo3o++AT6sd8++MbXeQhPuogcU9X8oNXvkVsfyg8Xo6
	ALxOnLk2J/13xa3Ln1bpQNssmU1vvveIym7tkbEMstK0QczBRMh+jmf/i8/agNrLGtdsLxZmYByW2
	0Ol97SuC5ZGGNmqx9RG1V39cYvZNpSyXgAWCVCh1zhNtCZtlrpVaJ5EDLvhtlWWLGOTi09ToHZ2yi
	pJsNehkPEgAwPcJsNzo+t9rFQOLBOOi3q5+wFVDeKYjNBuKTkPja/fKZdRksixOxanaXgfbNw5XrZ
	l+i5SE+Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNir-00000006u5I-190t;
	Mon, 30 Jun 2025 23:15:37 +0000
Message-ID: <38280710-0efa-4bb7-8ffa-a905f3dd7ad7@infradead.org>
Date: Mon, 30 Jun 2025 16:15:35 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] kconfig: gconf: replace GdkColor with GdkRGBA
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250629184554.407497-1-masahiroy@kernel.org>
 <20250629184554.407497-8-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250629184554.407497-8-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/29/25 11:43 AM, Masahiro Yamada wrote:
> GdkColor is deprecated with GTK 3.14. [1]
> 
> Use GdkRGBA instead.
> 
> This fixes warnings such as:
> 
> scripts/kconfig/gconf.c: In function ‘set_node’:
> scripts/kconfig/gconf.c:138:9: warning: ‘gdk_color_parse’ is deprecated: Use 'gdk_rgba_parse' instead [-Wdeprecated-declarations]
>   138 |         gdk_color_parse(menu_is_visible(menu) ? "Black" : "DarkGray", &color);
>       |         ^~~~~~~~~~~~~~~
> 
> [1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.14.0/gdk/deprecated/gdkcolor.h#L52
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
> (no changes since v1)
> 
>  scripts/kconfig/gconf.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 


-- 
~Randy

