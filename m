Return-Path: <linux-kbuild+bounces-8500-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4850AB299FD
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 08:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CBDF170725
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 06:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F6B2777F9;
	Mon, 18 Aug 2025 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxA4+bzF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A769E275B1A;
	Mon, 18 Aug 2025 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755499426; cv=none; b=tdAXAWyCTDMhb9NlFM7AMpb1JuJ91NsnDm31bYzFstbbbxrCY6Yv5eFL1wMdhHpBMkwe2FIdC+ZfZW5l9DuGLMZLEF8rTQFkPsq8Iazdedlj3yUex6GTjBROFtyHNwjdXo7wN9y2wUqRKkYbpq8NRiJWNDPvg4F4eX7fSt35CrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755499426; c=relaxed/simple;
	bh=+UB0v50PNZs7N99cne4veHn0nFg12G6ZT3pMDJejsig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLkVZIcezCErx+l/MC1kyxY5G3LuRMJo/kSI/Jjk8kUJOqSwAaIfiLWxGIBTQCaDooCpSFGDicyMYEIjlMwL42cA87I0AExpNhBzKaj/XnqN55gtEdVzCE8c6ZSQlRIlQpGYQEj0bief4mjRPKwq6WyC+iWTJcQDO8U8OOPVAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxA4+bzF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FFCC4CEEB;
	Mon, 18 Aug 2025 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755499426;
	bh=+UB0v50PNZs7N99cne4veHn0nFg12G6ZT3pMDJejsig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cxA4+bzFlDM64tQvh3k93X/uuDwONH5X2jB9TbWouUFmdWH6d8wiF/TEzrF364bVd
	 Y0dUyq/ObBoPy1zaKYvOItvvC8Y3Jf01c3tjKwWMdw8bQjPSuKlim/7y1GToX6Z5vs
	 yENqVx0FTn8CF47oK+MLVGaSbwJB+SwP54ubrocRFETGV1PHkQGnZjmLK8OqdXfecc
	 dHjpUAP79pnAQ66dZffB4uQb6sysFZSebvin2fZ95eOkXC+r+c0FxxdeRWSiRsQF04
	 pxVPLpG9r4l1Qk7zmxPYdIXtFwnFDhPoUGxBDM92C8Lhj8LXzVQuEfc6lMwG6gDGhJ
	 62InHmPGHgqHA==
Date: Sun, 17 Aug 2025 23:43:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6 3/9] kbuild: extract modules.builtin.modinfo from
 vmlinux.unstripped
Message-ID: <20250818064341.GA2815827@ax162>
References: <cover.1755170493.git.legion@kernel.org>
 <16859d94a2c8e4b1bb305defdb8b7be238499c66.1755170493.git.legion@kernel.org>
 <CAK7LNAR-gD2H6Kk-rZjo0R3weTHCGTm0a=u2tRH1WWW6Sx6=RQ@mail.gmail.com>
 <aKHQl_XC63-c-81L@example.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKHQl_XC63-c-81L@example.org>

On Sun, Aug 17, 2025 at 02:52:39PM +0200, Alexey Gladkov wrote:
> My emails must have gotten lost somewhere. Because I replied to that
> message right away and provided a fix. Stephen even applied it to the tree
> later. You were in CC whole time.
> 
> https://lore.kernel.org/all/20250730090025.2402129-1-legion@kernel.org/
> 
> Tomorrow I will make a new version with the corrections I missed. But now,
> I'm not sure to which tree I should send it.

You can send it against kbuild-next:

https://git.kernel.org/kbuild/l/kbuild-next

Cheers,
Nathan

