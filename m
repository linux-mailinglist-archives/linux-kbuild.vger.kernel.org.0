Return-Path: <linux-kbuild+bounces-4202-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8193F9A51B3
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Oct 2024 00:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34BDD284B04
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Oct 2024 22:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E10192B99;
	Sat, 19 Oct 2024 22:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U00Bhue5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257D20E30B;
	Sat, 19 Oct 2024 22:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729378626; cv=none; b=kX5DpPxp8KssVwBa+wOgVPmqPRUH54uNagjpKpIevnBQGPrPBBsvdDCWTUTldwIP6z80UR1clv0xlDCTviWhCze77AI3jSDzX/g/58RuREi+pdbBLqb1xcwCmf8BopoaPVg1rQ/MUwk+1FFvuxMaY4C2bKF+AnrzvmhAh8omvRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729378626; c=relaxed/simple;
	bh=GMkLHvRnZGJtzjtdeNAUL8UOKS7DHVy67CBq9JbkoZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUJdwZV6qaTImEkiiwlqC6SkavDPL+6Re/pjVyLMtfZlHNQ8lhLncYFCHqbQb+FUK+uwqgWkZsLAUx/cppO+hsneAf6J7HZvexGJ65LmSokLliHTirfuNshBnaFbaSiGYy0kURCuviyqhWua7s7dGZuZSdgGGWIzTlCZ0N3qRF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U00Bhue5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2330C4CEC5;
	Sat, 19 Oct 2024 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729378626;
	bh=GMkLHvRnZGJtzjtdeNAUL8UOKS7DHVy67CBq9JbkoZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U00Bhue5iIHc38+7K+ZB2GAYxUsO4UTUNzFhLjIFH/SBdWQi5GAd+6XCU9cfYIxK9
	 1rpxefzEkuo9j22QVzZ2e0iickU55iLgJ5h3DRq/i3bINu9vdVDnqaE+bflRIWZvCi
	 NXo14kFvmyjoZ3OWln6fspyvUYuglP5eAhbUoIkycgRvDAEABCe/Q90ri5Nd+Z64fR
	 EdZJWBgnX+3sS8MH+Gf1BGhB+r8DWGwI8TnTFXZMTtQQTyh7Qvgja4HMtJZbDeousF
	 JBTHtAhrOo3KP+QJyXxCUF+rqb6pdl5Jy5MRYI6jp15kWDwJKfK5VTy45vHEhUWePP
	 uk594+46j0QAA==
Date: Sat, 19 Oct 2024 15:57:04 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] module: sign with sha512 instead of sha1 by default
Message-ID: <ZxQ5QJAa-iv4S6sw@bombadil.infradead.org>
References: <52ee32c0c92afc4d3263cea1f8a1cdc809728aff.1729088288.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52ee32c0c92afc4d3263cea1f8a1cdc809728aff.1729088288.git.linux@leemhuis.info>

On Wed, Oct 16, 2024 at 04:18:41PM +0200, Thorsten Leemhuis wrote:
> Switch away from using sha1 for module signing by default and use the
> more modern sha512 instead, which is what among others Arch, Fedora,
> RHEL, and Ubuntu are currently using for their kernels.
> 
> Sha1 has not been considered secure against well-funded opponents since
> 2005[1]; since 2011 the NIST and other organizations furthermore
> recommended its replacement[2]. This is why OpenSSL on RHEL9, Fedora
> Linux 41+[3], and likely some other current and future distributions
> reject the creation of sha1 signatures, which leads to a build error of
> allmodconfig configurations:
> 
>   80A20474797F0000:error:03000098:digital envelope routines:do_sigver_init:invalid digest:crypto/evp/m_sigver.c:342:
>   make[4]: *** [.../certs/Makefile:53: certs/signing_key.pem] Error 1
>   make[4]: *** Deleting file 'certs/signing_key.pem'
>   make[4]: *** Waiting for unfinished jobs....
>   make[3]: *** [.../scripts/Makefile.build:478: certs] Error 2
>   make[2]: *** [.../Makefile:1936: .] Error 2
>   make[1]: *** [.../Makefile:224: __sub-make] Error 2
>   make[1]: Leaving directory '...'
>   make: *** [Makefile:224: __sub-make] Error 2
> 
> This change makes allmodconfig work again and sets a default that is
> more appropriate for current and future users, too.
> 
> Link: https://www.schneier.com/blog/archives/2005/02/cryptanalysis_o.html [1]
> Link: https://csrc.nist.gov/projects/hash-functions [2]
> Link: https://fedoraproject.org/wiki/Changes/OpenSSLDistrustsha1SigVer [3]
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>

Thanks!

Tested-by: kdevops <kdevops@lists.linux.dev> [0]
Links: https://github.com/linux-kdevops/linux-modules-kpd/actions/runs/11420092929/job/31775404330 # [0]

Applied and pushed!

  Luis

