Return-Path: <linux-kbuild+bounces-5435-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB3A09BA6
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 20:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FDFC3A5D73
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 19:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAA2214A65;
	Fri, 10 Jan 2025 19:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qcf1lvvy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F703214A82;
	Fri, 10 Jan 2025 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736536525; cv=none; b=aQLrDkAyjlFMidAi+ivYIoaZdbgo7AXLIgxLKaaeYMZlByyLTmvrTKrZFFUENqzVFcR1gcCGUw8TxKuT7I42YRH2vrQM9jIpH9WGmmO0F0vY246P+X4Y9I1MW2+HcoRRhdHlobPUIO2gKkIX2b0ZJf3bJCfWqgz7h2I/OVhyYjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736536525; c=relaxed/simple;
	bh=GyzRzEndGhSVI37d0YbAf3N9uKuCSnS7McCfF94rqf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlX5u195YCV6gFtQWLN87bGYvtMYVH5jTReLe3XgSby2p7/zBS++N2kYMKguL9z2mc1psuDxKSq5A3mgWNJpOkVRw8cTIEzC0crh/V+EdU4IIbDIP6XfxAhY7qy6mZQHQjP0ljYZ7N7m86pi+gKxE58FQ8VjJxL/H+KNpQl2wZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qcf1lvvy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E118C4CED6;
	Fri, 10 Jan 2025 19:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736536524;
	bh=GyzRzEndGhSVI37d0YbAf3N9uKuCSnS7McCfF94rqf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qcf1lvvyzxHW4HRmakE4gln4CUynbwmA82bWSpURIdObCseT6kvdAIttSgKoZyXOs
	 qs9jt5TTYWnlxNCF0lqDjj5fkNWQuw8h8W15bZH4HpB1DdYCdU/f0iS+wRQblx6Fxa
	 HzbKJo8p9xXnbUUP0GDFlcDDiAlkHG2IZsfl9mb1tb55yIEO6/o6SrWrDvy/s6sr8Z
	 nc8FH6msP2oO+39DDTUqVkW7D7AUtunpq7E0rBHgFWMSGDtAO39ChdslHEQgUeN9G+
	 vELvFngZHODBHnZTTlAhS7gABqIwKpdxb+2He79S1sRfzvP1mYk9VRXtdNbHhmne69
	 8jnTilpG+afGw==
Date: Fri, 10 Jan 2025 11:15:22 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: ole0811sch@gmail.com, deltaone@debian.org, jan.sollmann@rub.de,
	jude.gyimah@rub.de, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, thorsten.berger@rub.de
Subject: Re: [PATCH v6 01/11] kconfig: Add PicoSAT interface
Message-ID: <Z4FxyuF-Lnqa4Wl_@bombadil.infradead.org>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
 <20250109132817.1426138-1-jackmanb@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109132817.1426138-1-jackmanb@google.com>

On Thu, Jan 09, 2025 at 01:28:17PM +0000, Brendan Jackman wrote:
> Hi all, this looks cool!
> 
> > This support is provided within xconfig.
> 
> Sorry I haven't read properly enough to be able to answer this for myself but I
> suspect I'm not the only one idly wondering...
> 
> Would it be easy enough to provide this support as a standalone binary that can
> be called from scripts/config too?

I suspect this begs more the question of how could this be useful
outside of xconfig. But one step at a time, this can be done *after*
this initial patch set gets merged, but certainly its good to think
about and project if the current architecture would need to change to
address that later. I suspect not much yet.

  Luis

