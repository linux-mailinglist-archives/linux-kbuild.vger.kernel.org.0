Return-Path: <linux-kbuild+bounces-12849-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLAjBd6852mu/wEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12849-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2026 20:07:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32643E5F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2026 20:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 296683080E85
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2026 18:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9174F3A9610;
	Tue, 21 Apr 2026 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kl9SbaBS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83E39DBF3;
	Tue, 21 Apr 2026 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776794460; cv=none; b=nlcPLP2Vd/lvbxc2NrmH7mBIQtturqnkzYxqCN0EW7sda/UusiN9Ec3Dwt5n4D1HgBjxxMwNfUq7pRc4Dbq1z6XJeJxGEyHx7U+fL6MRNeGvBgyvNi2UDhYFsz2yDBwIPc48AFbbyGFGqyjkwng32w0cOhmhNadamsXXOCONULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776794460; c=relaxed/simple;
	bh=ohE20d4eeeH1tdEUpFFkSXsdolQHC/2BDrYxZa0fezY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEXEo0u1tHCYlVT8tqy3eaq78ymszEFXUDa8GD19wWGZfBt4WNVdA5V1bkO4OOVx6uHCLzzsofVmt8uiaZfnR9GQU1EbkdMpO9rO8Fge4ZtwdPbrDreX0PXOv9yI9vpDA2iAKq896nPgh8xhxFiZo/2PdrtD6Lcc6bw5Dp0eDuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kl9SbaBS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5297AC2BCB0;
	Tue, 21 Apr 2026 18:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776794459;
	bh=ohE20d4eeeH1tdEUpFFkSXsdolQHC/2BDrYxZa0fezY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kl9SbaBSvl7EPS37KTbZ4kANODXAFlQZeLHoXKzcgQSlQKcDuaySdYhqOIZDcwOD9
	 5BGcfRBTuci3+W+AXUD3ncIORh7suIbMHmhjmKcGEcbdVMMdtypRnryVxE/uSDUoKU
	 jwsRDHlqp/VDtFHNQ9/rONw1moSiY4FwesR9s8Z0kF/ZrQXnBADxwpg0z1kISoAuFX
	 1ijlucM/Jt5MQu5ZcvzRScunBmsnyjA7HkwHBAi989lIDCCfpVrzaWj8bWAi7eop7z
	 ep6+yjT+ma7645xskCUHtV2Tx6U252GfAOYnNd6S6u0YJgBHQGGUEVGhQCcj2zeqfw
	 TOjF1anlMnWDQ==
Date: Tue, 21 Apr 2026 19:56:12 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: document generation of offset header files
Message-ID: <aee6PKQlHxCeSS0z@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
References: <20260410221257.191517-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410221257.191517-1-piyushpatle228@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12849-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D32643E5F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 03:42:54AM +0530, Piyush Patle wrote:
> Replace the placeholder reference with a description of how Kbuild
> generates offset header files such as include/generated/asm-offsets.h.
> 
> Remove the corresponding TODO entry now that this is documented.
> 
> Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> ---
>  Documentation/kbuild/makefiles.rst | 41 ++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 8 deletions(-)

Looks good to me, thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>



