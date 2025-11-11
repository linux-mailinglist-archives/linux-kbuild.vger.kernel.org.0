Return-Path: <linux-kbuild+bounces-9563-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D15ECC4E15E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FE5E3A9B96
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 13:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F340E336EFF;
	Tue, 11 Nov 2025 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l43RlZgC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88EF331A75;
	Tue, 11 Nov 2025 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867212; cv=none; b=IiRn0QLusbPYHJE0aakBofIIsgB1asMvSVHQK4mw9OcCzvQuoM4I8t6K4nDE73WyhbdgylfkFgH6Llx3L5SsikCOp1qI7++PANKvlFrCxlGqXXgSTMi2GZOkgfyIEYZU3IH2cj5J/s5HnipX1XTpWjlb7yZQv/KSCfRIrn8594A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867212; c=relaxed/simple;
	bh=9mm6g+osJm1/EWGqawmYdfu46laP/lzTSdOtwjYCnTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEmwEG//23v2GYfYKF8BZpZ+ZIvaLc9zvgWrPYwCn0k+DhpJF0kP5YCYOt26Nr062O1cjuMFG9//pF2gCThLqL19TOeSTRRpp7osaECLf7b1fjPjLxJVaLEttDflEOLEhOPfVoFWpnIO+AzivMnmPjPDugVXlv3j54DlkbgS5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l43RlZgC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0ADC4CEFB;
	Tue, 11 Nov 2025 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762867212;
	bh=9mm6g+osJm1/EWGqawmYdfu46laP/lzTSdOtwjYCnTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l43RlZgCYNkLBeSiru6TxlcyrDsgcT9ZklHl0NU7twHyUVS5OmaJmO2aOVg/3y45h
	 3njS3UnXWYkkc62+BkDA/NoDDoZfpZqfHMLg1poawfgzdWEgT6r+Wvbf4L0OI85ZHc
	 T0opZPUtj82FqE1ygKIbfTM1e6YJVS+LjBrjDyfFjezu3zGBGyW8BkxVvXRb4eIy2W
	 TGB5jJdbIBJVF+isMCrPl4LKu+FjRel5IVrHKdqlLqB2zts4mcm97F6fSS4MSrauwR
	 4uKL15tBtwcGbpqrjW3bB4qNSkSCS7c+ITwBXRjuhDUWiojTuBIBSU79zv5MH5EiAe
	 jPW6SupAwy2pA==
Date: Tue, 11 Nov 2025 14:03:10 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: install-extmod-build: Properly fix CC
 expansion when ccache is used
Message-ID: <aRM0DmrBq-neaNYw@derry.ads.avm.de>
References: <20251111-kbuild-install-extmod-build-fix-cc-expand-third-try-v2-1-15ba1b37e71a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-kbuild-install-extmod-build-fix-cc-expand-third-try-v2-1-15ba1b37e71a@linaro.org>

On Tue, Nov 11, 2025 at 08:43:51AM +0200, Abel Vesa wrote:
> Currently, when cross-compiling and ccache is used, the expanding of CC
> turns out to be without any quotes, leading to the following error:
> 
> make[4]: *** No rule to make target 'aarch64-linux-gnu-gcc'.  Stop.
> make[3]: *** [Makefile:2164: run-command] Error 2
> 
> And it makes sense, because after expansion it ends up like this:
> 
> make run-command KBUILD_RUN_COMMAND=+$(MAKE) \
> HOSTCC=ccache aarch64-linux-gnu-gcc VPATH= srcroot=. $(build)= ...
> 
> So add another set of double quotes to surround whatever CC expands to
> to make sure the aarch64-linux-gnu-gcc isn't expanded to something that
> looks like an entirely separate target.
> 
> Fixes: 140332b6ed72 ("kbuild: fix linux-headers package build when $(CC) cannot link userspace")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Moved the new double quotes inside of single ones, to be able
>   to drop the escape, like Nathan suggested.
> - Re-worded the commit message according to the above change.
> - Link to v1: https://lore.kernel.org/r/20251110-kbuild-install-extmod-build-fix-cc-expand-third-try-v1-1-5c0ddb1c67a8@linaro.org
> ---
>  scripts/package/install-extmod-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Just as a note: the fix is only required for build rpm packages.  For
the Debian package call of install-extmod-build
CC="${DEB_HOST_GNU_TYPE}-gcc" is used, no matter what was given to make
deb-pkg.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

