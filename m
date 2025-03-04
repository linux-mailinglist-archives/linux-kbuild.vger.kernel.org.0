Return-Path: <linux-kbuild+bounces-5950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7CA4D227
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 04:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C71331892576
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 03:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F9D1D516A;
	Tue,  4 Mar 2025 03:46:54 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F057F1AA786;
	Tue,  4 Mar 2025 03:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741060014; cv=none; b=fj9GiFwV69nM4meJHgacpHzenu/HpUBr3sXbitJmPZtlqmxZIhwatKu0bsEKWE59NLP1OCisByBYza7BlqrYGr8czM8K3abbC+pR7r6DLo5xMCeoZh0UTqthr1+2EYGQBBp5rQLUHbZZPnQKKp+QxckeBpY8SMC3tf6V3NmLvVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741060014; c=relaxed/simple;
	bh=Op3jCOwYpdPKnI5eF1Hy3BKUNqTaOTi76n8/3xo0sYA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0LZDvnmbd+MZqEOIHlBiziGaaTBjWbp8GKCCyzyLjD10hj0zhBbdEWQitaxRD7XMyHMu73frREwvHKz31cJ8UIM5FlTmJGf/Jo6xD+w6VAVQmULlTzqZgKT6t3X9fq2r0VV+rfVj5D/jzoMj3hSx/8fXcKd3zZ9mSOQAua15XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCC2C4CEE7;
	Tue,  4 Mar 2025 03:46:52 +0000 (UTC)
Date: Mon, 3 Mar 2025 22:46:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Uday Shankar <ushankar@purestorage.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: improve debuggability
Message-ID: <20250303224653.3e756252@batman.local.home>
In-Reply-To: <Z7zwDV5BvezaS6Sn@dev-ushankar.dev.purestorage.com>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
	<Z7Pv+hD3AOS/ymFI@dev-ushankar.dev.purestorage.com>
	<Z7zJ5EjIFLbz9C3I@dev-ushankar.dev.purestorage.com>
	<20250224170709.3eb9d94c@gandalf.local.home>
	<Z7zwDV5BvezaS6Sn@dev-ushankar.dev.purestorage.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Feb 2025 15:17:49 -0700
Uday Shankar <ushankar@purestorage.com> wrote:

> On Mon, Feb 24, 2025 at 05:07:09PM -0500, Steven Rostedt wrote:
> > On Mon, 24 Feb 2025 12:35:00 -0700
> > Uday Shankar <ushankar@purestorage.com> wrote:
> >   
> > > On Mon, Feb 17, 2025 at 07:27:06PM -0700, Uday Shankar wrote:  
> > > > ping    
> > > 
> > > ping again  
> > 
> > Do you just package it, or do you actually use it?  
> 
> Are you talking about the two scripts whose shebangs I modified in patch
> 1? Those scripts aren't used by the build process, they're just packaged
> in kernel-devel by the following command
> 
> %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}/scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'
> 
> Presumably those scripts are important to users of kernel-devel, which
> is supposed to "provide kernel headers and makefiles sufficient to build
> modules against the ... kernel." Though looking closer at these scripts,
> they look like they're probably extraneous for that purpose.

Sorry, I missed your reply here.

I'm asking if anyone uses draw_functrace.py or if it can simply be deleted.

The rest of the changes are for the build maintainer not me.

-- Steve

