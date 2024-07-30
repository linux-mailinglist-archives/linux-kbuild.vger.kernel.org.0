Return-Path: <linux-kbuild+bounces-2736-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52F940306
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 03:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF3211C21913
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 01:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3943D10E9;
	Tue, 30 Jul 2024 01:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZSQBGtB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ABF8BF0;
	Tue, 30 Jul 2024 01:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722301439; cv=none; b=YPIA3FSV6xMxC66DBrni1jInwX69vXxzId2e+wBJchEFGeA33MCGY7kFbfsJ+7HeL0hsqohNbsx+eoj7M540oG7Gz+i7vmQuFxKmAlX44ZqXni8vN+Q7aZlP2j3y8hTzgqz42AElVQlMyFnvmAwp+0H19YuQxjEg8KsR6J/NuK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722301439; c=relaxed/simple;
	bh=2Q7uEnGSSgWeJik9prx3AAxtezJhB7SlZbfhdLKQFcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tS112wrZerdsA2HUBlfqd3wA27QLhLoBGD/uWzcxQQn8m0GZSLpWEaYxRV/YB3gHurudZBgl6saOgey85xdKSGZ6jVHhVabh45Rlfdo53asQNSQ4h4Wnp8kg3gZ2jmtaBxNBsZG2+rsVUZYh12EW2atUOBR18DKDLym54y2mVlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZSQBGtB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBEFC32786;
	Tue, 30 Jul 2024 01:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722301438;
	bh=2Q7uEnGSSgWeJik9prx3AAxtezJhB7SlZbfhdLKQFcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZSQBGtBAkoTz9EFp/H1Pu8+qxJ/8O2YBanXsU4pnJKrwcXrNs8x38Xy01nIcpwbg
	 rLfaJ+KKVytSVnhEtzGSiNPYjDsMWgwu5PXevo/MHVqwDLKVMp4rbY8AnGr6iQHYy8
	 mVm73iF6Io+obCXDy/2dL/clkb65IshU0dXIp4raeyFhOrK/uhhFFo6XkIcdWdzZ1e
	 J4TzwDDGgWIa5lzJNP6+4WQfhYRr6xGtbqHJUFWoPmGioVyOK8cq1tRY3GSD2G2mAj
	 BXEgF5mXaoBhwogbWAy0QTG99NhiFOja3O99NRkOBNE4PT1HJwNrkidspNDRxBw/bY
	 E/MYlkPl5N7Hw==
Date: Mon, 29 Jul 2024 18:03:58 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when
 possible
Message-ID: <202407291757.BE6D847803@keescook>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727074526.1771247-5-masahiroy@kernel.org>

On Sat, Jul 27, 2024 at 04:42:04PM +0900, Masahiro Yamada wrote:
> There are known limitations:
> 
>  - GCC plugins
> 
>    It would possible to rebuild GCC plugins for the target architecture
>    by passing HOSTCXX=${CROSS_COMPILE}g++ with necessary packages
>    installed, but gcc on the installed system emits
>    "cc1: error: incompatible gcc/plugin versions". I did not find a
>    solution for this because 'gcc' on a foreign architecture is a
>    different compiler after all.

Do you mean having a plugins as part of a distro package? Does anyone do
this?

-- 
Kees Cook

