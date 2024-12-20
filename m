Return-Path: <linux-kbuild+bounces-5216-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D10E9F8B3A
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2024 05:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A152167098
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2024 04:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BB87E107;
	Fri, 20 Dec 2024 04:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4RKSCwQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5218EAB;
	Fri, 20 Dec 2024 04:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734668942; cv=none; b=GrHtWqslqGImw75AnOwUDKdSkR/Sv+dRhuYpHbx9cG598bhPz6Bqd5zQq/ticBYrl8IFjatmy30sWmsCGCULvqzObGuwkMDDdndyMbkAx3ULmsWBtXliQoYySlLGEEqch8ZIlTTW21i4VhQaKB9tk3qLC4CJ0MD8vC13whGIXSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734668942; c=relaxed/simple;
	bh=uPUnHYn/V1+uMo80vM/4FkDBN47Pxt/+NHL6ybpWZ7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0fsXxS9Yh6seXLX02CVWiET/PSugrf1tyGK/CswV293Pm02OvC+V3eM7CeKkt4W3xYCOpY61zLEt+/IWIAmEYb0CxUdH4wzjm/2FqMzIQkUIMxZDpIWj5vaYMhquEl+fC1M7kcKyTCowpTMSIjLQuVJSbV+nboa743EwX9ULUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4RKSCwQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3CBC4CECD;
	Fri, 20 Dec 2024 04:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734668942;
	bh=uPUnHYn/V1+uMo80vM/4FkDBN47Pxt/+NHL6ybpWZ7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4RKSCwQ1BKLiT5ChzVtgl1UQA0rglKgLqk/JBoa7leqe/bwuAFOdaxb2V0TrXbaN
	 pAzzH1Dj6v61fb1Z2R/liF9RTdmY1Z3fsSqcUQ88CCLj7h5l1SvmI8MCVvOoc6HsAB
	 ZLHyRuMIXKVzAFknDOX9g3ipy+Fq5htQ5LeAqRRDuB0xFAYXMrGAsqzxW5aenThmCf
	 U1RRpOacI16yjzkDRRGU0KGiptUSsLi2arnnvIaVq7Fj50nwv2NgO73zwzVb2IcIBO
	 2lkQsMNJPEHp1hU8j6e0N+4i+yROMGy3dpkYwgPTpf+EQgUnGO1pAJFu7e184E/PNf
	 0GBmrnGtS5mbg==
Date: Fri, 20 Dec 2024 04:28:57 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, akuchynski@google.com,
	sboyd@kernel.org, pmalani@chromium.org, badhri@google.com,
	rdbabiera@google.com, dmitry.baryshkov@linaro.org,
	jthies@google.com, Benson Leung <bleung@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 0/8] Thunderbolt and DP altmode support for
 cros-ec-typec
Message-ID: <Z2TyiUt1SCASbznh@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>

On Fri, Dec 13, 2024 at 03:35:41PM -0800, Abhishek Pandit-Subedi wrote:
> Abhishek Pandit-Subedi (7):
>   usb: typec: Only use SVID for matching altmodes
>   usb: typec: Make active on port altmode writable
>   usb: typec: Print err when displayport fails to enter
>   platform/chrome: cros_ec_typec: Update partner altmode active
>   platform/chrome: cros_ec_typec: Displayport support
>   platform/chrome: cros_ec_typec: Thunderbolt support
>   platform/chrome: cros_ec_typec: Disable tbt on port
> 
> Heikki Krogerus (1):
>   usb: typec: Add driver for Thunderbolt 3 Alternate Mode

It looks no but just want to confirm: does the 4 cros_ec_typec patches
build-time depend on the typec patches?  I.e. can they merge through
different trees?

