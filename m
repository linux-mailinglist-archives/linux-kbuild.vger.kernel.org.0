Return-Path: <linux-kbuild+bounces-10695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2FAD3BA46
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 22:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E40DD303AE9B
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 21:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4857C29D26C;
	Mon, 19 Jan 2026 21:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaOM+ISh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232CA1DC9B3;
	Mon, 19 Jan 2026 21:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768859377; cv=none; b=jIUUmM0A8xESsZVMDR4WB3J6vv47OFk3hYXzcQz0OEBiBcCgfey6ZUswHZwHAX8Uko8fyXA17jHFrZIZQvGw8/3v3PZ1TR9rYzEn7WtaLe3BQ0yXKBHCcsOIqd3tvRVuMnafAZNbFJTDuHJZiNdt+C7ANbcOxjkBDKjRhBgCegE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768859377; c=relaxed/simple;
	bh=pYFQ/9KIr4DC+6IM82aHx4ktfEImmRQJgadK+07XKCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFziZVW4NdBCFY4p4F1FsVo8+IAGskW3nSW6HHz4xkR56ovu1aQXttLh++11nFlh0O7xD6mfwF0aC+4PVmzPKoEToqmtG0UpMvYM216pkfBI3O1/pt5dmj7t3RCFQuqMtMTZGJE+8ytgkRWztsOE05tQ0cHokOEvOEf0ZdvUH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaOM+ISh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AEBC116C6;
	Mon, 19 Jan 2026 21:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768859376;
	bh=pYFQ/9KIr4DC+6IM82aHx4ktfEImmRQJgadK+07XKCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EaOM+ISh3kdNYoEBzFXL3lvOjnDDU9nUhL4aCazncRkiHtRfKS7xZvmWIjksUUuKb
	 jqFul3fCbM1BkI2T2L1K8MqvlvmttRnRsNscUuM5Br7M3FuI0ZvWWTe+Tsa2v47I5P
	 SgVBUhWSrklqVC+4a4e4GoD/6RdF+dsPs8O+pRA3/UgRkAY5n/GhziDZiSHBouo9cK
	 6oUw5W7fOh8qwtgiG0DPZFol79NM/TffhjJz5EbhW4sZ8N+e6NxTBBacbDcndI7UfP
	 +WLZGd9tMEUFMMIt8XB79WUU1fSKDOhdszF5mpmpGoC/CnCUf3W9ZCBIJ5CD0a9Bur
	 HHAAMx7HDX8aQ==
Date: Mon, 19 Jan 2026 14:49:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
Message-ID: <20260119214931.GA1058062@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <20260119213516.GA1051134@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119213516.GA1051134@ax162>

On Mon, Jan 19, 2026 at 02:35:16PM -0700, Nathan Chancellor wrote:
> I will apply this to kbuild-next-unstable shortly to give folks a week
> or so to voice any objections or give critical review comments.

During application, checkpatch.pl pointed out that this should have a
MAINTAINERS entry. Would you be opposed to the following?

CONTAINER BUILD SCRIPT
M:	Guillaume Tucker <gtucker@gtucker.io>
S:	Maintained
F:	Documentation/dev-tools/container.rst
F:	scripts/container

I will also add scripts/container to the kbuild entry. Now that I am
looking, it looks like Nicolas has been left out of this whole thread,
cc'ing him now (even though I assume he should have seen this through
linux-kbuild but just in case not, the top of the thread is
https://lore.kernel.org/cover.1767199119.git.gtucker@gtucker.io/).

Cheers,
Nathan

