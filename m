Return-Path: <linux-kbuild+bounces-10622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4399AD3906F
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jan 2026 20:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B29E301D0C0
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jan 2026 19:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39003274B51;
	Sat, 17 Jan 2026 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlVuMALX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC2500941;
	Sat, 17 Jan 2026 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768676776; cv=none; b=krUMyn/WI6FDSmB/zRahwpPydl6ctWqJBRT+E7u/Q1IumGEpTWgouQXpgEOLPV2e2XmHSBVUDNYv0x4+ssQ33ABP4WtqVg8F+MwIDX+7STfOUVk3RP5R13F7jwUydOZzbcVv68S5qcqovLgkSVhmfXcx9Cg7glFG4Ieiafshx/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768676776; c=relaxed/simple;
	bh=q8qu18F27V3Xz+2lU4I0Z/A66zmOn1LC5Kh3Xs5w56k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufBpjQFtHy+81gBkjfDQRJdvt6MsVqyOC4P5jX7s6HPgg/Tkxk/DW+XgajohIbB9SU44i5J2W2lRzFoitwgIA5XRivfjVxvYf8o1ycg8onRo3XP5aSZ2chyzsRa+nhpEpYZPlQgwVC3yBwDLrHPUusuWiaBKCPx4ZOclhV7hkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlVuMALX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D36C4CEF7;
	Sat, 17 Jan 2026 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768676775;
	bh=q8qu18F27V3Xz+2lU4I0Z/A66zmOn1LC5Kh3Xs5w56k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PlVuMALX46xGmCAtjtfhqyZeLltDt00I+YIixUsrW4nMpq2AFNueAJRucW2ncdcuv
	 MhMl8dlpuCneVDedUcnsMHEPymy4CQ2QzM/WR6cSCvAcyusGk58v/2rgSpHqxplxSY
	 psz5/f7VpM6PfyaMc+U7pJgUTr8lxy9FrtW6XIIYHlRQKlZBFInu/a2yiYWBzkP5uA
	 YRSR/M4KTeqBB6Ei3BhGcNruj5nmOCDLnvqGLhvBy8qclHm/MpjvTWdoLxSD2SHlda
	 saV0giinqaSKipi6pTiZdZgYa//EATBk4ygv5H9BdO/8/atuttSwFycHKiytG7BLx9
	 2Unxi852aiF+w==
Date: Sat, 17 Jan 2026 11:06:15 -0800
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bill Wendling <morbo@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Marc Herbert <Marc.Herbert@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brian Gerst <brgerst@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __counted_by_ptr macro
Message-ID: <202601171105.A031AEFDDE@keescook>
References: <20251121195504.1661783-1-morbo@google.com>
 <20260114193716.1740684-1-morbo@google.com>
 <202601141956.A798BFF@keescook>
 <20260116083604.GJ830755@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116083604.GJ830755@noisy.programming.kicks-ass.net>

On Fri, Jan 16, 2026 at 09:36:04AM +0100, Peter Zijlstra wrote:
> On Wed, Jan 14, 2026 at 08:00:54PM -0800, Kees Cook wrote:
> > I think to keep operational parity, we should limit counted_ptr on Clang
> > to version 22 then, otherwise we'll have problems using it on void *.
> 
> Ooh, you got that fixed! Nice!

Yes, to my great relief, I was able to convince both GCC and Clang.

-- 
Kees Cook

