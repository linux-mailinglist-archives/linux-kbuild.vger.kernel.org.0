Return-Path: <linux-kbuild+bounces-4547-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E49C0A19
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 16:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5840FB24030
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 15:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A23D213147;
	Thu,  7 Nov 2024 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b+RYg1rJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6048F38DC8;
	Thu,  7 Nov 2024 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730993278; cv=none; b=kyWpOfq2Eru54dtCnDzwKdDnNtd/Biipy2sAJh8Mo3Nnbsh4Mrr/UMB9c/zwuqivmjNb5cAtWEX3HecQGOOEl+P/PuMbe3nGAbkFjMVRiga1XBtVS6/wjOC6/TlcCx3Y7rO3+v02r7SVZdrLOetO/++Np5ZbfRtcYCbZ1+FfE70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730993278; c=relaxed/simple;
	bh=8H74BgN4YtiFC0HZf6L74kXO/D++bo50Wsb3uPJyIN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpsC9FE1zezAPiZRNrBuX9sdqEHBIZbFFqVmZnRKbPWxzW6sbbYEjLnf8hGkNJVdgYWcyjZJ5tlYM9wTWOmzH1NlvD92P37/R5127AQHaw73spjpHOEtBYr1zYMC3eIltNYTaNnkaq0sdkqZtZUNml3X3fhKhU+whjpU69krsUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b+RYg1rJ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8H74BgN4YtiFC0HZf6L74kXO/D++bo50Wsb3uPJyIN0=; b=b+RYg1rJ/Dv5uBzL/rQhxvqXiE
	SzSzZDlbc7haR6riuoGHI9xQK20ZnaeF6EN/ckHHCs3Lzdjz2fvOLUA9dRzW9jsQaWY6tTlqWWcsO
	kDXUbyYj04ku2tfNhKScoD7KZANlxnAaODd+oI18R0XerGSacRaBDfmwtd2ZOMpccLi4bKrDiMxsi
	w8H9LnS5sSIPtcto7ds/zbRNdp4LLH45wUqHNojQ9kdhN630kdlkPkJrr76RLbSpE7V0Wq3P7digV
	49vy0wTDhHEPW6ZKEgUtgtYBbBGH5LoxitaNrTYYbNu9QJffe6rVYJd417Qr2wQlLXeM6PPYWPJ4K
	f9k9TCBg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t94QI-0000000C9EQ-0UCL;
	Thu, 07 Nov 2024 15:27:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 54FF53006AB; Thu,  7 Nov 2024 16:27:49 +0100 (CET)
Date: Thu, 7 Nov 2024 16:27:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org,
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC] module: Strict per-modname namespaces
Message-ID: <20241107152749.GA38972@noisy.programming.kicks-ass.net>
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
 <CAK7LNAQ-wMTOaCuBab-JOfz4ggefNiEBmiKCUpuFncTqS0P3xQ@mail.gmail.com>
 <20241107115819.GA38786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107115819.GA38786@noisy.programming.kicks-ass.net>

On Thu, Nov 07, 2024 at 12:58:19PM +0100, Peter Zijlstra wrote:

> Anyway, let me see about doing that whole ',' parsing thing people seem
> to want.

git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git module/namespace

Seems to work with very limited testing.

