Return-Path: <linux-kbuild+bounces-5474-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE93A0FD39
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 01:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7591A169A27
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 00:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E132F2A;
	Tue, 14 Jan 2025 00:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUxDP6xL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840E4A0F;
	Tue, 14 Jan 2025 00:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736813683; cv=none; b=D1TcnJQ6M0XjPCT/Tt9oWFU/6rjcrxudyHjO6UvOXtKqpWqQgYOaUHqYekcWU22EmHGX2uEhP9njId8XWHbI4A897kUhU0UqgpL8Oz8sjeaicTznXIvGteMNadPBouqfA1+8Ovz/oMRJNd/O03+qYm+NfsEMafR9u9hWaWruuQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736813683; c=relaxed/simple;
	bh=ZmWUDCKboxZSC3iJnyp08a2hpmkxQXKxuJj7SrYo7pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYHUN8wD2Cr2M3pmq4kRY/adQjAbNu99pHmJaYsabUWNWH5OLuooY6/VkQQfXzMMMp+g6M7tqc1RLSx6MMSZbyj0RcGxJDgk1S2cl0KF359Dur4/SmtIh8J8V0CPr/zdFX4MaOYjYBXSxxVTY/HBACAuUdNOOK+fJJHbpLoGw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUxDP6xL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C50C4CED6;
	Tue, 14 Jan 2025 00:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736813683;
	bh=ZmWUDCKboxZSC3iJnyp08a2hpmkxQXKxuJj7SrYo7pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUxDP6xLJ0/p7g0vvGqJX3paW73Uap76xXkbITM0VoGXSl0o64u8PUQtHd0XRZnRS
	 U6rsOYXiipn/cpYT1RL3AimzOLgHfTXIbp0m9kQFnaCLv5+zlIWLZL1dYj07i3hGIS
	 9rGw+TPPg/5tKkMpCO/vESby0aeChLoC1iiMBX2ilVieO0Yu31iypRqSJm4GV5fnbD
	 +0GtUFK48kAkcSBkQI1xgcL7KOgoKPQAJl76KUYDdRQm9vcbmrXLfRLvBhiQqDdigR
	 MmDTRXgm5/sMoNKNG92gtYXFlLSAMbxX9yf9lQq692Md5hNEVurG/S0DQA+hMGsNjC
	 ppDLAAwJf1BvQ==
Date: Mon, 13 Jan 2025 16:14:40 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>

On Mon, Jan 13, 2025 at 02:05:14PM +0000, Brendan Jackman wrote:
> This adds an option to objtool to exit with an error when it enounters
> warnings.
> 
> Then, it adds a config to enable that flag. This enables you to fail
> the build e.g. when noinstr is violated.
> 
> When that happens, you also get a more verbose log, for example when
> failing noisntr validation it dumps disassembly of the offending code.
> 
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
> Changes in v3:
> - Added --verbose to objtool args (equivalent to OBJTOOL_VERBOSE=1, which
>   Josh Poimboeuf suggested).
> - Link to v2: https://lore.kernel.org/r/20241218-objtool-strict-v2-0-a5297c961434@google.com

Thanks!  I'm putting it through bot testing now.

-- 
Josh

