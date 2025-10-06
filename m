Return-Path: <linux-kbuild+bounces-9010-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA55BBE160
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 14:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 051174E33F9
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 12:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7698B278E5D;
	Mon,  6 Oct 2025 12:48:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE01F8755;
	Mon,  6 Oct 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754900; cv=none; b=e2Y49cJqMtY1qF7ICCrBNU+IT3aFQK6W1bX6/i4wi3Ym1YyIfDOFTp5xJvpdJcXN5am/N8V0qfvvez/E/XlHqgpil7AQF36GjeN5BfUNcSyPbtfqKC+dzhnrXwcuq1wA50m5hZK/WmpmKyscMdHJhgC/Or/9aXWg23PesMiI5SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754900; c=relaxed/simple;
	bh=yIv+Y6LFJ/1OHcFWks74RoSN8VfD9jS30sS4ckZ/d8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AgeO8S7CnpRoboHMAIGlsfJJ78pJFG2IRPRamAWpX0IYKR/zm0W/IbDFSsWUy9j0RdV+2lc+acawd2bRkGHa9PWU/o7m1c0y3COd1+aeSl4EIFkg8v2LQCjgk2PZlIleXS7xAqtLPqbFe53moWqbqApiYHeJClQGbLJHRXSi6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4cgJln5gHVz1sBqm;
	Mon,  6 Oct 2025 14:40:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4cgJln4ljQz1qqlg;
	Mon,  6 Oct 2025 14:40:53 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id Lo6ufq-sBmXT; Mon,  6 Oct 2025 14:40:44 +0200 (CEST)
X-Auth-Info: fjqPRUDZ+D6alIMK+BgANJlB5OxNLA/TAqqPneisA9BfcE8wksM6zHXxzf/cqM2e
Received: from hawking (unknown [81.95.8.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  6 Oct 2025 14:40:44 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>,  Nicolas Schier
 <nicolas.schier@linux.dev>,  Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>,  linux-kbuild@vger.kernel.org,
  linux-m68k@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: uapi: Strip comments before size type check
In-Reply-To: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
	(Geert Uytterhoeven's message of "Mon, 6 Oct 2025 14:33:42 +0200")
References: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
Date: Mon, 06 Oct 2025 14:40:43 +0200
Message-ID: <mvm347wjj90.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Okt 06 2025, Geert Uytterhoeven wrote:

> diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
> index 21c2fb9520e6af2d..16c238aadfebb061 100755
> --- a/usr/include/headers_check.pl
> +++ b/usr/include/headers_check.pl
> @@ -155,6 +155,8 @@ sub check_sizetypes
>  	if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
>  		check_include_typesh($included);
>  	}
> +	# strip comments (single-line only)
> +	$line =~ s@\/\*.*?\*\/@@;

I don't think you need to quote the forward slashes in the regexp.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

