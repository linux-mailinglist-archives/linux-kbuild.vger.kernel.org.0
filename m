Return-Path: <linux-kbuild+bounces-8449-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED84B25E15
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 09:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E51F21CC0C85
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 07:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9609F26E701;
	Thu, 14 Aug 2025 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpDKIpnN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE1205ABA;
	Thu, 14 Aug 2025 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157898; cv=none; b=KdlHhA8YKpYUQNR+s8uzdWg7w93qZordH+rH7c/4XR9fTmnja29i7ZtsG9e/5CjZdLRhZAYokvNSogmULZWjfy4WJfleC7vw6fNrg1F9ppBqpmwGnbpOyEwBYpincY4erqSLMZY0yW7qg7xit/Mii++xuZAbauPNBXlMl+rM1Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157898; c=relaxed/simple;
	bh=v9VvPeUNkiYLsnm5QnJA58YlOU9rsWyTUonI6fizXCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyoLqw2FkDeWNiZdJZXjL6M5GPK8KZAalEa2nYyiVKiH6smqlVjk5IoEg4G3IofQtawUdTa4CIGWz0fLSTagkRkNCbb/eq2ZiOnhAlHjoyeE0BXkmyoCdQhKRXu/ukuo0QTULJ9uMbzfdzpVfix2/xCkXQQ0m8fF6XX7guOCbHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpDKIpnN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945DBC4CEEF;
	Thu, 14 Aug 2025 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755157897;
	bh=v9VvPeUNkiYLsnm5QnJA58YlOU9rsWyTUonI6fizXCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpDKIpnNETkXnHQSwCbvN2lXghfs4ctSCHzLF3CCNwMK7ab7aZCuhWBc8R0rAXFgr
	 XYlDrr+JvysDzRRYkCLGk/oUzagfsSx/1x8bTq29BXImg8oihuIRhy6siQtfcZBoSS
	 OwKsvSMX08WE/bJJGr/AMbH8oo6aSdvJyS9KJ+A6Kt6lJgvsWLI5pfCJZ3eA8r/fj+
	 y9eE/u9Ys5GtQ7dnQM1nVPVGvyytOr7WQL6rbC7E7xPSijc4R3cz3hdFW/cCH4Mzqg
	 X3c41OaaWwvS5N42cqztidmcwMMkcXQYD15MaRBvjbN/IoQTpBF5ZGN03Ype1d10kJ
	 0i/fL9Wyaeb6w==
Date: Thu, 14 Aug 2025 09:42:22 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: nconf: Format and print 'line' without a
 temporary copy
Message-ID: <aJ2TUo_2Mwct924o@levanger>
References: <20250811161650.37428-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811161650.37428-2-thorsten.blum@linux.dev>

On Mon, Aug 11, 2025 at 06:16:48PM +0200, Thorsten Blum wrote:
> Use "%.*s" as the format specifier and supply the 'line' length 'len' to
> mvwprintw() to format and print each line without making a temporary
> copy. Remove the temporary buffer.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  scripts/kconfig/nconf.gui.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

As kconfig is currently orphaned, I am going to take this via kbuild
tree.

Kind regards,
Nicolas

