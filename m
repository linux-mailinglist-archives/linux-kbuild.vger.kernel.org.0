Return-Path: <linux-kbuild+bounces-10127-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 447BACC5BF9
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 03:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D17C2300450F
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 02:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8926E22D9F7;
	Wed, 17 Dec 2025 02:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CCcq0nbV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F9B1EE7B7;
	Wed, 17 Dec 2025 02:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765937196; cv=none; b=K1mz/LX503XyIb3xyjeDIPRkc+Xw/4CQDasck2b6DsgxPJlzTPRv2ZVXl3n8BdqD9K35wLUgAHdwY7owzS0l1NL2tYtE982Z5g8MOvDKH5+CxchYuJuCctXJh5dm4KpOavSxMpWfA4hcj7yIy8yOPw1vXGkz2KspIGX9Xes85+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765937196; c=relaxed/simple;
	bh=SBDhu7x/3JI5aAxIOI9+w7Oj4aq4blZjbrD8SiN7cl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPYKPcY0CFHtMmOFFUctTDTQYFCQV6xGJYU9DVfBBQ2G74SWdyjJJECBIfr/T76nwVw1WAZZ6SSc/vhn+qpet1IFWRndt+fPBPzMbiRjMlJRoBvsP1Il9vbeevYjSmQ/593ClM3WmFmFZp70Z5Y4JyB3UXHOyoC6cDYD6WdR8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CCcq0nbV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=aebOnTMy8OuLXMgLwqR0us+Ejw+wij7gbbC2y4R526w=; b=CCcq0nbVh02n7IU5v9TZuVQrSL
	liVAUcGNK3fIiKbrU6tv4a09nd6zEzGN9lfxx642E3Hab0GH1nOCZVzwJ1KTNxad7W1QZgoL9wjUM
	7TP397DWpKaXnx49VhjbnRdOuSzTOgUMPHjc3QgkSYqwIOSKcfdnQgONkt8C0CUsDu/aSjk3aPDTi
	VSsnFfJFgMf+eqId99UiI/rWLHXSFftiua06inIVptruUQt+uVEU7mZ7F6u8MgpbLucBqHcNymn9z
	ZtDFi0rpSA2LJvv99la7oAhDi1zW0Wbb7PAf0zTN4okU8PkNeoSzo7TJ7qFaMQc8zi/pJJ9bIls0M
	TALe9QHA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVgvv-000000062qP-0SPP;
	Wed, 17 Dec 2025 02:06:31 +0000
Message-ID: <4930b918-82c3-4e67-9ec6-39b067525aab@infradead.org>
Date: Tue, 16 Dec 2025 18:06:30 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/1] kconfig: move XPM icons to separate files
To: Rostislav Krasny <rostiprodev@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <46a5f2d9-b118-4675-8372-40f9b2fc7bbe@infradead.org>
 <20251217015409.30102-1-rostiprodev@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251217015409.30102-1-rostiprodev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/16/25 5:54 PM, Rostislav Krasny wrote:
> On Wed, 17 Dec 2025 at 00:39, Randy Dunlap <rdunlap@infradead.org> wrote:

BTW, in the future, please start a new thread for new versions of
patches. Don't just reply to the previous version's thread.

I think that's documented somewhere, but there is a lot of process
documentation to digest.

Thanks.

-- 
~Randy


