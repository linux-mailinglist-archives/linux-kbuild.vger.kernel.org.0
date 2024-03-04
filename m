Return-Path: <linux-kbuild+bounces-1144-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E786FDA9
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 10:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A4F2B22405
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 09:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA933249E6;
	Mon,  4 Mar 2024 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="kWBVNGat";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="nPPSaxYU";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="aE7Vbpsp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i652.smtp2go.com (e2i652.smtp2go.com [103.2.142.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453920DE0
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 09:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544432; cv=none; b=j5eraObq9MewS9mAVXXO1ui0Sc8tvAwu2bQH2toX/aqqZPQIKVY5kFVCMbg2qc9tmNOtSaT9SOGTEzxldPxBm+oLPIr5s0o9futGmZsqe7jM04htq3akRA2/sjW5keu043wldQ/FDFoi9UUkwLevtzI+137ejdanwdxkXlL+QQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544432; c=relaxed/simple;
	bh=JImv23jdXjLRor9Cn502GabxEt1k66f48C+3dfgfdck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZTWq1KzPEH44XYq0CGllc9i6FVlAobmvx7Nz3F4qiwba2+VO94Y0hRioarpjbfukCcvjbwfNV5o02rY8FyU1FoPtzxuRi7/uvZWOtLhUH8fOoGXJoRBqIXoyBpmP5oHPjmNU4ZWstJLiOme2hSuibq4T1HKi2W7cnnMbBO9jdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=kWBVNGat; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=nPPSaxYU; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=aE7Vbpsp; arc=none smtp.client-ip=103.2.142.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1709545323; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=W9vOf5sHthWslbSsPMC1VRrQRgKWvxP8wBkQDQnnMYc=; b=kWBVNGat
	P9HlpEpImAtCkhx+9MLRFSILoYoSXVc2f2TwpTg9ZgHehdXVu7Gh4yWVzqGaXoJZ+ROTB/XVYkyfm
	QozmxgxQNKw2f/TFDdurJUvq/Zf49KgAW4+X77MkMv3WdJmhy56Naxf2BIF1PpIl2G8wY93cD455v
	elY2jow5x4sN/BlKFE2DF5qByARt1hu2n/5Itb2RZEz2lWpZ481VpyJQmsDB9ynhFGTH0R+aYUhx6
	w+wU1evDIp0+BOC4QQTSk41gFPEn3G6C8DnVT1ZaM6jTzirpWSZcER+G3nsjSpf34VBg/9Uzo6fu3
	oVq8Ucw63ini09Pwn/zhnY7fJw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1709544423; h=from : subject :
 to : message-id : date;
 bh=W9vOf5sHthWslbSsPMC1VRrQRgKWvxP8wBkQDQnnMYc=;
 b=nPPSaxYUbVssnc5dFlyaHgfHDg4kJCu+GmvM1LZhaFNB5Pzc6UKr8pbTFdeHdMahRc6Sa
 fenw04z761ZdI75ptSdo1oYOrrcCH5pwzVQ4VFYC5GUv6PjJ2np3am+FqsEDCrJhwlfEy9p
 PXhH/GR5kuk60OL+WkomyKCXq2Vt8GyweRwS3S5aV8eC51po2pN/S7H4KycuNhlzA2pgmHF
 bu8FbU0Ii1GoWMzS/rQsQCVjQPdkx5KdXHnLmxRh2MsHthOnFvaLOMnoIGi1xBzWWAAdisH
 3TUIBfcs9Yk9J1kxcqtrh6VaR2Xzj2Fu0PVHdmMusMM87ou4hvEXinSj2Ejg==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rh4b0-qt4Kr9-18; Mon, 04 Mar 2024 09:26:54 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rh4az-4XdKoZ-2b; Mon, 04 Mar 2024 09:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1709544413; bh=JImv23jdXjLRor9Cn502GabxEt1k66f48C+3dfgfdck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aE7Vbpspw/DY6C8W06WXiUA89CsdLWu68EtwKacbc+h6U073E6j+GD4yi3WovCZzm
 QWKGOuGI/g6hCNfj6v8YATT38v3qaual2cTNEN9IdjddoFLAnG0smMY8PpfWuXTMpn
 UG56Nzh4AfC9viPSJh2v38y4pYXhrS3wK6cQJjeo=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 5B8823C312; Mon,  4 Mar 2024 10:26:53 +0100 (CET)
Date: Mon, 4 Mar 2024 10:26:53 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] kconfig: use linked list in get_symbol_str() to
 iterate over menus
Message-ID: <ZeWT3Wb5AYGcBcok@fjasle.eu>
References: <20240303040035.3450914-1-masahiroy@kernel.org>
 <20240303040035.3450914-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240303040035.3450914-2-masahiroy@kernel.org>
X-Smtpcorp-Track: 1rh4az4bdKoZ2P.5lef9HMTQ1P_t
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sYfuv_Rthp
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Sun, Mar 03, 2024 at 01:00:34PM +0900 Masahiro Yamada wrote:
> Currently, get_symbol_str() uses a tricky approach to traverse the
> associated menus.
> 
> With relevant menus now linked to the symbol using a linked list,
> use list_for_each_entry() for iterating on the menus.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/menu.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

