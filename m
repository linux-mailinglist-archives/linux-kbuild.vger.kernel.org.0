Return-Path: <linux-kbuild+bounces-9208-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C99BEBB78
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 22:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFA124E2631
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 20:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F881D5CC6;
	Fri, 17 Oct 2025 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9zR1WIi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE2354AC9;
	Fri, 17 Oct 2025 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733986; cv=none; b=l1JHJqv3rKb6G7bcEKbeTUgQlGNNxIkkM4V9z+wJraXqIUKbxe7t6sTqtVF/eOAOMGPVcztZhNDNvFGNq5H7rtbfuF8O4sjGX46WwnKYcZwUQy/9niDp0pM2yAm0gHC3fLppyy+G55nWDNbZ30ILMXEgOTcu8xVSaDQEqBP7+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733986; c=relaxed/simple;
	bh=tonlCgAc2fou04wY9oIAPAvVd1QMUHHqi+nHAFLkvmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCVHuAlUIPVJU8kUxp9fzaepCdPxM4imUVOXQ0OodjW+3gO2sOV2Cx24avnFUWlheObzLMZY/0ygXvWl2dgq45aZkNgxflZt5H82lap3OITiZy8+PZ0heXo46vfCYg/CzkSyPWjYyYMAPOkHlzkQx92iH8yh8Umac6TJEYPhVes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9zR1WIi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D85C4CEE7;
	Fri, 17 Oct 2025 20:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760733985;
	bh=tonlCgAc2fou04wY9oIAPAvVd1QMUHHqi+nHAFLkvmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9zR1WIisBlunuVE6mKDmfQIf2gzMFlpC3TblNQxrHTevdhhlFEXthAqRZ3lJ6xx0
	 wdmdMOP3ij1RkaaMk7ZVBNg66NTfTKTUYr4gPx0EOJcBD1O4WfwuHQrqPq4OWuAAxI
	 rrk7TrKxWCiSxXiYo6zM6JmTJJnweI9vq6TGe8JfK2RnRXbDDRE9aY4V1W7wWTYIsd
	 +09IW6/RnRiKHMKrJhYd7V8u2oi195DyfVvQ0QceRJMNAm2CGe76slpZBCsVFZSGtZ
	 SQJRrh6ztwc8EmSByEtH2cDJnQR40k/2pW5vW07JyrmhxM6fpyUmXQFyckt/7ymIDd
	 sH2kCkGWHhsCg==
Date: Fri, 17 Oct 2025 21:54:12 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Gang Yan <gang.yan@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	David Disseldorp <ddiss@suse.de>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, Gang Yan <yangang@kylinos.cn>
Subject: Re: [PATCH, v2] kbuild: doc: improve KBUILD_BUILD_TIMESTAMP
 documentation
Message-ID: <aPKe5KGR27robyc5@levanger>
References: <20251017021209.6586-1-gang.yan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017021209.6586-1-gang.yan@linux.dev>

On Fri, Oct 17, 2025 at 10:12:09AM +0800, Gang Yan wrote:
> From: Gang Yan <yangang@kylinos.cn>
> 
> This patch adds an example of how to set KBUILD_BUILD_TIMESTAMP to a
> specific date. Also, note that the provided timestamp is used for
> initramfs mtime fields, which are 32-bit and thus limited to dates
> between the Unix epoch and 2106-02-07 06:28:15 UTC. Dates outside this
> range will cause errors.
> 
> Suggested-by: David Disseldorp <ddiss@suse.de>
> Signed-off-by: Gang Yan <yangang@kylinos.cn>
> Reviewed-by: David Disseldorp <ddiss@suse.de>
> ---
> Changelog:
>  v2:
>   - Replace the invalid example with a valid one.
>   - Apply David's suggestions.
> ---
>  Documentation/kbuild/kbuild.rst | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Thanks to both of you!

I have only found a tiny nit-pick, see below.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 3388a10f2dcc..881189ecd0ca 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -328,8 +328,14 @@ KBUILD_BUILD_TIMESTAMP
>  ----------------------
>  Setting this to a date string overrides the timestamp used in the
>  UTS_VERSION definition (uname -v in the running kernel). The value has to
> -be a string that can be passed to date -d. The default value
> -is the output of the date command at one point during build.
> +be a string that can be passed to date -d. E.g.::
> +
> +$ KBUILD_BUILD_TIMESTAMP="Mon Oct 13 00:00:00 UTC 2025" make

Other code blocks in kbuild.rst are indented by four spaces (and
accidentally five in one line).

I can add these when applying the patch for kbuild-next, if that is ok
for you.

Kind regards
Nicolas

