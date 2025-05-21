Return-Path: <linux-kbuild+bounces-7193-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A1DABEC9C
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 09:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E227117CF2D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 07:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32BE22D9E0;
	Wed, 21 May 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3WPhsDZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C12B9A9;
	Wed, 21 May 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810899; cv=none; b=botmj1gZk/OLWrYoHbGUTq37bElPDyFyOfQpLGx1rabrUCRn2iz/i03xY4tH6u01GSlbR170sxJgIla5gqeIChQ6fA0U3OyM8GSIma969InWU1yWMOqoyGQ31qHZDwh8Di2Onv/zN+3Hk/GOlxwdbXBIVKL4FlJpA8mTCfRfr3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810899; c=relaxed/simple;
	bh=AhlslH5jwX1AYzOcfks+qLNg7TfwpDCMnd+L6Pv36E4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqepZpJTURipsxBuSycIeRWQ78sJyPe88sE7ZXoK0cDfSmnScAIIi6UbQJYrLOuZXjfmlYwwqKEc457JYXkO4qI/fCIJqWbj6b4j1FnUpgdA4is5tPABVob3zfdINGqpOI36unJYMXs7QETUsDrsej9jzhqCCqa6e5Po2vl/NHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3WPhsDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15665C4CEE4;
	Wed, 21 May 2025 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810899;
	bh=AhlslH5jwX1AYzOcfks+qLNg7TfwpDCMnd+L6Pv36E4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A3WPhsDZ2JB3BOgBb0VYJMIq33IvhTFDGFLjFLdPy3uAddqrF4+/kdYPdb5R95EHZ
	 F4sCrbhlbtayw8DUgLoBDVUk/TZI5CYHyvVs2tcFCCbLgfA0PPoldQL02BnhMZmg+1
	 kgMzwQDgzb2TjdMU4MNLQZytloHMXFVoHvaXGaheIJIqOIbQohLJdo0mPtFazzjZ76
	 ynVUzLzJAnh/ywrm6RmP2eect6nzN6XmiGAjjA94PM+s1qI0/cQknGFx4DJPjMBAv8
	 NAXJXupZHB411/OKiuOMo6g8SZsHit8qJgL0RZdgDdrE2d5SM/9iE6e+UPizR+9M2P
	 H266lVWWnRz/A==
Date: Wed, 21 May 2025 09:01:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org, Nicolas
 Schier <nicolas.schier@linux.dev>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] Some kernel-doc fixes
Message-ID: <20250521090134.1a73bd6d@foz.lan>
In-Reply-To: <cover.1747809627.git.mchehab+huawei@kernel.org>
References: <cover.1747809627.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 21 May 2025 08:50:25 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Hi Jon,
> 
> That's the second version of the kernel-doc fixup patch series.

Please ignore this... It got just the last patch...
It reminds I didn't trink my usual cup of coffee this morning.

I opted to re-order the series placing the MAINTAINERS patch first,
with the hope that Lore would pick the entire series as submissions
for linux-doc.

Thanks,
Mauro

