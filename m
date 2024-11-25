Return-Path: <linux-kbuild+bounces-4860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A84FD9D8F2A
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 00:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 286D4B21D60
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 23:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566B51925AD;
	Mon, 25 Nov 2024 23:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2fuigt1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5171CD2C;
	Mon, 25 Nov 2024 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732577401; cv=none; b=Obh979XJYpbcQq9lIveO3qFKCYSwk9XoIx9YUjDDiKmHBktWA3frd66jqe/HTOQyrzImOfDZqNIwndMeTw5SUS5AuaJDOTAutIoqiDNVqPTlHd2HBBdVQWFCzFR04WgYITr4qH91WfpWtQMInoqu0Y4Ji1FAtXg9nOKqczEA3j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732577401; c=relaxed/simple;
	bh=RcIAlDpiZCSATkNyuZVzgcKeSyPLiVdPefWA8rTbZMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5IRf12Cxuv6FqxncfjZ8g2xnGFUqTPr1T7Ps8Sp9IKi4Jhge5hEafh+N2dfdZaU9g9EFOi1I09ZGs9QC6Xd5e7lsHSKblfmGSCm6M1yPBpBeqK/O0hPZIikp8Scvi6l+ahi4bii+YTmTbzZfWHXMakAHuf7wNLC10myg+q1QqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2fuigt1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2777FC4CECF;
	Mon, 25 Nov 2024 23:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732577400;
	bh=RcIAlDpiZCSATkNyuZVzgcKeSyPLiVdPefWA8rTbZMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2fuigt1qS9/0fLvlfqPjCo377tXkjRU0cNuZje+05zsKWZ7ZiqVt6qssc+uRTXQS
	 5QhmHpnNvl1GfhBCPVZgLfH2WrdfX98WY+hCDuiNb0sLNDxC1T8W1OG41WKKpzz8iH
	 KqUFo4DF2mJI8xVTurMGuJBTRKrpF7ReeqP2wb2S8O6HdNxrznDB5gg1HI2tQgMLvP
	 WfKysRMvFz5H1l0s9EuEDk0Az1v387nBqoDvw7J9Xijcxo/s5V9PdBcRIY8dgJ0VSX
	 ViwNNj7P/FSeM+K3v4Wdaq9bdol+Wpk14JFAEq4J+Z0XYwh47DNv17J3dnF+6gW/D4
	 BKl4b80bzeonA==
Date: Mon, 25 Nov 2024 15:29:58 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Miroslav Benes <mbenes@suse.cz>,
	Asahi Linux <asahi@lists.linux.dev>,
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 01/18] tools: Add gendwarfksyms
Message-ID: <Z0UIdmDHYQtUTR1i@bombadil.infradead.org>
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121204220.2378181-21-samitolvanen@google.com>

On Thu, Nov 21, 2024 at 08:42:22PM +0000, Sami Tolvanen wrote:
> Add a basic DWARF parser, which uses libdw to traverse the debugging
> information in an object file and looks for functions and variables.
> In follow-up patches, this will be expanded to produce symbol versions
> for CONFIG_MODVERSIONS from DWARF.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  kernel/module/Kconfig                 |   8 ++
>  scripts/Makefile                      |   1 +
>  scripts/gendwarfksyms/.gitignore      |   2 +

This doesn't add scripts/gendwarfksyms to MAINTAINERS
but then again   scripts/genksyms/ is not there either
but it does got to Masahiro.

Masahiro, should we just add both to KERNEL BUILD and add
Sami as a Reviewer to help with gendwarfksyms?

  Luis

