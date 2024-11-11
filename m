Return-Path: <linux-kbuild+bounces-4640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A36E99C3D75
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67525283604
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FABB15C15C;
	Mon, 11 Nov 2024 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="runMO+Zl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC7015A84E;
	Mon, 11 Nov 2024 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731325036; cv=none; b=ekZgx/9LqtU/BjWwb2D0anxBIEW7N+KX4n2v9LwqPhe7IG32g4BEbaOTYQSY0ZLsFDxi+xw625TKcWGrw1Mmrose7t6xheY4n5TK5+zyXZrWBPZ5omBR1mKb91KkcHP9gv69I074+sDj/St3CVMp6pDyyW1opinYP2exbMcICNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731325036; c=relaxed/simple;
	bh=oDRzGmQEErTEXMu7cPHyM1J2jFl+lHG5Q6D7SwTW6J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjJqG90Tnn5oOR9Zb9JH9spkizNpe8al1C9tNOUe8ULMKLvpbLB2o4kvu7PbPxayuqYHl+tNAQocw2Qy1gTWQAn1U5KQMRsd+SLl7xb0o/VQoo20pyMRyaruQqg1Ox1UN97O52q/mohyWuKC6K9lxv7/YlC53x6YrcLPdYvRTgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=runMO+Zl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=11pV35Wzb6z9X7HSXzqx3DLYy0hWTTgXKvn2iPy58S0=; b=runMO+ZlCxe1fEZFKUe7CwjOrW
	1aZTxTIb06S3bBPTlB5iK9DwG97XsjOvM9vzQc9ZGV+SefZLV6ICrVh+vtoKO4yDf/GYN7GrdPqND
	ss6V3HIXBFI9YdZOl2s7YTcFNR+zYHLZtvFVXt3rG1WGJyyTLtKxvj6eNBAqmK6PiA++7qV6s02m5
	/ft3g+l0tZGUkWYT1PiV/+S4XkdJTl/KhP/ckvjPifDTbtUWYHDmnyHE9r2tI5/S/Rl80ehdybpA+
	9Om0G1os1qGe0/Ese5TjtPfWasQ0zYF9bKjJ5eM6SlwfZ+w6bQwaoG5dzpsc4GlyNln4rbsbV7+KC
	taeHEgtQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tASjG-0000000HU9a-2aoe;
	Mon, 11 Nov 2024 11:37:10 +0000
Date: Mon, 11 Nov 2024 03:37:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC][PATCH 6/8] module: Add module specific symbol namespace
 support
Message-ID: <ZzHsZoYlwYpNx9A5@infradead.org>
References: <20241111105430.575636482@infradead.org>
 <20241111111817.532312508@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111111817.532312508@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Nov 11, 2024 at 11:54:36AM +0100, Peter Zijlstra wrote:
> Designate the "MODULE_${modname}" symbol namespace to mean: 'only
> export to the named module'.
> 
> Notably, explicit imports of anything in the "MODULE_" space is
> forbidden. Modules implicitly get the "MODULE_${modname}" namespace
> added.

Btw, I finally remember why I wanted a separate macro for this:
so that we can also add the config symbol as an argument and not
export the symbol if the module isn't configured or built in.


