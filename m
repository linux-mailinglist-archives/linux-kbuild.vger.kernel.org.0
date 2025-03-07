Return-Path: <linux-kbuild+bounces-5992-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940AA56D48
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 17:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46C3B3A7555
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 16:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DE8226D19;
	Fri,  7 Mar 2025 16:14:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C4C226D0C;
	Fri,  7 Mar 2025 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364050; cv=none; b=NHKftQLq1MAYFseurN+HXmXFO7LexTuKSSSMh6AvjQs7IvPzJ8Ve2X6PILXnIwwV29bO5YfeqVdHGvC5egk6f4pz2d4rMhi+H3uAfZc+qCUb1OqEv7CRRw+g2ZxY2NS4mK2j97CyrwJnSAtaiR0fqEYa1aLedOImN51BPkvA7Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364050; c=relaxed/simple;
	bh=92cx1cBCDTShMfwReN9yU9enqFO6kybEdjhN1J7Q8K4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQrpfDkmNb79w7gCDKfqEQeacwwpEOHhLTTfLiJAKr+Z45jD6Bbh63+JP3O71Snfl8e5tzyAuq3kt4m8iEsTBTVlgj2jVAKn0UwWWWVHVqjK6slr8jOUjKc3xmFPe4ji7s7aNpiLubcFu2lufGGPIMm9rsiQD3Ej8gxWVhQNtIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C2AC4CED1;
	Fri,  7 Mar 2025 16:14:07 +0000 (UTC)
Date: Fri, 7 Mar 2025 11:14:07 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Nick Alcock <nick.alcock@oracle.com>,
 Alan Maguire <alan.maguire@oracle.com>, Sam James <sam@gentoo.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>,
 Elena Zannoni <elena.zannoni@oracle.com>, Daniel Gomez
 <da.gomez@samsung.com>, Jack Vogel <jack.vogel@oracle.com>
Subject: Re: [PATCH] kbuild: exclude .rodata.(cst|str)* when building ranges
Message-ID: <20250307111407.0073ff75@gandalf.local.home>
In-Reply-To: <20250305192808.2826336-1-kris.van.hees@oracle.com>
References: <20250305192808.2826336-1-kris.van.hees@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  5 Mar 2025 14:27:58 -0500
Kris Van Hees <kris.van.hees@oracle.com> wrote:

> The .rodata.(cst|str)* sections are often resized during the final
> linking and since these sections do not cover actual symbols there is
> no need to include them in the modules.builtin.ranges data.
> 
> When these sections were included in processing and resizing occurred,
> modules were reported with ranges that extended beyond their true end,
> causing subsequent symbols (in address order) to be associated with
> the wrong module.

If that's the case, shouldn't this be considered a fix, and include a fixes
tag as well as Cc stable?

-- Steve


> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Jack Vogel <jack.vogel@oracle.com>
> ---

