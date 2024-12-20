Return-Path: <linux-kbuild+bounces-5220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B09F9AEB
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2024 21:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8A3188B2C5
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2024 20:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAAE2210D0;
	Fri, 20 Dec 2024 20:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKM+fSgL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8CB157A48;
	Fri, 20 Dec 2024 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734725431; cv=none; b=tR53bfJhV857XI57t11Dgx2tY86fH1zn+Hg+yd6zy6GU0prQB1Jd47pspdUg87s3j0mWCZLCcyifptKQC21AaaKRUtaMSxCjafCaiGrdg+dhkre2zEVic0jHgq4PWL/xnPEWcjr9HJK0J+ofXxKRLdINQWoVPJ/E1FP74zID93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734725431; c=relaxed/simple;
	bh=Y5WkjUd7LXEn4qV2JV8JcU/BT3jEqqZU5OsCIK0j1HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GM9FK0RRTfaGrITE7jH4E0qUPe/a0IiRZMTPTgeZ8cQJPVR6SROa3n0A6uJdGUdGfFRfsPcD2j9mVxqMsL6CZm9AfoRLWmv5RUDkrFjShz5jV9xw6dy4b9v41EcltxqO2ra3++1Nawb33QzgJngw42SUkqX9djLbFAYAZ8EZXJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKM+fSgL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B405C4CECD;
	Fri, 20 Dec 2024 20:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734725430;
	bh=Y5WkjUd7LXEn4qV2JV8JcU/BT3jEqqZU5OsCIK0j1HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKM+fSgLUJGVn1HXFpYNBtoyOwFOUF66NNOilKp+1PTOUBMcjFg5H4qp3WxBT0Yjc
	 C2eXYB9+UG/mw3nlzh5WQRWWzB6XaXv5mzeHDjsCY8hv0CUgYUD99N2dn0n1yhz8sa
	 Uh6nZAGm93nNdZsrfA4sG9YZ2DkUoSHu9w8yYB5/OmqILiwnS1M524S1Rbj+iCRSE5
	 IlGjlOAIpG1k88FuXK6B7AM6G94oRXqBNRvgjChSpVb7+Ir6J9WyJuKqWUdKEz7ioF
	 eBGTyo6yrNzDK7GW4Ch3gFZWXmqJFLnlrTxQne12L5PloFWctxsaJ+XDV+CotNNXTX
	 nWV/8dgBkjyiw==
Date: Fri, 20 Dec 2024 13:10:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20241220201025.GB936171@ax162>
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>
 <20241219010054.pxcnejgkvy3g744k@jpoimboe>
 <20241219221913.GA1259354@ax162>
 <20241219225642.ho42z3kgeuy5vq4v@jpoimboe>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219225642.ho42z3kgeuy5vq4v@jpoimboe>

On Thu, Dec 19, 2024 at 02:56:42PM -0800, Josh Poimboeuf wrote:
> On Thu, Dec 19, 2024 at 03:19:13PM -0700, Nathan Chancellor wrote:
> > I do agree with you that figuring our the root problem and resolution to
> > some of these warnings is not always the easiest, especially when they
> > are on the toolchain side, so I have often kicked the can down the road.
> > I know there is some documentation in objtool.txt around various
> > warnings, is that pretty up to date/accurate? Are there any other
> > resources I could look at to help with this work?
> 
> I think the document is pretty up to date.  Some warnings are self
> explanatory but others like "unreachable instruction" or "stack state
> mismatch" do require digging.
> 
> One thing that can help is to "export OBJTOOL_VERBOSE=1", which will
> tell objtool to disassemble any affected functions and show a backtrace
> with all the taken branches leading up to the warning (if applicable).
> Maybe that should be the default for --Werror.

Yeah, that does not sound like a bad idea. If the build is going to
break, it seems reasonable to give developers as much pertinent
information as possible so they can address the problem properly and
move on.

> I'd definitely like more people to be able to debug objtool warnings.
> Any ideas on making that easier or educating people or improving
> warnings are very welcome.  I'll be keeping that in mind when looking at
> the build errors over the holidays.

I will definitely ponder on that as well since I should have a good
perspective on that front.

> > Some objtool reports get sent to only llvm@lists.linux.dev when clang is
> > involved (due to a historical filter IIRC, I cannot find the original
> > request), so you may want to glance at [2] to see if anything new pops
> > up.
> 
> We need to figure out how to get that fixed, the commit author really
> needs to know if their code causes a warning/error.

I have started a new thread with the 0day folks to get that adjusted
with you and Peter on CC:

https://lore.kernel.org/20241220200617.GA936171@ax162/

Cheers,
Nathan

