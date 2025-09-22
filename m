Return-Path: <linux-kbuild+bounces-8930-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F61B93896
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 01:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2C547A4CB0
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Sep 2025 23:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EC2287519;
	Mon, 22 Sep 2025 23:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="USt70Zbv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0379770FE;
	Mon, 22 Sep 2025 23:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758582487; cv=none; b=B3CS1EBEYwXAByZUOz9ebVhSJQOUsyyzQ6zgElIYD7HU5WekYJuh1uj9cvgeU3J5Uhv3QCWzR4CVAIPr1KLhYNWFCSXcjyeQovaNFp4+V20IyOvYUroB6jQXjUGes3eZhACcSechAwfFwh7ZPqUAjMJ9CLJap2tPB8arqKpbV4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758582487; c=relaxed/simple;
	bh=XWxaf+eruACKBW+zC6wZBjwveAojRX5W0Ql935IxLow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKnF50jkj4fi3wGReCU/TUNP+EBhpRmj+CO+2YrM5DNuM4ET+P8vK3TBJegymBnld0v82h4BU2ZxX88tucuuPg+0JlHasYO8s9A5cz/vVXhT0jWKoLlrfA3b/LyPIeqvyxylhAsMhmPIgk3Hqj08UpVas3Rq2jEpnaNN3ktU+H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=USt70Zbv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vna6onQ17GRMJdgDqCCzwoNwGnMVdyQrXYBFE4uxe+E=; b=USt70ZbvzeG7Gwgi8fg1qfL5kE
	2oVtNvV2Z8HerbbcZLlW3pMHOJ5FMD17x2BAQle8tsISd2exOeNzj/zKti+pGnJ3JAf1VBSbIxkv5
	LdDYRupeWwJA5C501fG+mXsk2y1hGyuIjR9PnX3OxToj76hnr/QrJOcR8dYRIQZybhHMzblHf4quH
	3QZykxoumA1MUHFzhTwG9BxOuSDCjkeGDX14zNTy1wqFOknfXQ6/fVKTWiVz9s3YBZm6Lf4jJg2KI
	PoOcXgQlkqYOG9RhrHrLtFkSr4ZQ2DoOy0povid4qYyB3nuq9jh0Y9qvBYVtux6IExEg654vFzC8e
	Q/uSLFnA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pdY-0000000BhXD-2OGh;
	Mon, 22 Sep 2025 23:08:00 +0000
Message-ID: <c02f08cc-0613-4e57-886f-9d49803cea00@infradead.org>
Date: Mon, 22 Sep 2025 16:07:59 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] kbuild: Allow adding modules into the FIT ramdisk
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?=
 <j.ne@posteo.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Ard Biesheuvel <ardb@kernel.org>,
 Han Shen <shenhan@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250922224835.1918759-1-sjg@chromium.org>
 <20250922224835.1918759-5-sjg@chromium.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250922224835.1918759-5-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/22/25 3:48 PM, Simon Glass wrote:
> Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> ramdisk image within the FIT.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---

Regarding $subject, a comment in scripts/make_fit.py says:

  Note that this tool does not yet support adding a ramdisk / initrd.

Is the comment incorrect or are you changing that feature here?

Thanks.

> 
> (no changes since v1)
> 
>  scripts/Makefile.lib | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1d581ba5df66..2e880d9b4706 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -398,9 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
>  # Use this to override the compression algorithm
>  FIT_COMPRESSION ?= gzip
>  
> +# Set this to 1 to include an initrd with all the kernel modules
> +FIT_MODULES ?= 0
> +ifeq ($(FIT_MODULES),1)
> +EXTRA := -B $(objtree) -m
> +endif
> +
>  quiet_cmd_fit = FIT     $@
>        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> -		--name '$(UIMAGE_NAME)' \
> +		--name '$(UIMAGE_NAME)' $(EXTRA) \
>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
>  		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)

-- 
~Randy


