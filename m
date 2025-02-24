Return-Path: <linux-kbuild+bounces-5882-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7241BA42C03
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 19:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B5D117B23F
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 18:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D80B263F3A;
	Mon, 24 Feb 2025 18:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ogr4hGpV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474B26136D;
	Mon, 24 Feb 2025 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740423104; cv=none; b=dnvXMtoJ7nQdzs5zH3aU74h8nd7svvMHBh44EKjTDVx+fVc26pQlFcNDdNoyZINEAE3FXR4UC4MHh4mrkxAIRD7jKswlZf+a7m9cdvR6K9qnQ3rbrwUCtZy/zfhtkBdVOtJABqUF685CqIYJqvg+YoyGf/6C5Lup7SLJuT/YzRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740423104; c=relaxed/simple;
	bh=LdrQZqrp3xjhBQGUZB3gje9pLhxMsPsOYHdOiNeCf5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAHlv4VefUJIisgwkikS9O2WCf/u3Ln5iLLg1WyzzVrvmhQaqSh3o5Iqb1CHq64VPTLkMN3AHy6ddPCTVECVa3cAZc63kRiP04nadjStKgNvZoLYMRemR+vSo2NlXzgU0XB+TTkgRieCCRRNHAH2zhHikaKnkPXh8eUCT8xPGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ogr4hGpV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625C0C4CED6;
	Mon, 24 Feb 2025 18:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740423103;
	bh=LdrQZqrp3xjhBQGUZB3gje9pLhxMsPsOYHdOiNeCf5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ogr4hGpVVlzS+yqzsEQhi01hwxo/x0XFGs2lXu93KVPC7ln9waKrcxxXytrFJzEmA
	 Bj29u3u4CvmQwFh3Iew2fDFRZ93g4WTyyHIgXck4JXhc5Y9SXsBh7YmhGzaEK09YmN
	 5WCkYR5Gb9CAi/lRyqIBN2zu4Kl6JcP+a2SacjNBVZVz6z8Qzh3qwoKEDyyNynhpj1
	 sAqTgm+iTHc8g6/nu63LHIbVMypo9UrBIqohkxtUD0/ICm4ghEa2uyfT/BmjLEfQEW
	 qR1NT47MTGvdI7Wre2GXtBG/hdfrkaOVQCWmYSMclA2rjfNmMfIkUgoOpJ6lIOXkeM
	 uqUy7HpUqfzHw==
Date: Mon, 24 Feb 2025 19:51:35 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-kbuild@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
Message-ID: <Z7y_i-ySL68BfkgQ@gmail.com>
References: <20250224132132.1765115-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224132132.1765115-6-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Kbuild supports an architecture specific Makefile.postlink file that is
> invoked for the vmlinux target after it has been built. This Makefile
> takes 'vmlinux' (which has just been built) as the target, and mangles
> the file and/or constructs other intermediate artifacts from it.
> 
> This violates the general philosophy of Make, which is based on rules
> and dependencies, and artifacts that are rebuilt only when any of their
> dependencies have been updated.
> 
> Instead, the different incarnations of vmlinux that are consumed by
> different stages of the build should be emitted as distinct files, where
> rules and dependencies are used to define one in terms of the other.
> 
> This also works around an error observed here [0], where vmlinux is
> deleted by Make because a subsequent step that consumes it as input
> throws an error.
> 
> So refactor the vmlinux shell scripts and build rules so that
> architectures that rely on --emit-relocs to construct vmlinux with
> static relocations preserved will get a separate vmlinux.unstripped file
> carrying those relocations. This removes the need for an imperative
> postlink step, given that any rules that depend on the unstripped
> vmlinux can now simply depend on vmlinux.unstripped, rather than inject
> a build step into Makefile.postlink

Nice! Does this also result in any measurable speedup of the build, or 
are the steps still similar?

But in terms of justification for upstreaming, the reduction in 
complexity alone makes it worth it IMO:

  19 files changed, 52 insertions(+), 87 deletions(-)

Thanks,

	Ingo

