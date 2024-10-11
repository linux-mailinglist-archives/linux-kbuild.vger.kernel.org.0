Return-Path: <linux-kbuild+bounces-4060-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B74C99AE8A
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 00:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A6881C21A62
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 22:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A7B1D1745;
	Fri, 11 Oct 2024 22:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTfmSX7w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6951CB509;
	Fri, 11 Oct 2024 22:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728684794; cv=none; b=WqX/PAgaLjwTtSPxIEbbPK5Kp0HjISY0Q50K8o02A6TTNN6oq1AVvfnfibrwNX2UHt+n8Th2RGAtZirq9SbrRedhHQrCAcM/7ux0w9IOEhAq8mT2q9n1Wql1CkFrLI1iZG2/th+sAQVA36Clljigv9iCEKAtIKuSi4wHk5SmQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728684794; c=relaxed/simple;
	bh=Y8Xs/sQX2kS6V8xv9rjsehyhc+uRws7azTUCt8jAD9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NX3bN92OHYw9UeR/kg8mVOJbVKT0W0feXHnHN0DBHDIhXTBvqhhIqz5hD5rQ1ttXOKcI2scZDqPiadSVuwarhl67kur+fseTc87vpY8Hq/l1COszYMqMGxPvUI80NdQQiTrkKQJUu/9R1Cr+QzYLzgOBgLuPg28FgPU/eP1kPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTfmSX7w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ED6C4CEC3;
	Fri, 11 Oct 2024 22:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728684794;
	bh=Y8Xs/sQX2kS6V8xv9rjsehyhc+uRws7azTUCt8jAD9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTfmSX7wRzybyskrZGpgB901vcZ5Ou+9exp2SaSFgWKQ2Ru7VVDGg+Dr0C+2Wskng
	 gJohezXvM/Hj7OwPTjCewb7TLtH+YEWVNgQeE1E+d2fdJPgvP92/BDiwg578VOVcDo
	 1aVwl9M7DcdiQxZhDfGQiCGUidIN3i2A9g7NIU44pyixwuLwFgIU69GanyatSPHkYO
	 pHmL8PZ5+1d/t7/jmIwpiAQPPhoOye9pDR+kr6R9fa4S+h2rLEFPPpjNW8Ag8R+oBx
	 0zjsafL2k8Ai6fNkaNPwa/fnzutXRX4Xgba4RWs/1pok/olkMgu4CnYW2eiRgYmcho
	 TdaoWBXXBO3mA==
Date: Fri, 11 Oct 2024 15:13:12 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Alex Gaynor <alex.gaynor@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st,
	j@jannau.net, asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v5 13/16] export_report: Rehabilitate script
Message-ID: <Zwmi-MEVE_E4nkzl@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-14-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925233854.90072-14-mmaurer@google.com>

On Wed, Sep 25, 2024 at 11:38:28PM +0000, Matthew Maurer wrote:
> * modules.order has .o files when in a build dir, support this

The commit log is not clear, is it that it's always had *.o files, and
you're adding them now, why? Why is the .ko search now removed?

> * .mod.c source layout has changed,

When, why did this change not happen at that time?

> update regexes to match

Why did this not break anything before ? Is this fixing something, or
is it prep work?

> * Add a stage 3, to be more robust against additional .mod.c content

Future .mod.c changes?

  Luis

