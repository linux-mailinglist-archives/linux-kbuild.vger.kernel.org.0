Return-Path: <linux-kbuild+bounces-6183-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDCBA63297
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 22:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A4D716FE49
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 21:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30D219D07B;
	Sat, 15 Mar 2025 21:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bs3UorAg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927AC376;
	Sat, 15 Mar 2025 21:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742073909; cv=none; b=ddCwPb5egm6RpHU7OYk8kdyJCDjjg88Ap0gW6P2g7uGfKteVbYxJVp1f9qSJQlx1P3Br0LrtbcQ8lqVzFhSVxmyW4MNm3Chq2Zsj+8+3g5IIREZCBLEFx050NwkbO5V7nPpkp30ustHCZRgLADHY1wrkqmvK8RHYc0rlkm7Qios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742073909; c=relaxed/simple;
	bh=7/HKPUBJ3JQjXOQkoxJFT9T4hUXjg/lOG1N7gfF6AFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ad3Wx9BX1lCzDcdgrIFrBUDOcsRpxteiOkHND2VsuKGDAIITZot1Jeeo9bPwAQdXm7UQXTaxojqfmHq/67Bf1UiTd2vW0g8KYMvgwxjU/DmIcZ5k1AiXU6ZAWgsBWJo2H+YZWjZf/NTVhtPCxDxG9UiklxbJZFxAKpPui3bRR0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bs3UorAg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAFBC4CEE5;
	Sat, 15 Mar 2025 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742073909;
	bh=7/HKPUBJ3JQjXOQkoxJFT9T4hUXjg/lOG1N7gfF6AFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bs3UorAgO+H0EJe0OMNUjsXjt5H8sl6nBw4/vEp2GypIzmeHC9f3u8Bm7fhjEk2CH
	 3LLbKzPX5/dqZ9OaXzWfCP0nvmisSZPCZmpvAz3VDIb/M/pgdFLQA6K9Px3UpBONNn
	 +8uOigGdGl4yMx8axC6BzOcEEZm/6zKlFyZl1Jtgz3RlwlvgI3HaWN4MUGZwuwWvva
	 rqH2VoDuBqHSuUd2Q5rA8r5qe0IIZOVqLzh1k7swM6xSLbPCCTqudShAXNOVIixyXn
	 qntuK2dMZBgRVr5qUxizhLZ2TPigOR/TwOK2iw6h/1bxXVLX1wLquMUHP2BOL9g6Th
	 iiegr9oLIG4nQ==
Date: Sat, 15 Mar 2025 22:25:03 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/4] x86/boot/compressed: Switch to -ffile-prefix-map
Message-ID: <Z9XwL8v3-nIneMox@gmail.com>
References: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
 <20250313-kbuild-prefix-map-v1-4-38cea8448c5f@weissschuh.net>
 <CAK7LNATuGr39YSsr0e6pB6wD7shyZVL12GMuE3HaWfXFXuRd4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATuGr39YSsr0e6pB6wD7shyZVL12GMuE3HaWfXFXuRd4w@mail.gmail.com>


* Masahiro Yamada <masahiroy@kernel.org> wrote:

> Hi X86 maintainers,
> 
> Is it OK to pick up this to kbuild tree?
> Ack is appreciated.

Acked-by: Ingo Molnar <mingo@kernel.org>

Thank you for picking up these!

	Ingo

