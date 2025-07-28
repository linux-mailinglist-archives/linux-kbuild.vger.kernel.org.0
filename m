Return-Path: <linux-kbuild+bounces-8218-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E094B133B6
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 06:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85FC8165FD0
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 04:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6762116E7;
	Mon, 28 Jul 2025 04:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rN7bvFx9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289F2E36E4;
	Mon, 28 Jul 2025 04:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753676956; cv=none; b=gGNz/wvPeAPN3dWRnqL/9psZR94HVFIPsXEbCGg1YMVGYkDhmhMYXv5amjTcNhok2BJ/fXCrfyER6mcDVWTeTbcTXxahvtoayNUjzP4fXMCNNsvakF0glSYghc2yFygaF0P+h6UlpbwS6Jf0wq1Ei+clf5ioLXdXdydspBlYuhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753676956; c=relaxed/simple;
	bh=qKU54/z7LUvMco1kwAKQLW3MZqJwPklhezcdKgo/Q+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bp3H29g32phBvsYbhIIZn3/oRo0FejRRLXOXzcSVQuws8JAl1bRF0RaPEtmmnIRWeC4eeSQ56DEK8ntxGu2vvXwXI2Q6SrEQtOSQKN1Cm1ihF1L+ghkwPSSVk6vQbxsc/UU0D9pM0xxyKQKZztTS1QTS0sdbzKMNeFDT3L+6Y7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rN7bvFx9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3616C4CEE7;
	Mon, 28 Jul 2025 04:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753676956;
	bh=qKU54/z7LUvMco1kwAKQLW3MZqJwPklhezcdKgo/Q+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rN7bvFx9AOD05Pi+qEKX3uP5R8YE/je+0SwnyJ5xIiwO8e0O9Qc2Z+yQ/PaI1YpWu
	 bWRyHhLIJ4UP7PT+7GyFSsnr5FnZ58zQgKxrR6QZ81RZXEG9DzNvzhoUMifm4dj1FO
	 RWLgZgyyWhT2Nw67nTFOdgF/JqRyqTxxgtBIiUds=
Date: Mon, 28 Jul 2025 06:29:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: masahiroy@kernel.org, nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in
 inputbox.c
Message-ID: <2025072842-require-smokeless-f98f@gregkh>
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727164433.203775-1-suchitkarunakaran@gmail.com>

On Sun, Jul 27, 2025 at 10:14:33PM +0530, Suchit Karunakaran wrote:
> strcpy() performs no bounds checking and can lead to buffer overflows if
> the input string exceeds the destination buffer size. This patch replaces
> it with strncpy(), and null terminates the input string.
> 
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
> index 3c6e24b20f5b..5e4a131724f2 100644
> --- a/scripts/kconfig/lxdialog/inputbox.c
> +++ b/scripts/kconfig/lxdialog/inputbox.c
> @@ -39,8 +39,10 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
>  
>  	if (!init)
>  		instr[0] = '\0';
> -	else
> -		strcpy(instr, init);
> +	else {
> +		strncpy(instr, init, sizeof(dialog_input_result) - 1);
> +		instr[sizeof(dialog_input_result) - 1] = '\0';

As this is a userspace tool, why is this change needed at all?  How can
this overflow and if it does, what happens?

thanks,

greg k-h

