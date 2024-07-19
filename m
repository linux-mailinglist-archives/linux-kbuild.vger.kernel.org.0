Return-Path: <linux-kbuild+bounces-2597-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A06FE937DED
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 00:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DE84B214D0
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jul 2024 22:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FB1146A76;
	Fri, 19 Jul 2024 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kc2HqEj2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9999824AE;
	Fri, 19 Jul 2024 22:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721429735; cv=none; b=qp2lM/Ap2GNvFj9qH+eTJkGGfMuBZ4b2sM/hr659fLDpkZNMRV5Nt+fR9lX5djEVtFrdIEtyV4m3qeKd2IWK32z1rec8VI+kUtTN4Skhu8bmS2hqEQuLtmtcIkLm3TXbTRW3HJuinE/Y8w0SO5yXpWiio40g+LI/6nxUIOd+WfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721429735; c=relaxed/simple;
	bh=v+Z4xYT3kllfu8QjT9K4YASNCAgFD5wlTBeTO/fv904=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6By3EUFQ75KIufXr6/lFM/XaoG/scmEqB6lpf+d2LjHswIVcrscIIEF8nDSX8Ru222UnKDCnPWLwXA9sw4Dyp85hGZv2/18RhtOcsjsivoE4VhedG3BsiUIk3a96uXtiX+JjBq7W4C6Mdv0v/AGgJY7aM23evPh7QALnG6cATI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kc2HqEj2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEB3C32782;
	Fri, 19 Jul 2024 22:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721429734;
	bh=v+Z4xYT3kllfu8QjT9K4YASNCAgFD5wlTBeTO/fv904=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kc2HqEj2TI1wsaMrSCU7kxdUO4YYgSeVd68dM0NUuN0xM/tgTPfawl60LLkYseR0d
	 ujSYgH4BD+EUrstcIdQyY4fPkBQipUzTCiAw5yP7BGMLmPvQbfdS+ItnniTwRnqqyO
	 wEM0K76FhzqkLDqg3HClpjXbom/nDf1AamEVKso9S66PJTBeOAK32TTYYpu2Rjcd0Z
	 qVjpg/wnRhD/3obT+quKkqF+Z3NZ3SHQhuPXvbt73OafkZeS/Qss7dN+xmCfh4geML
	 b8Aa9gyvw7V1xKE+mjtmQUhyzZPL4sa0ej5ay7S808+ej+hhRFDqDx8n3V9JvTQ1Y8
	 o9VGGcKbSB2uw==
Date: Fri, 19 Jul 2024 15:55:32 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jiri Olsa <jolsa@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Brian Norris <briannorris@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] Makefile: add comment to discourage tools/* addition
 for kernel builds
Message-ID: <20240719225532.mpm36wh6xa3acl7r@treble>
References: <20240717182828.1527504-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240717182828.1527504-1-masahiroy@kernel.org>

On Thu, Jul 18, 2024 at 03:28:19AM +0900, Masahiro Yamada wrote:
> Kbuild provides scripts/Makefile.host to build host programs used for
> building the kernel. Unfortunately, there are two exceptions that opt
> out of Kbuild. The build system under tools/ is a cheesy replica, and
> cause issues. I was recently poked about a problem in the tools build
> system, which I do not maintain (and nobody maintains). [1]
> 
> Without a comment, people might believe this is the right location
> because that is where objtool lives, even if a more robust Kbuild
> syntax satisfies their needs. [2]

I think the original idea (from Ingo?) was to make objtool portable so
it could be easily copied and built separately without getting too
intertwined with the kernel source.

I think that's still a useful goal.  To my knowledge it's been used in
at least one other code base and could be used elsewhere going forward
as much of its functionality might be transferable to other code bases.

Also being in tools helps it shares library code (libsubcmd) and
synced headers with perf (and others).

If there's some other way to make it portable and allow it to share code
with other tools that then I wouldn't object to moving it to scripts.

Or, if the main problem is that there are two custom build systems (one
of them being a cheap knockoff), could kbuild be made portable enough to
be used in tools?

-- 
Josh

