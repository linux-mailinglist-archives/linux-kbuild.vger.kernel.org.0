Return-Path: <linux-kbuild+bounces-8336-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E788DB1FD3E
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 02:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06C9C1763AB
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 00:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0305A79B;
	Mon, 11 Aug 2025 00:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yJ7KRNWh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E00184;
	Mon, 11 Aug 2025 00:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754871580; cv=none; b=hOhr+txsgZKtf+cs5WXIzozghnxtDCgx+AWuiaXc4tFmYLt5A6cZ0uRqUpRQWk4+Efa+xGZ8jwpWGbuZGQISJXjFBJTm8kb1Q92GXJQjc3Cq0lmXfHb+mcP77HtbfMucXNQEAFL1paLZHTKlcp3rEYbvAN1W3dpogX48Pt9KixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754871580; c=relaxed/simple;
	bh=PbpvoKO4USUgwkCLMNoAIDbQ1JPBAioDCnX2S3Rp5dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZPEz9uqUYg+6muuJNxIXMevpYtJams8hzOsImRl990k2Z2AT1o6rAZ38//xJJVsFmoVeUA5WPz1dFk/DFMR32JKf/qhDgT1ep0ZhAyc7/u+hVLFz+asI9GR894f/J3BHeVVW4k4m00ErrPKBMRel4PmtGhibjnGNLZm07c4VUT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yJ7KRNWh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=wCcau8DFFFb/JrLj+a+X/WQIFM2JxO+iJB40lGagkLw=; b=yJ7KRNWhMyCRXCKHgP2nNIihM4
	okY99zhoqEck0iNx3PVvlcAX+wvukxXoehhm8SrO0LPj2sbXKEA9d7Qir5kEgAx7SkyhRnjTPiF+d
	Vza4zq4EhkRgJM3BD7yH8vKX8L89voUtTvpP7E8T5/i8r+QyN0yjU8VwmlUgdFLPcvdKF76eO4Cxw
	AqnfqzbkkX2M3usDYAKK7b8AEW0ypEXADELWnXwAfcojHoepU0/qskCjjA/N8HR5KRHNP71ThR/6w
	kyTOrXa0OU2/RSVq5KGshpkJia6Q7IebkjNZf5QO83nhlXRHnt7HxsYr+xEKmmMiR68Qgm2JEez3L
	HEG1Scuw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulGGF-00000006DhZ-1jdZ;
	Mon, 11 Aug 2025 00:19:35 +0000
Message-ID: <dfa160ef-4145-4666-83ea-cccc874bf9b0@infradead.org>
Date: Sun, 10 Aug 2025 17:19:34 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: nconf: NUL-terminate 'line' correctly in
 fill_window()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 "nir.tzachar@gmail.com" <nir.tzachar@gmail.com>,
 Michal Marek <mmarek@suse.cz>
Cc: stable@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250810142239.120294-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250810142239.120294-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/10/25 7:22 AM, Thorsten Blum wrote:
> Use 'min(len, x)' as the index instead of just 'len' to NUL-terminate
> the copied 'line' string at the correct position.
> 
> Add a newline after the local variable declarations to silence a
> checkpatch warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: 692d97c380c6 ("kconfig: new configuration interface (nconfig)")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  scripts/kconfig/nconf.gui.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 7206437e784a..ec021ebd2c52 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -175,8 +175,9 @@ void fill_window(WINDOW *win, const char *text)
>  	for (i = 0; i < total_lines; i++) {
>  		char tmp[x+10];
>  		const char *line = get_line(text, i);
> -		int len = get_line_length(line);
> -		strncpy(tmp, line, min(len, x));
> +		int len = min(get_line_length(line), x);
> +
> +		strncpy(tmp, line, len);
>  		tmp[len] = '\0';
>  		mvwprintw(win, i, 0, "%s", tmp);
>  	}

-- 
~Randy

