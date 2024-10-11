Return-Path: <linux-kbuild+bounces-4069-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F068599AF8A
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 01:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28894B2385A
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 23:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CE81E2000;
	Fri, 11 Oct 2024 23:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4HK9HCuW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7E1D3562;
	Fri, 11 Oct 2024 23:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728690372; cv=none; b=SCK6DcS/7TU7WAN5hpbkc9itCHIwPP2slA2/NP97XjN3ZB5nKkIHu1LbjmTOo/s/i/ZEZLWP+Vy3j7JjnJnJGEULNgqkBW0vn0QB810/F5oy7o83mttenLz8twAvzmfeL4eIM5oj397Yb2+GnuLjNg+9UGlEzskqL2SXulWaTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728690372; c=relaxed/simple;
	bh=8nrcBnAzx5ZMgu8ee2QdENddvQaLsPb9ijW5IT8anZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTroAv4HJkALBsWJevsgUi384f/DXdZ5LGwhDkbPXd0PA1J5u7ivYfIf9YibiYvgKskQoSqbummAnlF4imZll0A3FLNaULuyo1lSAZqZuZKqFZcnz/OLKJfBlulfkJJtitPBJDNosjxuiXFU1GxZ/FSkjMhfnjwBd2R6VkgZZ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4HK9HCuW; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+bkr9LORWRx0O7dGlBaGEyKOrPTlNXCc6U0HgL4an08=; b=4HK9HCuWKP6MdEO6ryZMn88miZ
	EYOw/m2Fqgbn9N79t+rMb9j+QxnOL8ofNLufXsrPwR1ofvX8u5dTs8tBAYRi5ynQtmhSNMlR8P1pO
	wNldDHPYRMV06ZHnGI0Ack9ipfb57khEd+KK7YtJ7RsBanGMYp8HxZAfUFcahL+MO+Z3ZJgMl+/uU
	gCHoBUxX6bKS/okAD52BR5so3L1alT99vRxpFa64DerntZVJiqNinNxK+5EINhl5qyDCblb1Sc3Pg
	FK/W1NUqiEA76uYmJ7ik3ybWMUQQlrqutXFfRQwoS4ju6kQkC9/9f8K19WnIR7TTfzH/u1vWUeF4m
	wZJT/fAg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1szPKh-00000000Elc-0TUG;
	Fri, 11 Oct 2024 23:46:07 +0000
Date: Fri, 11 Oct 2024 16:46:07 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
Message-ID: <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Fri, Oct 11, 2024 at 04:45:25PM -0700, Luis Chamberlain wrote:
> 
> Also, just as I asked Sami, coould you split this up into patch sets?
> One with all the cleanups and elf validation code shifts. And then the
> other code. That will let me pick up quickly the first patch set.

Oh and if you can think of ways to enhance our test covereage on all
this as I noted to Sami, it would be greatly appreciated.

  Luis

