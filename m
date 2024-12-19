Return-Path: <linux-kbuild+bounces-5214-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A0F9F882A
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 23:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC50E1891164
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7841D2B2A;
	Thu, 19 Dec 2024 22:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7xMpq1R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18278F4A;
	Thu, 19 Dec 2024 22:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734649004; cv=none; b=VCezI9tXEHw9eyJO/SBHqFRLyShdI/GXBsjaRQ5cCNPMDnjlN5RcJb5SEMRDV/oUybw/wu3DeKV2RmvJF+yZOilBsXV8xSPNBGHumqpBCOXG4CPSdKpIuHW3JO72yyT9v4acjP3p2EFu5LG0qWZENvawlsZlx+/Hsw0K7hBkaYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734649004; c=relaxed/simple;
	bh=J2q1sa3skK2L8gyug4xknJ2l4Ih0hsNJ4Yx0LkevRQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHi0pxhFkNOftEwjuTwGdabY1NVEw52H8CXgtKzMcFwQbj5yLAtxgq4klVJMluf/Hz+n7LQBnnP5F8qqadFLJ2UsmfxJ3YDpYkDNeckAWMR/V1qM6TF85CqEMUqSv0F27fups7IuZL2NqSHt7qpUPobjHtE23q4Ac6SLmFY0pA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7xMpq1R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CBEC4CECE;
	Thu, 19 Dec 2024 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734649004;
	bh=J2q1sa3skK2L8gyug4xknJ2l4Ih0hsNJ4Yx0LkevRQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7xMpq1R08NkbYvysDMk5hIjiXRPQPSqfw09+UiCVkpAoQ65qkCsGJk6AgSEQFHS3
	 BEFAlHJRtA8wameoIzE+dkcGs2idcvRo4P31iQNJN8mBr0D+x5TV919U3NDSGG4tbD
	 cBnEd+L63PRLo8dZngkhCvo6GyWz+gVBXtdxKMDlHzSUOutYLF9KRA07VeKpkOo2/A
	 YojWb6d6/Fp+wDhZGoreE2tEv7n+HHWAIgWsfqHvs68xtni8L5NfyuKZrdXrmbYCJQ
	 iTF0WuVqV8nhReaS4h91AJlwWHjsAmlvx8wrINWoOnEgPh739pi4eNmsJCGfu/3mYy
	 TioCM8A0S1/Og==
Date: Thu, 19 Dec 2024 14:56:42 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20241219225642.ho42z3kgeuy5vq4v@jpoimboe>
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>
 <20241219010054.pxcnejgkvy3g744k@jpoimboe>
 <20241219221913.GA1259354@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219221913.GA1259354@ax162>

On Thu, Dec 19, 2024 at 03:19:13PM -0700, Nathan Chancellor wrote:
> I do agree with you that figuring our the root problem and resolution to
> some of these warnings is not always the easiest, especially when they
> are on the toolchain side, so I have often kicked the can down the road.
> I know there is some documentation in objtool.txt around various
> warnings, is that pretty up to date/accurate? Are there any other
> resources I could look at to help with this work?

I think the document is pretty up to date.  Some warnings are self
explanatory but others like "unreachable instruction" or "stack state
mismatch" do require digging.

One thing that can help is to "export OBJTOOL_VERBOSE=1", which will
tell objtool to disassemble any affected functions and show a backtrace
with all the taken branches leading up to the warning (if applicable).
Maybe that should be the default for --Werror.

I'd definitely like more people to be able to debug objtool warnings.
Any ideas on making that easier or educating people or improving
warnings are very welcome.  I'll be keeping that in mind when looking at
the build errors over the holidays.

> Some objtool reports get sent to only llvm@lists.linux.dev when clang is
> involved (due to a historical filter IIRC, I cannot find the original
> request), so you may want to glance at [2] to see if anything new pops
> up.

We need to figure out how to get that fixed, the commit author really
needs to know if their code causes a warning/error.

-- 
Josh

