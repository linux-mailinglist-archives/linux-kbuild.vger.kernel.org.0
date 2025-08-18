Return-Path: <linux-kbuild+bounces-8512-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD68B2B009
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 20:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D833564F2E
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 18:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAE032BF4D;
	Mon, 18 Aug 2025 18:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wb/lpzPY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D932BF40;
	Mon, 18 Aug 2025 18:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755540879; cv=none; b=apu11Plg++Y+Y0ctyM9pvlndHYuikOcMO1SUcOE7wnUcpZfvfFgoPLmw7V3tanlSirZhy1lWyMqM2upuRcf5B5C99Z4LIh+lydM/HYQWN2FG8xF7JFRQGzgwTUdBhCJlH4Gx4VAGeQlK3aAXzhl2xS9p6wUKkrCuTuLZoGjWKHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755540879; c=relaxed/simple;
	bh=WFKp9me8icbg83h1QuYSouVF1A34XDm3cgUvvS2/xuI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BW+qQozwbXMrII2eP+u+o7uc+k+FMXmy2ui7M2EgLXVJEHuf5RZ8jZyZndHXcRoNlDZw69/3kIO7tCT2jp9d5sxZOZdclym8O9YPzIWBUKbvmpOSGPsoGwbS4vA6Y0GfrKGVuc8fTvGGHfP+FRcQMdCcjY0IZm32T/OLGq9WoPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wb/lpzPY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80A2C4CEEB;
	Mon, 18 Aug 2025 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755540879;
	bh=WFKp9me8icbg83h1QuYSouVF1A34XDm3cgUvvS2/xuI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wb/lpzPYggbKznGq4VHGbEVQnQCTyfV3nfMyVjjE+M2ALjB+oJyE8DMVvj5vbPzRn
	 CwKf6T/ur0vPr1HQocvNnCAdGfvKUUdZSAgBjQvNpyPQuZHQXZqcGfDHLduCCcKMEs
	 C4waIwE6/5scIhaBQ0JKbkVyJfdA+13SCbC100yH+Ld0HLAQkuAHj/kwj9R5+Mm/UF
	 AoDWewBEY9f3vXPqdCa4c/bI8zKuQexyNTUno1qpnP2CeS1pV0vyaYAr8CQtcr4eAy
	 C0uCwa13Z8QgST7lVw30V8txUpfcmANjspIEjYRc17LGL85+fvd1aHo1rzAD1wHRCD
	 NUaigPV6eAyeg==
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shankari Anand <shankari.ak0208@gmail.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250811161650.37428-2-thorsten.blum@linux.dev>
References: <20250811161650.37428-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] kconfig: nconf: Format and print 'line' without a
 temporary copy
Message-Id: <175554087738.3761802.6002337302576851486.b4-ty@kernel.org>
Date: Mon, 18 Aug 2025 11:14:37 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Mon, 11 Aug 2025 18:16:48 +0200, Thorsten Blum wrote:
> Use "%.*s" as the format specifier and supply the 'line' length 'len' to
> mvwprintw() to format and print each line without making a temporary
> copy. Remove the temporary buffer.
> 
> 

Applied, thanks!

[1/1] kconfig: nconf: Format and print 'line' without a temporary copy
      https://git.kernel.org/kbuild/c/35883b030c5f1

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


