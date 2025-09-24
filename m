Return-Path: <linux-kbuild+bounces-8941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DFDB9867D
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 08:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED0E217AC6C
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 06:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A56424DCEF;
	Wed, 24 Sep 2025 06:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIqiLlKB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEA424A066;
	Wed, 24 Sep 2025 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758696011; cv=none; b=IkQ4mfqLXHKN5LMM1d+BEZK+0+Pd0/v6x2XXkVfhOukeqv1mh0M2EzLFj4NMFLyPRoWVGilqoGWzdY0qDr374gqbhyuFA3+a2xYQAk14WZl1OKfh8V7RtYSsYlwR83QSDpeudm+V+eMAKoSN1CKLD7AgOX+mzIcqboV22qYCCcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758696011; c=relaxed/simple;
	bh=EEtssODGjPjyupMHIEJAZ+hnB3jH2E3r+gr6xVyDzRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHqVFLXawLpZqcZEdzC0uskLdlkalCZ/HHJJG67iCZG7Kiglbh4Z3QZuej6hZcbKssH89s8kUBHgtp2ut3qGz2r6sFthZJ7NDmNFaF94yqaIDdZdL2ActYSwDm/WhJ+YSig3VCO8q74AnasMOg4WIOBDoPmZ18Xiod4JaWejPKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIqiLlKB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAFBC113CF;
	Wed, 24 Sep 2025 06:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758696011;
	bh=EEtssODGjPjyupMHIEJAZ+hnB3jH2E3r+gr6xVyDzRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gIqiLlKBoKXxbr9orthP05oGn2hz3GN/Ky/b5vgrBhOvU3WhSsDrYLWI1mb0FQdRl
	 hQ6v4Yso/RAi6rwNZwTBV5uLRhUPvR+58sT4k9R79Z+bKNXd+5TR3X8DfWZUkv+L86
	 Cy+hBVMr6nX6fgFihr6vrzPil0RyYDisGFb9WBAzSdCe1w4iA4TUabpH6azDECrX0B
	 ALiK+62itF5FzSglh5ccWlZPLxEXdi68xyXCkxpSywxfDlC7qfETiYJBghy0WINXTP
	 wwtrgGO629vfX3jhf1Qz5tNIBKQXoqMxYe9eF8R/l6KCJhUI4+/zWKfqdcwtFDAVFI
	 rY7urqaoNchPA==
Date: Wed, 24 Sep 2025 08:31:00 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 6/8] modpost: Add modname to mod_device_table alias
Message-ID: <aNOQJH8kDW3lFHf-@levanger>
References: <cover.1758182101.git.legion@kernel.org>
 <1a0d0bd87a4981d465b9ed21e14f4e78eaa03ded.1758182101.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a0d0bd87a4981d465b9ed21e14f4e78eaa03ded.1758182101.git.legion@kernel.org>

On Thu, Sep 18, 2025 at 10:05:50AM +0200, Alexey Gladkov wrote:
> At this point, if a symbol is compiled as part of the kernel,
> information about which module the symbol belongs to is lost.
> 
> To save this it is possible to add the module name to the alias name.
> It's not very pretty, but it's possible for now.
> 
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Andreas Hindborg <a.hindborg@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alex Gaynor <alex.gaynor@gmail.com>
> Cc: rust-for-linux@vger.kernel.org
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  include/linux/module.h   | 14 +++++++++++++-
>  rust/kernel/device_id.rs |  8 ++++----
>  scripts/mod/file2alias.c | 15 ++++++++++++---
>  3 files changed, 29 insertions(+), 8 deletions(-)
> 

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

