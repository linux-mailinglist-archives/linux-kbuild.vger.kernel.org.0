Return-Path: <linux-kbuild+bounces-5641-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AA0A29949
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 19:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 133753AA36C
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 18:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431F61FF7D3;
	Wed,  5 Feb 2025 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVi+Nib9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF01FF7B5;
	Wed,  5 Feb 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738780816; cv=none; b=gKjH+cT8sXHW6vN6gpDDcx8Y6wRazSZQVA3W8z2AJqTGpFRKXLSSGCnCD5cHDMtdqcyVDPe5K9CGtDp6SDTvXD3EdX5H9cBdm6vixlaLCN2Ybs/CCPcejR30rCXoIfTDkHG++ljjJvAD1ntW0ygD/QdBN1g+snG52Rag1aJROIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738780816; c=relaxed/simple;
	bh=y/NG5FTLCFJRaDNQOoKcgy/tGSS72p/ondJLRJ37VTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrocAr7aS/sZhA89+mMidqB7YH4T7G9A2cNFwQEs/ZqSWNEe/QavFahNqsXKWQvU+miOpBIjvcDzCx+ntmyuApLktqAVxUkvUwZoLm2eQOFSB5oHb3/mi08WOsdDMwEc1kpIv23KxSGkHZQaMLAsvzE9e2u7K4JpT2MYK986itY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVi+Nib9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A779C4CED1;
	Wed,  5 Feb 2025 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738780815;
	bh=y/NG5FTLCFJRaDNQOoKcgy/tGSS72p/ondJLRJ37VTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVi+Nib9a+JAW3WNwzequBJrI0lmMve9qnqXwpPiBQZ5kgm9D7DFoyKDqe3E2OuRU
	 nYXUTfF44PaBqpXWXzW3c2vIepaxv2a6K/L3gPEG1enZ/4DNmqund4wa0CmmgORQSe
	 2ksVit07Mb1Ot68z75/IbGcjP89QV8DRcA+vMqkYpSsJl++Drosu/ZDQOr87x44HjU
	 i+FSFigHA8p8uKxRq0+yVQQnW5m+nCXz1FmyUSMsqncm39n9MjHNxj+M8ForVhnzKR
	 OqcMXF3cshv40AclZ49EAkGtDLHh8J+qBHyEgtA5sDJMgJE+FYTk/2WgnxKYJ4OcUx
	 dEHSeQrNp6NRw==
Date: Wed, 5 Feb 2025 10:40:15 -0800
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH] kbuild: remove EXTRA_*FLAGS support
Message-ID: <202502051040.2DEF0C534@keescook>
References: <20250205163939.3464137-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205163939.3464137-1-masahiroy@kernel.org>

On Thu, Feb 06, 2025 at 01:39:38AM +0900, Masahiro Yamada wrote:
> Commit f77bf01425b1 ("kbuild: introduce ccflags-y, asflags-y and
> ldflags-y") deprecated these in 2007. The migration should have been
> completed by now.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Looks good to me.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

