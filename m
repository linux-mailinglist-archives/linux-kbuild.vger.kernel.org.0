Return-Path: <linux-kbuild+bounces-3102-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A3957716
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 00:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1EC1285A71
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 22:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01001DC46C;
	Mon, 19 Aug 2024 22:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p7+h4U+g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2B14D70E;
	Mon, 19 Aug 2024 22:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105087; cv=none; b=BZAKoUe0iqtGgz3brTVZ2e9nPojK/MNWwu7GE/3B0i5rqXzFqf83DYjlSWhM4QE8nZJ+3LoaSgRb0CjfQADHpXCxDvIriKPe62qAfGz0/bqlGxbIhunsXCY+U0y7xnr23m3xy/nxhWWY+Y5GmqmCDS12EtphruFAqxV/ZuCPzD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105087; c=relaxed/simple;
	bh=a1vaXvA5VjW0QvYWQxXnLcOIeNgzB/7qhyVGmEcL3fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgjQFMhzPmy4ssR10LEDjnLvT4oS4Yqa0Ck29DIhVQPETVW1HrZd+Dt4INo510kpTfXfH+3t5ZV3UPNT0+pXLICLIDeNzHFCpLGJEwRlkAD+Bcu1E7Yai6s0QEndSupxn/hKT1nPthm1ruci1fTwKI+KnpIIiHKdB0RGg4AKczs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=p7+h4U+g; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eV8JZxLwfOg+cI/ztjeOEoIspIfloBKPplrwQTVTsS4=; b=p7+h4U+gA9SA3MQnNgTCqGdufV
	5erU9s3eqE/Agxz5m9o21OrVGTu7IMwydVJkgtDC4OspQut3WgovE9L9ErbN7CGf5/67aBMixWyMN
	HENYJOBE5UkN8InkMnFgpunfL/YizQ/E60dRNYf07HegqSaPdULz2ceMhDJJPuP6kpfIpN/YIkqYK
	LydlTU4Rnxz8xVr3LjTiaHr+Ucekb7cFBgKOs2Y53DuocNQ+Ts+NPCwHUBYyIf8fxX0alHWCvj2kC
	v4+nOB9W+GM6ySp5ggibhbTDl2gpB2yLdC07IVUFiDnvBAzNXpy6P0Db+Zk3F+sIvP9fLnjIlj36u
	gSFQNOlQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgAUW-000000033k1-2Jky;
	Mon, 19 Aug 2024 22:04:44 +0000
Date: Mon, 19 Aug 2024 15:04:44 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: masahiroy@kernel.org, deltaone@debian.org, jan.sollmann@rub.de,
	jude.gyimah@rub.de, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, thorsten.berger@rub.de
Subject: Re: [PATCH v4 02/12] kconfig: Add picosat.c (1/3)
Message-ID: <ZsPBfBQXNZmbNfpE@bombadil.infradead.org>
References: <CAK7LNAQ9fddijdAJFNYKqA3nQibwiv5jvZs3O9-nDbcRToWS4g@mail.gmail.com>
 <20240816102001.21668-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816102001.21668-1-ole0811sch@gmail.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Fri, Aug 16, 2024 at 12:20:01PM +0200, Ole Schuerks wrote:
> What's the best way of letting the user know that they need to 
> install PicoSAT if they want to use the conflict resolver?
> My idea would 
> be to notify the user via the GUI when they try to use the interface of 
> the conflict resolver without having PicoSAT installed. Do you see any 
> issues with that/do you prefer some alternative approach?

Conflicts don't happen often and we already have a printf which happens when
one does, my recommendation would be that we simply opt-in for the
resolver if the user has the requirements installed. Otherwise we only
inform the user to install it if a conflict comes up. Documentation can
also be enhanced to describe this functionality / support.

  Luis

