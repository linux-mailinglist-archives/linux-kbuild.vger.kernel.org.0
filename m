Return-Path: <linux-kbuild+bounces-9956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE9C9E242
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 09:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56B164E10F4
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 08:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FBA2BEC2D;
	Wed,  3 Dec 2025 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oQJE0a16"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3432BE7DF;
	Wed,  3 Dec 2025 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749227; cv=none; b=GKcd2hRY1QDP+2Byl2u3ZDhkyogqsSrJM1mB7uBqpS0DRGeZps/0C7M4rQFzVOKMeZYoWBHKAcjFRIHru6SgQ4Bfjfu7+nLtKay5uPb2qKv9uwqTYUF2cvb+Is9TZHpXmw60wB23oLWsgts7TrxMW1Iv+SkeeIMaCA/FPt7P6sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749227; c=relaxed/simple;
	bh=hbwx1jJWjNjB6HWEntsHWkqWx5U9X1zPHvgMbNVET4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/N03lIL6C5qhLRlXpBqNB+aGrOsuv0umsTXJGyPaxHcoiNZVid6H/BaQzeWZX/Q3xlJWuxuCmolgHn9CC106mSdU2o6Wq0UDL3V6MoDiLLgsTcf1KzJTklxTZWhZnnBcYSB5uXPcM/o+8IQez93FmEd47NeCVrQ6g+oK/VqyJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oQJE0a16; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534DEC113D0;
	Wed,  3 Dec 2025 08:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764749225;
	bh=hbwx1jJWjNjB6HWEntsHWkqWx5U9X1zPHvgMbNVET4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQJE0a16agj2XMK0WZzKxGD44AXePkTbPAaQFSnfC7ZMZqljdeUL+3WXK1zHRwSd+
	 g4ZXuSIqlr89XGc5v5LzHNS1m7dOHK+NJ5fFMEYFPUXBCEUgPlK3wBF7+Tl4zTEP1i
	 M9CkBlGy/Xf2Grz5AU2sGztWWrRAn/CLA6zV3xmw=
Date: Wed, 3 Dec 2025 09:07:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	andy@kernel.org, krzk@kernel.org, linus.walleij@linaro.org,
	nsc@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, abhishekpandit@chromium.org,
	masahiroy@kernel.org, legion@kernel.org, hughd@google.com,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Subject: Re: [PATCH v3] mcb: Add missing modpost build support
Message-ID: <2025120340-clubbing-stash-a933@gregkh>
References: <20251202084200.10410-1-dev-josejavier.rodriguez@duagon.com>
 <20251202203421.GB1959956@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202203421.GB1959956@ax162>

On Tue, Dec 02, 2025 at 01:34:21PM -0700, Nathan Chancellor wrote:
> On Tue, Dec 02, 2025 at 09:42:00AM +0100, Jose Javier Rodriguez Barbarin wrote:
> > mcb bus is not prepared to autoload client drivers with the data defined on
> > the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
> > inside MODULE_DEVICE_TABLE so the data declared inside is ignored.
> > 
> > Add modpost build support for accessing to the mcb_table_id coded on device
> > drivers' MODULE_DEVICE_TABLE.
> > 
> > Fixes: 3764e82e5150 ("drivers: Introduce MEN Chameleon Bus")
> > Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
> > Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
> > ---
> 
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> 
> We should be able to get this to Linus by 6.19-rc1.

Why?  What's the rush?  It should have been in -next already to get into
-rc1.

thanks,

greg k-h

