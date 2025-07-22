Return-Path: <linux-kbuild+bounces-8104-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D1B0E259
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 19:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F124567B44
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 17:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B800927E1AC;
	Tue, 22 Jul 2025 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlPm87Ql"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CF1279912;
	Tue, 22 Jul 2025 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753203872; cv=none; b=aHK+NlS2HVDhiBW/Gcs6Y+yy8H7ZNTKulFiY3CgXf+CfrhyiNbyjsTHH78IE99gWbILs8gZpayKMixRsplJZ1gt5SdbHeO2mnL3LwZR2riAvrAHRTwMXTG3+ZsJ+2wMYzLIGTC0uS0GALjmq0QRQkCqo/R15mpV67C6q4i3ry9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753203872; c=relaxed/simple;
	bh=sFJ+AGCE2dn47JoYP+Vtmo3OGEJvEP4LEfB8jA6dHr0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DFRySTPPWnxdRkWSRd0GwSBwd6r2+CvtxDKJGwhGEwuLLAaAcgSvn0UQvdLuNBhE78iQ0KceLG/lH6WP5Rz1aerpX0kPqkL4xtGAvVF1bGhQTh5J1zmvZweqp3OqzpH9KmDx5JXkXn7/ffER/+bP8j7toxTN4ePqjPVNaD53K+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlPm87Ql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89249C4CEEB;
	Tue, 22 Jul 2025 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753203872;
	bh=sFJ+AGCE2dn47JoYP+Vtmo3OGEJvEP4LEfB8jA6dHr0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nlPm87QlUcYTpqrZeg2cOy6S2Lw5u9TAchbb1TRKygP5A9VY4euSyb/VMlnVa/oLG
	 OudfLzkTIk29iaF6nFZB4kP2V7u+033JPWx/KoA35Q/e9auM/aEi0MiHBT3EOGeiGN
	 VhXgOqbdfPjdBnxPEnLXcsKToH3AI41a1EYr7WG4s4lRJPgpnQlIVOM0gNtqcT4ITL
	 CCgVOdteXxunPdhP8ztZL3gkNF8Ou6oyvEKXHHEzI5UznnFoWj4kz3Lq5cqogPm+5i
	 gNCXsofGSBdjV8lhkHxxm/BsNIQmt9be/Dwzr8nvO4tlHajcKfZJHystiR8Tko32l8
	 IaUa2wXwVvCpQ==
Date: Tue, 22 Jul 2025 13:04:29 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 1/5] tracepoints: Add verifier that makes sure all
 defined tracepoints are used
Message-ID: <20250722130429.7418520b@batman.local.home>
In-Reply-To: <CAHk-=wihb6KVgU__zfhdHR=-Mqhp6qaAABdu31CJ2ML6MDj0dw@mail.gmail.com>
References: <20250722152053.343028095@kernel.org>
	<20250722152157.664260747@kernel.org>
	<CAHk-=wihb6KVgU__zfhdHR=-Mqhp6qaAABdu31CJ2ML6MDj0dw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Jul 2025 09:16:49 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 22 Jul 2025 at 08:21, Steven Rostedt <rostedt@kernel.org> wrote:
> >
> > Add a verifier that injects a pointer to the tracepoint structure in the
> > functions that are used and added to a section called __tracepoint_check.
> > Then on boot up, iterate over this section and for every tracepoint
> > descriptor that is pointed to, update its ".funcs" field to (void *)1, as
> > the .funcs field is only set when a tracepoint is registered. At this
> > time, no tracepoints should be registered.  
> 
> Why?
> 
> Doing this at runtime seems completely bass-ackwards.
> 
> If you want to do this verification, why don't you do it at build-time?

The second patch does that, but is much more complex due to having to
parse the elf file. It hooks into the sorttable code as that already
does most of the parsing that was needed. It uses the same trick as the
runtime verifier by checking tracepoints against the __tracepoint_check
section (but not with the '.func' test, but instead it sorts it and
does a binary search).

I kept this to verify that the build time worked too, as the runtime
check is so much simpler and easier to implement. Basically, I use this
to verify that the build time works. That's why if you enable this it
will select the build time version. It was used to catch bugs in the
build version as I developed it.

And currently neither tests modules (I run this against an
allyesconfig), but the runtime version could easily be modified to test
modules too, whereas the build time would require adding another elf
parser as the sorttable isn't run on module code.

I can remove the runtime check if you prefer. 

-- Steve

