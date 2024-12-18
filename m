Return-Path: <linux-kbuild+bounces-5167-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDB59F610C
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 10:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E671918957E0
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 09:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E991990BD;
	Wed, 18 Dec 2024 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWYAqJO9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCF9194ACC;
	Wed, 18 Dec 2024 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512910; cv=none; b=arv2yeus0Bh+rviswITQLreD/Sh5gCU3cI9ML3kl31syclTVjfZP5N5m73J8CCvpPCgaoHF07BRyrni+E56Tv/6J0Id3Y5J3927hDaRcLYbbkpaZSt+tKi0uHq/rAA4fgNAf7ovmrQ93hfctYPpDTjbDZ4ey/yeFeb9BkaBvrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512910; c=relaxed/simple;
	bh=2l359ykYG5FfehKnl90wrIE1Nf6TSo45YjUCjJDzv2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQKZQT9XOUm0iF4KnoZSDrcohsMHZb4HTIyis13Nd/n1k3dyaGhtxlmTLx7fNWo1fIj8n1bBFPvlKz8dih6TWQ0WednVfL1qTg12OkaZVmyyfxvoJvikuVXluQmxuDfhWUmfh2PQH9AM5SuuUmEe3P9uaUkH+Qj3xPKwzBIqgP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWYAqJO9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B08C4CECE;
	Wed, 18 Dec 2024 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734512909;
	bh=2l359ykYG5FfehKnl90wrIE1Nf6TSo45YjUCjJDzv2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWYAqJO9HrZoq9P6Mg6hgljSg8TWuNDG1kaUEB/mOxJFh/QPOZ1Xd0W9DyHAkbP0x
	 VqaV+CRTDAbD7ziD7sttB5gjJTGo5TE2ZsapRtk8HKUgDrSNMzgF1ZqRqZP1HWIKx2
	 T/jjkroM44DpuRnwAeQcX0FCTaigKJKxSBMN0HI6qNO5K65yef5dTUgJYSKpeNWTA+
	 fq+zl9Dl+L7KVFRJiHQ+51iErCliLi0isizN9XW2vd095Wo0/Yp+QPnqvW3nA0oB3x
	 kDiPFeJiUPRYJfhLEMjPeO1uu2EC7HhP2E4eWGFN6jOMvk5wsZi6pgGcCQtAo1SQkK
	 oYa/aTZfaI7Xg==
Date: Wed, 18 Dec 2024 01:08:27 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: Add option to fail build on vmlinux objtool
 issues
Message-ID: <20241218090827.fns4wx4bqwadqvcq@jpoimboe>
References: <20241213-objtool-strict-v1-0-fd388f9d971f@google.com>
 <20241213-objtool-strict-v1-2-fd388f9d971f@google.com>
 <20241214005223.f2fansikbwovm3oo@jpoimboe>
 <CA+i-1C20dBQGYU0gAJ7BGfo7ShSYSuZgB0Gr_Y-ei9gqXq83zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+i-1C20dBQGYU0gAJ7BGfo7ShSYSuZgB0Gr_Y-ei9gqXq83zw@mail.gmail.com>

On Mon, Dec 16, 2024 at 11:00:58AM +0100, Brendan Jackman wrote:
> On Sat, 14 Dec 2024 at 01:52, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > Note that *any* objtool warning has a good change of being a major bug
> > in the kernel or compiler which could result in crashing the kernel or
> > breaking the livepatch consistency model.  So the option shouldn't be
> > restricted to noinstr builds only.  In which case it should be called
> > CONFIG_OBJTOOL_WERROR, analagous to CONFIG_WERROR.
> 
> Sure, sounds good too.
> 
> Just to make sure I'm on the same page - are you saying I should add
> the flag to $(objtool-args-y) instead of $(vmlinux-objtool-args-y)?

Yeah, that should do it.

-- 
Josh

