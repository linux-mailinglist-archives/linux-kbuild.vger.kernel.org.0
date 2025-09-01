Return-Path: <linux-kbuild+bounces-8683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7028EB3ECBD
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 18:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 810CD7A282A
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 16:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFC43064A1;
	Mon,  1 Sep 2025 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C6foWfSR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46E12DF13C;
	Mon,  1 Sep 2025 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745669; cv=none; b=Mc7Lva5iJbsT0+PgDhtz2dKvj0pLroU4tvC14Oh7CrLvgqVlHn/HDldLiA5PmnN+efU/L3bdnag2+Y4vkeQDCZ3QzSPRyJ44JKeWoUxvjzgvwGTaOmBVekrKVCSw2swBawdzn4jOyZDGJd0k/N9JcWXWcnSk0oODrDObRs01yVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745669; c=relaxed/simple;
	bh=or+QEmvqQthxP5KlB7QuHcOFpktvyMnamOGevaOE/Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I28hWJmkFk5iepk6g5/T34RcrIxeSuJ2cIDLkT8fMfwlIyWASu75Qdffl068VB6JCX69SAVtGNFFgJ4e1vsE5g+9tj/y3PrnT6sc+kaXieSQXyVWo48oKyBOVJOuvp7KOAtSLYqNq5CZ35xwqiJb71uXY42O6SSbkKpM+IYMkwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C6foWfSR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ilow6EIc5y22pIG9yaRN/E/TA3c+bEpyyK/DUWu+DLk=; b=C6foWfSRR0vcQWldgezvYK13dt
	mIkKkVVPIW2K423ZF02lazMoUpTIKUbhAph/0SGAsuwCZHzDtQIKL6Jr3h0y0FMxncabtZmjc0WkK
	W1c9G1sy8h8rz3blQcodRvvPwDPG1QRvi/UQRHvnE69FFVEMmf8dWFAEgxMxAyWOaqVVcKgfKpX5t
	bhMuGhSiv+1oaZYp2GkqfCWw0FXwrEXYZsTRo7aiSS4X0aG2aFVmivER0hCWnLbFYKcQIOe5pGs84
	bKHgTOPd9t4GTgKKs093Dj+PDUoigByA3vEMVQ9hJCwj5P0LL+PvadP1WeQ47no6+wQojkcDPgjEl
	jXS0z6eA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7nW-0000000DMYs-1Hqd;
	Mon, 01 Sep 2025 16:54:26 +0000
Message-ID: <4c75e5b0-48fe-4778-8ec5-d8d43009ddd4@infradead.org>
Date: Mon, 1 Sep 2025 09:54:25 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Stephen Brennan <stephen.s.brennan@oracle.com>,
 Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250830020109.it.598-kees@kernel.org>
 <a123ab8b-a335-48a1-9ac3-e3b348d78cd1@infradead.org>
 <202509010944.CAAFB2ED22@keescook>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202509010944.CAAFB2ED22@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/25 9:45 AM, Kees Cook wrote:
> On Mon, Sep 01, 2025 at 09:39:46AM -0700, Randy Dunlap wrote:
>> Are you (implicitly?) saying that all previous attempts at transitional
>> kconfig symbols have failed?  If so, I just wasn't aware of that.
> 
> I haven't found any way to do a "proper" CONFIG transition. I looked
> through past transitions and they all left stuff visible. Is there a way
> to actually do this with existing kconfig?
> 

I don't know. I haven't looked as hard at it as you have.
I just didn't realize that there had been significant failures
that required kconfig code changes.

I'm just trying to understand. Carry on.

-- 
~Randy


