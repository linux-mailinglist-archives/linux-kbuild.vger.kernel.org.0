Return-Path: <linux-kbuild+bounces-3103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF3957744
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 00:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14C2D1F240FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 22:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D381DC46C;
	Mon, 19 Aug 2024 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P06ujqIa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF7D15DBC1;
	Mon, 19 Aug 2024 22:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105663; cv=none; b=m3t+u28FC8s1XvZHSuWkHmKBxBThGzA7lUbq+Pd0JlKvQSWqhPHqaiD5YrI7f5mPhioUR4nYYfWX9Eo5c/IsykVH2WCOApdddg/6FHmzdZVKsStkQOh8bhSVPg8daDK9cFXtORg7t4/ClP67fmyykYuzNNtRyIDwCkoozm8sGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105663; c=relaxed/simple;
	bh=eDpXWJH5Og69OdCgqc1ewI53FjKhL2nBlcqDoKotG/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/Oo/va9Uzc1OP623JiSTe5AkP1HP23Ol5IZ53ZT1GGR+WGjYJI4gWjEJ/6rI1UVy/unvWs1TzmHCO+HqJuMyyp5E3zPZY1Dz1ipwtcOqXRSbXhYlsmU87LlNGlZdGJqjIta1YXqGg/Rf44ufSqok5GQ054KRdB14W6+X6HLbkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P06ujqIa; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T8kelMn0aXZni3gRXE84vY/+IeFnmfFNu5TyN7qOs0w=; b=P06ujqIakUyHb2eGA79WavfXFb
	SU2jh5/U/l7f8cGczk00RYT6U5Kio7rs/I7SYZroheAOzwVGJuTIHqBvd10y6f/h91RVoL4aUupq1
	wO0mNTIvqepCQGXt6M7M6EEwHCUeigOqBvbyL5woEMlBibS9qriNG05MYMqLH45mu3bxM2Ij58gT8
	BGzNPDDUMLy53Nv4KKBZz2+vokNsV3G8ewG6diphNW9j1fET0TNKOB039Dla0aPj1OEbGTz1qR91z
	WdJjhzMyjC0UlIX1WSJd2UhozBe60fcWUF3ALh7xx4ZQW3SyOh1iCFbli4rn8tqMZ51AYeUyiy664
	jRnTluaw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgAdn-000000034xf-2eUM;
	Mon, 19 Aug 2024 22:14:19 +0000
Date: Mon, 19 Aug 2024 15:14:19 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] module: Split modules_install compression and
 in-kernel decompression
Message-ID: <ZsPDu86poGWtmfCS@bombadil.infradead.org>
References: <20240722090622.16524-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722090622.16524-1-petr.pavlu@suse.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Jul 22, 2024 at 11:06:20AM +0200, Petr Pavlu wrote:
> Allow enabling the in-kernel module decompression support separately,
> without requiring to enable also the automatic compression during
> 'make modules_install'.

Applied and pushed, thanks!

  Luis

