Return-Path: <linux-kbuild+bounces-3920-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D799599106A
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 22:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C6111C211A1
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 20:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CBD231C8B;
	Fri,  4 Oct 2024 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="kmUEZQDX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226B231C8D;
	Fri,  4 Oct 2024 20:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728073032; cv=none; b=mE5Yj6VEFGXn1EA4bVsoxYUkCmuMV/dlnVhPcdDcf9CyNL2l7FpR0CzenO5E7BcvWXA7VrAt15mm83UJLTMsxAl+/DJqWe/ANRVuhvPCyb3Ra6ytoG80vEF8rUSuhtalPHemYvXqEHc3zIZcltFfyDYOJPB8b3MYlpvONDbAnsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728073032; c=relaxed/simple;
	bh=iUSgIAano9orVaigWsPHPZU8j88wY3jKpzUL2a6AEs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ds+mhp72txDg8c6fsEvvPlUyQ5fEiYfLozjHQM38NnUkNRQVu7h1e2e+44j16AYg3eNXLpM8fVvBGkBTTUgPjNiwec/Nwf7NjMKWdQC9vvaGF+lgZC603BM9DralZFjUBYiI8fSi5kLS85aTw+uWZI6fxzqoMyiRiZHzrwk4zU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=kmUEZQDX; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XHtZ1kzdzTmHTPpF0tTkbVytUrH8OZbSiYvFnbqtHMo=; b=kmUEZQDXpmX7+uvwITP4JiVzwM
	V0KBEfhaLF465sjovVmsQVmvZlewfCj+ZbjMs0IZyRxMa9N0BC/ZI0y7nK3ePJqqJPo7zKKYh3PHM
	ypoqjt5+/NW7ztrnHsMiFlsQ3M2Bu0kmeTf2yqBITWMvvhzrkByEwhphk9wCYXNgtsriK8aRzKZMy
	skWXO8L57eUKOiz7ZaRPblm8oncSDLTZWLzX1hu8JN2efTz5aCJ/onq62JmFgmL/nAGEUvi7jEIfJ
	LUuTUrHZ/Qgqjso/ffINEtf74enGoBE+ixnrrZ7Cog/KXG5uFiN5Q7qRdMurzIa14zyCOJIUwc0+C
	hqy/V/zQ==;
Received: from i5e8601c9.versanet.de ([94.134.1.201]:38552 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swojS-00D4KN-28;
	Fri, 04 Oct 2024 22:16:58 +0200
Date: Fri, 4 Oct 2024 22:16:53 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 00/23] kbuild: support building external modules in a
 separate build directory
Message-ID: <20241004-clever-powerful-hoatzin-2cebfb@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:28PM +0900, Masahiro Yamada wrote:
> 
> There has been a long-standing request to support building external
> modules in a separate build directory.
> 
> The first half is cleanups of documents and Makefiles.
> 
> The last part adds KBUILD_EXTMOD_OUTPUT (MO=).
> This is too big changes, and too late for the current MW.
> (I did not test kselftest at all.)
> I hope people test this and may uncover some issues.

thanks again for the whole series.  I really appreciated to go through
this patch set and am sorry for that it took so long.  I have tested
only with some in-tree kmods and with kmods' testsuite modules (but only
on amd64) and could not find any major issue, only the minor things
reported.  I also did not test the kselftest or similar.

Kind regards,
Nicolas

