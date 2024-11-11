Return-Path: <linux-kbuild+bounces-4641-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 082DA9C3D7C
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEFA71F211DD
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6FA18870C;
	Mon, 11 Nov 2024 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s1Y7m7hv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E515A84E;
	Mon, 11 Nov 2024 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731325076; cv=none; b=K3hWKqdqI5yA+B+igwz2xSzuLCW5JoWHHJljIfMut0xo2Htp5lsoLvU3hO2gBl1FWJDqchsHNxW/i6zXZAusupafWHx7YsMaEeUO88g/xJ4GIY3jcxUJv5zd6I/ulOToQV/pcSmVhDTvnjT8MQAwywl0twRXXu7IFrj3oVyYcdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731325076; c=relaxed/simple;
	bh=nrTSNfC9NoCn4WGpY3SEGggky9CH31LP9q2LfmXfq0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RX1TWND5nmteUYJX7EfT+OM9CPv/iC3sR2gXrMJl78tUx5EVhatr0rtpwTADaOjOdQ9BDeRzT6PXkueQ5spFpwwHx4u3ZQYDBbgiHnkmKRIGxwKjsy+Sj/ZrpThz31Y2wXgxlXI1LiwjGZkpZbOQQwLfeQPw817INTm5eGPjTH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=s1Y7m7hv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u/HlYXg5DhGex3Te5GVALENhFguRSVw/8MMHNY91jyg=; b=s1Y7m7hv7MgtoB2xEeWUDiefoP
	E6Tsv4ucNzOlj88eSfPDPtDSZSWN6u0K7SipAoLxHP8h1PDEu+l5/zRus1cL1FFXpslFqVvt7+lfU
	CDUBR4tdkM2Fds422cKDEjc103F2JR3W3K4ueZVWUhcYIQ/o6YXA2Qro08vmOFuxblvbo1T9OPePr
	+dp2MMvutonkyf54eNM3FxeMzJNr/pj3A7MwaDzRoNAP6M+HgVBthXd/Hm4Gn8/jGzvmlngfOYlbj
	QbPsCDeUlysTGAcM9l0E3dRRCHTqmNIs8xk8Wh3v3agLjKTyr3sMssg8BB/99jif7wtbEkLI9vmja
	DI736kjw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tASjv-0000000HUIz-08YM;
	Mon, 11 Nov 2024 11:37:51 +0000
Date: Mon, 11 Nov 2024 03:37:51 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC][PATCH 8/8] module: Provide EXPORT_SYMBOL*_FOR() helpers
Message-ID: <ZzHsj6o_c3iqbHgQ@infradead.org>
References: <20241111105430.575636482@infradead.org>
 <20241111111817.826286643@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111111817.826286643@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Nov 11, 2024 at 11:54:38AM +0100, Peter Zijlstra wrote:
> +#define EXPORT_SYMBOL_FOR(sym, mods)	EXPORT_SYMBOL_NS(sym, "MODULE_" mods)

I don't think we need a non-_GPL version of this, as the exports
obviously are for in-tree modules only.


