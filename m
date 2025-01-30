Return-Path: <linux-kbuild+bounces-5573-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D1A233C5
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 19:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87E261636B1
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 18:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A33B1482E1;
	Thu, 30 Jan 2025 18:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mezy6fJR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E747DA82;
	Thu, 30 Jan 2025 18:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738261848; cv=none; b=sdqKVmfqcrWNod3D62LCv+oL6NJOLJMa4cBYpIU9XwvF/z2D4JSQ82BpO4x5apXFCB50t+aTSY7ER+MflteWhUjbgTHxg155iZHtf4CZD2EdA7NuIPZe1SlwFcrZxR/JAwtnXwKkYXQYbZ8gNnq+UhSyWczwpuRKxt55vOTRF2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738261848; c=relaxed/simple;
	bh=q3D8T2eL4a5/21hoDtjcTOhRF4z3jarLUATrczArHTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9wf9ayq6XHGNNU6ZwfTc2EhptvhDLPoryoxO4HTwHYPYgZgSGWC93PtDdgBMs1i6H3hP/A6/eNsBQK3qu/lh0Xhunq+qeAYNZLo94nDG1GLk9PyVZ23QVJzE3ai1dzUO1l9dvohoT2ev1J9mtk8+UngOslhsEFaitd8GbDngEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mezy6fJR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA411C4CED2;
	Thu, 30 Jan 2025 18:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738261847;
	bh=q3D8T2eL4a5/21hoDtjcTOhRF4z3jarLUATrczArHTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mezy6fJRewn/qZZrF6SD2ebE9IlzPHe3zqrpSmhD1mvKXNyhxKuPlf5VQalm3QP3j
	 xgMcBO8drMkgcBKdZxm53G41u//c7353qbpbG99r9KqZKWfG4mQ8uMYzgHZ5/Ti1DA
	 Pb79m9IckU3YCsj6fQhTxTyUTaFk+RoyAItSez+CYtqw0GpOm9dTNIQkk0WerM2dlY
	 lGBqEbD9GUAoKSolmFx3nfhTVwZIMeSB2EQSpW2123eG0B/46KEvlIN2FJ1Bbz2O4O
	 8rDDVChZ7NnLdifCIybaQBQEclZSn/2IF+wdUAZF0S4v//YzUHvb3K5LtDZPhlfe/C
	 WWU3xYIwc06SA==
Date: Thu, 30 Jan 2025 11:30:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20250130183042.GB3394637@ax162>
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
 <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>

On Thu, Jan 30, 2025 at 04:55:39PM +0100, Brendan Jackman wrote:
> On Tue, 14 Jan 2025 at 01:14, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > Thanks!  I'm putting it through bot testing now.
> 
> Hey Josh, how has it been going - could we merge the feature?
> 
> (Or, has it already been merged in some tree that doesn't go into linux-next?)

It looks like it is in Josh's tree but that tree does not flow into
-next; IIRC, they have to be merged into -tip to show up there.

https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/log/?h=objtool/core

For the record, this will be disruptive for clang users because a number
of warnings have crept up in recent releases and this option will get
enabled for allmodconfig. I have started going through them all but I am
working at an unfortunate intersection between compiler/optimization
internals, other flags such as sanitizers, and reconstructing control
flow. Most of them are "falls through to the next function" or
"unexpected end of section" warnings, which generally mean some
undefined behavior has been encountered and clang has given up code
generation. Figuring out what changed on the LLVM side requires a bisect
then reporting it (if it is a legitimate compiler problem) requires a
source file reduction. I did explore turning unreachable into a trap to
fix several of those but I think that will need further objtool changes
to cure the warnings that were reported:

https://lore.kernel.org/all/?q=llvm-trap-unreachable

I think Josh already mentioned it but exposing -Werror for objtool is a
big committment. Any time the build breaks because of it (even due to
external factors such as a compiler upgrade), there will be a need for
triage and just saying "turn off CONFIG_OBJTOOL_WERROR" cannot always be
the solution otherwise it loses its power. While it is nice leverage to
keep things clean (and I feel like it has generally worked well for
compilers with CONFIG_WERROR), it is disruptive and requires real labor
to upkeep, which should be from the authors who introduce the warnings
but they might need guidance or advice. I am regularly helping people
with figuring out issues from the LLVM toolchain becuase they get a
report that they have broken something but they do not use LLVM so they
are unsure what to do or what it means. I am not saying this is all a
bad idea but I want to make sure that this committment has been
considered.

If exposing this to the world feels too premature, maybe the flag could
be added then have a make variable like OBJTOOL_FLAGS to allow a
developer to pass it through if they wish?

Cheers,
Nathan

