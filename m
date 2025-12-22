Return-Path: <linux-kbuild+bounces-10321-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D377ECD6A3B
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 17:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D38E303CF60
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 16:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9B9330640;
	Mon, 22 Dec 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fdX/37A+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5218A330300;
	Mon, 22 Dec 2025 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766419934; cv=none; b=MNJGJGpJyKXLHUz6/gVvDCzo9wrbKBX64QejmTzrfBvHKIRZx1C1hJwChiFoTV/sbPYTV2rKCFIibxC/AsIDRgYDBHU/0cGhFl48NIC+q6emGAlihLgqOgugT3N0pEfNdpySavbgU+xHlpTqntGKiD65TriD0pFA7p3AfkXBaHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766419934; c=relaxed/simple;
	bh=M6DhZvlSsq1rhfR277ODwk5R1IidPifAsL792UbrqPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4WvOHoWAXRcyLsnnR9YJzNpw/CMYsWJJKDHuVmg76kB2X+pZkqQW80C+KlV5qdRG1Bq0+l9bY6E00LsHQDQ18p46hmJweEf47qcbOmN6YB4c5y/KhWCh5psM+rJ+UUavAqxDp6U9CTXRm0dFhBMSB0wBYaB6Ix/py7S4gBqqf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fdX/37A+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3111C4CEF1;
	Mon, 22 Dec 2025 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766419931;
	bh=M6DhZvlSsq1rhfR277ODwk5R1IidPifAsL792UbrqPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdX/37A+PAyKz9lvuylArUF/YfbRmXPvjV7LCdB3suySnKWypb6Hnm4XGZvg5CINU
	 0qjjb6SAF2uzvxtuQZcXUk0N8AqSlEGbj1pkOaLgodfhrBWXjASouoJR+Ve83D5mtb
	 YK/p7RuoBUji167QPrD4Xu+dqwHwnx8grvo1lERM=
Date: Mon, 22 Dec 2025 11:12:10 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
Message-ID: <20251222-aboriginal-guppy-of-charisma-49fe02@lemur>
References: <cover.1766061692.git.gtucker@gtucker.io>
 <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
 <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
 <CANiq72mtqdR0EU9GM6yu1-Rn0V98ZftUA814eY3ue2YH1xdNHw@mail.gmail.com>
 <09b3bc78-6c55-4d8c-8d09-9f313454dee3@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <09b3bc78-6c55-4d8c-8d09-9f313454dee3@gtucker.io>

On Mon, Dec 22, 2025 at 10:11:25AM +0100, Guillaume Tucker wrote:
> Ah yes, good point.  Except right now it's returning HTTP 403...
> Hopefully that's just a temporary technical glitch.

(it was)

-K

