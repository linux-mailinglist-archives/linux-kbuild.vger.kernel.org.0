Return-Path: <linux-kbuild+bounces-4881-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E669E9D9D62
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 19:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD55284068
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 18:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C411DDC1B;
	Tue, 26 Nov 2024 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMdrxGfx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E165AD26D;
	Tue, 26 Nov 2024 18:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732645810; cv=none; b=WhGw3jJGsosXRM5vYVDDba6XuDApy5Tjw4P3pMzDVZf52aUMEDK+ylLi8zLmIUI244II4Zu3+ULRm3f3+XK8i/qNcdV++fkIISZho4xkTMC7Xy7JWHm//sIB2GSh5lldIAWqaRcIDFBPZ3zpNeF1KpnzewO3pkPAOR3AmH2K7ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732645810; c=relaxed/simple;
	bh=xJxnjepxK0AEdfOi6g9/KK12La2nbdJnN04DFsBA1UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8JVCcI0qZVU1o5udfJ9CnEU7TC2j6n+7/AkfZ67Z31MD4v3qu/wTDOvEigfh8xx5NmtgKEJtTslkaeNaGOeezeYfEBQdRww1V9rsic6mcEND+MKMF2WywS08pyEcagZ3GscRaCWvGJgv3R/zfPtW1FIYDQi9+6tv2ndDbv7XaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMdrxGfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF45CC4CED0;
	Tue, 26 Nov 2024 18:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732645809;
	bh=xJxnjepxK0AEdfOi6g9/KK12La2nbdJnN04DFsBA1UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMdrxGfxApaLT6JB8X+787BYq9pDSG9WhjeCG55VdqH+w/RUWwLHLhVS0W9U2s902
	 TkBJC8WDKfGLDKQBmymw7OOJjWOE9wGowLBeZ+gmybqPXtuKajzpg8xcveo7BCwOgl
	 yMlaDb717UxCNP7AHYZvpbYqOArsNXZ+ooBmMaqDkcQBESl5M2fH+fXpBYjsYdfsuJ
	 3HBqORXD3W67Jr/IzZjhLbk90+uMUKI1KgTRKtCATSg16L7z0fVjmBQgchOqJqfyXd
	 XiyHiBzLSXi4CeBE8O4sTA7xvd23Z27/mItW3ib5I9pjmKEXwQ6SV2Xf7s5IaCOV6K
	 8e0wmuXHhiYzw==
Date: Tue, 26 Nov 2024 10:30:07 -0800
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
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
Message-ID: <Z0YTrwR67-5T86E6@bombadil.infradead.org>
References: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>

On Thu, Nov 21, 2024 at 08:42:21PM +0000, Sami Tolvanen wrote:
> If you also want to test the series with actual Rust modules, this
> branch adds Matt's latest modversion_info series:

The merge window for v6.13 is now open so this is too late for that, so
this is all work to be queued up after, so in about 2 weeks or so. Given
that, considering this and the extended modversions patches what I don't
see is actual selftests to easily test this and extended modversions.
Could you guys add tests for this? Since we have automated tests for
modules and we now extended it with another new test for kallsyms under
the modules directly it should be fairly easy I think to add tests for
this. Think about how we can easily grow these tests to ensure we don't
break things with future kernel regressions.

  Luis

