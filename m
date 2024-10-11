Return-Path: <linux-kbuild+bounces-4068-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E7699AF85
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 01:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D7B9B21E86
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 23:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53C61E0B60;
	Fri, 11 Oct 2024 23:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aJh2gP+2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C461D12FA;
	Fri, 11 Oct 2024 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728690339; cv=none; b=Q98vxxn8n97UKwU0LXqXnEtDnrgdWZknNbOy774Wf9e42Ru3vyybazQg8bxGWljILCe67NEfPJzQ9wukfTSQOqriGDNBBEDH+ItExhzCeAAqVCV2p1FKLeJ0ycOhmMYqmtftPBYyZA9EC2nsVruVPz7DeU8b68RZz0kzzC9zZRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728690339; c=relaxed/simple;
	bh=n0v0l7lnMuLf3oo6ID+QJHpexGb45RQQmGnWDPeGKoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siF4fYXohsSPfXamT+sFfJw8VYjc/hARtcW3UkavY0PCnSUZHtwjirQbIMTGIcw8yJ/FGj2rELwgl5Hd12UTO0XlZGf7NrRnexWazsy2ajH0ZJ4DQmxrU49gQ5aAwn/ZmIFNTF3f76yF7bVx4bdgIwVW1TqKViUp+UQ4empl+Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aJh2gP+2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QJk/ha5iYQcTaJTFnJbtmxla+gEA09c4J1vJloM00VQ=; b=aJh2gP+2rAM0r5tcjBOCtc4ZJ4
	uEYVqFW7oi3Dsmfh6+nUwQrMO6h/FnEId0G20POgML4PVX3sLj9ymgvU933OtSixbXDQUnOiU8Lnp
	bYoDaWIypuEM3J9vCOGv2Jj81nBlQrjZm2zYrzM8k5Cp/UHiJtOWjICD5HZxuq3QBpU/1Bm3JdmL/
	U9Im9Tybsh7SEU/z9bS5J/atfsDU0c7xO1JwSUYfIava/esJTQ461O2XU5/1gTvZ0y32V5Ry7SRhu
	G6OpvnTdd1cTdqtlgbpc4zkuwfw1n2VGdpjgI2sL15m5pGK15LNPZYWSZQ82T4JKYq3Gw0CjCxD2f
	mWgQlE9w==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1szPK1-00000000EfT-0YiM;
	Fri, 11 Oct 2024 23:45:25 +0000
Date: Fri, 11 Oct 2024 16:45:25 -0700
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
Message-ID: <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>


Also, just as I asked Sami, coould you split this up into patch sets?
One with all the cleanups and elf validation code shifts. And then the
other code. That will let me pick up quickly the first patch set.

  Luis

