Return-Path: <linux-kbuild+bounces-8632-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A05B38701
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 17:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 358F67B2C37
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 15:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C34F2F0671;
	Wed, 27 Aug 2025 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLOHvVpR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BCD271444;
	Wed, 27 Aug 2025 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756309949; cv=none; b=H7vHMKpLbJ7AxLK+tO1yx8WjoO0QCvC0OMvYMqERsFC+SJ/RwhppjRA9BAtdIuqOoKHjE3jCdPw2kyDEQs3X7SjFEf3/uG+N/U8btsHPflIAkeRdIxjtbTA0jsJ1tE+q0gyNpHHC5VL8gNxwlkJUhGKZD21ytcDz32bEpYoywAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756309949; c=relaxed/simple;
	bh=rVWWbCWChOxQ+RyGGlA88YhFUAptpvFKsffn4iRI1mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIY/7tIXyFk4A7e+sypxo3rt80IqK41BN5e+siBzDW8WYDNu+AJ+L7IhyCgMyuM3aaA6c9l4Uu1WU84ALRfCZvmfX7pcwP+yEu5jhvltF0SzCQQ9d1f8fnP+/cZQltzSRsM3lB8e6lWacsBFzuKHB3e2ma9RIGX23BO7RWk+5MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLOHvVpR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA59CC4CEEB;
	Wed, 27 Aug 2025 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756309948;
	bh=rVWWbCWChOxQ+RyGGlA88YhFUAptpvFKsffn4iRI1mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BLOHvVpR4Hsqocny9B85z8YgvvvY/sl5tF8W+9TcxZ6sPN8DcoMXHXlo9xKkIiowc
	 DFY3FjgRM/9mccaxCA1/lIr1Vk+ZACSdQxcngFCpOeR99nc5rusSwdn6uzJGjbprBx
	 Gd3BkLSTBIS5nIEVSO6sow3csQrHMA+VWl4WvksVEwWwmqqdwrwtKx8OW2SlhrkLzU
	 uDANDuzv6EsAG9PjfFR87AqRscpVzx+v0XHSXMif/Mv5H8vND2XpSTSJM7yTsPQFrG
	 4Vy0zA5YSvMNjyB62VQH3+TCWjcezr+cUpDihu7H0TwdQSLvJ1eADzlZhkvP+pdzKF
	 hUmfMTbEcwH8g==
Date: Wed, 27 Aug 2025 16:52:23 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	dhowells@redhat.com, kees@kernel.org, gustavoars@kernel.org,
	aleksander.lobakin@intel.com, tstruk@gigaio.com
Subject: Re: [PATCH net-next v2] uapi: wrap compiler_types.h in an ifdef
 instead of the implicit strip
Message-ID: <20250827155223.GA10519@horms.kernel.org>
References: <20250825201828.2370083-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825201828.2370083-1-kuba@kernel.org>

On Mon, Aug 25, 2025 at 01:18:28PM -0700, Jakub Kicinski wrote:
> The uAPI stddef header includes compiler_types.h, a kernel-only
> header, to make sure that kernel definitions of annotations
> like __counted_by() take precedence.
> 
> There is a hack in scripts/headers_install.sh which strips includes
> of compiler.h and compiler_types.h when installing uAPI headers.
> While explicit handling makes sense for compiler.h, which is included
> all over the uAPI, compiler_types.h is only included by stddef.h
> (within the uAPI, obviously it's included in kernel code a lot).
> 
> Remove the stripping from scripts/headers_install.sh and wrap
> the include of compiler_types.h in #ifdef __KERNEL__ instead.
> This should be equivalent functionally, but is easier to understand
> to a casual reader of the code. It also makes it easier to work
> with kernel headers directly from under tools/
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2:
>  - remove the hack from scripts/headers_install.sh
>  - wrap in __KERNEL__ instead of removing
> v1: https://lore.kernel.org/20250818181848.799566-1-kuba@kernel.org

Reviewed-by: Simon Horman <horms@kernel.org>


